package com.ggproduct.automation.projectmanager;

import java.io.IOException;

import org.openqa.selenium.By;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.CoreHandlers;
import cucumber.api.DataTable;

/**
 * for Rei Systems
 * 
 * @author Handles generic/common methods and WebElements of the project.
 * 
 */
public class ProjectManager extends ProjectWebServices {
    public CoreHandlers reiDriver;
    public Controller controller;
    public GovGrantsHandler govgrants;
    public final String defaultLongText = "Automation test description";
    private final By attachmentClassificationPath, attachmentDescriptionPath, attachmentFilePath, approverDescription,
            acknowledgementCheckboxPath;

    /**
     * Super Constructor
     * 
     * @param controller
     * @param reiDriver
     */
    public ProjectManager(Controller controller, CoreHandlers reiDriver, GovGrantsHandler govgrants) {
        this.controller = controller;
        this.reiDriver = reiDriver;
        this.govgrants = govgrants;
        attachmentClassificationPath = By.xpath("//select[@title='Classification']");
        attachmentDescriptionPath = By.xpath("//div//label[text()='Description']/..//textarea");
        attachmentFilePath = By.xpath(
                "//td//label[text()='File']/../..//input[@type='file'] | //div//label[text()='File']/..//input[@type='file']");
        approverDescription = By.xpath("//div/label[text()=' Description ']/../span/textarea");
        acknowledgementCheckboxPath = By.xpath("//input[@type='checkbox' and @value='I Agree']");
    }

    /********* BELOW ARE ONLY EXAMPLE METHODS AND SHALL BE REMOVED ************/
    /******
     * BELOW PATTREN IS CONSIDERED BEST IN CODING WORLD. ADD JAVA DOCS AND KEEP
     * LOCAL/KEY METHOD CATEGORIES
     ***/

    /******* "Key Methods with complete functionality" *****************/

    public void navigateToURL(String urlName) throws IOException {
        UsersAndURL usersAndURL = new UsersAndURL();
        reiDriver.get().navigateToUrl(usersAndURL.navigateToAnyUrl(urlName));
    }

    /**
     * Handles scrolling to a specific section
     * 
     * @param sectionName
     */
    public void scrollToSection(String sectionName) {
        reiDriver.JavaScript().scrollpageToSpecificElement(getScrollToSection(sectionName));
    }

    /**
     * Handles clicking on confirmation dialog box
     * 
     * @param alertDecision
     */
    public void clickOnConfirmationtBox(String confirmationDecision) {
        govgrants.modal().handleModalAlert(confirmationDecision);
        reiDriver.get().getRefresh();
    }

    /**
     * Handles selecting a record in the flextable
     * 
     * @param uniqueColumnValue
     * @param flexTableName
     */
    public void clickOnMultipleCheckbox(String flextableId, String... uniqueColumnValues) {
        govgrants.flexTable().selectCheckBoxes(flextableId, uniqueColumnValues);
    }

    /**
     * Clicks on flextable row level buttons in list view where there are number of
     * flextables
     * 
     * @param buttonName
     * @param uniqueColumnvalue
     * @param flextableName
     */
    public void clickOnFlexTableIconWithTableId(String iconName, String tableId, String searchText) {
        govgrants.quickSearch().performTableSpecificQuickSearch(tableId, searchText);
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        govgrants.flexTable().clickTableActionIcons(iconName, searchText);
    }

    /**
     * Handles closing modal
     * 
     * @param closeButtonId
     */
    public void closeModal() {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        govgrants.modal().closeModalByClickingTopRightCloseButton();
        reiDriver.get().getRefresh();
    }

    /**
     * Handles acknowledging a record
     * 
     * @param sectionName
     */
    public void clickOnAcknowledgement(String sectionName) {
        reiDriver.JavaScript().scrollElementToPageDetailCenter(getScrollToSection(sectionName));
        reiDriver.findMyElement().getElement(acknowledgementCheckboxPath).click();
    }

    /**
     * Handles grid expansion
     * 
     * @param sectionName
     */
    public void expandGrid(String uniqueColumnValue) {
        reiDriver.WaitFor().makeThreadSleep(1500);
        govgrants.flexTable().expandOrCollapseNestedTable(uniqueColumnValue, true);
    }

    /**
     * Handles grid collapsing
     * 
     * @param sectionName
     */
    public void collapseGrid(String uniqueColumnValue) {
        govgrants.flexTable().expandOrCollapseNestedTable(uniqueColumnValue, false);
    }

    /**
     * Handles association of various related records
     * 
     * @param recordName
     * @param recordUniqueName
     * @param buttonName
     */
    public void chooseRecordForAssociation(String buttonName, String flexTableId, String... recordUniqueValues) {
        for (String recordUniqueValue : recordUniqueValues) {
            govgrants.quickSearch().performModalSpecificQuickSearch(flexTableId, recordUniqueValue);
            govgrants.mainPage().waitForNavigationLogoToDisappear();
            reiDriver.WaitFor().makeThreadSleep(1000);
            govgrants.flexTable().selectCheckBoxes(flexTableId, recordUniqueValue);
        }
        govgrants.phasePannel().clickAnyRightPannelButton(flexTableId, buttonName);
    }

    /**
     * Handles uploading of file
     * 
     * @param fileName
     * @param uploadSectionName
     */
    public void uploadFile(String fileName, String uploadSectionName, String attachmentType) {
        String defaultFilePath = System.getProperty("user.dir") + "/src/main/resources/";
        if (!uploadSectionName.equals("Checklist")) {
            reiDriver.findMyElement().getDropDown(attachmentClassificationPath).selectByValue(attachmentType);
            reiDriver.findMyElement().getElement(attachmentDescriptionPath).sendKeys(defaultLongText);
        }
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.findMyElement().getElement(attachmentFilePath).sendKeys(defaultFilePath + fileName);
        govgrants.modal().clickModalContentSpecificButton("Save");
    }

    /**
     * Handles selection of approver
     * 
     * @param approverName
     */
    public void fillInApproverDetails(String approverName) {
        reiDriver.WaitFor().makeThreadSleep(700);
        govgrants.inputForms().inputFormDataByFieldApiName("Name__c", approverName);
        reiDriver.WaitFor().makeThreadSleep(500);
        reiDriver.textInput().clearText(approverDescription);
        reiDriver.textInput().enterText(approverDescription, defaultLongText);
        reiDriver.WaitFor().makeThreadSleep(1000);
        govgrants.modal().clickModalContentSpecificButton("Save");
    }

    /**
     * Handles entering the comments in a confirmation box and click OK
     * 
     * @param comments
     * @param confirmation
     */
    public void enteringCommentsOnConfirmation(String comments, String confirmation) {
        reiDriver.findMyElement().getElement(By.xpath("//form[@class='bootbox-form']//textarea")).sendKeys(comments);
        clickOnConfirmationtBox(confirmation);
    }

    public DataTable seperateInlineDataTable(Map<String, Map<String, String>> dataTableMap) {
        List<String> inlineColumnTitleList = new ArrayList<String>();
        List<String> inlineValueList = new ArrayList<String>();
        for (String mainMapKey : dataTableMap.keySet()) {
            if (mainMapKey.equals("Inline Column Title")) {
                for (String innerMapKey : dataTableMap.get(mainMapKey).keySet()) {
                    inlineColumnTitleList.add(dataTableMap.get(mainMapKey).get(innerMapKey));
                }
            } else if (mainMapKey.contains("Inline values")) {
                for (String innerMapKey : dataTableMap.get(mainMapKey).keySet()) {
                    inlineValueList.add(dataTableMap.get(mainMapKey).get(innerMapKey));
                }
            }
        }
        List<List<String>> inlineInfoInTheRaw = Arrays.asList(inlineColumnTitleList, inlineValueList);
        DataTable inlineSeperatedDataTable = DataTable.create(inlineInfoInTheRaw);

        return inlineSeperatedDataTable;
    }


    /******* "Consolidated Generic Methods across the Modules" **********/



   

    private By getScrollToSection(String sectionName) {
        return By.xpath("//div[contains(@class,'panel-heading')]//*[@title='" + sectionName
                + "']|//div[contains(@class,'panel-heading')]//*[text()='" + sectionName + "']");
    }

}
