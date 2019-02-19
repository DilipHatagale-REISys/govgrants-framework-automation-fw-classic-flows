package com.ggproduct.automation.steps;

import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;

import cucumber.api.java.en.Given;
import eyethink.automation.bots.controller.Controller;
import eyethink.automation.bots.controller.CoreHandlers;

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
}   
