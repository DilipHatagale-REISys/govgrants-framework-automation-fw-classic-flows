package com.ggproduct.automation.steps;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;

import java.io.IOException;

import cucumber.api.DataTable;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;

public class GenericSteps {
    ProjectManager projectManager;

    public GenericSteps(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        projectManager = new ProjectManager(controller, handler, govgrants);
    }
    
    /****** Product Common Steps ***********/

    @Given("^I login to \"([^\"]*)\" app as \"([^\"]*)\" User$")
    public void loginToggleToApp(String appName, String userName) {
        projectManager.loginToggleToApp(appName, userName);
    }
    
    @When("^I re-login to \"([^\"]*)\" app as \"([^\"]*)\" User$")
    public void reloginToggleToApp(String appName, String userName) throws IOException {
        projectManager.reloginToggleToApp(appName, userName);
    }
    
    @When("^I re-login to \"([^\"]*)\" app as \"([^\"]*)\" User with environment \"([^\"]*)\"$")
    public void reloginToggleToAppInURL(String appName, String userName, String env) throws IOException {
        projectManager.reloginToggleToAppInURL(appName, userName, env);
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
    public void approversApproveRecord(String noOfApprovers, String approvers, String recordName, DataTable dataTable) throws IOException {
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
    
    @Given("^I fill in the form \"([^\"]*)\"$")
    public void fillingUpStandardForm(String formName, DataTable dataTable) {
        projectManager.fillingUpStandardForm(formName, dataTable);
    }
    
}
