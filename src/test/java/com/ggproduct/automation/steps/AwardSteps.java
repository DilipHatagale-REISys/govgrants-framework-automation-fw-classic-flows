package com.ggproduct.automation.steps;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.pageobjects.AwardPage;
import java.util.Map;
import cucumber.api.java.en.Given;

public class AwardSteps {
    AwardPage awardPage;

    public AwardSteps(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        awardPage = new AwardPage(controller, handler, govgrants);
    }
    
    @Given("^I create a subaward from the Announcement \"([^\"]*)\" for the Application \"([^\"]*)\"$")
    public void creationOfAward(String announcementName, String applicationName) {
        awardPage.creationOfAward(announcementName, applicationName);
    }
    
    @Given("^I complete the Award fields from the sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void editionOfAward(String sheetName, String excelName) {
        awardPage.editionOfAward(sheetName, excelName);
    }
    
    @Given("^I add budget in the Award Funding Account$")
    public void budgetAddtionInFundingAccountForAward(Map<String, Map<String, String>> rowValues) {
        awardPage.budgetAddtionInFundingAccountForAward(rowValues);
    }
    
    @Given("^I edit the Budget details in award for line item \"([^\"]*)\"$")
    public void budgetEditionForAward(String lineItem, Map<String, Map<String, String>> rowValues) {
        awardPage.budgetEditionForAward(lineItem, rowValues);
    }
    
    @Given("^I add the Payment Request schedule from sheet \"([^\"]*)\" in excel \"([^\"]*)\" to an award$")
    public void additionOfPaymentRequestToAward(String sheetName, String excelName) {
        awardPage.additionOfPaymentRequestToAward(sheetName, excelName);
    }
    
    @Given("^I add the Progress Report schedule from sheet \"([^\"]*)\" in excel \"([^\"]*)\" to an award$")
    public void additionOfProgressReportToAward(String sheetName, String excelName) {
        awardPage.additionOfProgressReportToAward(sheetName, excelName);
    }
    
    @Given("^I create a Risk Assessment from sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void creationOfRiskAssessment(String sheetName, String excelName) {
        awardPage.creationOfRiskAssessment(sheetName, excelName);
    }
    
    @Given("^I select the Program Approver as \"([^\"]*)\" and Fiscal Approver as \"([^\"]*)\" for Risk Assessment$")
    public void approverSelectionOfRiskAssessment(String pragramApprover, String fiscalApprover) {
        awardPage.approverSelectionOfRiskAssessment(pragramApprover, fiscalApprover);
    }
    
    @Given("^I approve Risk Assessment as Program Approver \"([^\"]*)\" and Fiscal Approver \"([^\"]*)\"$")
    public void approvalOfRiskAssessmentInAward(String pragramApprover, String fiscalApprover) {
        awardPage.approvalOfRiskAssessmentInAward(pragramApprover, fiscalApprover);
    }
    
    @Given("^I re-login and view the award \"([^\"]*)\" with name \"([^\"]*)\" as User \"([^\"]*)\"$")
    public void reloginToViewAward(String awardId, String awardName, String awardOwner) {
        awardPage.reloginToViewAward(awardId, awardName, awardOwner);
    }
    
    @Given("^I select the Program Approver as \"([^\"]*)\", Fiscal Approver as \"([^\"]*)\" and Executive Approver as \"([^\"]*)\" for Award$")
    public void approverSelectionOfAward(String pragramApprover, String fiscalApprover, String executiveApprover) {
        awardPage.approverSelectionOfAward(pragramApprover, fiscalApprover, executiveApprover);
    }
    
    @Given("^The subrecipient user \"([^\"]*)\" accepts the award \"([^\"]*)\" with comments \"([^\"]*)\"$")
    public void acceptanceOfAward(String subrecipientUser, String awardName, String comments) {
        awardPage.acceptanceOfAward(subrecipientUser, awardName, comments);
    }
    
    @Given("^I assign, initiate a reviewer for an award from sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void initiateReviewForAward(String sheetName, String excelFileName) {
        awardPage.initiateReviewForAward(sheetName, excelFileName);
    }
    
    @Given("^Review is completed as user \"([^\"]*)\" for the award \"([^\"]*)\" with name \"([^\"]*)\" created by \"([^\"]*)\"$")
    public void completeReviewForAward(String reviewer, String awardId, String awardName, String awardOwner) {
        awardPage.completeReviewForAward(reviewer, awardId, awardName, awardOwner);
    }
    
    @Given("^Approvers \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" approve the award \"([^\"]*)\"$")
    public void approversApproveAward(String programApprover, String fiscalApprover, String executiveApprover, String awardName) {
        awardPage.approversApproveAward(programApprover, fiscalApprover, executiveApprover, awardName);
    }
    
    @Given("^I initiate Site Visit from sheet \"([^\"]*)\" in excel \"([^\"]*)\" for award$")
    public void initiateSitVisitInAward(String sheetName, String excelFileName) {
        awardPage.initiateSitVisitInAward(sheetName, excelFileName);
    }
}
