package com.ggproduct.automation.steps;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.pageobjects.AnnouncementPage;

import cucumber.api.java.en.Given;

public class AnnouncementSteps {
    AnnouncementPage announcementPage;

    public AnnouncementSteps(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        announcementPage = new AnnouncementPage(controller, handler, govgrants);
    }
    
    @Given("^I create a \"([^\"]*)\" Announcement as user \"([^\"]*)\" from sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void creationOfAnnouncement(String AnnouncementType, String user,String sheetName, String excelFileName) {
        announcementPage.creationOfAnnouncement(AnnouncementType, user, sheetName, excelFileName);
    }
    
    @Given("^I complete the Announcement fields from the sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void editionOfAnnouncement(String sheetName, String excelFileName) {
        announcementPage.editionOfAnnouncement(sheetName, excelFileName);
    }
    
    @Given("^I associate an agency \"([^\"]*)\" to the annoucement$")
    public void associateAgencyToAnnouncement(String agency) {
        announcementPage.associateAgencyToAnnouncement(agency);
    }
    
    @Given("^I associate an agency \"([^\"]*)\" with amount \"([^\"]*)\" to the annoucement$")
    public void associateAgencyAmountToAnnouncement(String agency, String amount) {
        announcementPage.associateAgencyAmountToAnnouncement(agency, amount);
    }
    
    @Given("^I add a Funding Account \"([^\"]*)\" with the amount \"([^\"]*)\" to an announcement$")
    public void addFundingAccountToAnnouncement(String fundingAccount, String amount) {
        announcementPage.addFundingAccountToAnnouncement(fundingAccount, amount);
    }
    
    @Given("^I add Budget Period Details \"([^\"]*)\" from sheet \"([^\"]*)\" in excel \"([^\"]*)\" to an announcement$")
    public void addBudgetPeriodToAnnouncement(String budgetPeriod, String sheetName, String excelFileName) {
        announcementPage.addBudgetPeriodToAnnouncement(budgetPeriod, sheetName, excelFileName);
    }
    
    @Given("^I associate Contact \"([^\"]*)\", Focus Area \"([^\"]*)\", Objective \"([^\"]*)\" to the announcement$")
    public void associationOfRecordsToAnnouncement(String contact, String focusArea, String objective) {
        announcementPage.associationOfRecordsToAnnouncement(contact, focusArea, objective);
    }
    
    @Given("^I select the Program Approver \"([^\"]*)\",Fiscal Approver \"([^\"]*)\",Executive Approver \"([^\"]*)\" for the announcement$")
    public void approverSelectionForAnnouncement(String programApprover, String fiscalApprover, String executiveApprover) {
        announcementPage.approverSelectionForAnnouncement(programApprover, fiscalApprover, executiveApprover);
    }
    
    @Given("^I add an attachment checklist \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\" to upload the file \"([^\"]*)\" to the announcement$")
    public void additionOfChecklistToAnnouncement(String description, String required, String appliesTo, String fileName) {
        announcementPage.additionOfChecklistToAnnouncement(description, required, appliesTo, fileName);
    }
    
    @Given("^I add an attachment \"([^\"]*)\" to announcement$")
    public void additionOfAttachmentToAnnouncement(String fileName) {
        announcementPage.additionOfAttachmentToAnnouncement(fileName);
    }
    
    @Given("^Approvers \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" approve the announcement \"([^\"]*)\"$")
    public void approversApproveAnnouncement(String programApprover, String fiscalApprover, String executiveApprover, String announcementName) {
        announcementPage.approversApproveAnnouncement(programApprover, fiscalApprover, executiveApprover, announcementName);
    }
    
    @Given("^I assign, initiate a reviewer for an announcement from sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void initiateReviewForAnnouncement(String sheetName, String excelFileName) {
        announcementPage.initiateReviewForAnnouncement(sheetName, excelFileName);
    }
    
    @Given("^Review is completed as user \"([^\"]*)\" for the \"([^\"]*)\" announcement \"([^\"]*)\" created by \"([^\"]*)\"$")
    public void completeReviewForAnnouncement(String reviewer, String announcementType, String announcementName, String announcementOwner) {
        announcementPage.completeReviewForAnnouncement(reviewer, announcementType, announcementName, announcementOwner);
    }
   
}
