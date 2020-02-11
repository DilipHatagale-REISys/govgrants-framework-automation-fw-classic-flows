package com.ggproduct.automation.pageobjects;

import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.Register.EyeThink;
import eyethink.automation.bots.Report.LogLevel;
import io.cucumber.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.By;

import java.text.NumberFormat;
import java.text.ParseException;
import java.util.List;
import java.util.Locale;

public class AwardPage extends ProjectManager {

    /**
     * To verify text area is editable
     *
     * @param fieldApiName
     */
    public Boolean isFieldEditable(String fieldApiName) {
        By field = By.xpath("//div[@id='field" + fieldApiName + "' or @id='" + fieldApiName + "']//textarea");
        try {
            EyeThink.core().elementReference().of(field);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * @param usage       softly
     * @param createdUser such as Automation PM
     * @autor jitendra.pisal
     */
    public void assertSeeTextAfterHoveringOnAward(String usage, String createdUser) {
        By createdBy = By.xpath("//span[text()='Activated' and @class='progressStatusText']/parent::span[contains(@onmouseover,'" + createdUser + "')]");
        By createdOnDate = By.xpath("//span[text()='Activated' and @class='progressStatusText']/parent::span[contains(@onmouseover,'Date')]");
        if (usage.contains("softly")) {
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
     * @param label    label name
     * @param fieldKey key to be save
     * @author jitendra.pisal
     */
    public void saveFieldValueHavingLinkLabeledAs(String label, String fieldKey) {
        By value = By.xpath("//dt/span[contains(.,'" + label + "')]/ancestor::dl[1]/dd//a[text()] | //dt/span[contains(.,'" + label + "')]/ancestor::dl[1]/following-sibling::dd//a[text()]");
        EyeThink.core().Properties().saveValue(fieldKey, EyeThink.core().get()
                .text(value));
    }

    /**
     * @param usage        softly
     * @param textContains text to be validate
     * @author jitendra.pisal
     */
    public void assertToSeeWindowTitleContains(String usage, String textContains) {
        if (usage.contains("softly")) {
            EyeThink.core().assertion().assertThat(
                    EyeThink.core().get().text(By.xpath("//*[@id='pageHeaderId']//span[@class='overview-title']")).contains(textContains)
            ).isTrue();
        } else {
            Assert.assertTrue(
                    EyeThink.core().get().text(By.xpath("//*[@id='pageHeaderId']//span[@class='overview-title']")).contains(textContains)
            );
        }
    }

    public void verifyTotalObligation(String usage, String fieldToCompare, List<String> fieldsToSum) {
        try {
            double expectedSum = Double.parseDouble(EyeThink.saas().pageDetails().getFieldValue(fieldToCompare, true).replaceAll("[^0-9.]", ""));
            double actualSum = 0;
            for (String fieldToSum : fieldsToSum) {
                actualSum += Double.parseDouble(EyeThink.saas().pageDetails().getFieldValue(fieldToSum, true).replaceAll("[^0-9.]", ""));
            }

            if (usage.contains("softly")) {
                EyeThink.core().assertion().assertThat(actualSum)
                        .as("Verifying that the field %s is equal to the sum of fields %s", fieldToCompare, fieldsToSum)
                        .isEqualTo(expectedSum);
            } else {
                Assert.assertTrue(actualSum == expectedSum);
            }
        } catch (NumberFormatException e) {
            EyeThink.core().report().write(LogLevel.BUSINESS_LAYER_ERROR, String.format("Either the total field '%s' or the summable fields %s were not able to be converted to double.", fieldToCompare, fieldsToSum));
            throw e;
        }
    }

    /**
     * Here in this method we are finding the available balance by substracting Appropriation Amount(Saved in previous step)
     * and TotalObligation(saved in previous step)
     *
     * @param usage
     * @autor jitendra.pisal
     */
    public void validateAvailableBalance(String usage, String fieldToCompare, String initialFieldValue, List<String> fieldsToSum) {
        try {
            double expectedSum = Double.parseDouble(EyeThink.saas().pageDetails().getFieldValue(fieldToCompare, true).replaceAll("[^0-9.]", ""));
            double actualSum = Double.parseDouble(EyeThink.saas().pageDetails().getFieldValue(initialFieldValue, true).replaceAll("[^0-9.]", ""));
            for (String fieldToSum : fieldsToSum) {
                actualSum -= Double.parseDouble(EyeThink.saas().pageDetails().getFieldValue(fieldToSum, true).replaceAll("[^0-9.]", ""));
            }
            if (usage.contains("softly")) {
                EyeThink.core().assertion().assertThat(actualSum)
                        .as("Verifying that the field %s is equal to the difference of field %s and the fields %s", fieldToCompare, initialFieldValue, fieldsToSum)
                        .isEqualTo(expectedSum);
            } else {
                Assert.assertTrue(expectedSum == actualSum);
            }
        } catch (NumberFormatException e) {
            EyeThink.core().report().write(LogLevel.BUSINESS_LAYER_ERROR, String.format("Either the total field '%s', the initial field '%s', or the summable fields %s were not able to be converted to double.", fieldToCompare, initialFieldValue, fieldsToSum));
            throw e;
        }
    }

    /**
     * assert if expected multiple record inside table is displayed
     *
     * @param recordsName
     */
    public void assertExpectedRecordsInsideTable(boolean canOrCanotSee, String flexTableHeader, String recordsName) {
        if (canOrCanotSee){
            EyeThink.core().assertion().assertThat(
                    isExpectedRecordsDisplayedInsideTable(flexTableHeader, recordsName.split(","))
            ).isTrue();
        } else {
            Assert.assertTrue(isExpectedRecordsDisplayedInsideTable(flexTableHeader, recordsName.split(",")));
        }
    }

    /**
     * return true if expected records displayed inside table
     *
     * @param recordsName
     * @return
     */
    private boolean isExpectedRecordsDisplayedInsideTable(String flexTableHeader, String... recordsName) {
        boolean isRecordsDisplayed = false;
        for (String expectedRecords : recordsName) {
            EyeThink.core().is().isDisplayed(By.xpath("//div[@id='myTabbedContent']//a[@title='" + flexTableHeader + "']/../../../following-sibling::div//tbody//td//span[text()='" + expectedRecords + "'] "));
            isRecordsDisplayed = true;
        }
        return isRecordsDisplayed;
    }


}
