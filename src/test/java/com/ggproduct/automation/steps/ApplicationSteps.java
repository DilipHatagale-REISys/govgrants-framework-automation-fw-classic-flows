package com.ggproduct.automation.steps;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.pageobjects.ApplicationPage;

import cucumber.api.java.en.Given;

public class ApplicationSteps {
    ApplicationPage applicationPage;

    public ApplicationSteps(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
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
}
