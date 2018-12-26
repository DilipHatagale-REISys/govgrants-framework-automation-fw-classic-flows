package com.ggproduct.automation.steps;

import java.util.Map;
import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;

import java.io.IOException;
import java.util.List;

import cucumber.api.DataTable;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class GenericSteps {
    ProjectManager projectManager;

    public GenericSteps(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        projectManager = new ProjectManager(controller, handler, govgrants);
    }
    
    
    /******** Global Common Steps************/
    /* @When("^I navigate to \"([^\"]*)\" tab$")
    public void navigateToTab(String tabName) {
        projectManager.navigateToTab(tabName);
    }*/
    
    @When("^I navigate to \"([^\"]*)\" content inside \"([^\"]*)\" subheader on left panel$")
    public void clickOnSidebar(String sidebarContent, String sidebarSubHeader) {
        projectManager.clickOnSidebar(sidebarContent, sidebarSubHeader);
    }
    
    @When("^I click on \"([^\"]*)\" in the page details$")
    public void clickOnPageButton(String buttonName) {
        projectManager.clickOnPageButton(buttonName);
    }
    
    @When("^I click modal button \"([^\"]*)\"$")
    public void clickOnModalButton(String buttonName) {
        projectManager.clickOnModalButton(buttonName);
    }
    
    @When("^I click toggle button for \"([^\"]*)\"$")
    public void changeFlexTableView(String tableViewName) {
        projectManager.changeFlexTableView(tableViewName);
    }
    
    @When("^I perform quick search for \"([^\"]*)\" in \"([^\"]*)\" panel$")
    public void quickSearchOnTable(String searchText, String tableId) {
        projectManager.quickSearchOnTable(searchText, tableId);
    }
    
    @When("^I click on \"([^\"]*)\" icon for \"([^\"]*)\" inside table$")
    public void clickOnFlexTableIcon(String iconName, String uniqueTextValue) {
        projectManager.clickOnFlexTableIcon(iconName, uniqueTextValue);
    }
    
    @When("^I navigate to \"([^\"]*)\" sub tab$")
    public void clickOnSubtab(String subtabName) {
        projectManager.clickOnSubtab(subtabName);
    }
    
    @When("^I expand nested table containing column value \"([^\"]*)\"$")
    public void expandGrid(String uniqueColumnValue) {
        projectManager.expandGrid(uniqueColumnValue);
    }
    
    @When("^I collapse nested table containing column value \"([^\"]*)\"$")
    public void collapseGrid(String uniqueColumnValue) {
        projectManager.collapseGrid(uniqueColumnValue);
    }
    
    @When("^I click on top right button \"([^\"]*)\" in flex table with id \"([^\"]*)\"$")
    public void clickOnFlextableButton(String buttonName, String flextableId) {
        projectManager.clickOnFlextableButton(buttonName, flextableId);
    }
    
    @When("^I check \"([^\"]*)\" boxes in flex table with id \"([^\"]*)\"$")
    public void clickOnMultipleCheckbox(String uniqueColumnValues, String flextableId) {
        if ("All".equalsIgnoreCase(uniqueColumnValues)) {
            projectManager.clickOnMultipleCheckbox(flextableId);
        } else {
            projectManager.clickOnMultipleCheckbox(flextableId, uniqueColumnValues.split(","));
        }
    }
    
    @When("^I enter value \"([^\"]*)\" into field \"([^\"]*)\"$")
    public void enterFieldValue(String value, String fieldAPIName) {
        projectManager.enterFieldValue(fieldAPIName, value);
    }
    
    @When("^I enter \"([^\"]*)\" values from \"([^\"]*)\"$")
    public void enterFieldValues(String sheetName, String excelName) {
        projectManager.enterFieldValues(sheetName, excelName);
    }

    @When("^I click on \"([^\"]*)\" icon for \"([^\"]*)\" inside flex table with id \"([^\"]*)\"$")
    public void clickOnFlextableRowButton(String iconName, String uniqueColumnValue, String flexTableId) {
        projectManager.clickOnFlextableRowButton(flexTableId, iconName, uniqueColumnValue);
    }
    
    @When("^I enter the following values into flex table with id \"([^\"]*)\" by clicking \"([^\"]*)\" :$")
    public void addFieldsForInlineTable(String flexTableId, String buttonName, List<Map<String, String>> rowValues) {
        projectManager.addFieldsForInlineTable(flexTableId, buttonName, rowValues);
    }
    
    @When("^I edit the following rows inline in flex table with id \"([^\"]*)\" by clicking \"([^\"]*)\" :$")
    public void fillFieldsForInlineTable(String flexTableId, String buttonName, DataTable rowValues) {
        projectManager.fillFieldsForInlineTable(flexTableId, buttonName, rowValues);
    }
    
    @Then("^I see status in Progress-bar is \"([^\"]*)\" and is \"([^\"]*)\"$")
    public void assertStatusProgressBar(String status, String color) {
        projectManager.assertStatusProgressBar(status, color);
    }
    
    
    /****** Product Common Steps ***********/

    @Given("^I login to \"([^\"]*)\" app as \"([^\"]*)\" User$")
    public void loginToggleToApp(String appName, String userName) {
        projectManager.loginToggleToApp(appName, userName);
    }
    
    @Given("^I fill in the form \"([^\"]*)\"$")
    public void fillingUpStandardForm(String formName, DataTable dataTable) {
        projectManager.fillingUpStandardForm(formName, dataTable);
    }
    
    @When("^I re-login to \"([^\"]*)\" app as \"([^\"]*)\" User$")
    public void reloginToggleToApp(String appName, String userName) throws IOException {
        projectManager.reloginToggleToApp(appName, userName);
    }
    
    @When("^I re-login to \"([^\"]*)\" app as \"([^\"]*)\" User with environment \"([^\"]*)\"$")
    public void reloginToggleToAppInURL(String appName, String userName, String env) throws IOException {
        projectManager.reloginToggleToAppInURL(appName, userName, env);
    }
    
    @When("^I perform quick search for \"([^\"]*)\" for the parent value \"([^\"]*)\" on grid \"([^\"]*)\"$")
    public void quickSearchOnGridTable(String searchTerm, String anyUniqueColumnValueFromParent, String flexTableDivId) {
        projectManager.quickSearchOnGridTable(flexTableDivId, anyUniqueColumnValueFromParent, searchTerm);
    }
    
    @When("^I click on \"([^\"]*)\" button on \"([^\"]*)\" flextable for Attachment$")
    public void clickOnButtonForAttachmentNotesToOpenModal(String buttonName, String flextableName) {
        projectManager.clickOnButtonForAttachmentNotesToOpenModal(buttonName, flextableName);
    }
 
    @When("^I click \"([^\"]*)\" on the confirmation dialog box$")
    public void clickOnConfirmationtBox(String confirmationDecision) {
        projectManager.clickOnConfirmationtBox(confirmationDecision);
    }
    
    @When("^I switch to Parent frame$")
    public void switchToParentFrame() {
        projectManager.switchToParentFrame();
    }

    @When("^I enter \"([^\"]*)\" for comments and click \"([^\"]*)\"$")
    public void enteringCommentsOnConfirmation(String comments, String confirmation) {
        projectManager.enteringCommentsOnConfirmation(comments, confirmation);
    }
    
    @When("^I close Modal$")
    public void closeModal() {
        projectManager.closeModal();
    }
    
    @Given("^I complete filling up the standard form$")
    public void fillStandardForm() {
        projectManager.fillStandardForm();
    } 
    
    @When("^I enter a review as \"([^\"]*)\"$")
    public void enterReview(String rating) {
        projectManager.enterReview(rating);
    }
    
    @When("^I click \"([^\"]*)\" after selection of \"([^\"]*)\" in the table \"([^\"]*)\"$")
    public void chooseRecordForProgramAssociation(String buttonName, String recordUniqueValues, String tableId) {
        projectManager.chooseRecordForAssociation(buttonName, tableId, recordUniqueValues.split(","));
    }
    
    @When("^I fill in the \"([^\"]*)\" for the Approver details$")
    public void fillInApproverDetails(String approverName) {
        projectManager.fillInApproverDetails(approverName);
    }
    
    @When("^I click on \"([^\"]*)\" on the approval decision box$")
    public void clickOnApprovalDecisionBox(String approvalDesicion) {
        projectManager.clickOnApprovalDecisionBox(approvalDesicion);
    }
    
    @When("^I choose the file \"([^\"]*)\" to upload for \"([^\"]*)\" of type \"([^\"]*)\"$")
    public void uploadFile(String fileName, String uploadSectionName, String attachmentType) {
        projectManager.uploadFile(fileName, uploadSectionName, attachmentType);
    }
    
    @Then("^I see that \"([^\"]*)\" is in \"([^\"]*)\" status$")
    public void assertStatus(String record, String status) {
        projectManager.assertStatus(record, status);
    }
    
    @Then("^I see that \"([^\"]*)\" has been added in flextable with Id \"([^\"]*)\"$")
    public void assertColumnOnTable(String columnUniqueValue, String flextableId) {
        projectManager.assertColumnOnTable(columnUniqueValue, flextableId);
    }
    
    
    /**** Generic Consolidated Product Steps ******/
    
    @Given("^I create a post award record from sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void creationOfPostAwardRecord(String sheetName, String excelFileName, DataTable dataTable) {
        projectManager.creationOfPostAwardRecord(sheetName, excelFileName, dataTable);
    }
    
    @Given("^I complete the fields from the sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void editionOfRecord(String sheetName, String excelFileName, DataTable dataTable) {
        projectManager.editionOfRecord(sheetName, excelFileName, dataTable);
    }
    
    @Given("^I associate Contact \"([^\"]*)\", Focus Area \"([^\"]*)\", Objective \"([^\"]*)\"$")
    public void associationOfRecords(String contact, String focusArea, String objective, DataTable dataTable) {
        projectManager.associationOfRecords(contact, focusArea, objective, dataTable);
    }
    
    @Given("^I associate Participant \"([^\"]*)\"$")
    public void associationOfRecord(String participant, DataTable dataTable) {
        projectManager.associationOfRecord(participant, dataTable);
    }
    
    @Given("^I select \"([^\"]*)\" approvers \"([^\"]*)\"$")
    public void approverSelection(String noOfApprovers, String approvers, DataTable dataTable) {
        projectManager.approverSelection(noOfApprovers, dataTable, approvers.split(","));
    }
    
    @Given("^I add an attachment checklist to upload the file \"([^\"]*)\"$")
    public void additionOfChecklist(String fileName, DataTable dataTable) {
        projectManager.additionOfChecklist(fileName, dataTable);
    }
    
    @Given("^I upload \"([^\"]*)\" checklist document \"([^\"]*)\"$")
    public void uploadChecklistDocument(String noOfDocuments, String fileName, DataTable dataTable) {
        projectManager.uploadChecklistDocument(noOfDocuments, dataTable, fileName.split(","));
    }
    
    @Given("^I add an attachment \"([^\"]*)\" in the flextable \"([^\"]*)\"$")
    public void additionOfAttachment(String fileName, String flexTableName, DataTable dataTable) {
        projectManager.additionOfAttachment(fileName, flexTableName, dataTable);
    }
    
    @Given("^I assign, initiate a reviewer from sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void initiateReviewForAnnouncement(String sheetName, String excelFileName, DataTable dataTable) {
        projectManager.initiateReviewForAnnouncement(sheetName, excelFileName, dataTable);
    }
    
    @Given("^Review is completed as user \"([^\"]*)\" for the record \"([^\"]*)\" created by \"([^\"]*)\"$")
    public void completePeerReview(String reviewer, String recordName, String recordOwner, DataTable dataTable) throws IOException {
        projectManager.completePeerReview(reviewer, recordName, recordOwner, dataTable);
    }
    
    @Given("^\"([^\"]*)\" Approvers \"([^\"]*)\" approve the record \"([^\"]*)\"$")
    public void approversApproveRecord(String noOfApprovers, String recordName, String approvers, DataTable dataTable) throws IOException {
        projectManager.approversApproveRecord(noOfApprovers, recordName, dataTable, approvers.split(","));
    }
   
    
    @Given("^I login and view the \"([^\"]*)\" award \"([^\"]*)\" with name \"([^\"]*)\" as User \"([^\"]*)\"$")
    public void reloginToViewAward(String awardState, String awardId, String awardName, String awardOwner) throws IOException {
        projectManager.reloginToViewAward(awardState, awardId, awardName, awardOwner);
    }
    
    @Given("^Subrecipient \"([^\"]*)\" receives the task for \"([^\"]*)\"$")
    public void subrecipientTask(String subrecipient, String uniqueColumnValue,  DataTable dataTable) throws IOException {
        projectManager.subrecipientTask(subrecipient, uniqueColumnValue, dataTable);
    }
    
}
