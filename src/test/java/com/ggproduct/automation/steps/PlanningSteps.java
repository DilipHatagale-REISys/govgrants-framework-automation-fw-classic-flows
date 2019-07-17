package com.ggproduct.automation.steps;

import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.pageobjects.PlanningPage;
import io.cucumber.java.en.*;
import io.cucumber.datatable.DataTable;;
import eyethink.automation.bots.controller.Controller;
import eyethink.automation.bots.controller.CoreHandlers;

public class PlanningSteps {
    PlanningPage planningPage;


    public PlanningSteps(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        planningPage = new PlanningPage(controller, handler, govgrants);
    }

    @Given("^I create a planning record as user \"([^\"]*)\" from sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void creationOfPlanningRecord(String user, String sheetName, String excelFileName, DataTable dataTable) {
        planningPage.creationOfPlanningRecord(user, sheetName, excelFileName, dataTable);
    }
}
