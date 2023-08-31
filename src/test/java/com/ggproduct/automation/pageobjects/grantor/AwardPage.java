package com.ggproduct.automation.pageobjects.grantor;

import com.helperPackage.handlers.govgrants;
import com.ggproduct.automation.projectmanager.GrantorProjectManager;
import com.helperPackage.register.I;
import com.helperPackage.report.LogLevel;
import org.junit.Assert;
import org.openqa.selenium.By;

import java.util.List;

public class AwardPage extends GrantorProjectManager {

    /**
     * return if field is ediatble/not editable inside enhanced table
     */
    public void assertFieldIsNotEditableAtEnhancedTable(String usage, String fieldApiName) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isFieldIsEditableAtEnhancedTable(fieldApiName)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isFieldIsEditableAtEnhancedTable(fieldApiName)).isFalse();
        }
    }

    /**
     * To verify text area is editable
     *
     * @param fieldApiName
     */
    public Boolean isFieldEditable(String fieldApiName) {
        By field = By.xpath("//div[@id='field" + fieldApiName + "' or @id='" + fieldApiName + "']//textarea");
        try {
            I.amPerforming().getElementReference().of(field);
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
            I.amPerforming().assertionsTo().assertThat(
                    I.amPerforming().checkToSee().isDisplayed(createdBy) &&
                            I.amPerforming().checkToSee().isDisplayed(createdOnDate)).isTrue();
        } else {
            Assert.assertTrue(
                    I.amPerforming().checkToSee().isDisplayed(createdBy) &&
                            I.amPerforming().checkToSee().isDisplayed(createdOnDate)
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
        I.amPerforming().propertiesFileOperationsTo().saveValue(fieldKey, I.amPerforming().actionToGet()
                .text(value));
    }

    /**
     * @param usage        softly
     * @param textContains text to be validate
     * @author jitendra.pisal
     */
    public void assertToSeeWindowTitleContains(String usage, String textContains) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(
                    I.amPerforming().actionToGet().text(By.xpath("//*[@id='pageHeaderId']//span[@class='overview-title']")).contains(textContains)
            ).isTrue();
        } else {
            Assert.assertTrue(
                    I.amPerforming().actionToGet().text(By.xpath("//*[@id='pageHeaderId']//span[@class='overview-title']")).contains(textContains)
            );
        }
    }

    public void verifyTotalObligation(String usage, String fieldToCompare, List<String> fieldsToSum) {
        try {
            double expectedSum = Double.parseDouble(govgrants.perform().pageDetails().getFieldValue(fieldToCompare, true).replaceAll("[^0-9.]", ""));
            double actualSum = 0;
            for (String fieldToSum : fieldsToSum) {
                actualSum += Double.parseDouble(govgrants.perform().pageDetails().getFieldValue(fieldToSum, true).replaceAll("[^0-9.]", ""));
            }

            if (usage.contains("softly")) {
                I.amPerforming().assertionsTo().assertThat(actualSum)
                        .as("Verifying that the field %s is equal to the sum of fields %s", fieldToCompare, fieldsToSum)
                        .isEqualTo(expectedSum);
            } else {
                Assert.assertTrue(actualSum == expectedSum);
            }
        } catch (NumberFormatException e) {
            I.amPerforming().updatingOfReportWith().write(LogLevel.BUSINESS_LAYER_ERROR, String.format("Either the total field '%s' or the summable fields %s were not able to be converted to double.", fieldToCompare, fieldsToSum));
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
            double expectedSum = Double.parseDouble(govgrants.perform().pageDetails().getFieldValue(fieldToCompare, true).replaceAll("[^0-9.]", ""));
            double actualSum = Double.parseDouble(govgrants.perform().pageDetails().getFieldValue(initialFieldValue, true).replaceAll("[^0-9.]", ""));
            for (String fieldToSum : fieldsToSum) {
                actualSum -= Double.parseDouble(govgrants.perform().pageDetails().getFieldValue(fieldToSum, true).replaceAll("[^0-9.]", ""));
            }
            if (usage.contains("softly")) {
                I.amPerforming().assertionsTo().assertThat(actualSum)
                        .as("Verifying that the field %s is equal to the difference of field %s and the fields %s", fieldToCompare, initialFieldValue, fieldsToSum)
                        .isEqualTo(expectedSum);
            } else {
                Assert.assertTrue(expectedSum == actualSum);
            }
        } catch (NumberFormatException e) {
            I.amPerforming().updatingOfReportWith().write(LogLevel.BUSINESS_LAYER_ERROR, String.format("Either the total field '%s', the initial field '%s', or the summable fields %s were not able to be converted to double.", fieldToCompare, initialFieldValue, fieldsToSum));
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
            I.amPerforming().assertionsTo().assertThat(
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
            I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[@id='myTabbedContent']//a[@title='" + flexTableHeader + "']/../../../following-sibling::div//tbody//td//span[text()='" + expectedRecords + "'] "));
            isRecordsDisplayed = true;
        }
        return isRecordsDisplayed;
    }

    /**
     * @param fieldApiName
     * @return true if field is not editable for enhanced table
     */
    private Boolean isFieldIsEditableAtEnhancedTable(String fieldApiName) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//field[@field-name='" + fieldApiName + "']//input[@type='text']"))) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }
}
