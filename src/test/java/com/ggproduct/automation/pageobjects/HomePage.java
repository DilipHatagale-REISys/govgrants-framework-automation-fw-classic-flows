package com.ggproduct.automation.pageobjects;

import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.Register.EyeThink;
import org.junit.Assert;
import org.openqa.selenium.By;

import java.time.format.DateTimeFormatter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class HomePage extends ProjectManager {

    /**
     * handles to reassign the record to particular user
     *
     * @param userName - username which needs to be selected from drop down to reassign the records
     * @author - Mahadev.hanme
     */
    public void reassignUser(String userName) {
        try {
            EyeThink.core().click().on(By.xpath("//div[contains(@class,'panel-body')]//span[@class='select2-chosen']"));
            EyeThink.core().enterText().in(By.xpath("//div[@id='select2-drop']//div/input"), userName);
            EyeThink.core().click().on(By.xpath("//div[contains(@class,'select2-search')]/following-sibling::ul//li//span[text()='" + userName + "']"));
        } catch (Exception e) {
        }
    }

    /**
     * @param tabName - Main tab name
     * @param tableID - pending task table ID
     * @return - count of total records available in pending task
     * @author - Mahadev.hanme
     */
    public String findTaskCount(String tabName, String tableID) {
        EyeThink.saas().mainPage().clickMainMenuBar(tabName);
        String pendingTaskCount = "";
        EyeThink.saas().sideBar().clickSideBarContent("My Tasks", "Pending Tasks");
        try {
            pendingTaskCount = totalRecordsCount(tableID);
            Pattern p = Pattern.compile("\\d+");
            Matcher m = p.matcher(pendingTaskCount);
            if (m.find())
                pendingTaskCount = m.group(0);
        } catch (Exception e) {
            pendingTaskCount = "0";
        }

        EyeThink.saas().mainPage().clickMainMenuBar("Home");
        return pendingTaskCount;
    }

    public void assertTaskCount(String tabName, String tableID, boolean isSoftly) {
        String finalCount = EyeThink.core().get().text(By.xpath("//div[@class='container-fluid']//li//span[text()='" + tabName + "']/../..//span[contains(@ng-bind,'taskCount')]"));
        if (isSoftly){
            EyeThink.core().assertion().assertThat(finalCount).isEqualTo(findTaskCount(tabName, tableID));
        } else {
            Assert.assertEquals(findTaskCount(tabName, tableID), finalCount);
        }
    }

    /**
     * handles to verify whether file is displayed under workspace or not
     *
     * @param recordID - string to be search under files
     * @return
     */
    public boolean isFileDisplayedInWorkspace(String recordID) {
        Boolean flag = false;
        EyeThink.core().enterText().in(By.xpath("//input[@id='FilesSearchText0' or name='FilesSearchText']"), EyeThink.saas().pageDetails().idOfRecord);
        EyeThink.core().click().on(By.xpath("//input[@id='FilesSearchButton0']"));

        try {
            return EyeThink.core().is().isDisplayed(By.xpath("//div[@id='FilesDataTable']//a[text()='" + EyeThink.saas().pageDetails().idOfRecord + "']"));
        } catch (Exception e) {
        }
        return false;
    }

    public void assertFileInWorkspace(String recordId, boolean isSoftly) {
        if (isSoftly){
            EyeThink.core().assertion().assertThat(isFileDisplayedInWorkspace(recordId)).isTrue();
        } else {
            Assert.assertTrue(isFileDisplayedInWorkspace(recordId));
        }
    }

    /**
     * handles to add notes on home tab
     * @param title
     * @param description
     */
    public void enterNotesValues(String title, String description) {
        EyeThink.core().enterText().in(By.xpath("//*[contains(@placeholder,'Title')]"), title);
        EyeThink.core().enterText().in(By.xpath("//*[contains(@placeholder,'Description')]"), description);
    }

    /**
     * To select value from global search drop down
     * @param dropDownValue - value to be selected
     */
    public void selectValueFromGlobalSearchDropDown(String dropDownValue) {
        By globalDropdownSelector = By.xpath("//*[@id='selectSearchId']");
        EyeThink.core().select().from(globalDropdownSelector).selectByVisibleText(dropDownValue);
    }

    /**
     * To save the todays date as well as date after one year
     */
    public void saveTodaysDate(){
        EyeThink.core().Properties().saveValue("Todays Date",EyeThink.core().get().currentDateInDesiredFormat(DateTimeFormatter.ofPattern("M/d/yyyy")));
        EyeThink.core().Properties().saveValue("Expiration Date",EyeThink.core().get().dateWithOffsetFromGivenDate(EyeThink.core().get().currentDateInDesiredFormat(DateTimeFormatter.ofPattern("M/d/yyyy")),365,DateTimeFormatter.ofPattern("M/d/yyyy")));
    }
}