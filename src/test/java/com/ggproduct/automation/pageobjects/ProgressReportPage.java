package com.ggproduct.automation.pageobjects;

import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.Register.EyeThink;
import eyethink.automation.bots.objects.Elements;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.List;
import java.util.Map;

public class ProgressReportPage extends ProjectManager {

    public void verifyProgressReportSchedulesUpdated(String totalRecords, String tableID, boolean isSoftly) {
        if (isSoftly){
            EyeThink.core().assertion().assertThat(EyeThink.core().Properties().getValue("EGMSID1")).isEqualTo(
                    EyeThink.core().Properties().getValue("EGMSID2")
            );
        } else {
            Assert.assertEquals(EyeThink.core().Properties().getValue("EGMSID1"), EyeThink.core().Properties().getValue("EGMSID2"));
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
        EyeThink.saas().phasePanel().clickDoubleArrowToggle("#toggleFlexTableGrantorProgressReportsInternal");
        List<Elements> toggleOptions = EyeThink.core().elementReference().listOfElements().of(By.xpath("//div[@id='" + flexTableId + "']//div[@id='dropdownListView']//ul/li/a/span[contains(@class,'ng-binding')]"));

        for (Elements el : toggleOptions) {
            if (el.getText().equalsIgnoreCase(anyItemToBeCheck)) {
                return true;
            }
        }
        return false;
    }

    public void assertToggleOptionNotDisplayed(String anyItemToBeCheck, String flexTableId, boolean isSoftly) {
        if (isSoftly){
            EyeThink.core().assertion().assertThat(isGivenToggleOptionPresent(anyItemToBeCheck, flexTableId)).isFalse();
        } else {
            Assert.assertFalse(isGivenToggleOptionPresent(anyItemToBeCheck, flexTableId));
        }
    }

    /**
     * @return true if specified column value present inside flex table
     */
    public boolean isColumnValuePresentInsideFlexTable(String valueToBeCheck, String columnName, String tableId) {
        WebElement row = EyeThink.core().elementReference().of(By.xpath("//div[@id='" + tableId + "']//table//tbody//tr"));
        Map<String, Integer> columnMapping = EyeThink.saas().flexTable().constructColumnMapping(row, Collections.singleton(columnName));
        By columnSelector = By.xpath("//div[@id='" + tableId + "']//table//tr//td[not(contains(@class, 'ng-hide')) and contains(@class,'tableCell')][" + columnMapping.get(columnName) + "]//descendant-or-self :: *[text()='" + valueToBeCheck + "']");

        List<Elements> rowValues = EyeThink.core().elementReference().listOfElements().of(columnSelector);
        for (Elements value : rowValues) {
            if (!"".equalsIgnoreCase(valueToBeCheck) && !value.getText().equalsIgnoreCase(valueToBeCheck))
                return false;
        }
        return true;
    }

    public void verifyColumnValuesInFlexTable(String valueToBeCheck, String columnName, String tableId, boolean isSoftly){
        if (isSoftly){
            EyeThink.core().assertion().assertThat(isColumnValuePresentInsideFlexTable(valueToBeCheck,columnName,tableId)).isTrue();
        } else {
            Assert.assertTrue(isColumnValuePresentInsideFlexTable(valueToBeCheck, columnName, tableId));
        }
    }

    /**
     * To click on hyperlink inside page details
     * @param linkName
     */
    public void clickOnLink(String linkName){
        EyeThink.core().click().on(By.xpath("//a[contains(text(),'"+linkName+"')] | //span[contains(text(),'"+ linkName +"')]"));
    }

    /**
     * returns true if field contains todays date
     */
    public void compareDateFieldWithTodaysDate(String fieldLabel, boolean isSoftly){
        String fieldValue =  EyeThink.saas().pageDetails().getFieldValue(fieldLabel);
        if (fieldValue.contains(" ")){
            fieldValue =fieldValue.replaceAll("\\s.*","");
        }
        if (isSoftly){
            EyeThink.core().assertion().assertThat(EyeThink.core().get().currentDateInDesiredFormat(DateTimeFormatter.ofPattern("M/d/yyyy"))).isEqualTo(fieldValue);
        } else {
            Assert.assertEquals(EyeThink.core().get().currentDateInDesiredFormat(DateTimeFormatter.ofPattern("M/d/yyyy")), fieldValue);
        }
    }

    /**
     * To verify top right button not displayed on attachments flex table
     * @param buttonName
     * @param flextableHeaderName
     * @return
     */
    public Boolean isTopRightButtonDisplayed(String buttonName, String flextableHeaderName) {
        try {
            return EyeThink.core().is().isDisplayed(By.xpath("//a[text()='" + flextableHeaderName + "']/../../div/button[text()='" + buttonName + "']"));
        } catch (Exception e) {
            return false;
        }
    }

    public void assertTopRightButtonOnFlexTable(String shouldBeDisplayed, String buttonName, String flextableHeaderName, boolean isSoftly) {
        if (isSoftly){
            EyeThink.core().assertion().assertThat("softly see".equalsIgnoreCase(shouldBeDisplayed)).isEqualTo(isTopRightButtonDisplayed(buttonName, flextableHeaderName));
        } else {
            Assert.assertEquals("see".equalsIgnoreCase(shouldBeDisplayed), isTopRightButtonDisplayed(buttonName, flextableHeaderName));
        }
    }

    /**
     * To verify row level action button displayed or not
     * @param buttonName
     * @param flextableHeaderName
     * @return
     */
    public Boolean isRowLevelActionButtonDisplayed(String buttonName, String uniqueColumnValue, String flextableHeaderName){
        if (EyeThink.core().is().isDisplayed(By.xpath("//a[@title='"+ flextableHeaderName +"']/../../../following-sibling::div//tbody//td//span[text()='"+ uniqueColumnValue +"']/../following-sibling::td//a[contains(@title,'"+ buttonName +"')]")))
            return true;
        else
            return false;
    }

    public void assertRowLevelActionButtonInsideFlexTable(String buttonName, String uniqueColumnValue, String flextableHeaderName, boolean isSoftly){
        if (isSoftly){
            EyeThink.core().assertion().assertThat(isRowLevelActionButtonDisplayed(buttonName,uniqueColumnValue,flextableHeaderName)).isFalse();
        } else {
            Assert.assertFalse(isRowLevelActionButtonDisplayed(buttonName, uniqueColumnValue, flextableHeaderName));
        }
    }

    public void downloadAttachment(){
        By downloadBtn = By.xpath("//div[contains(@id,'Attachments')]//a[@title='Download'] ");
        EyeThink.core().click().on(downloadBtn);
    }

    /**
     * To verify reported date field contains today's date
     */
    public void assertReportedDateField(boolean isSoftly){
        if (isSoftly) {
            EyeThink.core().assertion().assertThat(EyeThink.core().get().currentDateInDesiredFormat(DateTimeFormatter.ofPattern("M/d/yyyy"))).isEqualTo(EyeThink.core().Properties().getValue("ReportedDate"));
        } else {
            Assert.assertEquals(EyeThink.core().Properties().getValue("ReportedDate"), EyeThink.core().get().currentDateInDesiredFormat(DateTimeFormatter.ofPattern("M/d/yyyy")));
        }
    }

    public Boolean isFieldEditable(String fieldAPIName){
        boolean flag=true;
        try {
            if (EyeThink.core().is().isDisplayed(By.xpath("//field[@field-name='"+ fieldAPIName +"']/input")))
                flag = true;
        }catch (Exception e){
            flag = false;
        }
        return flag;
    }

    public void assertFieldIsEditableOrNot(String fieldAPIName, boolean isSoftly){
        if (isSoftly){
            EyeThink.core().assertion().assertThat(isFieldEditable(fieldAPIName)).isFalse();
        } else {
            Assert.assertFalse(isFieldEditable(fieldAPIName));
        }
    }

    public Boolean isCheckboxFieldEditable(String fieldApiName){
        boolean flag=true;
            try {
                EyeThink.core().elementReference().of(By.xpath("//span[@id='" + fieldApiName +"']/input[@type='checkbox']")).getAttribute("disabled");
                    flag = false;
            }catch (Exception e){
                flag = true;
            }
        return flag;
    }

    public void assertCheckBoxFieldIsEditable(String fieldAPIName, boolean isSoftly){
        if (isSoftly){
            EyeThink.core().assertion().assertThat(isCheckboxFieldEditable(fieldAPIName)).isTrue();
        } else {
            Assert.assertTrue(isCheckboxFieldEditable(fieldAPIName));
        }
    }

    /**
     * To verify radio button on approval decision box
     * @param radioButtonOption
     * @return
     */
    public Boolean isbuttonDisplayedOnApprovalDecisionBox(String radioButtonOption){
        try {
            EyeThink.core().is().isDisplayed(By.xpath("//div/span/input[@name='myRadio' and @value='" + radioButtonOption + "']"));
            return true;
        }catch (Exception e){
            return false;
        }
    }

    /**
     * To click on link containging text + today's date
     * @param linkName - link text
     */
    public void clickOnHyperLinkContainingDate(String linkName){
        clickOnLink(linkName + " " + EyeThink.core().get().currentDateInDesiredFormat(DateTimeFormatter.ofPattern("M/d/yyyy")));
    }

    public boolean compareTwoFieldValues(String savedValue1, String compare, String savedValue2){
        Double value1 = Double.valueOf(EyeThink.core().Properties().getValue(savedValue1).replaceAll("[^0-9.]", ""));
        Double value2 = Double.valueOf(EyeThink.core().Properties().getValue(savedValue2).replaceAll("[^0-9.]", ""));
        return compare.equalsIgnoreCase("Less Than") ? value1<value2 : compare.equalsIgnoreCase("Greater Than") ? value1 > value2 : value1 == value2;
    }
}