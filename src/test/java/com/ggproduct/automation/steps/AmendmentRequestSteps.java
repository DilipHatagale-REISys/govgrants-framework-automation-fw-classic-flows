package com.ggproduct.automation.steps;

import com.ggproduct.automation.pageobjects.AmendmentRequestPage;
import io.cucumber.java.en.When;
import org.springframework.context.annotation.Description;

public class AmendmentRequestSteps  {
    AmendmentRequestPage amendmentRequestPage;

    @Description("To enter revised encumbrance balance on amendment request page")
    @When("I enter Revised Encumbrance")
    public void iEnterRevisedEncumbrance() {
        amendmentRequestPage.enterRevisedEncumbrance();
    }
}
