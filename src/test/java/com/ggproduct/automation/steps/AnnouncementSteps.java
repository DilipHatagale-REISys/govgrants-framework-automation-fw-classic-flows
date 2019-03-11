package com.ggproduct.automation.steps;

import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.pageobjects.AnnouncementPage;

import cucumber.api.DataTable;
import cucumber.api.java.en.Given;
import eyethink.automation.bots.controller.Controller;
import eyethink.automation.bots.controller.CoreHandlers;

public class AnnouncementSteps {
    AnnouncementPage announcementPage;

    public AnnouncementSteps(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        announcementPage = new AnnouncementPage(controller, handler, govgrants);
    }
    
    @Given("^I add Budget Period Details \"([^\"]*)\" from sheet \"([^\"]*)\" in excel \"([^\"]*)\" to an announcement$")
    public void addBudgetPeriodToAnnouncement(String budgetPeriod, String sheetName, String excelFileName, DataTable dataTable) {
        announcementPage.addBudgetPeriodToAnnouncement(budgetPeriod, sheetName, excelFileName, dataTable);
    }
    
}
