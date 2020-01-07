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
        By createdBy = By.xpath("//span[text()='Activated' and @class='progressStatusText']/parent::span[contains(@onmouseover,'"+createdUser+"')]");
        By createdOnDate = By.xpath("//span[text()='Activated' and @class='progressStatusText']/parent::span[contains(@onmouseover,'Date')]");
        if (usage.contains("softly")){
            EyeThink.core().assertion().assertThat(
                    EyeThink.core().elementReference().of(createdBy).isDisplayed() &&
                    EyeThink.core().elementReference().of(createdOnDate).isDisplayed()).isTrue();
        } else {
            Assert.assertTrue(
                    EyeThink.core().elementReference().of(createdBy).isDisplayed() &&
                            EyeThink.core().elementReference().of(createdOnDate).isDisplayed()
            );
        }

    }

    @And("^I mouse hover to link contains \"([^\"]*)\"$")
    public void iMouseHoverToLinkContains(String link) {
        EyeThink.core().scroll().moveToElement(EyeThink.core()
        .elementReference().of(By.xpath("//a[text()='"+link+"']")));
    }

    @Then("^I (softly see|see) \"([^\"]*)\" in hovered link tooltip$")
    public void iSeeInHoveredLinkTooltip(String usage, String text) {
       By textToBeSeen = By.xpath("//p[contains(@class,'tooltip-title') and text()='"+text+"']");
       if (usage.contains("softly")){
           EyeThink.core().assertion().assertThat(
                   EyeThink.core().elementReference().of(textToBeSeen)
                   .isDisplayed()
           ).isTrue();
       } else {
           Assert.assertTrue(
                   EyeThink.core().elementReference().of(textToBeSeen)
                   .isDisplayed()
           );
       }
    }

    @And("I save the field value having link labeled \"([^\"]*)\" as \"([^\"]*)\"")
    public void iSaveTheFieldValueHavingLinkLabeledAs(String label, String fieldKey) {
        By value = By.xpath("//dt/span[contains(.,'"+label+"')]/ancestor::dl[1]/dd//a[text()] | //dt/span[contains(.,'"+label+"')]/ancestor::dl[1]/following-sibling::dd//a[text()]");
        EyeThink.core().Properties().saveValue(fieldKey, EyeThink.core().get()
        .text(value));
    }

    @And("I click \"([^\"]*)\" link present on hovered tooltip")
    public void iClickLinkPresentOnHoveredTooltip(String text) {
        EyeThink.core().click().on(By.xpath("//div[contains(@class,'form-group')]//a[text()='"+text+"']"));
    }

    @Then("^I (softly see|see) page title contains as \"([^\"]*)\"$")
    public void iSeeWindowTitleContainsAs(String usage, String textContains) {
        if (usage.contains("softly")){
            EyeThink.core().assertion().assertThat(
                    EyeThink.core().get().text(By.xpath("//*[@id='pageHeaderId']//span[@class='overview-title']")).contains(textContains)
            ).isTrue();
        } else {
            Assert.assertTrue(
                    EyeThink.core().get().text(By.xpath("//*[@id='pageHeaderId']//span[@class='overview-title']")).contains(textContains)
            );
        }
    }
}
