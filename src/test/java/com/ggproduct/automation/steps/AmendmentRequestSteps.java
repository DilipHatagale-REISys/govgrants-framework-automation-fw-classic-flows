package com.ggproduct.automation.steps;

import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.pageobjects.AmendmentRequestPage;
import eyethink.automation.bots.controller.CoreHandlers;
import io.cucumber.java.en.When;
import org.springframework.context.annotation.Description;

public class AmendmentRequestSteps  {
    AmendmentRequestPage amendmentRequestPage;

    public AmendmentRequestSteps(CoreHandlers reiDriver, GovGrantsHandler govgrants){
        this.amendmentRequestPage = new AmendmentRequestPage(reiDriver,govgrants);
    }

    @Description("To enter revised encumbrance balance on amendment request page")
    @When("I enter Revised Encumbrance")
    public void iEnterRevisedEncumbrance() {
        amendmentRequestPage.enterRevisedEncumbrance();
    }
}
