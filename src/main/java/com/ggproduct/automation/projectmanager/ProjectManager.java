package com.ggproduct.automation.projectmanager;

import java.io.IOException;
import org.openqa.selenium.By;
import org.testng.Assert;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
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
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelName, sheetName);
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
     * Handles toggling between different list views
     * 
     * @param tableViewName
     */
    public void changeFlexTableView(String tableViewName) {
        govgrants.phasePannel().clickDoubleArrowDropDownAndSelectItem(tableViewName);
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
    public void quickSearchOnTable(String searchText, String tableId) {
        govgrants.quickSearch().performTableSpecificQuickSearch(tableId, searchText);
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
    public void clickOnMultipleCheckbox(String flextableId, String... uniqueColumnValues) {
        govgrants.flexTable().selectCheckBoxes(flextableId, uniqueColumnValues);
    }

    /**
     * Handles entering of Peer review
     */
    public void enterReview(String rating) {
        govgrants.inputForms().inputFormDataByFieldApiName("fieldRating__c", rating);
        govgrants.inputForms().inputFormDataByFieldApiName("ReviewComments__c", "Automation Reviewer comments");
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
    public void collapseGrid(String uniqueColumnValue) {
        govgrants.flexTable().expandOrCollapseNestedTable(uniqueColumnValue, false);
    }

    /**
     * Clicks on flextable row level buttons inside the record view page where there
     * are number of flextables
     * 
     * @param buttonName
     * @param uniqueColumnvalue
     * @param flextableName
     */
    public void clickOnFlextableRowButton(String flextableId, String iconName, String uniqueColumnvalue) {
        govgrants.flexTable().clickTableActionIcon(flextableId, iconName, uniqueColumnvalue);
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
        clickOnFlextableButton(dataTableMap.get("FlexTable").get("Step 1"),
                dataTableMap.get("FlexTable").get("Step 2"));
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
        chooseRecordForAssociation(dataTableMap.get("Contact").get("Step 4"), dataTableMap.get("Contact").get("Step 5"),
                contact.split(","));
        closeModal();

        // Focus Area association
        clickOnSubtab(dataTableMap.get("Focus Area").get("Step 1"));
        clickOnFlextableButton(dataTableMap.get("Focus Area").get("Step 2"),
                dataTableMap.get("Focus Area").get("Step 3"));
        chooseRecordForAssociation(dataTableMap.get("Focus Area").get("Step 4"),
                dataTableMap.get("Focus Area").get("Step 5"), focusArea.split(","));
        try {
            closeModal();
        } catch (Exception ex) {
            reiDriver.get().getRefresh();
        }

        // Objective association
        clickOnSubtab(dataTableMap.get("Objective").get("Step 1"));
        clickOnFlextableButton(dataTableMap.get("Objective").get("Step 2"),
                dataTableMap.get("Objective").get("Step 3"));
        chooseRecordForAssociation(dataTableMap.get("Objective").get("Step 4"),
                dataTableMap.get("Objective").get("Step 5"), objective.split(","));
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
        chooseRecordForAssociation(dataTableMap.get("Participant").get("Step 4"),
                dataTableMap.get("Participant").get("Step 5"), participant.split(","));
        closeModal();
    }

    /**
     * Handles assigning given n# of approvers
     * 
     * @param programApprover
     * @param executiveApprover
     */
    public void approverSelection(String noOfApprovers, DataTable dataTable, String... approvers) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        int numberOfApprovers = Integer.parseInt(noOfApprovers);
        clickOnSubtab(dataTableMap.get("Subtab").get("Step 1"));
        for (int i = 1; i <= numberOfApprovers; i++) {
            singleApproverSelection(i, approvers[i - 1], dataTableMap);
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
        clickOnFlextableRowButton(dataTableMap.get("Checklist FlexTable").get("Step 1"),
                dataTableMap.get("Upload Modal").get("Step 1"), dataTableMap.get("Upload Modal").get("Step 2"));
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
     * Handles uploading of checklist files
     * 
     * @param fileName
     */
    public void uploadChecklistDocument(String noOfDocuments, DataTable dataTable, String... fileName) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        clickOnSubtab(dataTableMap.get("Navigation").get("Step 1"));
        int numberOfDocuments = Integer.parseInt(noOfDocuments);
        for (int i = 1; i <= numberOfDocuments; i++) {
            singleChecklistDocumentUpload(fileName[i - 1], dataTableMap);
        }
    }

    /**
     * Handles assigning of reviewer and initiating the review process
     * 
     * @param sheetName
     * @param excelFileName
     */
    public void initiateReviewForAnnouncement(String sheetName, String excelFileName, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        clickOnSubtab(dataTableMap.get("Reviewer Navigation").get("Step 1"));
        clickOnFlextableButton(dataTableMap.get("FlexTable").get("Step 1"),
                dataTableMap.get("FlexTable").get("Step 2"));
        enterFieldValues(sheetName, excelFileName);
        clickOnModalButton(dataTableMap.get("FlexTable").get("Step 3"));
        closeModal();
        clickOnFlextableRowButton(dataTableMap.get("FlexTable").get("Step 2"),
                dataTableMap.get("Send Review").get("Step 1"), dataTableMap.get("Send Review").get("Step 1"));
    }

    /**
     * Handles reviewing the announcement and completing the review process for an
     * announcement
     * 
     * @param reviewer
     * @param announcementType
     * @param announcementName
     * @param announcementOwner
     * @throws IOException
     */
    public void completePeerReview(String reviewer, String recordName, String recordOwner, DataTable dataTable)
            throws IOException {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        reloginToggleToApp(dataTableMap.get("Reviewer Navigation").get("Step 1"), reviewer);
        navigateToTab(dataTableMap.get("Reviewer Navigation").get("Step 2"));
        clickOnSidebar(dataTableMap.get("Reviewer Navigation").get("Step 3"),
                dataTableMap.get("Reviewer Navigation").get("Step 4"));
        quickSearchOnTable(recordName, dataTableMap.get("FlexTable").get("Step 1"));
        clickOnFlexTableIcon(dataTableMap.get("FlexTable").get("Step 2"), recordName);
        clickOnFlextableRowButton(dataTableMap.get("FlexTable").get("Step 3"),
                dataTableMap.get("FlexTable").get("Step 4"), dataTableMap.get("Enter Review").get("Step 1"));
        enterReview(dataTableMap.get("Enter Review").get("Step 2"));
        clickOnModalButton(dataTableMap.get("Enter Review").get("Step 3"));
        clickOnModalButton(dataTableMap.get("Enter Review").get("Step 4"));
        closeModal();
        reloginToggleToApp(dataTableMap.get("Owner Navigation").get("Step 1"), recordOwner);
        navigateToTab(dataTableMap.get("Owner Navigation").get("Step 2"));
        clickOnSidebar(dataTableMap.get("Owner Navigation").get("Step 3"),
                dataTableMap.get("Owner Navigation").get("Step 4"));
        changeFlexTableView(dataTableMap.get("Complete Review").get("Step 1"));
        quickSearchOnTable(recordName, dataTableMap.get("Complete Review").get("Step 2"));
        clickOnFlexTableIcon(dataTableMap.get("Complete Review").get("Step 3"), recordName);
        clickOnPageButton(dataTableMap.get("Complete Review").get("Step 4"));
    }

    /**
     * Handles approving of any record by all approvers
     * 
     * @param programApprover
     * @param fiscalApprover
     * @param executiveApprover
     * @param announcementName
     * @throws IOException
     */
    public void approversApproveRecord(String noOfApprovers, String recordName, DataTable dataTable,
            String... approvers) throws IOException {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        int numberOfApprovers = Integer.parseInt(noOfApprovers);
        for (int i = 1; i <= numberOfApprovers; i++) {
            singleApproverApproval(recordName, approvers[i - 1], dataTableMap);
        }
    }

    /**
     * Handles re-logging in and to view the given award
     * 
     * @param awardId
     * @param awardName
     * @param awardOwner
     * @throws IOException
     */
    public void reloginToViewAward(String awardState, String awardId, String awardName, String awardOwner)
            throws IOException {
        try {
            loginToggleToApp("As a Grantor", awardOwner);
        } catch (Exception ex) {
            reloginToggleToApp("As a Grantor", awardOwner);
        }
        navigateToTab("Grants");
        clickOnSidebar("Grants and Subawards", "Grants, Awards & Amendments");
        changeFlexTableView(awardState + " Grants");
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
    public void subrecipientTask(String subrecipient, String uniqueColumnValue, DataTable dataTable)
            throws IOException {
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
        clickOnFlextableButton(dataTableMap.get("Validation").get("Step 1"),
                dataTableMap.get("Validation").get("Step 2"));
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

    /**
     * Handles re-logging as a different user and toggling to the app specified
     * 
     * @param appName
     * @param userName
     * @throws IOException
     */
    public void reloginToggleToAppInURL(String appName, String userName, String env) throws IOException {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.WaitFor().makeThreadSleep(1000);
        govgrants.mainPage().clickLoginDropDown();
        govgrants.mainPage().getLoginDropDownItems("Logout").click();
        reiDriver.eatCookies().deleteAllCookies();
        reiDriver.WaitFor().makeThreadSleep(500);
        reiDriver.get().navigateToUrl(new Properties_Logs().ReadPropertyFile("environment.properties", env));
        govgrants.mainPage().login(new UsersAndURL().handleUsersForEnv(userName),
                new Properties_Logs().ReadPropertyFile("environment.properties", "DEFAULTPASSWORD"));
        govgrants.mainPage().waitForEgmsHeader();
        govgrants.mainPage().setUpCustomAppDropDown(appName);
    }

    /******* "Local Methods with Limited functionality " **********/

    private void login(String userName) {
        govgrants.mainPage().login(new UsersAndURL().handleUsersForEnv(userName), defaultPassword);
    }

    private void toggleApp(String appName) {
        govgrants.mainPage().setUpCustomAppDropDown(appName);
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

    private boolean isColumnPresent(String columnUniqueValue, String flextableId) {
        return govgrants.flexTable().getSpecificTableColumn(flextableId, columnUniqueValue).isEnabled();
    }

    private void singleApproverSelection(int qNumber, String approverName,
            Map<String, Map<String, String>> dataTableMap) {
        clickOnFlextableRowButton(dataTableMap.get("Approver " + qNumber).get("Step 1"),
                dataTableMap.get("Approver " + qNumber).get("Step 2"),
                dataTableMap.get("Approver " + qNumber).get("Step 3"));
        fillInApproverDetails(approverName);
        try {
            closeModal();
        } catch (Exception ex) {
            switchToParentFrame();
        }
    }

    private void singleApproverApproval(String recordName, String approver,
            Map<String, Map<String, String>> dataTableMap) throws IOException {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reloginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), approver);
        navigateToTab(dataTableMap.get("Navigation").get("Step 2"));
        clickOnSidebar(dataTableMap.get("FlexTable").get("Step 1"), dataTableMap.get("FlexTable").get("Step 2"));
        quickSearchOnTable(recordName, dataTableMap.get("FlexTable").get("Step 3"));
        clickOnFlexTableIcon(dataTableMap.get("Approval").get("Step 1"), recordName);
        clickOnApprovalDecisionBox(dataTableMap.get("Approval").get("Step 2"));
    }
    

    private void singleChecklistDocumentUpload(String fileName, Map<String, Map<String, String>> dataTableMap) {
        clickOnFlextableRowButton(dataTableMap.get("FlexTable").get("Step 1"),
                dataTableMap.get("FlexTable").get("Step 2"), dataTableMap.get("FlexTable").get("Step 3"));
        uploadFile(fileName, dataTableMap.get("Upload").get("Step 1"), dataTableMap.get("Upload").get("Step 2"));
        closeModal();
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
