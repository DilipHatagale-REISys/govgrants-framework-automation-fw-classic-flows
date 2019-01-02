package com.ggproduct.automation.projectmanager;

import java.io.IOException;
import org.openqa.selenium.By;

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
     * Handles clicking on the given left pans/ side bar option
     * 
     * @param sidebarContent
     * @param sidebarSubHeader
     */
    public void clickOnSidebar(String sidebarContent, String sidebarSubHeader) {
        govgrants.sideBar().getSideBarContent(sidebarSubHeader, sidebarContent).click();
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
     * Handles entering of Peer review
     */
    public void enterReview(String rating) {
        govgrants.inputForms().inputFormDataByFieldApiName("fieldRating__c", rating);
        govgrants.inputForms().inputFormDataByFieldApiName("ReviewComments__c", "Automation Reviewer comments");
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
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Navigation").get("Step 1"));
        govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("FlexTable").get("Step 2"),
                dataTableMap.get("FlexTable").get("Step 1"));
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelFileName, sheetName);
        govgrants.modal().clickModalContentSpecificButton(dataTableMap.get("Creation").get("Step 1"));
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Creation").get("Step 2"));
    }

    /**
     * Handles filling up of fields from the sheet in an excel
     * 
     * @param sheetName
     * @param excelFileName
     */
    public void editionOfRecord(String sheetName, String excelFileName, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Edition Buttons").get("Step 1"));
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelFileName, sheetName);
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Edition Buttons").get("Step 2"));
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
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Contact").get("Step 1"));
        govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("Contact").get("Step 3"),
                dataTableMap.get("Contact").get("Step 2"));
        chooseRecordForAssociation(dataTableMap.get("Contact").get("Step 4"), dataTableMap.get("Contact").get("Step 5"),
                contact.split(","));
        closeModal();

        // Focus Area association
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Focus Area").get("Step 1"));
        govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("Focus Area").get("Step 3"),
                dataTableMap.get("Focus Area").get("Step 2"));
        chooseRecordForAssociation(dataTableMap.get("Focus Area").get("Step 4"),
                dataTableMap.get("Focus Area").get("Step 5"), focusArea.split(","));
        try {
            closeModal();
        } catch (Exception ex) {
            reiDriver.get().getRefresh();
        }

        // Objective association
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Objective").get("Step 1"));
        govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("Objective").get("Step 3"),
                dataTableMap.get("Objective").get("Step 2"));
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
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Participant").get("Step 1"));
        govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("Participant").get("Step 3"),
                dataTableMap.get("Participant").get("Step 2"));
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
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Subtab").get("Step 1"));
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
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Checklist Navigation").get("Step 1"));
        govgrants.flexTable().enterFlexTableRows(dataTableMap.get("Checklist FlexTable").get("Step 1"),
                dataTableMap.get("Checklist FlexTable").get("Step 2"), inlineRowAdditionDatableSeperator(dataTableMap));
        govgrants.flexTable().clickTableActionIcon(dataTableMap.get("Checklist FlexTable").get("Step 1"),
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
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Attachment Navigation").get("Step 1"));
        govgrants.modal().clickTopRightButtonForAttachmentNotes(dataTableMap.get("Attachment Navigation").get("Step 2"),
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
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Navigation").get("Step 1"));
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
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Reviewer Navigation").get("Step 1"));
        govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("FlexTable").get("Step 2"),
                dataTableMap.get("FlexTable").get("Step 1"));
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelFileName, sheetName);
        govgrants.modal().clickModalContentSpecificButton(dataTableMap.get("FlexTable").get("Step 3"));
        closeModal();
        govgrants.flexTable().clickTableActionIcon(dataTableMap.get("FlexTable").get("Step 2"),
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
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Reviewer Navigation").get("Step 2"));
        clickOnSidebar(dataTableMap.get("Reviewer Navigation").get("Step 3"),
                dataTableMap.get("Reviewer Navigation").get("Step 4"));
        govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("FlexTable").get("Step 1"),
                recordName);
        govgrants.flexTable().clickTableActionIcons(dataTableMap.get("FlexTable").get("Step 2"), recordName);
        govgrants.flexTable().clickTableActionIcon(dataTableMap.get("FlexTable").get("Step 3"),
                dataTableMap.get("FlexTable").get("Step 4"), dataTableMap.get("Enter Review").get("Step 1"));
        enterReview(dataTableMap.get("Enter Review").get("Step 2"));
        govgrants.modal().clickModalContentSpecificButton(dataTableMap.get("Enter Review").get("Step 3"));
        govgrants.modal().clickModalContentSpecificButton(dataTableMap.get("Enter Review").get("Step 4"));
        closeModal();
        reloginToggleToApp(dataTableMap.get("Owner Navigation").get("Step 1"), recordOwner);
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Owner Navigation").get("Step 2"));
        clickOnSidebar(dataTableMap.get("Owner Navigation").get("Step 3"),
                dataTableMap.get("Owner Navigation").get("Step 4"));
        changeFlexTableView(dataTableMap.get("Complete Review").get("Step 1"));
        govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("Complete Review").get("Step 2"),
                recordName);
        govgrants.flexTable().clickTableActionIcons(dataTableMap.get("Complete Review").get("Step 3"), recordName);
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Complete Review").get("Step 4"));
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
        govgrants.mainPage().clickMainMenuBar("Grants");
        clickOnSidebar("Grants and Subawards", "Grants, Awards & Amendments");
        changeFlexTableView(awardState + " Grants");
        govgrants.quickSearch().performTableSpecificQuickSearch("ActiveGrants", awardName);
        govgrants.flexTable().clickTableActionIcons("View", awardName);
        govgrants.pageDetails().clickSubTabsInsideTableView("Subawards");
        govgrants.flexTable().clickTableActionIcon("RelatedAwards1", "View", awardId);
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
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 1"));
        clickOnSidebar(dataTableMap.get("Left Panel").get("Step 1"), dataTableMap.get("Left Panel").get("Step 2"));
        govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("FlexTable").get("Step 1"), uniqueColumnValue);
        govgrants.flexTable().clickTableActionIcons(dataTableMap.get("FlexTable").get("Step 2"), uniqueColumnValue);
    }

    public void fillingUpStandardForm(String formName, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Navigation").get("Step 1"));
        govgrants.flexTable().clickTableActionIcon(dataTableMap.get("FlexTable").get("Step 2"),
                dataTableMap.get("FlexTable").get("Step 1"), formName);
        govgrants.inputForms().completeFillingStandardForm();
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Form Button").get("Step 1"));
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Form Button").get("Step 2"));
        govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("Validation").get("Step 2"),
                dataTableMap.get("Validation").get("Step 1"));
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

    private void singleApproverSelection(int qNumber, String approverName,
            Map<String, Map<String, String>> dataTableMap) {
        govgrants.flexTable().clickTableActionIcon(dataTableMap.get("Approver " + qNumber).get("Step 1"),
                dataTableMap.get("Approver " + qNumber).get("Step 2"),
                dataTableMap.get("Approver " + qNumber).get("Step 3"));
        fillInApproverDetails(approverName);
        try {
            closeModal();
        } catch (Exception ex) {
            reiDriver.switchTo().switchToParentFrame();
        }
    }

    private void singleApproverApproval(String recordName, String approver,
            Map<String, Map<String, String>> dataTableMap) throws IOException {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reloginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), approver);
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 2"));
        clickOnSidebar(dataTableMap.get("FlexTable").get("Step 1"), dataTableMap.get("FlexTable").get("Step 2"));
        govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("FlexTable").get("Step 3"), recordName);
        govgrants.flexTable().clickTableActionIcons(dataTableMap.get("Approval").get("Step 1"), recordName);
        clickOnApprovalDecisionBox(dataTableMap.get("Approval").get("Step 2"));
    }

    private void singleChecklistDocumentUpload(String fileName, Map<String, Map<String, String>> dataTableMap) {
        govgrants.flexTable().clickTableActionIcon(dataTableMap.get("FlexTable").get("Step 1"),
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
