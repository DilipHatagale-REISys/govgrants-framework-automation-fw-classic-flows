package com.ggproduct.automation.steps;

import com.ggproduct.automation.pageobjects.AwardPage;
import eyethink.automation.bots.Register.EyeThink;
import io.cucumber.java.en.Then;
import org.junit.Assert;
import org.springframework.context.annotation.Description;

public class AwardSteps {
    private AwardPage awardPage;

    public AwardSteps(AwardPage awardPage){ this.awardPage = awardPage; }

    @Description("To verify values inside dropdown")
    @Then("^I (softly see|see) field dropdown \"([^\"]*)\" contains values \"([^\"]*)\"$")
    public void verifyValuesInsideDropdown(String usage, String fieldAPIName, String dropdownValues) {
        if (usage.contains("softly")){
            EyeThink.core().assertion().assertThat(awardPage.areValuesPresentInsideDropdownSelector(fieldAPIName,dropdownValues)).isTrue();
        } else {
            Assert.assertTrue(awardPage.areValuesPresentInsideDropdownSelector(fieldAPIName,dropdownValues));
        }
    }

}
