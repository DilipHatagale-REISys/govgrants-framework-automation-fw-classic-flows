package com.ggproduct.automation.steps;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.pageobjects.AnnouncementPage;

import cucumber.api.DataTable;
import cucumber.api.java.en.Given;

public class AnnouncementSteps {
    AnnouncementPage announcementPage;

    public AnnouncementSteps(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        announcementPage = new AnnouncementPage(controller, handler, govgrants);
    }
    
    @Given("^I create a \"([^\"]*)\" Announcement as user \"([^\"]*)\" from sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void creationOfAnnouncement(String AnnouncementType, String user,String sheetName, String excelFileName, DataTable dataTable) {
        announcementPage.creationOfAnnouncement(AnnouncementType, user, sheetName, excelFileName, dataTable);
    }
    
    @Given("^I associate an agency \"([^\"]*)\" to the annoucement$")
    public void associateAgencyToAnnouncement(String agency) {
        announcementPage.associateAgencyToAnnouncement(agency);
    }
    
    @Given("^I associate an agency \"([^\"]*)\" with amount to the annoucement$")
    public void associateAgencyAmountToAnnouncement(String agency, DataTable dataTable) {
        announcementPage.associateAgencyAmountToAnnouncement(agency, dataTable);
    }
    
    @Given("^I add a Funding Account \"([^\"]*)\" with the amount to an announcement$")
    public void addFundingAccountToAnnouncement(String fundingAccount, DataTable dataTable) {
        announcementPage.addFundingAccountToAnnouncement(fundingAccount, dataTable);
    }
    
    @Given("^I add Budget Period Details \"([^\"]*)\" from sheet \"([^\"]*)\" in excel \"([^\"]*)\" to an announcement$")
    public void addBudgetPeriodToAnnouncement(String budgetPeriod, String sheetName, String excelFileName, DataTable dataTable) {
        announcementPage.addBudgetPeriodToAnnouncement(budgetPeriod, sheetName, excelFileName, dataTable);
    }
    
}
