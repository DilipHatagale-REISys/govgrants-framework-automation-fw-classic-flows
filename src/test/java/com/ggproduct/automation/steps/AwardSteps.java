package com.ggproduct.automation.steps;

import com.ggproduct.automation.pageobjects.AwardPage;
import eyethink.automation.bots.Register.EyeThink;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.By;
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

    @And("^I (softly see|see) \"([^\"]*)\" is present after mouse hover for active subaward$")
    public void iSeeIsPresentAfterMouseHoverForActiveSubaward(String usage, String createdUser) {
        awardPage.assertSeeTextAfterHoveringOnAward(usage,createdUser);
    }

    @And("^I mouse hover to link contains \"([^\"]*)\"$")
    public void iMouseHoverToLinkContains(String link) {
        EyeThink.core().scroll().moveToElement(EyeThink.core()
        .elementReference().of(By.xpath("//a[text()='"+link+"']")));
    }

    @Then("^I (softly see|see) \"([^\"]*)\" in hovered link tooltip$")
    public void iSeeInHoveredLinkTooltip(String usage, String text) {
       awardPage.assertToSeeTextAfterHoveringOnLinkTooltip(usage,text);
    }

    @And("I save the field value having link labeled \"([^\"]*)\" as \"([^\"]*)\"")
    public void iSaveTheFieldValueHavingLinkLabeledAs(String label, String fieldKey) {
        awardPage.saveFieldValueHavingLinkLabeledAs(label,fieldKey);
    }

    @And("I click \"([^\"]*)\" link present on hovered tooltip")
    public void iClickLinkPresentOnHoveredTooltip(String text) {
        EyeThink.core().click().on(By.xpath("//div[contains(@class,'form-group')]//a[text()='"+text+"']"));
    }

    @Then("^I (softly see|see) page title contains as \"([^\"]*)\"$")
    public void iSeeWindowTitleContainsAs(String usage, String textContains) {
        awardPage.assertToSeeWindowTitleContains(usage, textContains);
    }
}
