package com.ggproduct.automation.pageobjects;

import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.Register.EyeThink;
import org.junit.Assert;
import org.openqa.selenium.By;

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
}
