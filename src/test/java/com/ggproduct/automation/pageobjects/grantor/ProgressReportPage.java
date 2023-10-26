package com.ggproduct.automation.pageobjects.grantor;

import com.helperPackage.handlers.govgrants;
import com.ggproduct.automation.projectmanager.GrantorProjectManager;
import com.helperPackage.objects.Elements;
import com.helperPackage.register.I;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.List;
import java.util.Map;

public class ProgressReportPage extends GrantorProjectManager {

    public void verifyProgressReportSchedulesUpdated(String totalRecords, String tableID, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().propertiesFileOperationsTo().getValue("EGMSID1")).isEqualTo(
                    I.amPerforming().propertiesFileOperationsTo().getValue("EGMSID2")
            );
        } else {
            Assert.assertEquals(I.amPerforming().propertiesFileOperationsTo().getValue("EGMSID1"), I.amPerforming().propertiesFileOperationsTo().getValue("EGMSID2"));
        }
        AssertTotalRecordsCountInFlexTable(totalRecords, tableID, isSoftly);
    }

    /**
     * To verify toggle option not displayed on flex table
     *
     * @param anyItemToBeCheck - Toggle Optin to be check
     * @param flexTableId
     * @return
     */
    public Boolean isGivenToggleOptionPresent(String anyItemToBeCheck, String flexTableId) {
        govgrants.perform().phasePanel().clickDoubleArrowToggle("#toggleFlexTableGrantorProgressReportsInternal");
        List<Elements> toggleOptions = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='" + flexTableId + "']//div[@id='dropdownListView']//ul/li/a/span[contains(@class,'ng-binding')]"));

        for (Elements el : toggleOptions) {
            if (el.getText().equalsIgnoreCase(anyItemToBeCheck)) {
                return true;
            }
        }
        return false;
    }

    public void assertToggleOptionNotDisplayed(String anyItemToBeCheck, String flexTableId, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(isGivenToggleOptionPresent(anyItemToBeCheck, flexTableId)).isFalse();
        } else {
            Assert.assertFalse(isGivenToggleOptionPresent(anyItemToBeCheck, flexTableId));
        }
    }

    /**
     * @return true if specified column value present inside flex table
     */
    public boolean isColumnValuePresentInsideFlexTable(String valueToBeCheck, String columnName, String tableId) {
        WebElement row = I.amPerforming().getElementReference().of(By.xpath("//div[@id='" + tableId + "']//table//tbody//tr"));
        Map<String, Integer> columnMapping = govgrants.perform().flexTable().constructColumnMapping(row, Collections.singleton(columnName));
        By columnSelector = By.xpath("//div[@id='" + tableId + "']//table//tr//td[not(contains(@class, 'ng-hide')) and contains(@class,'tableCell')][" + columnMapping.get(columnName) + "]//descendant-or-self :: *[text()='" + valueToBeCheck + "']");

        List<Elements> rowValues = I.amPerforming().getElementReference().forListOfElements().of(columnSelector);
        for (Elements value : rowValues) {
            if (!"".equalsIgnoreCase(valueToBeCheck) && !value.getText().equalsIgnoreCase(valueToBeCheck))
                return false;
        }
        return true;
    }

    public void verifyColumnValuesInFlexTable(String valueToBeCheck, String columnName, String tableId, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(isColumnValuePresentInsideFlexTable(valueToBeCheck, columnName, tableId)).isTrue();
        } else {
            Assert.assertTrue(isColumnValuePresentInsideFlexTable(valueToBeCheck, columnName, tableId));
        }
    }

    /**
     * To click on hyperlink inside page details
     *
     * @param linkName
     */
    public void clickOnLink(String linkName) {
        I.amPerforming().click().on(By.xpath("//a[contains(text(),'" + linkName + "')] | //span[contains(text(),'" + linkName + "')]"));
    }

    /**
     * returns true if field contains todays date
     */
    public void compareDateFieldWithTodaysDate(String fieldLabel, boolean isSoftly) {
        String fieldValue = govgrants.perform().pageDetails().getFieldValue(fieldLabel);
        if (fieldValue.contains(" ")) {
            fieldValue = fieldValue.replaceAll("\\s.*", "");
        }
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().dateOperationsToGet().currentDateInDesiredFormat(DateTimeFormatter.ofPattern("MM/dd/yyyy"))).isEqualTo(fieldValue);
        } else {
            Assert.assertEquals(I.amPerforming().dateOperationsToGet().currentDateInDesiredFormat(DateTimeFormatter.ofPattern("MM/dd/yyyy")), fieldValue);
        }
    }

    /**
     * To verify top right button not displayed on attachments flex table
     *
     * @param buttonName
     * @param flextableHeaderName
     * @return
     */
    public Boolean isTopRightButtonDisplayed(String buttonName, String flextableHeaderName) {
        try {
            return I.amPerforming().checkToSee().isDisplayed(By.xpath("//a[text()='" + flextableHeaderName + "']/../../div/button[text()='" + buttonName + "']"));
        } catch (Exception e) {
            return false;
        }
    }

    public void assertTopRightButtonOnFlexTable(String shouldBeDisplayed, String buttonName, String flextableHeaderName, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat("softly see".equalsIgnoreCase(shouldBeDisplayed)).isEqualTo(isTopRightButtonDisplayed(buttonName, flextableHeaderName));
        } else {
            Assert.assertEquals("see".equalsIgnoreCase(shouldBeDisplayed), isTopRightButtonDisplayed(buttonName, flextableHeaderName));
        }
    }

    /**
     * To verify row level action button displayed or not
     *
     * @param buttonName
     * @param flextableHeaderName
     * @return
     */
    public Boolean isRowLevelActionButtonDisplayed(String buttonName, String uniqueColumnValue, String flextableHeaderName) {
        if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//a[@title='" + flextableHeaderName + "']/../../../following-sibling::div//tbody//td//span[text()='" + uniqueColumnValue + "']/../following-sibling::td//a[contains(@title,'" + buttonName + "')]")))
            return true;
        else
            return false;
    }

    public void assertRowLevelActionButtonInsideFlexTable(String buttonName, String uniqueColumnValue, String flextableHeaderName, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(isRowLevelActionButtonDisplayed(buttonName, uniqueColumnValue, flextableHeaderName)).isFalse();
        } else {
            Assert.assertFalse(isRowLevelActionButtonDisplayed(buttonName, uniqueColumnValue, flextableHeaderName));
        }
    }

    public void assertRowLevelActionButtonInsideFlexTableWithoutUniqueValue(String buttonName, String tableId, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(isRowLevelActionButtonDisplayedWithoutUniqueValue(buttonName, tableId)).isTrue();
        } else {
            Assert.assertTrue(isRowLevelActionButtonDisplayedWithoutUniqueValue(buttonName, tableId));
        }
    }

    public Boolean isRowLevelActionButtonDisplayedWithoutUniqueValue(String buttonName, String tableId) {
        if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[@id='" + tableId + "']//td//a[contains(@title,'" + buttonName + "')]")))
            return true;
        else
            return false;
    }

    public void clickRowLevelActionIconUnderAttachmentFlexTable(String buttonName) {
        By downloadBtn = By.xpath("//div[contains(@id,'Attachments')]//a[@title='" + buttonName + "'] ");
        I.amPerforming().click().on(downloadBtn);
        govgrants.perform().modal().acceptPopUp();
        govgrants.perform().modal().acceptPopUpWithParameter("Ok");
    }

    /**
     * To verify reported date field contains today's date
     */
    public void assertReportedDateField(boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().dateOperationsToGet().currentDateInDesiredFormat(DateTimeFormatter.ofPattern("MM/dd/yyyy"))).isEqualTo(I.amPerforming().propertiesFileOperationsTo().getValue("ReportedDate"));
        } else {
            Assert.assertEquals(I.amPerforming().propertiesFileOperationsTo().getValue("ReportedDate"), I.amPerforming().dateOperationsToGet().currentDateInDesiredFormat(DateTimeFormatter.ofPattern("MM/dd/yyyy")));
        }
    }

    public Boolean isCheckboxFieldEditable(String fieldLabel) {
        try {
            I.amPerforming().checkToSee().isDisplayed(By.xpath("//span[@class='customLabelstyle' and text()='" + fieldLabel + "']/ancestor::dl[1]//dd//input[@type='checkbox' and @disabled='true']"));
            return false;
        } catch (Exception e) {
        }
        return true;
    }

    public void assertCheckBoxFieldIsEditable(String fieldLabel, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(isCheckboxFieldEditable(fieldLabel)).isTrue();
        } else {
            Assert.assertTrue(isCheckboxFieldEditable(fieldLabel));
        }
    }

    /**
     * To verify radio button on approval decision box
     *
     * @param radioButtonOption
     * @return
     */
    public Boolean isbuttonDisplayedOnApprovalDecisionBox(String radioButtonOption) {
        try {
            I.amPerforming().checkToSee().isDisplayed(By.xpath("//div/span/input[@name='myRadio' and @value='" + radioButtonOption + "']"));
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean compareTwoFieldValues(String savedValue1, String compare, String savedValue2) {
        int value1 = Double.valueOf(savedValue1.replaceAll("[^0-9.]", "")).intValue();
        int value2 = Double.valueOf(savedValue2.replaceAll("[^0-9.]", "")).intValue();
        return compare.equalsIgnoreCase("Not Equals to") ? value1 != value2 : compare.equalsIgnoreCase("Less Than") ? value1 < value2 : compare.equalsIgnoreCase("Greater Than") ? value1 > value2 : value1 == value2 ;
    }

    public boolean compareTwoValues(String savedValue1, String compare, String savedValue2) {
        float value1 = Double.valueOf(savedValue1.split("/")[0].replaceAll("[^0-9.]", "")).floatValue();
        float value2 = Double.valueOf(savedValue2.split("/")[0].replaceAll("[^0-9.]", "")).floatValue();
        return compare.equalsIgnoreCase("Not Equals to") ? value1 != value2 : compare.equalsIgnoreCase("Less Than") ? value1 < value2 : compare.equalsIgnoreCase("Greater Than") ? value1 > value2 : value1 == value2 ;
    }


    public Boolean addTwoFieldValues(String savedValue1, String savedValue2, String expectedValue) {
        int value1 = Double.valueOf(savedValue1.replaceAll("[^0-9.]", "")).intValue();
        int value2 = Double.valueOf(savedValue2.replaceAll("[^0-9.]", "")).intValue();
        int value3 = Double.valueOf(expectedValue.replaceAll("[^0-9.]", "")).intValue();
        int actualValue = value1 + value2;

        if(value3==actualValue)
            return true;
        else
            return false;
    }

    public Boolean substractTwoFieldValues(String savedValue1, String savedValue2, String expectedValue) {
        int value1 = Double.valueOf(savedValue1.replaceAll("[^0-9.]", "")).intValue();
        int value2 = Double.valueOf(savedValue2.replaceAll("[^0-9.]", "")).intValue();
        int value3 = Double.valueOf(expectedValue.replaceAll("[^0-9.]", "")).intValue();
        int actualValue = value1 - value2;

        if(value3==actualValue)
            return true;
        else
            return false;
    }
}