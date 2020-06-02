package com.ggproduct.automation.steps.grantor;

import com.ggproduct.automation.pageobjects.grantor.NegotiationPage;
import io.cucumber.java.en.Then;
import org.junit.Assert;
import org.springframework.context.annotation.Description;

public class NegotiationSteps {
    private NegotiationPage negotiationPage;

    public NegotiationSteps(NegotiationPage negotiationPage) {
        this.negotiationPage = negotiationPage;
    }

    @Description("To verify value is present in pick list")
    @Then("^I see multipicklist field \"([^\"]*)\" contains value \"([^\"]*)\" under list \"([^\"]*)\"$")
    public void verifyValueInMultiPickList(String fieldAPIName, String valueFromList, String listTitleFromMultiPickList) {
        Assert.assertTrue(negotiationPage.isValuePresentInsidePicklist(fieldAPIName,valueFromList,listTitleFromMultiPickList));
    }
}
