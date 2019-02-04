package com.ggproduct.automation.steps;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.pageobjects.AwardPage;

import java.io.IOException;

import cucumber.api.DataTable;
import cucumber.api.java.en.Given;

public class AwardSteps {
    AwardPage awardPage;

    public AwardSteps(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        awardPage = new AwardPage(controller, handler, govgrants);
    }
    
    @Given("^I create a Grant as user \"([^\"]*)\" from sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void creationOfStanAloneAward(String user,String sheetName, String excelFileName, DataTable dataTable) {
        awardPage.creationOfStanAloneGrant(user, sheetName, excelFileName, dataTable);
    }
    
    @Given("^I create a subaward from the Announcement \"([^\"]*)\" for the Application \"([^\"]*)\" as user \"([^\"]*)\"$")
    public void creationOfAward(String announcementName, String applicationName, String User, DataTable dataTable) {
        awardPage.creationOfAwardFromFDM(announcementName, applicationName, User, dataTable);
    }
    
    @Given("^I edit the Budget details in award for line item \"([^\"]*)\"$")
    public void budgetEditionForAward(String lineItem, DataTable rowValues) {
        awardPage.budgetEditionForAward(lineItem, rowValues);
    }
    
    @Given("^I create a monitoring record from sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void creationOfMonitoringRecord(String sheetName, String excelName, DataTable dataTable) {
        awardPage.creationOfMonitoringRecord(sheetName, excelName, dataTable);
    }
    
    @Given("^The subrecipient user \"([^\"]*)\" accepts the award \"([^\"]*)\" with comments \"([^\"]*)\"$")
    public void acceptanceOfAward(String subrecipientUser, String awardName, String comments, DataTable dataTable) throws IOException {
        awardPage.acceptanceOfAward(subrecipientUser, awardName, comments, dataTable);
    }
}
