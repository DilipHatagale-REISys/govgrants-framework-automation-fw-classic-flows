package com.ggproduct.automation.steps;

import com.automation.rei.controller.Controller;

import java.util.Map;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.pageobjects.ApplicationPage;

import cucumber.api.DataTable;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;

public class ApplicationSteps {
    ApplicationPage applicationPage;

    public ApplicationSteps(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        applicationPage = new ApplicationPage(controller, handler, govgrants);
    }
    
    @Given("^I qualiy the announcement \"([^\"]*)\" as user \"([^\"]*)\"$")
    public void qualifyAnnouncement(String announcementName, String user) {
        applicationPage.qualifyAnnouncement(announcementName, user);
    }
    
    @Given("^I create an Application from sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void applicationCreation(String sheetName, String excelFileName) {
        applicationPage.applicationCreation(sheetName, excelFileName);
    }
    
    @Given("^I complete the Application fields from the sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void editionOfApplication(String sheetName, String excelFileName) {
        applicationPage.editionOfApplication(sheetName, excelFileName);
    }
    
    @Given("^I add focus area \"([^\"]*)\" to the application$")
    public void additionOfFocusAreaToApplication(String focusArea) {
        applicationPage.additionOfFocusAreaToApplication(focusArea);
    }
    
    @Given("^I add budget details to the application$")
    public void additionOfBudgetToApplication(DataTable rowValues) {
        applicationPage.additionOfBudgetToApplication(rowValues);
    }
    
    @Given("^I add target to the KPI in the application$")
    public void additionOfTargetToKPIInApplication(DataTable rowValues) {
        applicationPage.additionOfTargetToKPIInApplication(rowValues);
    }
    
    @Given("^I upload checklist \"([^\"]*)\" to the application$")
    public void uploadChecklistToApplication(String fileName) {
        applicationPage.uploadChecklistToApplication(fileName);
    }
    
    @Given("^\"([^\"]*)\" is completed by clicking \"([^\"]*)\" for Application \"([^\"]*)\" as user \"([^\"]*)\" submitted for announcement \"([^\"]*)\"$")
    public void completeReviewStepForApplication(String reviewStep, String buttonName, String applicationName, String announcementOwner, String announcementName) {
        applicationPage.completeReviewStepForApplication(reviewStep, buttonName, applicationName, announcementOwner, announcementName);
    }
    
    @Given("^I enter the Due In Days for all SME review steps$")
    public void enterDueInDaysSME(DataTable rowValues) {
        applicationPage.enterDueInDaysSME(rowValues);
    }
    
    @Given("^I add Reviewers \"([^\"]*)\" for Program Review, \"([^\"]*)\" for Fiscal Review, \"([^\"]*)\" for Compliance Review in SME Review$")
    public void addReviewerForReviewSME(String programReviewer, String fiscalReviewer, String complianceReviewer) {
        applicationPage.addReviewerForReviewSME(programReviewer, fiscalReviewer, complianceReviewer);
    }
    
    @Given("^I assign application \"([^\"]*)\" to the Reviewers for SME Review$")
    public void assignApplicationToReviewerSME(String applicationName) {
        applicationPage.assignApplicationToReviewerSME(applicationName);
    }
    
    @Given("^I choose Reviews for SME review and Send for Review$")
    public void chooseAndSendReviewsSME() {
        applicationPage.chooseAndSendReviewsSME();
    }
    
    @Given("^I complete review form as assigned reviewers for SME review$")
    public void completeReviewFormSME() {
        applicationPage.completeReviewFormSME();
    }
    
    @When("^I add \"([^\"]*)\" as reviewer in the table \"([^\"]*)\"$")
    public void addReviewerForReview(String reviewer, String tableId) {
        applicationPage.addReviewerForReview(reviewer, tableId);
    }
    
    @When("^I fill in the Review form$")
    public void fillInReviewForm() {
        applicationPage.fillInReviewForm();
    }
    
    @Given("^I enter the Due In Days for all Management review steps$")
    public void enterDueInDaysManagement(DataTable rowValues) {
        applicationPage.enterDueInDaysManagement(rowValues);
    }
    
    @Given("^I add Reviewers \"([^\"]*)\" for Management Review$")
    public void addReviewerForReviewManagement(String ManagementReviewer) {
        applicationPage.addReviewerForReviewManagement(ManagementReviewer);
    }
    
    @Given("^I assign application \"([^\"]*)\" to the Reviewers for Management Review$")
    public void assignApplicationToReviewerManagement(String applicationName) {
        applicationPage.assignApplicationToReviewerManagement(applicationName);
    }
    
    @Given("^I choose Reviews for Management review and Send for Review$")
    public void chooseAndSendReviewsManagement() {
        applicationPage.chooseAndSendReviewsManagement();
    }
    
    @Given("^I complete review form as assigned reviewers for Management review$")
    public void completeReviewFormManagement() {
        applicationPage.completeReviewFormManagement();
    }
    
    @Given("^I enter Subaward Abbreviation as \"([^\"]*)\"$")
    public void enterSubAwardAbbreviationFDM(String value) {
        applicationPage.enterSubAwardAbbreviationFDM(value);
    }
    
    @Given("^I enter the recommendation in FDM$")
    public void enterRecommendationFDM(DataTable rowValues) {
        applicationPage.enterRecommendationFDM(rowValues);
    }
    
    @Given("^I select \"([^\"]*)\" as \"([^\"]*)\" for Approver details$")
    public void selectApproverFDM(String approverName, String approverType) {
        applicationPage.selectApproverFDM(approverName, approverType);
    }
}
