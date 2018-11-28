package com.ggproduct.automation.steps;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.pageobjects.ApplicationPage;

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
    
    @Given("^I add budget details Award budget \"([^\"]*)\", Cash match \"([^\"]*)\", Non-cash match \"([^\"]*)\" to the application$")
    public void additionOfBudgetToApplication(String awardBudget, String cashMatch, String nonCashMatch) {
        applicationPage.additionOfBudgetToApplication(awardBudget, cashMatch, nonCashMatch);
    }
    
    @Given("^I add target \"([^\"]*)\" to the KPI in the application$")
    public void additionOfTargetToKPIInApplication(String target) {
        applicationPage.additionOfTargetToKPIInApplication(target);
    }
    
    @Given("^I upload checklist \"([^\"]*)\" to the application$")
    public void uploadChecklistToApplication(String fileName) {
        applicationPage.uploadChecklistToApplication(fileName);
    }
    
    @Given("^\"([^\"]*)\" is done for Application \"([^\"]*)\" as user \"([^\"]*)\" submitted for announcement \"([^\"]*)\"$")
    public void completeReviewStepForApplication(String reviewStep, String applicationName, String announcementOwner, String announcementName) {
        applicationPage.completeReviewStepForApplication(reviewStep, applicationName, announcementOwner, announcementName);
    }
    
    @Given("^I enter the Due In Days as \"([^\"]*)\" for all SME review steps$")
    public void enterDueInDaysSME(String dueInDays) {
        applicationPage.enterDueInDaysSME(dueInDays);
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
    
    @Given("^I enter the Due In Days as \"([^\"]*)\" for all Management review steps$")
    public void enterDueInDaysManagement(String dueInDays) {
        applicationPage.enterDueInDaysManagement(dueInDays);
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
}
