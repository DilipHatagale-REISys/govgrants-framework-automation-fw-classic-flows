package com.ggproduct.automation.pageobjects;

import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.Register.EyeThink;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
        List<WebElement> dropdownValues = EyeThink.core().findMyElement().getElements(By.xpath("//div[@id='" + flexTableId + "']//div[@id='dropdownListView']//ul/li/a/span[contains(@class,'ng-binding')]"));

        for (WebElement el : dropdownValues) {
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
        WebElement row = EyeThink.core().findMyElement().getElement(By.xpath("//div[@id='" + tableId + "']//table//tbody//tr"));
        Set<String> headerTitles = new HashSet<>();
        headerTitles.add(columnName);
        Map<String, Integer> columnMapping = EyeThink.saas().flexTable().constructColumnMapping(row, headerTitles);

        By columnSelector = By
                .xpath("//div[@id='" + tableId + "']//table//tr" + "//td[not(contains(@class, 'ng-hide'))and contains(@class,'tableCell')]["
                        + columnMapping.get(columnName) + "]" + "//span[contains(@class,'tableCellText')]");
        List<WebElement> rowValues = EyeThink.core().findMyElement().getElements(columnSelector);
        for (WebElement value : rowValues) {
            if (!value.getText().equalsIgnoreCase(valueToBeCheck))
                return false;
        }
        return true;
    }

    public void verifyColumnValuesInFlexTable(String valueToBeCheck, String columnName, String tableId){
        Assert.assertTrue(isColumnValuePresentInsideFlexTable(valueToBeCheck,columnName,tableId));
    }
}
