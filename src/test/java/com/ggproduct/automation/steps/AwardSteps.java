package com.ggproduct.automation.steps;

import com.ggproduct.automation.pageobjects.AwardPage;
import eyethink.automation.bots.Register.EyeThink;
import io.cucumber.java.en.Then;
import org.junit.Assert;
import org.springframework.context.annotation.Description;

public class AwardSteps {
    AwardPage awardPage;

    public AwardSteps(){
        this.awardPage = new AwardPage();
    }

    @Description("To verify text area is editable ")
    @Then("^I (see|softly see) textarea field \"([^\"]*)\" is editable$")
    public void iSeeTextareaFieldIsEditable(String usage,String fieldAPIName) {
        if (usage.contains("softly")) {
            EyeThink.core().assertion().assertThat(awardPage.isFieldEditable(fieldAPIName)).isTrue();
        } else {
            Assert.assertTrue(awardPage.isFieldEditable(fieldAPIName));
        }
    }
}
