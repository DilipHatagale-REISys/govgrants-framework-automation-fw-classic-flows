package com.ggproduct.automation.steps;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.pageobjects.PlanningPage;

import cucumber.api.DataTable;
import cucumber.api.java.en.Given;

public class PlanningSteps {
    PlanningPage planningPage;
    
    
    public PlanningSteps(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        planningPage = new PlanningPage(controller, handler, govgrants);
    }
    
    @Given("^I create a program as user \"([^\"]*)\" from sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void creationOfPrrogram(String user,String sheetName, String excelFileName, DataTable dataTable) {
        planningPage.creationOfProgram(user, sheetName, excelFileName, dataTable);
    }
}
