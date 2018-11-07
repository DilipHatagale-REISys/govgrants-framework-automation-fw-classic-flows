package com.ggproduct.automation.steps;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.pageobjects.ApplicationIntakePage;

public class ApplicationIntakeSteps {
    ApplicationIntakePage applicationIntakePage;

    public ApplicationIntakeSteps(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
        applicationIntakePage = new ApplicationIntakePage(controller, handler, govgrants);
    }
}
