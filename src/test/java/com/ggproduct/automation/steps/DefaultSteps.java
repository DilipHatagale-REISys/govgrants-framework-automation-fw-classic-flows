package com.ggproduct.automation.steps;

import java.io.IOException;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.pageobjects.DefaultPage;

import cucumber.api.DataTable;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;

public class DefaultSteps {
    DefaultPage defaultPage;
    
    public DefaultSteps(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        defaultPage = new DefaultPage(controller, handler, govgrants);
    }
    
    /*********************Login Steps ************************/
    
    @Given("^I login to \"([^\"]*)\" app as \"([^\"]*)\" User$")
    public void loginToggleToApp(String appName, String userName) {
        defaultPage.loginToggleToApp(appName, userName);
    }
    
    @When("^I re-login to \"([^\"]*)\" app as \"([^\"]*)\" User$")
    public void reloginToggleToApp(String appName, String userName) throws IOException {
        defaultPage.reloginToggleToApp(appName, userName);
    }
    
    @When("^I re-login to \"([^\"]*)\" app as \"([^\"]*)\" User with environment \"([^\"]*)\"$")
    public void reloginToggleToAppInURL(String appName, String userName, String env) throws IOException {
        defaultPage.reloginToggleToAppInURL(appName, userName, env);
    }
    
    /**** Default Consolidated Steps ******/

    @Given("^Review is completed as user \"([^\"]*)\" for the record \"([^\"]*)\"$")
    public void completePeerReview(String reviewer, String recordName, DataTable dataTable) throws IOException {
        defaultPage.completePeerReview(reviewer, recordName, dataTable);
    }
    
    @Given("^\"([^\"]*)\" Approvers \"([^\"]*)\" approve the record \"([^\"]*)\"$")
    public void approversApproveRecord(String noOfApprovers, String approvers, String recordName, DataTable dataTable) throws IOException {
        defaultPage.approversApproveRecord(noOfApprovers, recordName, dataTable, approvers.split(","));
    }
    
    @Given("^I login and view the record \"([^\"]*)\" as \"([^\"]*)\"$")
    public void reloginToViewRecord(String recordName, String recordOwner, DataTable dataTable) throws IOException {
        defaultPage.reloginToViewRecord(recordName, recordOwner, dataTable);
    }
    
    @Given("^I login and view the \"([^\"]*)\" award \"([^\"]*)\" with name \"([^\"]*)\" as User \"([^\"]*)\"$")
    public void reloginToViewAward(String awardState, String awardId, String awardName, String awardOwner, DataTable dataTable) throws IOException {
        defaultPage.reloginToViewAward(awardState, awardId, awardName, awardOwner, dataTable);
    }
    
    @Given("^Subrecipient \"([^\"]*)\" receives the task for \"([^\"]*)\"$")
    public void subrecipientTask(String subrecipient, String uniqueColumnValue,  DataTable dataTable) throws IOException {
        defaultPage.subrecipientTask(subrecipient, uniqueColumnValue, dataTable);
    }

    @Given("^I complete \"([^\"]*)\" review form as \"([^\"]*)\"$")
    public void completeReviewForm(String noOfReviewers, DataTable dataTable, String reviewers) throws IOException {
        defaultPage.completeReviewForm(noOfReviewers, dataTable, reviewers.split(","));
    }

}
