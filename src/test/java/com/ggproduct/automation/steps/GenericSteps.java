package com.ggproduct.automation.steps;

import java.util.Map;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.pageobjects.GenericPage;
import com.ggproduct.automation.pageobjects.LoginPage;

import cucumber.api.DataTable;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class GenericSteps {
    GenericPage genericPage;
    LoginPage loginpage;

    public GenericSteps(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
        genericPage = new GenericPage(controller, handler, govgrants);
        loginpage = new LoginPage(controller, handler, govgrants);
    }

    @Given("^I login to \"([^\"]*)\" app as \"([^\"]*)\" User$")
    public void loginToggleToApp(String appName, String userName) {
        genericPage.loginToggleToApp(appName, userName);
    }

    @When("^I navigate to \"([^\"]*)\" tab$")
    public void navigateToTab(String tabName) {
        genericPage.navigateToTab(tabName);
    }

    @When("^I click \"([^\"]*)\" inside side bar \"([^\"]*)\"$")
    public void clickOnSidebar(String sidebarContent, String sidebarSubHeader) {
        genericPage.clickOnSidebar(sidebarContent, sidebarSubHeader);
    }

    @When("^I click on \"([^\"]*)\" button$")
    public void clickOnButton(String buttonName) {
        genericPage.clickOnButton(buttonName);
    }

    @When("^I click on \"([^\"]*)\" button in the modal$")
    public void clickOnModalButton(String buttonName) {
        genericPage.clickOnModalButton(buttonName);
    }

    @When("^I change the \"([^\"]*)\" field to \"([^\"]*)\"$")
    public void changeFieldValue(String fieldId, String text) {
        genericPage.changeFieldValueText(fieldId, text);
    }

    @When("^I toggle to \"([^\"]*)\"$")
    public void changeFlexTableView(String tableViewName) {
        genericPage.changeFlexTableView(tableViewName);
    }

    @When("^I perform quick search \"([^\"]*)\" on table \"([^\"]*)\"$")
    public void quickSearchOnTable(String searchText, String tableName) {
        genericPage.quickSearchOnTable(searchText, tableName);
    }

    @When("^I click on the \"([^\"]*)\" icon for the \"([^\"]*)\"$")
    public void clickOnFlexTableIcon(String iconName, String uniqueTextValue) {
        genericPage.clickOnFlexTableIcon(iconName, uniqueTextValue);
    }

    @When("^I click on \"([^\"]*)\" icon on \"([^\"]*)\" table against \"([^\"]*)\"$")
    public void clickOnFlexTableIconWithTableId(String iconName, String tableId, String searchText) {
        genericPage.clickOnFlexTableIconWithTableId(iconName, tableId, searchText);
    }

    @When("^I click on \"([^\"]*)\" subtab$")
    public void clickOnSubtab(String subtabName) {
        genericPage.clickOnSubtab(subtabName);
    }

    @When("^I click on \"([^\"]*)\" button on \"([^\"]*)\" flextable to switch to frame \"([^\"]*)\"$")
    public void clickOnFlextableButtonToOpenModal(String buttonName, String flextableName, String iFrameId) {
        genericPage.clickOnFlextableButtonToOpenModal(buttonName, flextableName, iFrameId);
    }
    
    @When("^I click on \"([^\"]*)\" button on \"([^\"]*)\" flextable to switch to frame$")
    public void clickOnButtonForAttachmentNotesToOpenModal(String buttonName, String flextableName) {
        genericPage.clickOnButtonForAttachmentNotesToOpenModal(buttonName, flextableName);
    }

    @When("^I click on \"([^\"]*)\" button on \"([^\"]*)\" flextable$")
    public void clickOnFlextableButton(String buttonName, String flextableName) {
        genericPage.clickOnFlextableButton(buttonName, flextableName);
    }

    @When("^I click on \"([^\"]*)\" button on \"([^\"]*)\" phase flextable$")
    public void clickOnFlexTableButton(String buttonName, String flextableName) {
        genericPage.clickOnFlexTableButton(buttonName, flextableName);
    }
    
    @When("^I click on \"([^\"]*)\" button on \"([^\"]*)\" phase flextable to switch to frame \"([^\"]*)\"$")
    public void clickOnFlexTableButtonToOpenModal(String buttonName, String flextableName, String iFrameId) {
        genericPage.clickOnFlexTableButtonToOpenModal(buttonName, flextableName, iFrameId);
    }

    @When("^I click on the \"([^\"]*)\" icon for the \"([^\"]*)\" on the flextable \"([^\"]*)\"$")
    public void clickOnFlextableRowButton(String iconName, String uniqueColumnValue, String flexTableName) {
        genericPage.clickOnFlextableRowButton(iconName, uniqueColumnValue, flexTableName);
    }

    @When("^I click on the \"([^\"]*)\" icon for the \"([^\"]*)\" on the flextable \"([^\"]*)\" to switch to frame \"([^\"]*)\"$")
    public void clickOnFlextableRowButtontoOpenModal(String iconName, String uniqueColumnValue, String flexTableName,
            String iFrameId) {
        genericPage.clickOnFlextableRowButtontoOpenModal(iconName, uniqueColumnValue, flexTableName, iFrameId);
    }

    @When("^I close Modal \"([^\"]*)\"$")
    public void closeModal(String closeButtonId) {
        genericPage.closeModal(closeButtonId);
    }

    @When("^I enter \"([^\"]*)\" values from \"([^\"]*)\"$")
    public void enterFieldValues(String sheetName, String excelName) {
        genericPage.enterFieldValues(sheetName, excelName);
    }
    
    @When("^I enter a review$")
    public void enterReview(){
        genericPage.enterReview();
    }

    @When("^I re-login to \"([^\"]*)\" app as \"([^\"]*)\" User$")
    public void reloginToggleToApp(String appName, String userName) {
        genericPage.reloginToggleToApp(appName, userName);
    }

    @When("^I click \"([^\"]*)\" after selection of \"([^\"]*)\" in the table \"([^\"]*)\"$")
    public void chooseRecordForProgramAssociation(String buttonName, String recordUniqueName, String tableId) {
        genericPage.chooseRecordForAssociation(buttonName, recordUniqueName, tableId);
    }

    @When("^I fill in the \"([^\"]*)\" in the frame \"([^\"]*)\" for the Approver details$")
    public void fillInApproverDetails(String approverName, String iFrameId) {
        genericPage.fillInApproverDetails(approverName, iFrameId);
    }

    @When("^I click on \"([^\"]*)\" on the approval decision box$")
    public void clickOnApprovalDecisionBox(String approvalDesicion) {
        genericPage.clickOnApprovalDecisionBox(approvalDesicion);
    }

    @When("^I choose the file \"([^\"]*)\" to upload for \"([^\"]*)\" of type \"([^\"]*)\"$")
    public void uploadFile(String fileName, String uploadSectionName, String attachmentType) {
        genericPage.uploadFile(fileName, uploadSectionName, attachmentType);
    }

    @When("^I fill the fields in the table \"([^\"]*)\":$")
    public void fillFieldsForInlineTable(String tableId, DataTable inLineEditFields) throws Throwable {
        for(Map<String,String> parameters:inLineEditFields.asMaps(String.class, String.class)) {
            genericPage.fillFieldsForInlineTable(tableId,parameters.get("tableColumnNumber"),parameters.get("inputype"),parameters.get("inputValue"));
        }
    }

    @Then("^I see that \"([^\"]*)\" is in \"([^\"]*)\" status$")
    public void assertStatus(String record, String status) {
        genericPage.assertStatus(record, status);
    }

    @Then("^I see that \"([^\"]*)\" field is modified to \"([^\"]*)\"$")
    public void assertfieldValue(String fieldLabel, String text) {
        genericPage.assertfieldValue(fieldLabel, text);
    }

    @Then("^I see that the status is \"([^\"]*)\"$")
    public void assertStatusOnTable(String status) {
        genericPage.assertColumnValueOnTable(status);
    }

    @Then("^I see that \"([^\"]*)\" has been added in \"([^\"]*)\" flextable$")
    public void assertColumnOnTable(String columnUniqueValue, String flextableName) {
        genericPage.assertColumnOnTable(columnUniqueValue, flextableName);
    }
}
