package com.ggproduct.automation.pageobjects;

import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.Register.EyeThink;
import eyethink.automation.bots.objects.Elements;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import java.util.*;

public class ProgressReport extends ProjectManager {

    public void verifyProgressReportSchedulesUpdated(String totalRecords, String tableID) {
        Assert.assertEquals(EyeThink.core().Properties().getValue("EGMSID1"), EyeThink.core().Properties().getValue("EGMSID2"));
        AssertTotalRecordsCountInFlexTable(totalRecords, tableID);
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
        List<Elements> toggleOptions = EyeThink.core().elementReference().listOfElements().onWeb(By.xpath("//div[@id='" + flexTableId + "']//div[@id='dropdownListView']//ul/li/a/span[contains(@class,'ng-binding')]"));

        for (Elements el : toggleOptions) {
            if (el.getText().equalsIgnoreCase(anyItemToBeCheck)) {
                return true;
            }
        }
        return false;
    }

    public void assertToggleOptionNotDisplayed(String anyItemToBeCheck, String flexTableId) {
        Assert.assertFalse(isGivenToggleOptionPresent(anyItemToBeCheck, flexTableId));
    }

    /**
     * @return true if specified column value present inside flex table
     */
    public boolean isColumnValuePresentInsideFlexTable(String valueToBeCheck, String columnName, String tableId) {
        WebElement row = EyeThink.core().elementReference().onWeb(By.xpath("//div[@id='" + tableId + "']//table//tbody//tr"));
        Map<String, Integer> columnMapping = EyeThink.saas().flexTable().constructColumnMapping(row, Collections.singleton(columnName));
        By columnSelector = By.xpath("//div[@id='" + tableId + "']//table//tr//td[not(contains(@class, 'ng-hide')) and contains(@class,'tableCell')][" + columnMapping.get(columnName) + "]//descendant-or-self :: *[text()='" + valueToBeCheck + "']");

        List<Elements> rowValues = EyeThink.core().elementReference().listOfElements().onWeb(columnSelector);
        for (Elements value : rowValues) {
            if (!"".equalsIgnoreCase(valueToBeCheck) && !value.getText().equalsIgnoreCase(valueToBeCheck))
                return false;
        }
        return true;
    }

    public void verifyColumnValuesInFlexTable(String valueToBeCheck, String columnName, String tableId){
        Assert.assertTrue(isColumnValuePresentInsideFlexTable(valueToBeCheck,columnName,tableId));
    }

    /**
     * To click on hyperlink inside page details
     * @param linkName
     */
    public void clickOnLink(String linkName){
        EyeThink.core().click().onWeb(By.xpath("//span[contains(text(),'"+ linkName +"')]"));
    }
}
