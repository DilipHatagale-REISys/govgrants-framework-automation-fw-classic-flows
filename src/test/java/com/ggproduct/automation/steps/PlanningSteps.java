package com.ggproduct.automation.steps;

import com.automation.rei.controller.Controller;

import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.pageobjects.PlanningPage;

public class PlanningSteps {
    PlanningPage planningPage;

    public PlanningSteps(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
        planningPage = new PlanningPage(controller, handler, govgrants);
    }
    
}
