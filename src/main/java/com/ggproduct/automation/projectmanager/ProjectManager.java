package com.ggproduct.automation.projectmanager;

import java.io.IOException;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.CoreHandlers;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

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
    private final By headerOverviewPath, attachmentClassificationPath, attachmentDescriptionPath, attachmentFilePath,
            lookUpSearchPath, lookUpIFramePath, approverDescription, acknowledgementCheckboxPath;

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
        headerOverviewPath = By.xpath("//div[@class='panel-heading overview-header']");
        attachmentClassificationPath = By.xpath("//select[@title='Classification']");
        attachmentDescriptionPath = By.xpath("//div//label[text()='Description']/..//textarea");
        attachmentFilePath = By.xpath(
                "//td//label[text()='File']/../..//input[@type='file'] | //div//label[text()='File']/..//input[@type='file']");
        lookUpSearchPath = By.xpath("//span[@class='fa fa-search']");
        lookUpIFramePath = By.xpath("//iframe[@id='iframeCustomLookupModalId']");
        approverDescription = By.xpath("//div/label[text()=' Description ']/../span/textarea");
        acknowledgementCheckboxPath = By.xpath("//input[@type='checkbox' and @value='I Agree']");
    }

    /********* BELOW ARE ONLY EXAMPLE METHODS AND SHALL BE REMOVED ************/
    /******
     * BELOW PATTREN IS CONSIDERED BEST IN CODING WORLD. ADD JAVA DOCS AND KEEP
     * LOCAL/KEY METHOD CATEGORIES
     ***/

    /******* "Key Methods with complete functionality" *****************/

    /**
     * navigate to a url
     * 
     * @param urlName
     * @throws IOException
     */
    public void navigateToURL(String urlName) throws IOException {
        new UsersAndURL();
        reiDriver.get().navigateToUrl(UsersAndURL.navigateToAnyUrl(urlName));
    }

    /**
     * get main menu tab name to click on it. e.g; planning,announcements etc
     * 
     * @param menuItem
     */
    public void clickMainMenuTab(String menuItem) {
        reiDriver.WaitFor().WaitForElementToBePresent(
                By.xpath("//div/ul[@class='nav navbar-nav']/li/a[@title='" + menuItem + "']")).click();
    }

    /**
     * generic method to enter field values from an Excel file on a page form Excel
     * file should have four columns in the following order: Subtab: The subtab the
     * field input is found on. Note: Do not leave this blank. Enter "None" if there
     * is no subtab
     *
     * FieldType: The type of the field. Valid types are: "Text", "RichText",
     * "Date", "Date/Time", "Lookup", "Checkbox", "DropDown", "MultiSelect" Note:
     * These are case insensitive
     *
     * FieldApiName: The Salesforce API name of the field. Note: Include the "__c"
     * suffix for the field, even if the field is standard.
     *
     * FieldValue: The value to be entered into the field. Note: "Date" and
     * "Date/Time" inputs take an integer offset from the current day. They do not
     * currently support entering specific dates
     *
     * Inputs are read starting from the second row of the sheet. This is a feature
     * of reiDriver.excelReader, allowing you to use the first row as a header.
     *
     * @param fileName
     * @param sheetName
     *
     */
    public void enterInputForFormsFromExcelFile(String fileName, String sheetName) {
        String[][] data = reiDriver.excelReader().readExcelFile(fileName, sheetName);
        String currentSubTab = "";

        if (data != null) {
            for (String[] column : data) {
                String subTab = column[0];
                String fieldType = column[1];
                String fieldApiName = column[2];
                String fieldValue = column[3];

                // Switch to relevant tab
                if (!"None".equalsIgnoreCase(subTab) && !subTab.equalsIgnoreCase(currentSubTab)) {
                    reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//*[@id='topTabsID']"));
                    reiDriver.JavaScript().scrollpageToSpecificElement(By.xpath("//*[@id='page-content-wrapper']"));
                    govgrants.pageDetails().clickSubTabsInsideTableView(subTab);
                    currentSubTab = subTab;
                }
                this.inputData(fieldType, fieldApiName, fieldValue);
            }
        }
    }

    public void inputData(String fieldType, String fieldApiName, String fieldValue) {
        int attempts = 0;
        while (attempts < 10
                && !reiDriver.is().IsElementPresentQuick(By.xpath("//div[@id='field" + fieldApiName + "']"))) {
            attempts++;
            try {
                reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//div[@id='field" + fieldApiName + "']"));
            } catch (Exception e) {

            }
        }

        if ("Text".equalsIgnoreCase(fieldType)) {
            handleTextInput(fieldApiName, fieldValue);
        }
        if ("TextArea".equalsIgnoreCase(fieldType)) {
            handleTextAreaInput(fieldApiName, fieldValue);
        }
        if ("Date".equalsIgnoreCase(fieldType)) {
            handleDateInput(fieldApiName, fieldValue, false);
        }
        if ("Date/Time".equalsIgnoreCase(fieldType)) {
            handleDateInput(fieldApiName, fieldValue, true);
        }
        if ("RichText".equalsIgnoreCase(fieldType)) {
            handleRichTextInput(fieldApiName, fieldValue);
        }
        if ("Lookup".equalsIgnoreCase(fieldType)) {
            handleLookUpInput(fieldApiName, fieldValue);
        }
        if ("Dropdown".equalsIgnoreCase(fieldType)) {
            handleDropdownInput(fieldApiName, fieldValue);
        }
        if ("MultiSelect".equalsIgnoreCase(fieldType)) {
            handleMultiSelectInput(fieldApiName, fieldValue);
        }
        if ("CheckBox".equalsIgnoreCase(fieldType)) {
            handleCheckBoxInput(fieldApiName, fieldValue);
        }
    }

    public void scrollToTop() {
        WebDriver driver = reiDriver.switchTo().switchToParentFrame();
        JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("document.body.scrollTo(0, 0);");
    }

    /**
     * Performs login and toggles app
     * 
     * @param appName
     * @param userName
     */
    public void loginToggleToApp(String appName, String userName) {
        login(userName);
        toggleApp(appName);
    }

    /**
     * Handles navigation to the given tab/ module
     * 
     * @param tabName
     */
    public void navigateToTab(String tabName) {
        govgrants.mainPage().clickMainMenuBar(tabName);
    }

    /**
     * Handles clicking on the given left pans/ side bar option
     * 
     * @param sidebarContent
     * @param sidebarSubHeader
     */
    public void clickOnSidebar(String sidebarContent, String sidebarSubHeader) {
        govgrants.sideBar().getSideBarContent(sidebarSubHeader, sidebarContent).click();
    }

    /**
     * Handles clicking of subtab inside the record view page
     * 
     * @param subtabName
     */
    public void clickOnSubtab(String subtabName) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.JavaScript().scrollpageToSpecificElement(headerOverviewPath);
        govgrants.pageDetails().clickSubTabsInsideTableView(subtabName);
    }

    /**
     * Handles clicking on the given page button
     * 
     * @param buttonName
     */
    public void clickOnPageButton(String buttonName) {
        govgrants.pageDetails().clickAnyTopRightButton(buttonName);
    }

    /**
     * Handles clicking on the given page button
     * 
     * @param buttonName
     */
    public void clickOnPageButtonWithModalId(String buttonName, String IframeId) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.JavaScript().scrollPageDocumentJS("pageup", 0, 0);
        govgrants.pageDetails().clickAnyTopRightButton(buttonName);
        reiDriver.switchTo().switchToFrame(getIFramePath(IframeId));
    }

    /**
     * Handles clicking on the given button inside a modal
     * 
     * @param buttonName
     */
    public void clickOnModalButton(String buttonName) {
        try {
            govgrants.modal().clickModalContentSpecificButton(buttonName);
        } catch (Exception e) {
            reiDriver.findMyElement().getElement(By.xpath("//div[@class='panel-footer']//button[@title='" + buttonName
                    + "']  | //div[@class='panel-footer']//*[@value='" + buttonName + "']")).click();
        }
        govgrants.mainPage().waitForNavigationLogoToDisappear();
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
     * Handles entering of field values
     * 
     * @param sheetName
     * @param excelName
     */
    public void enterFieldValues(String sheetName, String excelName) {
        enterInputForFormsFromExcelFile(excelName, sheetName);
    }

    /**
     * Assert the status for a record through progress bar
     * 
     * @param record
     * @param status
     */
    public void assertStatusProgressBar(String status, String color) {
        Assert.assertTrue(isStatusProgressBar(status, color));
    }

    /**
     * Assert the status for a record through overview header
     * 
     * @param record
     * @param status
     */
    public void assertStatus(String record, String status) {
        Assert.assertTrue(isStatus(record, status));
    }

    /**
     * handles changing field values
     * 
     * @param fieldId
     * @param text
     */
    public void changeFieldValueText(String fieldId, String text) {
        reiDriver.textInput().clearText(getTextInputFields(fieldId));
        reiDriver.textInput().enterText(getTextInputFields(fieldId), text);
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
        toggleApp(appName);
    }

    /**
     * Assert the text value for the given field label
     * 
     * @param fieldLabel
     * @param text
     */
    public void assertfieldValue(String fieldLabel, String text) {
        Assert.assertTrue(isFieldModified(fieldLabel, text));
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
     * Assert if a column value is present in a flextable
     * 
     * @param status
     */
    public void assertColumnValueOnTable(String status) {
        Assert.assertTrue(isStatusCorrect(status));
    }

    /**
     * To perform quick search on a table
     * 
     * @param searchText
     * @param tableName
     */
    public void quickSearchOnGridTable(String flexTableDivId, String anyUniqueColumnValueFromParent,
            String searchTerm) {
        govgrants.quickSearch().performEnhancedGridSearch(flexTableDivId, anyUniqueColumnValueFromParent, searchTerm);
    }

    /**
     * To perform quick search on a table
     * 
     * @param searchText
     * @param tableName
     */
    public void quickSearchOnTable(String searchText, String tableName) {
        govgrants.quickSearch().performTableSpecificQuickSearch(tableName, searchText);
    }

    /**
     * Handles clicking of an row level button against the given unique column value
     * 
     * @param iconName
     * @param uniqueTextValue
     */
    public void clickOnFlexTableIcon(String iconName, String anyUniqueColumnValues) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        govgrants.flexTable().clickTableActionIcons(iconName, anyUniqueColumnValues);
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
     * Handles clicking on the top button of the given flextable
     * 
     * @param buttonName
     * @param flextableName
     * @param iFrameId
     */
    public void clickOnFlextableButton(String buttonName, String flextableId) {
            govgrants.flexTable().clickTableTopRightButton(flextableId, buttonName);
    }

    /**
     * Clicking on flextable top button when one flextable is present in the page
     * 
     * @param buttonName
     */
    public void clickOnPhaseFlexTableButton(String buttonName, String flextableName) {
        govgrants.flexTable().clickTableTopRightButton(flextableName, buttonName);
    }

    /**
     * Handles selecting a record in the flextable
     * 
     * @param uniqueColumnValue
     * @param flexTableName
     */
    public void clickOnCheckbox(String uniqueColumnValue, String flextableName) {
        reiDriver.JavaScript().scrollpageToSpecificElement(getScrollToSection(flextableName));
        reiDriver.findMyElement().getElement(getCheckboxForSpecificRecord(flextableName, uniqueColumnValue)).click();
    }

    /**
     * Handles entering of Peer review
     */
    public void enterReview() {
        reiDriver.findMyElement().getDropDown(By.xpath("//div[@id='fieldRating__c']//select"))
                .selectByVisibleText("Passed");
        reiDriver.findMyElement().getElement(By.xpath("//div[@id='fieldReviewComments__c']//textarea"))
                .sendKeys("Automation Reviewer comments");
    }

    /**
     * Handles clicking on the top button of the given flextable to open a modal and
     * switch to the modal frame
     * 
     * @param buttonName
     * @param flextableName
     */
    public void clickOnButtonForAttachmentNotesToOpenModal(String buttonName, String flextableName) {
        govgrants.modal().clickTopRightButtonForAttachmentNotes(flextableName, buttonName);
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
     * Asserts if a column value is present inside the given flextable
     * 
     * @param columnUniqueValue
     * @param flextableName
     */
    public void assertColumnOnTable(String columnUniqueValue, String flextableId) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        Assert.assertTrue(isColumnPresent(columnUniqueValue, flextableId));
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
     * Handles sliding to the right of the child grid and clicking on the row level
     * icon
     * 
     * @param buttonName
     * @param uniqueColumnName
     * @param tableId
     */
    public void clickButtonOnGrid(String iconName, String uniqueColumnValue, String tableId) {
        try {
            govgrants.flexTable().clickTableActionIcons(iconName, uniqueColumnValue);
        } catch (Exception ex) {
            govgrants.flexTable().slideNestedFlexTable(tableId, 150);
            govgrants.flexTable().clickTableActionIcons(iconName, uniqueColumnValue);
        }

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
    public void expandGrid(String uniqueColumnValue, String gridName) {
        reiDriver.WaitFor().makeThreadSleep(2000);
        reiDriver.JavaScript().scrollpageToSpecificElement(getScrollToSection(gridName));
        try {
            govgrants.flexTable().expandOrCollapseNestedTable(uniqueColumnValue, true);
        } catch (Exception ex) {
            reiDriver.findMyElement().getElement(By
                    .xpath("//td//*[text()='" + uniqueColumnValue + "']//ancestor::tr[1]//i[contains(@class, 'plus')]"))
                    .click();
        }
    }

    /**
     * Handles switching to parent frame
     * 
     * @param uniqueColumnValue
     * @param flextableName
     */
    public void switchToParentFrame() {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.switchTo().switchToParentFrame();
    }

    /**
     * Handles grid collapsing
     * 
     * @param sectionName
     */
    public void collapseGrid(String uniqueColumnValue, String gridName) {
        reiDriver.WaitFor().makeThreadSleep(500);
        reiDriver.JavaScript().scrollpageToSpecificElement(getScrollToSection(gridName));
        try {
            govgrants.flexTable().expandOrCollapseNestedTable(uniqueColumnValue, false);
        } catch (Exception ex) {
            reiDriver.findMyElement().getElement(By.xpath(
                    "//td//*[text()='" + uniqueColumnValue + "']//ancestor::tr[1]//i[contains(@class, 'minus')]"))
                    .click();
        }
    }

    /**
     * Clicks on flextable row level buttons inside the record view page where there
     * are number of flextables
     * 
     * @param buttonName
     * @param uniqueColumnvalue
     * @param flextableName
     */
    public void clickOnFlextableRowButton(String flextableName, String iconName, String uniqueColumnvalue) {
        govgrants.flexTable().clickTableActionIcon(flextableName,iconName, uniqueColumnvalue);
    }

    /**
     * Handles association of various related records
     * 
     * @param recordName
     * @param recordUniqueName
     * @param buttonName
     */
    public void chooseRecordForAssociation(String buttonName, String recordUniqueName, String tableId) {
        reiDriver.WaitFor().makeThreadSleep(1000);
        try {
            govgrants.quickSearch().performModalSpecificQuickSearch(tableId, recordUniqueName);
        } catch (Exception ex) {
            By searchInputBox = By.cssSelector("div#" + tableId + " div>input[placeholder='Quick Search']");
            reiDriver.findMyElement().getElement(searchInputBox);
            reiDriver.WaitFor().WaitForElementToBePresent(searchInputBox).clear();
            reiDriver.WaitFor().WaitForElementToBePresent(searchInputBox).sendKeys(recordUniqueName);
            reiDriver.WaitFor().WaitForElementToBePresent(By.cssSelector("div#" + tableId + " a>i.fa.fa-search"))
                    .click();
        }
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.WaitFor().WaitForElementToBePresent(getCheckbox()).click();
        govgrants.phasePannel().clickAnyRightPannelButton(tableId, buttonName);
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
        reiDriver.findMyElement().getElement(By.xpath("//span[@class='lookupInput']//input")).clear();
        reiDriver.findMyElement().getElement(By.xpath("//span[@class='lookupInput']//input")).sendKeys(approverName);
        reiDriver.WaitFor().WaitForElementToBePresent(lookUpSearchPath).click();
        reiDriver.switchTo().switchToFrame(lookUpIFramePath);
        reiDriver.WaitFor().makeThreadSleep(1000);
        govgrants.flexTable().clickTableActionIcons("Select", approverName);
        reiDriver.WaitFor().makeThreadSleep(500);
        reiDriver.switchTo().switchToParentFrame();
        reiDriver.WaitFor().makeThreadSleep(500);
        reiDriver.textInput().clearText(approverDescription);
        reiDriver.textInput().enterText(approverDescription, defaultLongText);
        reiDriver.WaitFor().makeThreadSleep(1000);
        govgrants.modal().clickModalContentSpecificButton("Save");
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

    /**
     * Handles entering of a single field value
     * 
     * @param fieldAPIName
     * @param value
     */
    public void enterFieldValue(String fieldAPIName, String value) {
        govgrants.inputForms().inputFormDataByFieldApiName(fieldAPIName, value);
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
     * Handles addition of row and filling in fields in a flex table
     */
    public void addFieldsForInlineTable(String tableId, String iconName, List<Map<String, String>> rowValues) {
        govgrants.flexTable().enterFlexTableRows(tableId, iconName, rowValues);
    }

    /**
     */
    public void fillFieldsForInlineTable(String tableId, String iconName, DataTable rowValues) {
        govgrants.flexTable().editFlexTableRowsInline(tableId, iconName, rowValues);
    }

    public void fillStandardForm() {
        govgrants.inputForms().completeFillingStandardForm();
    }
    
    public DataTable seperateInlineDataTable(Map<String, Map<String,String>> dataTableMap) {
        List<String> inlineColumnTitleList = new ArrayList<String>();
        List<String> inlineValueList = new ArrayList<String>();
        for (String mainMapKey : dataTableMap.keySet()) {
            if (mainMapKey.equals("Inline Column Title")) {
                for (String innerMapKey : dataTableMap.get(mainMapKey).keySet()) {
                    inlineColumnTitleList.add(dataTableMap.get(mainMapKey).get(innerMapKey));
                }
            } else if (mainMapKey.equals("Inline values")) {
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

    /**
     * Handles creation of a post award record from the sheet in an excel
     * 
     * @param user
     * @param sheetName
     * @param excelFileName
     * @param dataTable
     */
    public void creationOfPostAwardRecord(String sheetName, String excelFileName, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        clickOnSubtab(dataTableMap.get("Navigation").get("Step 1"));
        clickOnFlextableButton(dataTableMap.get("FlexTable").get("Step 1"), dataTableMap.get("FlexTable").get("Step 2"));
        enterFieldValues(sheetName, excelFileName);
        clickOnModalButton(dataTableMap.get("Creation").get("Step 1"));
        clickOnPageButton(dataTableMap.get("Creation").get("Step 2"));
    }

    /**
     * Handles filling up of fields from the sheet in an excel
     * 
     * @param sheetName
     * @param excelFileName
     */
    public void editionOfRecord(String sheetName, String excelFileName, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        clickOnPageButton(dataTableMap.get("Edition Buttons").get("Step 1"));
        enterFieldValues(sheetName, excelFileName);
        clickOnPageButton(dataTableMap.get("Edition Buttons").get("Step 2"));
    }

    /**
     * Handles association of contact, focus area and objective
     * 
     * @param contact
     * @param focusArea
     * @param objective
     */
    public void associationOfRecords(String contact, String focusArea, String objective, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        // Contact association
        clickOnSubtab(dataTableMap.get("Contact").get("Step 1"));
        clickOnFlextableButton(dataTableMap.get("Contact").get("Step 2"), dataTableMap.get("Contact").get("Step 3"));
        chooseRecordForAssociation(dataTableMap.get("Contact").get("Step 4"), contact,
                dataTableMap.get("Contact").get("Step 5"));
        closeModal();

        // Focus Area association
        clickOnSubtab(dataTableMap.get("Focus Area").get("Step 1"));
        clickOnFlextableButton(dataTableMap.get("Focus Area").get("Step 2"),
                dataTableMap.get("Focus Area").get("Step 3"));
        chooseRecordForAssociation(dataTableMap.get("Focus Area").get("Step 4"), focusArea,
                dataTableMap.get("Focus Area").get("Step 5"));
        try {
            closeModal();
        } catch(Exception ex) {
            reiDriver.get().getRefresh();
        }

        // Objective association
        clickOnSubtab(dataTableMap.get("Objective").get("Step 1"));
        clickOnFlextableButton(dataTableMap.get("Objective").get("Step 2"), dataTableMap.get("Objective").get("Step 3"));
        chooseRecordForAssociation(dataTableMap.get("Objective").get("Step 4"), objective,
                dataTableMap.get("Objective").get("Step 5"));
        closeModal();
    }

    /**
     * Handles association of participant
     * 
     * @param participant
     * @param dataTable
     */
    public void associationOfRecord(String participant, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        clickOnSubtab(dataTableMap.get("Participant").get("Step 1"));
        clickOnFlextableButton(dataTableMap.get("Participant").get("Step 2"),
                dataTableMap.get("Participant").get("Step 3"));
        chooseRecordForAssociation(dataTableMap.get("Participant").get("Step 4"), participant,
                dataTableMap.get("Participant").get("Step 5"));
        closeModal();
    }

    /**
     * Handles assigning two of approvers
     * 
     * @param programApprover
     * @param executiveApprover
     */
    public void twoApproverSelection(String programApprover, String executiveApprover, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        clickOnSubtab(dataTableMap.get("Subtab").get("Step 1"));
        clickOnFlextableRowButton(dataTableMap.get("Approver 1").get("Step 1"),
                dataTableMap.get("Approver 1").get("Step 2"), dataTableMap.get("Approver 1").get("Step 3"));
        fillInApproverDetails(programApprover);
        try {
            closeModal();
        }catch (Exception ex) {
            switchToParentFrame();
        }
        clickOnFlextableRowButton(dataTableMap.get("Approver 2").get("Step 1"),
                dataTableMap.get("Approver 2").get("Step 2"), dataTableMap.get("Approver 2").get("Step 3"));
        fillInApproverDetails(executiveApprover);
        try {
            closeModal();
        }catch (Exception ex) {
            switchToParentFrame();
        }
    }

    /**
     * Handles addition of checklist
     * 
     * @param description
     * @param required
     * @param appliesTo
     * @param fileName
     */
    public void additionOfChecklist(String fileName, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        clickOnSubtab(dataTableMap.get("Checklist Navigation").get("Step 1"));
        addFieldsForInlineTable(dataTableMap.get("Checklist FlexTable").get("Step 1"),
                dataTableMap.get("Checklist FlexTable").get("Step 2"), inlineRowAdditionDatableSeperator(dataTableMap));
        clickOnFlextableRowButton(dataTableMap.get("Upload Modal").get("Step 1"),
                dataTableMap.get("Upload Modal").get("Step 2"), dataTableMap.get("Upload Modal").get("Step 3"));
        uploadFile(fileName, dataTableMap.get("Upload file").get("Step 1"),
                dataTableMap.get("Upload file").get("Step 2"));
        closeModal();
    }

    /**
     * Handles adding an attachment
     * 
     * @param fileName
     */
    public void additionOfAttachment(String fileName, String flexTableName, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        clickOnSubtab(dataTableMap.get("Attachment Navigation").get("Step 1"));
        clickOnButtonForAttachmentNotesToOpenModal(dataTableMap.get("Attachment Navigation").get("Step 2"),
                flexTableName);
        uploadFile(fileName, dataTableMap.get("Attachment Details").get("Step 1"),
                dataTableMap.get("Attachment Details").get("Step 2"));
        closeModal();
    }

    /**
     * Handles approving a record by the assigned approvers
     * 
     * @param programApprover
     * @param executiveApprover
     * @param programName
     * @throws IOException 
     */
    public void twoApproversApproveRecord(String programApprover, String executiveApprover, String recordName,
            DataTable dataTable) throws IOException {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        reloginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), programApprover);
        navigateToTab(dataTableMap.get("Navigation").get("Step 2"));
        clickOnSidebar(dataTableMap.get("Pending Task").get("Step 1"), dataTableMap.get("Pending Task").get("Step 2"));
        quickSearchOnTable(recordName, dataTableMap.get("Pending Task").get("Step 3"));
        clickOnFlexTableIcon(dataTableMap.get("Approval Buttons").get("Step 1"), recordName);
        clickOnApprovalDecisionBox(dataTableMap.get("Approval Buttons").get("Step 2"));
        reloginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), executiveApprover);
        navigateToTab(dataTableMap.get("Navigation").get("Step 2"));
        clickOnSidebar(dataTableMap.get("Pending Task").get("Step 1"), dataTableMap.get("Pending Task").get("Step 2"));
        quickSearchOnTable(recordName, dataTableMap.get("Pending Task").get("Step 3"));
        clickOnFlexTableIcon(dataTableMap.get("Approval Buttons").get("Step 1"), recordName);
        clickOnApprovalDecisionBox(dataTableMap.get("Approval Buttons").get("Step 2"));
    }

    /**
     * Handles re-logging in and to view the given award
     * 
     * @param awardId
     * @param awardName
     * @param awardOwner
     * @throws IOException 
     */
    public void reloginToViewAward(String awardId, String awardName, String awardOwner) throws IOException {
        try {
            loginToggleToApp("As a Grantor", awardOwner);
        } catch (Exception ex) {
            reloginToggleToApp("As a Grantor", awardOwner);
        }
        navigateToTab("Grants");
        clickOnSidebar("Grants and Subawards", "Grants, Awards & Amendments");
        changeFlexTableView("Active Grants");
        quickSearchOnTable(awardName, "ActiveGrants");
        clickOnFlexTableIcon("View", awardName);
        clickOnSubtab("Subawards");
        clickOnFlextableRowButton("View", awardId, "Subawards");
    }
    
    /**
     * Handles logging in as specified subrecipient and checking for task
     * 
     * @param subrecipient
     * @param uniqueColumnValue
     * @param dataTable
     * @throws IOException 
     */
    public void subrecipientTask(String subrecipient, String uniqueColumnValue, DataTable dataTable) throws IOException {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        reloginToGrantsPortal(subrecipient);
        navigateToTab(dataTableMap.get("Navigation").get("Step 1"));
        clickOnSidebar(dataTableMap.get("Left Panel").get("Step 1"), dataTableMap.get("Left Panel").get("Step 2"));
        quickSearchOnTable(uniqueColumnValue, dataTableMap.get("FlexTable").get("Step 1"));
        clickOnFlexTableIcon(dataTableMap.get("FlexTable").get("Step 2"), uniqueColumnValue);
    }

    public void fillingUpStandardForm(String formName, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        clickOnSubtab(dataTableMap.get("Navigation").get("Step 1"));
        clickOnFlextableRowButton(dataTableMap.get("FlexTable").get("Step 1"), formName,
                dataTableMap.get("FlexTable").get("Step 2"));
        govgrants.inputForms().completeFillingStandardForm();
        clickOnPageButton(dataTableMap.get("Form Button").get("Step 1"));
        clickOnPageButton(dataTableMap.get("Form Button").get("Step 2"));
        clickOnFlextableButton(dataTableMap.get("Validation").get("Step 1"), dataTableMap.get("Validation").get("Step 2"));
    }

    /******* "Local Methods with Limited functionality " **********/

    private void login(String userName) {
        govgrants.mainPage().login(new UsersAndURL().handleUsersForEnv(userName), defaultPassword);
    }

    private void toggleApp(String appName) {
        govgrants.mainPage().setUpCustomAppDropDown(appName);
    }

    private By getTextInputFields(String fieldId) {
        return By.xpath("//span[@id='" + fieldId + "']/input[@type='text']");
    }

    private By getScrollToSection(String sectionName) {
        return By.xpath("//div[contains(@class,'panel-heading')]//*[@title='" + sectionName
                + "']|//div[contains(@class,'panel-heading')]//*[text()='" + sectionName + "']");
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

    private By getIFramePath(String iFrameId) {
        return By.xpath("//iframe[@id='" + iFrameId + "']");
    }

    private By getCheckboxForSpecificRecord(String flexttableName, String uniqueColumnValue) {
        return By.xpath("//span[text()='" + flexttableName + "']/..//div[@class='table-responsive']//td//*[text()='"
                + uniqueColumnValue + "']/ancestor::tr[1]//td//input[@type='checkbox']");
    }

    private By getCheckbox() {
        return By.xpath("//td//input[@type='checkbox']");
    }

    private boolean isStatusProgressBar(String status, String color) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        return govgrants.pageDetails().isStepProgressBarStatusInSpecifiedColor(status, color);
    }

    private boolean isStatus(String record, String status) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        return reiDriver.WaitFor()
                .WaitForElementToBePresent(By.xpath("//span[text()='" + record
                        + "']/../../../../../../../..//div//dt/span[text()='Status']/../..//dd//span[text()='" + status
                        + "']"))
                .isDisplayed();
    }

    private boolean isFieldModified(String fieldLabel, String text) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//span[text()='" + fieldLabel + "']/../..//span"));
        return reiDriver.findMyElement()
                .getElement(By.xpath("//span[text()='" + fieldLabel + "']/../..//span[text()='" + text + "']"))
                .isDisplayed();
    }

    private boolean isStatusCorrect(String status) {
        reiDriver.WaitFor().WaitForElementListToBePresent(By.xpath("//table"));
        return reiDriver.findMyElement().getElement(govgrants.flexTable().getFlexTableColumn(status)).isDisplayed();
    }

    private boolean isColumnPresent(String columnUniqueValue, String flextableId) {
        return govgrants.flexTable().getSpecificTableColumn(flextableId, columnUniqueValue).isEnabled();
    }

    private void handleTextInput(String fieldApiName, String fieldValue) {
        By fieldInput = By.xpath("//div[@id='field" + fieldApiName + "']//input[@type='text']");
        reiDriver.textInput().clearText(fieldInput);
        reiDriver.textInput().enterText(fieldInput, fieldValue);
    }

    private void handleTextAreaInput(String fieldApiName, String fieldValue) {
        By fieldInput = By.xpath("//div[@id='field" + fieldApiName + "']//textarea");
        reiDriver.textInput().clearText(fieldInput);
        reiDriver.textInput().enterText(fieldInput, fieldValue);
    }

    private void handleDateInput(String fieldApiName, String fieldValue, boolean isDateTime) {
        String inputFormat = "MM/dd/YYYY";
        if (isDateTime) {
            inputFormat = inputFormat + " hh:mm a";
        }

        int offset = 0;
        try {
            offset = Integer.parseInt(fieldValue);
        } catch (Exception e) {

        }

        By fieldInput = By.xpath("//div[@id='field" + fieldApiName + "']//input[@type='text']");
        reiDriver.textInput().clearText(fieldInput);
        reiDriver.textInput().enterText(fieldInput,
                reiDriver.get().getCurrentDateWithOffsetInDesiredFormat(offset, inputFormat));
        try {
            reiDriver.WaitFor().WaitForElementToBePresent(fieldInput).click();
        } catch (Exception e) {

        }
    }

    private void handleRichTextInput(String fieldApiName, String value) {
        reiDriver.WaitFor().makeThreadSleep(2000);
        reiDriver.switchTo().switchToFrame(By.xpath("//div[@id='field" + fieldApiName + "']//iframe"));
        reiDriver.textInput().clearText(By.xpath("//html/body"));
        reiDriver.findMyElement().getElement(By.xpath("//html/body")).sendKeys(value);
        reiDriver.switchTo().switchToParentFrame();
    }

    private void handleLookUpInput(String fieldApiName, String fieldValue) {
        int attempts = 0;
        while (attempts < 10
                && !reiDriver.is().IsElementPresentQuick(By.xpath("//body[contains(@class, 'modal-open')]"))) {
            attempts++;
            try {
                reiDriver.WaitFor()
                        .FluentWaitForClick(By
                                .xpath("//div[@id='field" + fieldApiName + "']//dd//span[@class='lookupInput']/input"))
                        .sendKeys(fieldValue);

                reiDriver.WaitFor().FluentWaitForClick(By.xpath("//div[@id='field" + fieldApiName + "']//dd//a"))
                        .click();
                reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//body[contains(@class, 'modal-open')]"));
            } catch (Exception e) {
            }
        }
        reiDriver.WaitFor().makeThreadSleep(1000);
        WebDriver driver = reiDriver.switchTo().switchToFrame(By.xpath("//iframe[@id='iframeCustomLookupModalId']"));
        attempts = 0;
        while (attempts < 10 && reiDriver.is().IsElementPresentQuick(By.xpath("//body/*"))) {
            reiDriver.WaitFor().makeThreadSleep(1000);
            reiDriver.WaitFor()
                    .WaitForElementToBePresent(
                            By.xpath("//td//*[text()='" + fieldValue + "']//ancestor::tr[1]//a[@title='Select']"))
                    .click();
        }

        driver.switchTo().parentFrame();
        reiDriver.WaitFor().WaitForElementToDisapear(By.xpath("//iframe[@id='iframeCustomLookupModalId']"));
    }

    private void handleDropdownInput(String fieldApiName, String value) {
        reiDriver.WaitFor().WaitForElementListToBePresent(By.xpath("//div[@id='field" + fieldApiName + "']//select"));
        reiDriver.findMyElement().getDropDown(By.xpath("//div[@id='field" + fieldApiName + "']//select"))
                .selectByVisibleText(value);
    }

    private void handleMultiSelectInput(String fieldApiName, String value) {
        reiDriver.WaitFor().WaitForElementListToBePresent(By.xpath("//div[@id='field" + fieldApiName + "']//select"));

        JsonArray values = new JsonParser().parse(value).getAsJsonArray();
        for (JsonElement val : values) {
            String input = val.toString().substring(1, val.toString().length() - 1);
            reiDriver.findMyElement()
                    .getDropDown(By.xpath("//div[@id='field" + fieldApiName + "']//optgroup[@label='Available']//.."))
                    .selectByVisibleText(input);
        }

        reiDriver.WaitFor()
                .FluentWaitForClick(By.xpath("//div[@id='field" + fieldApiName + "']//img[@title='Add']//..")).click();
    }

    private void handleCheckBoxInput(String fieldApiName, String fieldValue) {
        By fieldInput = By.xpath("//div[@id='field" + fieldApiName + "']//input[@type='checkbox']");
        if ("Checked".equalsIgnoreCase(fieldValue)
                && !reiDriver.WaitFor().WaitForElementToBePresent(fieldInput).isSelected()) {
            reiDriver.WaitFor().FluentWaitForClick(fieldInput).click();
        } else if ("Unchecked".equalsIgnoreCase(fieldValue)
                && reiDriver.WaitFor().WaitForElementToBePresent(fieldInput).isSelected()) {
            reiDriver.WaitFor().FluentWaitForClick(fieldInput).click();
        }
    }

    private List<Map<String, String>> inlineRowAdditionDatableSeperator(
            Map<String, Map<String, String>> convertedMapOfMaps) {
        List<Map<String, String>> listOfMapForInlineMethod = new ArrayList<Map<String, String>>();
        Map<String, String> inlineMap = new HashMap<String, String>();
        for (String mainMapKey : convertedMapOfMaps.keySet()) {
            if (mainMapKey.equals("Inline Column Title")) {
                for (String innerMapKey : convertedMapOfMaps.get(mainMapKey).keySet()) {
                    inlineMap.put(convertedMapOfMaps.get(mainMapKey).get(innerMapKey),
                            convertedMapOfMaps.get("Inline values").get(innerMapKey));
                }
                listOfMapForInlineMethod.add(inlineMap);
            }
        }
        return listOfMapForInlineMethod;
    }
}
