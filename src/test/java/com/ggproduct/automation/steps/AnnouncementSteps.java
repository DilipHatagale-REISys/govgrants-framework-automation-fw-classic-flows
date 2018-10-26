package com.ggproduct.automation.steps;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.pageobjects.AnnouncementPage;

import cucumber.api.java.en.When;

public class AnnouncementSteps {
    AnnouncementPage announcementPage;

    public AnnouncementSteps(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
        announcementPage = new AnnouncementPage(controller, handler, govgrants);
    }
    
    @When("^I choose the \"([^\"]*)\" with \"([^\"]*)\" and click \"([^\"]*)\" button for announcement$")
    public void chooseRecordforAnnouncementAssociation(String recordName, String recordUniqueName, String buttonName) {
        announcementPage.chooseRecordforAnnouncementAssociation(recordName, recordUniqueName, buttonName);
    }
    
    @When("^I fill in the Funding Account fields on \"([^\"]*)\"$")
    public void fillInFundingAccountFields(String flextableName) {
        announcementPage.fillInFundingAccountFields(flextableName);
    }
    
    @When("^I fill in the \"([^\"]*)\" for the Approver details for announcement$")
    public void fillInApproverDetails(String approverName) {
        announcementPage.fillInApproverDetails(approverName);
    }
}    
