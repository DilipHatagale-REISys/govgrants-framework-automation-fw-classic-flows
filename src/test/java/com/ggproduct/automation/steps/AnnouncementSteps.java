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

    @When("^I fill in the Inline fields on \"([^\"]*)\"$")
    public void fillInInlineFields(String flextableName) {
        announcementPage.fillInInlineFields(flextableName);
    }

}
