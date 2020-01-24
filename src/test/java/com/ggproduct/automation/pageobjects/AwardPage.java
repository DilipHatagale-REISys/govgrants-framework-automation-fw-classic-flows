package com.ggproduct.automation.pageobjects;

import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.Register.EyeThink;
import io.cucumber.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.By;

import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Locale;

public class AwardPage extends ProjectManager {

    /**
     * To verify text area is editable
     * @param fieldApiName
     */
    public Boolean isFieldEditable(String fieldApiName) {
        By field = By.xpath("//div[@id='field" + fieldApiName + "' or @id='" + fieldApiName + "']//textarea");
        try {
            EyeThink.core().elementReference().of(field);
            return true;
        } catch (Exception e){
            return false;
        }
    }

    /**
     *
     * @param usage softly
     * @param createdUser such as Automation PM
     * @autor jitendra.pisal
     */
    public void assertSeeTextAfterHoveringOnAward(String usage, String createdUser){
        By createdBy = By.xpath("//span[text()='Activated' and @class='progressStatusText']/parent::span[contains(@onmouseover,'"+createdUser+"')]");
        By createdOnDate = By.xpath("//span[text()='Activated' and @class='progressStatusText']/parent::span[contains(@onmouseover,'Date')]");
        if (usage.contains("softly")){
            EyeThink.core().assertion().assertThat(
                    EyeThink.core().is().isDisplayed(createdBy) &&
                            EyeThink.core().is().isDisplayed(createdOnDate)).isTrue();
        } else {
            Assert.assertTrue(
                    EyeThink.core().is().isDisplayed(createdBy) &&
                            EyeThink.core().is().isDisplayed(createdOnDate)
            );
        }
    }

    /**
     *
     * @param label label name
     * @param fieldKey key to be save
     * @author jitendra.pisal
     */
    public void saveFieldValueHavingLinkLabeledAs(String label, String fieldKey){
        By value = By.xpath("//dt/span[contains(.,'"+label+"')]/ancestor::dl[1]/dd//a[text()] | //dt/span[contains(.,'"+label+"')]/ancestor::dl[1]/following-sibling::dd//a[text()]");
        EyeThink.core().Properties().saveValue(fieldKey, EyeThink.core().get()
                .text(value));
    }

    /**
     *
     * @param usage softly
     * @param textContains text to be validate
     * @author jitendra.pisal
     */
    public void assertToSeeWindowTitleContains(String usage, String textContains){
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

    public void verifyTotalObligation(String usage) {
        try {
            Number preEncumbrance = NumberFormat.getCurrencyInstance(Locale.US).parse(
                    EyeThink.core().Properties().getValue("Pre-Encumbrance")
            );
            Number encumbrance = NumberFormat.getCurrencyInstance(Locale.US).parse(
                    EyeThink.core().Properties().getValue("Encumbrance")
            );
            Number spent = NumberFormat.getCurrencyInstance(Locale.US).parse(
                    EyeThink.core().Properties().getValue("Spent")
            );

            Number totalObligation = NumberFormat.getCurrencyInstance(Locale.US).parse(
                    EyeThink.core().Properties().getValue("TotalObligation")
            );

            if (usage.contains("softly")) {
                EyeThink.core().assertion().assertThat(
                        preEncumbrance.intValue() + encumbrance.intValue() + spent.intValue()
                ).isEqualTo(totalObligation.intValue()).as(
                        "Total Obligation is : " + totalObligation +
                                " preEncumbrance : " + preEncumbrance +
                                " encumbrance : " + encumbrance +
                                " spent : " + spent
                );
            } else {
                Assert.assertEquals("Total obligation is not sum of preEncumbrance, spent and encumbrance",(preEncumbrance.intValue()+spent.intValue()+encumbrance.intValue()),totalObligation);
            }

        } catch (ParseException pe) {

        }
    }

    /**
     * Here in this method we are finding the available balance by substracting Appropriation Amount(Saved in previous step)
     * and TotalObligation(saved in previous step)
     * @param usage
     * @autor jitendra.pisal
     */
    public void validateAvailableBalance(String usage){

        int appropriationAmt = 0;
        int totalObligation = 0;
        int availableBalance = 0;

        try{
            appropriationAmt =  NumberFormat.getCurrencyInstance(Locale.US)
                    .parse(
                            EyeThink.core()
                                    .Properties().getValue("Appropriation Amount")
                    ).intValue();

            totalObligation = NumberFormat.getCurrencyInstance(Locale.US)
                    .parse(
                            EyeThink.core()
                                    .Properties().getValue("TotalObligation")
                    ).intValue();

            availableBalance = NumberFormat.getCurrencyInstance(Locale.US)
                    .parse(
                            EyeThink.core()
                                    .Properties().getValue("Available Balance")
                    ).intValue();

        } catch (ParseException re){

        }

        if (usage.contains("softly")){
            EyeThink.core().assertion().assertThat(
                    appropriationAmt - totalObligation
            ).isEqualTo(availableBalance);
        }
    }
}
