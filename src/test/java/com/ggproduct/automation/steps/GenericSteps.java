package com.ggproduct.automation.steps;

import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;

import cucumber.api.PendingException;
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

    @Given("^I get the \"([^\"]*)\"$")
    public void getRecordId(String recordIdLabel) {
        projectManager.getRecordId(recordIdLabel);
    }

    @When("I attempt to delete record \"([^\"]*)\" inside table with id \"([^\"]*)\"")
    public void attemptDeletion(String columnValues, String tableId) {
        projectManager.attemptDeletion(columnValues, tableId);
    }

    @Description("To verify no record found in flex table")
    @Then("^I do not see value inside table with id \"([^\"]*)\"$")
    public void iDoNotSeeValueInsideTableWithId(String tableId) {
        Assert.assertTrue(projectManager.isRecordPresentInTheFlexTable(tableId));
    }

    @Description("API call used to create a post award records i.e. Payment Request, Progress Report and Closout and will fetch the record ID for that record")
    @When("^I create a post award record \"([^\"]*)\" for the Award \"([^\"]*)\" having object api name as \"([^\"]*)\"$")
    public void iCreateAPostAwardRecordForTheAwardHavingObjectApiNameAs(String objectType, String recordName, String objectApiName) {
        projectManager.getRecordIdFromResponse(objectType, recordName, objectApiName);
    }

}
