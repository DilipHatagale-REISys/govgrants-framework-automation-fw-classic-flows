package com.ggproduct.automation.projectmanager;

import java.io.IOException;
import org.openqa.selenium.By;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.automation.rei.controller.Controller;
import com.automation.rei.corelib.Properties_Logs;
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
    public final String defaultPassword = "SALESFORCE2018";
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
        new UsersAndURL();
        reiDriver.get().navigateToUrl(UsersAndURL.navigateToAnyUrl(urlName));
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
     * Handles toggling between different list views
     * 
     * @param tableViewName
     */
    public void changeFlexTableView(String tableViewName) {
        govgrants.phasePannel().clickDoubleArrowDropDownAndSelectItem(tableViewName);
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

    /**
     * Handles clicking on Approval Decision and clicks submit
     * 
     * @param approvalDesicion
     */
    public void clickOnApprovalDecisionBox(String approvalDesicion) {
        govgrants.approvals().completeApprovalFlow(approvalDesicion, defaultLongText);
        govgrants.mainPage().waitForNavigationLogoToDisappear();
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

    /**
     * Handles re-logging as a different user and toggling to the app specified
     * 
     * @param appName
     * @param userName
     * @throws IOException
     */
    public void reloginToggleToApp(String appName, String userName) throws IOException {
        reloginAsDifferentUser(userName);
        govgrants.mainPage().setUpCustomAppDropDown(appName);
    }

    /******* "Consolidated Generic Methods across the Modules" **********/

    public void reloginToViewRecord(String recordName, String recordOwner, DataTable dataTable) throws IOException {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        reloginToggleToApp(dataTableMap.get("Owner Navigation").get("Step 1"), recordOwner);
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Owner Navigation").get("Step 2"));
        govgrants.sideBar().getSideBarContent(dataTableMap.get("Owner Navigation").get("Step 4"),
                dataTableMap.get("Owner Navigation").get("Step 3"));
        changeFlexTableView(dataTableMap.get("Complete Review").get("Step 1"));
        govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("Complete Review").get("Step 2"),
                recordName);
        govgrants.flexTable().clickTableActionIcons(dataTableMap.get("Complete Review").get("Step 3"), recordName);
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Complete Review").get("Step 4"));
    }

    /**
     * Handles re-logging in and to view the given award
     * 
     * @param awardId
     * @param awardName
     * @param awardOwner
     * @throws IOException
     */
    public void reloginToViewAward(String awardState, String awardId, String awardName, String awardOwner,
            DataTable dataTable) throws IOException {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        try {
            loginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), awardOwner);
        } catch (Exception ex) {
            reloginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), awardOwner);
        }
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 2"));
        govgrants.sideBar().getSideBarContent(dataTableMap.get("Navigation").get("Step 4"),
                dataTableMap.get("Navigation").get("Step 3"));
        changeFlexTableView(awardState + " " + dataTableMap.get("FlexTable").get("Step 1"));
        govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("FlexTable").get("Step 2"), awardName);
        govgrants.flexTable().clickTableActionIcons(dataTableMap.get("FlexTable").get("Step 3"), awardName);
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Subaward").get("Step 1"));
        govgrants.flexTable().clickTableActionIcon(dataTableMap.get("Subaward").get("Step 2"),
                dataTableMap.get("Subaward").get("Step 2"), awardId);
    }

    /**
     * Performs login and toggles app
     * 
     * @param appName
     * @param userName
     */
    public void loginToggleToApp(String appName, String userName) {
        login(userName);
        govgrants.mainPage().setUpCustomAppDropDown(appName);
    }

    public void reloginToGrantsPortal(String userName) throws IOException {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.WaitFor().makeThreadSleep(1000);
        govgrants.mainPage().clickLoginDropDown();
        govgrants.mainPage().getLoginDropDownItems("Logout").click();
        reiDriver.eatCookies().deleteAllCookies();
        reiDriver.WaitFor().makeThreadSleep(500);
        navigateToURL("SUBRECIPIENT PORTAL");
        govgrants.mainPage().login(new UsersAndURL().handleUsersForEnv(userName), defaultPassword);
        govgrants.mainPage().waitForEgmsHeader();
    }

    private void reloginAsDifferentUser(String userName) throws IOException {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.WaitFor().makeThreadSleep(1000);
        govgrants.mainPage().clickLoginDropDown();
        govgrants.mainPage().getLoginDropDownItems("Logout").click();
        reiDriver.eatCookies().deleteAllCookies();
        reiDriver.WaitFor().makeThreadSleep(500);
        navigateToURL("PRODUCT PORTAL");
        govgrants.mainPage().login(new UsersAndURL().handleUsersForEnv(userName), defaultPassword);
        govgrants.mainPage().waitForEgmsHeader();
    }

    private By getScrollToSection(String sectionName) {
        return By.xpath("//div[contains(@class,'panel-heading')]//*[@title='" + sectionName
                + "']|//div[contains(@class,'panel-heading')]//*[text()='" + sectionName + "']");
    }

    private void login(String userName) {
        govgrants.mainPage().login(new UsersAndURL().handleUsersForEnv(userName), defaultPassword);
    }

}
