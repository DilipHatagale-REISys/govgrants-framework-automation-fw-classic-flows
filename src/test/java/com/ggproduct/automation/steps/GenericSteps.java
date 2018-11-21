package com.ggproduct.automation.steps;

import java.util.Map;
import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.projectmanager.ProjectManager;

import cucumber.api.DataTable;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class GenericSteps {
    ProjectManager projectManager;

    public GenericSteps(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
        projectManager = new ProjectManager(controller, handler, govgrants);
    }

   
    @Given("^I login to \"([^\"]*)\" app as \"([^\"]*)\" User$")
    public void loginToggleToApp(String appName, String userName) {
        projectManager.loginToggleToApp(appName, userName);
    }

    @When("^I navigate to \"([^\"]*)\" tab$")
    public void navigateToTab(String tabName) {
        projectManager.navigateToTab(tabName);
    }

    @When("^I click \"([^\"]*)\" inside side bar \"([^\"]*)\"$")
    public void clickOnSidebar(String sidebarContent, String sidebarSubHeader) {
        projectManager.clickOnSidebar(sidebarContent, sidebarSubHeader);
    }

    @When("^I click on \"([^\"]*)\" button$")
    public void clickOnPageButton(String buttonName) {
        projectManager.clickOnPageButton(buttonName);
    }
    
    @When("^I click on \"([^\"]*)\" button to switch to frame \"([^\"]*)\"$")
    public void clickOnPageButtonWithModalId(String buttonName, String IframeId) {
        projectManager.clickOnPageButtonWithModalId(buttonName, IframeId);
    }

    @When("^I click on \"([^\"]*)\" button in the modal$")
    public void clickOnModalButton(String buttonName) {
        projectManager.clickOnModalButton(buttonName);
    }

    @When("^I change the \"([^\"]*)\" field to \"([^\"]*)\"$")
    public void changeFieldValue(String fieldId, String text) {
        projectManager.changeFieldValueText(fieldId, text);
    }

    @When("^I toggle to \"([^\"]*)\"$")
    public void changeFlexTableView(String tableViewName) {
        projectManager.changeFlexTableView(tableViewName);
    }

    @When("^I perform quick search \"([^\"]*)\" on table \"([^\"]*)\"$")
    public void quickSearchOnTable(String searchText, String tableName) {
        projectManager.quickSearchOnTable(searchText, tableName);
    }

    @When("^I click on the \"([^\"]*)\" icon for the \"([^\"]*)\"$")
    public void clickOnFlexTableIcon(String iconName, String uniqueTextValue) {
        projectManager.clickOnFlexTableIcon(iconName, uniqueTextValue);
    }

    @When("^I click on \"([^\"]*)\" icon on \"([^\"]*)\" table against \"([^\"]*)\"$")
    public void clickOnFlexTableIconWithTableId(String iconName, String tableId, String searchText) {
        projectManager.clickOnFlexTableIconWithTableId(iconName, tableId, searchText);
    }

    @When("^I click on \"([^\"]*)\" subtab$")
    public void clickOnSubtab(String subtabName) {
        projectManager.clickOnSubtab(subtabName);
    }

    @When("^I click on \"([^\"]*)\" button on \"([^\"]*)\" flextable to switch to frame \"([^\"]*)\"$")
    public void clickOnFlextableButtonToOpenModal(String buttonName, String flextableName, String iFrameId) {
        projectManager.clickOnFlextableButtonToOpenModal(buttonName, flextableName, iFrameId);
    }
    
    @When("^I click on Agree in \"([^\"]*)\" section$")
    public void clickOnAcknowledgement(String sectionName) {
        projectManager.clickOnAcknowledgement(sectionName);
    }
    
    @When("^I expand the \"([^\"]*)\" on grid \"([^\"]*)\"$")
    public void expandGrid(String uniqueColumnValue, String gridName) {
        projectManager.expandGrid(uniqueColumnValue, gridName);
    }
    
    @When("^I collapse the \"([^\"]*)\" on grid \"([^\"]*)\"$")
    public void collapseGrid(String uniqueColumnValue, String gridName) {
        projectManager.collapseGrid(uniqueColumnValue, gridName);
    }
    
    @When("^I click on \"([^\"]*)\" button on \"([^\"]*)\" flextable to switch to frame$")
    public void clickOnButtonForAttachmentNotesToOpenModal(String buttonName, String flextableName) {
        projectManager.clickOnButtonForAttachmentNotesToOpenModal(buttonName, flextableName);
    }

    @When("^I click on \"([^\"]*)\" button on \"([^\"]*)\" flextable$")
    public void clickOnFlextableButton(String buttonName, String flextableName) {
        projectManager.clickOnFlextableButton(buttonName, flextableName);
    }
    
    @When("^I click \"([^\"]*)\" on the confirmation dialog box$")
    public void clickOnConfirmationtBox(String confirmationDecision) {
        projectManager.clickOnConfirmationtBox(confirmationDecision);
    }
    
    @When("^I choose \"([^\"]*)\" in the flextable \"([^\"]*)\"$")
    public void clickOnCheckbox(String uniqueColumnValue, String flextableName) {
        projectManager.clickOnCheckbox(uniqueColumnValue, flextableName);
    }
    
    @When("^I switch to Parent frame$")
    public void switchToParentFrame() {
        projectManager.switchToParentFrame();
    }

    @When("^I click on \"([^\"]*)\" button on \"([^\"]*)\" phase flextable$")
    public void clickOnFlexTableButton(String buttonName, String flextableName) {
        projectManager.clickOnFlexTableButton(buttonName, flextableName);
    }
    
    @When("^I click on \"([^\"]*)\" button on \"([^\"]*)\" phase flextable to switch to frame \"([^\"]*)\"$")
    public void clickOnFlexTableButtonToOpenModal(String buttonName, String flextableName, String iFrameId) {
        projectManager.clickOnFlexTableButtonToOpenModal(buttonName, flextableName, iFrameId);
    }

    @When("^I click on the \"([^\"]*)\" icon for the \"([^\"]*)\" on the flextable \"([^\"]*)\"$")
    public void clickOnFlextableRowButton(String iconName, String uniqueColumnValue, String flexTableName) {
        projectManager.clickOnFlextableRowButton(iconName, uniqueColumnValue, flexTableName);
    }
    
    @When("^I scroll to \"([^\"]*)\" section$")
    public void scrollToSection(String sectionName){
        projectManager.scrollToSection(sectionName);
    }
    
    @When("^I click on \"([^\"]*)\" on the grid against \"([^\"]*)\" in the table \"([^\"]*)\"$")
    public void clickButtonOnGrid(String iconName, String uniqueColumnValue, String tableId){
        projectManager.clickButtonOnGrid(iconName, uniqueColumnValue, tableId);
    }

    @When("^I click on the \"([^\"]*)\" icon for the \"([^\"]*)\" on the flextable \"([^\"]*)\" to switch to frame \"([^\"]*)\"$")
    public void clickOnFlextableRowButtontoOpenModal(String iconName, String uniqueColumnValue, String flexTableName,
            String iFrameId) {
        projectManager.clickOnFlextableRowButtontoOpenModal(iconName, uniqueColumnValue, flexTableName, iFrameId);
    }

    @When("^I close Modal \"([^\"]*)\"$")
    public void closeModal(String closeButtonId) {
        projectManager.closeModal(closeButtonId);
    }

    @When("^I enter \"([^\"]*)\" values from \"([^\"]*)\"$")
    public void enterFieldValues(String sheetName, String excelName) {
        projectManager.enterFieldValues(sheetName, excelName);
    }
    
    @When("^I enter a review$")
    public void enterReview(){
        projectManager.enterReview();
    }

    @When("^I re-login to \"([^\"]*)\" app as \"([^\"]*)\" User$")
    public void reloginToggleToApp(String appName, String userName) {
        projectManager.reloginToggleToApp(appName, userName);
    }

    @When("^I click \"([^\"]*)\" after selection of \"([^\"]*)\" in the table \"([^\"]*)\"$")
    public void chooseRecordForProgramAssociation(String buttonName, String recordUniqueName, String tableId) {
        projectManager.chooseRecordForAssociation(buttonName, recordUniqueName, tableId);
    }

    @When("^I fill in the \"([^\"]*)\" in the frame \"([^\"]*)\" for the Approver details$")
    public void fillInApproverDetails(String approverName, String iFrameId) {
        projectManager.fillInApproverDetails(approverName, iFrameId);
    }

    @When("^I click on \"([^\"]*)\" on the approval decision box$")
    public void clickOnApprovalDecisionBox(String approvalDesicion) {
        projectManager.clickOnApprovalDecisionBox(approvalDesicion);
    }

    @When("^I choose the file \"([^\"]*)\" to upload for \"([^\"]*)\" of type \"([^\"]*)\"$")
    public void uploadFile(String fileName, String uploadSectionName, String attachmentType) {
        projectManager.uploadFile(fileName, uploadSectionName, attachmentType);
    }

    @When("^I fill the fields in the table \"([^\"]*)\":$")
    public void fillFieldsForInlineTable(String tableId, DataTable inLineEditFields) throws Throwable {
        for(Map<String,String> parameters:inLineEditFields.asMaps(String.class, String.class)) {
            projectManager.fillFieldsForInlineTable(tableId,parameters.get("tableColumnNumber"),parameters.get("inputype"),parameters.get("inputValue"));
        }
    }
    
    @Then("^I see that \"([^\"]*)\" is in \"([^\"]*)\" status$")
    public void assertStatus(String record, String status) {
        projectManager.assertStatus(record, status);
    }

    @Then("^I see that \"([^\"]*)\" status is in \"([^\"]*)\" on progress bar$")
    public void assertStatusProgressBar(String status, String color) {
        projectManager.assertStatusProgressBar(status, color);
    }

    @Then("^I see that \"([^\"]*)\" field is modified to \"([^\"]*)\"$")
    public void assertfieldValue(String fieldLabel, String text) {
        projectManager.assertfieldValue(fieldLabel, text);
    }

    @Then("^I see that the status is \"([^\"]*)\"$")
    public void assertStatusOnTable(String status) {
        projectManager.assertColumnValueOnTable(status);
    }

    @Then("^I see that \"([^\"]*)\" has been added in \"([^\"]*)\" flextable$")
    public void assertColumnOnTable(String columnUniqueValue, String flextableName) {
        projectManager.assertColumnOnTable(columnUniqueValue, flextableName);
    }
}
