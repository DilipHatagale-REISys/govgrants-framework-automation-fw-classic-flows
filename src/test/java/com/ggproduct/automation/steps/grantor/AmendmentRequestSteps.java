package com.ggproduct.automation.steps.grantor;

import com.ggproduct.automation.pageobjects.grantor.AmendmentRequestPage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.When;
import org.springframework.context.annotation.Description;

public class AmendmentRequestSteps  {
    AmendmentRequestPage amendmentRequestPage;

    public AmendmentRequestSteps(){
        this.amendmentRequestPage = new AmendmentRequestPage();
    }

    @Description("To enter revised encumbrance balance on amendment request page")
    @When("^I enter Revised Encumbrance for award \"([^\"]*)\"$")
    public void iEnterRevisedEncumbranceForAward(String awardName) {
        amendmentRequestPage.enterRevisedEncumbrance(awardName);
    }

    @And("^I get the updated budget end date by offset \"([^\"]*)\" for award \"([^\"]*)\"$")
    public void getEndDate(String offset, String awardName) {
        amendmentRequestPage.updatedBudgetPeriodEndDate(offset, awardName);
    }
}
