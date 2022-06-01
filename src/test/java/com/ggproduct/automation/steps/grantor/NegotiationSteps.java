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
    @Then("^I (see|do not see) multipicklist field \"([^\"]*)\" contains value \"([^\"]*)\" under list \"([^\"]*)\"$")
    public void verifyValueInMultiPickList(String usage,String fieldAPIName, String valueFromList, String listTitleFromMultiPickList) {
        if (usage.equalsIgnoreCase("see")) {
        Assert.assertTrue(negotiationPage.isValuePresentInsidePicklist(usage,fieldAPIName,valueFromList,listTitleFromMultiPickList));
    }   else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(negotiationPage.isValuePresentInsidePicklist(usage,fieldAPIName,valueFromList,listTitleFromMultiPickList));
        }
        }
}
