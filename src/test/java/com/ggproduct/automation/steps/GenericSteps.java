package com.ggproduct.automation.steps;

import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;

import cucumber.api.PendingException;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import eyethink.automation.bots.controller.Controller;
import eyethink.automation.bots.controller.CoreHandlers;
import org.springframework.context.annotation.Description;

public class GenericSteps {
    ProjectManager projectManager;

    public GenericSteps(Controller controller, CoreHandlers reiDriver, GovGrantsHandler govgrants) {
        projectManager = new ProjectManager(controller, reiDriver, govgrants);
    }

    @Given("^I delete the record \"([^\"]*)\" from the object \"([^\"]*)\"$")
    public void deleteTestData(String recordName, String objectType) {
        projectManager.automationDeletionApi(recordName, objectType);
    }

    @Given("^I get the \"([^\"]*)\"$")
    public void getRecordId(String recordIdLabel) {
        projectManager.getRecordId(recordIdLabel);
    }

    @When("I attempt to delete record \"([^\"]*)\" inside table with id \"([^\"]*)\"")
    public void attemptDeletion(String columnValues, String tableId) {
        projectManager.attemptDeletion(columnValues, tableId);
    }

    @Description("API call will retrieve the Record Id.")
    @When("^I get the EGMS ID for record \"([^\"]*)\" having field name \"([^\"]*)\" from the object \"([^\"]*)\"$")
    public void iGetTheEgmsIdForRecordHavingFieldNameFromTheObject(String recordName, String fieldName, String objectType){
        projectManager.getRecordIdFromResponse(recordName,fieldName,objectType);
    }

    @Description("API call will create a post award record currently supports only for - PaymentRequest, ProgressReport, Closeout")
    @When("^I create a post award record \"([^\"]*)\" for the Award  \"([^\"]*)\"$")
    public void iCreateAPostAwardRecordForTheAward(String objectType, String recordName) {
        projectManager.automationBatchExecuteApi(objectType,recordName);
    }
}
