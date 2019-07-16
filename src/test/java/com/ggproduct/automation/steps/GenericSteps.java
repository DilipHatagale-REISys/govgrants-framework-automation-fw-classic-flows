package com.ggproduct.automation.steps;

import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import eyethink.automation.bots.controller.Controller;
import eyethink.automation.bots.controller.CoreHandlers;
import org.springframework.context.annotation.Description;
import org.testng.Assert;

public class GenericSteps {
    ProjectManager projectManager;

    public GenericSteps(Controller controller, CoreHandlers reiDriver, GovGrantsHandler govgrants) {
        projectManager = new ProjectManager(controller, reiDriver, govgrants);
    }

    @Given("^I delete the record \"([^\"]*)\" from the object \"([^\"]*)\"$")
    public void deleteTestData(String recordName, String objectType) {
        projectManager.deletionApi(recordName, objectType);
    }

    @When("I attempt to delete record \"([^\"]*)\" inside table with id \"([^\"]*)\"")
    public void attemptDeletion(String columnValues, String tableId) {
        projectManager.attemptDeletion(columnValues, tableId);
    }

    @Description("API call used to create a post award records i.e. Payment Request, Progress Report and Closout and will fetch the record ID for that record")
    @When("^I create a post award record \"([^\"]*)\" for the Award \"([^\"]*)\" having object api name as \"([^\"]*)\"$")
    public void iCreateAPostAwardRecordForTheAwardHavingObjectApiNameAs(String objectType, String recordName, String objectApiName) {
        projectManager.getRecordIdFromResponse(objectType, recordName, objectApiName);
    }

    @Description("To verify field value is blank in flex table")
    @Then("^I see field name \"([^\"]*)\" is blank in flex table$")
    public void iSeeFieldNameIsBlank(String fieldname) {
        projectManager.assertColumnValuIsBlank(fieldname);
    }

    @Description("To verify total records available under flex table")
    @Then("^I see total records count \"([^\"]*)\" in flex table \"([^\"]*)\"$")
    public void iSeeTotalRecordsCountInFlexTable(String totalRecords, String tableId) {
        projectManager.AssertTotalRecordsCountInFlexTable(totalRecords, tableId);
    }

    @Then("^I (can see|cannot see) page block \"([^\"]*)\"$")
    public void iCanSeeCannotSeePageBlock(String usage, String pageblockName) {
        projectManager.AssertPageBlockDisplayed(pageblockName, "can see".equalsIgnoreCase(usage));
    }

    @Description("To capture message on approval decision box")
    @Then("^I see the message \"([^\"]*)\" on approval decision box$")
    public void iSeeTheMessageOnApprovalDecisionBox(String message) {
        projectManager.captureMessageOnApprovalDecisionBox(message);
    }

    @Description("To get the field value from page block")
    @And("^I get the field value \"([^\"]*)\" from sub tab \"([^\"]*)\"$")
    public void iGetTheFieldValueFromSubTab(String fieldName, String subTabName) {
        projectManager.getFieldValue(fieldName, subTabName);
    }

    @Description("To compare two different field values")
    @Then("^I compare field \"([^\"]*)\" from sub tab \"([^\"]*)\" with expected field$")
    public void iCompareFieldFromSubTabWithExpectedField(String fieldName, String subTabName) {
        projectManager.assertTwoFieldValues(fieldName, subTabName);
    }

    @Description("To check no records displayed in flex table")
    @Then("^I see \"([^\"]*)\" inside flex table with id \"([^\"]*)\";$")
    public void iSeeInsideFlexTableWithId(String text, String tableID) {
        Assert.assertTrue(projectManager.isRecordPresentInTheFlexTable(text, tableID));
    }

    @Description("To verify text under attachment flex table")
    @Then("^I see \"([^\"]*)\" has been added in \"([^\"]*)\" flex table$")
    public void iSeeHasBeenAddedInFlexTable(String valueToBeSearch, String flexTableHeader) {
        projectManager.AssertFieldValueIsPresentInFlexTable(valueToBeSearch, flexTableHeader);
    }

    @Description("To upload attachment from default workspace")
    @And("^I upload attachment \"([^\"]*)\" from workspace$")
    public void iUploadAttachmentFromWorkspace(String fileNameToBeUpload) {
        projectManager.uploadAttachmentFromWorkspace(fileNameToBeUpload);
    }

    @When("^I download the file$")
    public void saveTheFileToProjectRoot() throws Throwable {
        projectManager.saveFile();
    }

    @When("^I click on top right parallel lines bar for \"([^\"]*)\"$")
    public void clickTopRightParallelLinesBar(String title) {
        projectManager.clickRightHeaderBars(title);
    }

    @Then("^I verify that \"([^\"]*)\" file is downloaded$")
    public void iVerifyThatPdfFileIsDownloaded(String fileType) {
        projectManager.assertThatFileIsDownloaded(fileType);
    }

}