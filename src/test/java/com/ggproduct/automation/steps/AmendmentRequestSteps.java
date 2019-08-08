package com.ggproduct.automation.steps;

import com.ggproduct.automation.pageobjects.AmendmentRequestPage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.When;
import org.springframework.context.annotation.Description;

public class AmendmentRequestSteps  {
    AmendmentRequestPage amendmentRequestPage;

    public AmendmentRequestSteps(){
        this.amendmentRequestPage = new AmendmentRequestPage();
    }

    @Description("To enter revised encumbrance balance on amendment request page")
    @When("I enter Revised Encumbrance")
    public void iEnterRevisedEncumbrance() {
        amendmentRequestPage.enterRevisedEncumbrance();
    }

    @And("^I get the updated budget end date$")
    public void getEndDate(){
        amendmentRequestPage.updatedBudgetPeriodEndDate();
    }
}
