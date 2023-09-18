package com.ggproduct.automation.pageobjects.grantor;

import com.helperPackage.handlers.govgrants;
import com.ggproduct.automation.projectmanager.GrantorProjectManager;
import com.helperPackage.objects.Elements;
import com.helperPackage.register.I;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class HomePage extends GrantorProjectManager {

    /**
     * handles to reassign the record to particular user
     *
     * @param userName - username which needs to be selected from drop down to reassign the records
     * @author - Mahadev.hanme
     */
    public void reassignUser(String userName) {
        try {
            I.amPerforming().click().on(By.xpath("//div[contains(@class,'panel-body')]//span[@class='select2-chosen']"));
            I.amPerforming().textInput().in(By.xpath("//div[@id='select2-drop']//div/input"), userName);
            I.amPerforming().click().on(By.xpath("//div[contains(@class,'select2-search')]/following-sibling::ul//li//span[text()='" + userName + "']"));
        } catch (Exception e) {
        }
    }

    /**
     * handles yopmail portal emails notification
     */
    public void NavigateToYopmailPortalForWithSubject(String emailId, String subject) {
        I.amPerforming().browserOperationsTo().navigateToUrl("http://www.yopmail.com/");
        I.amPerforming().textInput().toClear(By.xpath("//input[@id='login' and @type='text']"));
        I.amPerforming().textInput().in(By.xpath("//input[@id='login' and @type='text']"), emailId);
        I.amPerforming().click().on(By.xpath("//input[@type='submit']"));
        I.amPerforming().click().on(By.xpath("//div[@class='m']//div[@class='lms' and text()='" + subject + "']"));
        I.amPerforming().click().on(By.xpath("//span/a[text()='here']| //div[@id='mailctn']//a"));
    }

    /**
     * @param tabName - Main tab name
     * @param tableID - pending task table ID
     * @return - count of total records available in pending task
     * @author - Mahadev.hanme
     */
    public String findTaskCount(String tabName, String tableID) {
        govgrants.perform().mainPage().clickMainMenuBar(tabName);
        String pendingTaskCount = "";
        govgrants.perform().sideBar().clickSideBarContent("My Tasks", "Pending Tasks");
        try {
            pendingTaskCount = totalRecordsCount(tableID);
            Pattern p = Pattern.compile("\\d+");
            Matcher m = p.matcher(pendingTaskCount);
            if (m.find())
                pendingTaskCount = m.group(0);
        } catch (Exception e) {
            pendingTaskCount = "0";
        }

        govgrants.perform().mainPage().clickMainMenuBar("Home");
        return pendingTaskCount;
    }

    public void assertTaskCount(String tabName, String tableID, boolean isSoftly) {
        String finalCount = I.amPerforming().actionToGet().text(By.xpath("//div[@class='container-fluid']//li//span[text()='" + tabName + "']/../..//span[contains(@ng-bind,'taskCount')]"));
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(finalCount).isEqualTo(findTaskCount(tabName, tableID));
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
        I.amPerforming().textInput().in(By.xpath("//input[@id='FilesSearchText0' or name='FilesSearchText']"), govgrants.perform().pageDetails().idOfRecord);
        I.amPerforming().click().on(By.xpath("//input[@id='FilesSearchButton0']"));

        try {
            return I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[@id='FilesDataTable']//a[text()='" + govgrants.perform().pageDetails().idOfRecord + "']"));
        } catch (Exception e) {
        }
        return false;
    }

    public void assertFileInWorkspace(String recordId, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(isFileDisplayedInWorkspace(recordId)).isTrue();
        } else {
            Assert.assertTrue(isFileDisplayedInWorkspace(recordId));
        }
    }

    /**
     * handles to add notes on home tab
     *
     * @param title
     * @param description
     */
    public void enterNotesValues(String title, String description) {
        I.amPerforming().textInput().in(By.xpath("//*[contains(@placeholder,'Title')]"), title);
        I.amPerforming().textInput().in(By.xpath("//*[contains(@placeholder,'Description')]"), description);
    }

    /**
     * To select value from global search drop down
     *
     * @param dropDownValue - value to be selected
     */
    public void selectValueFromGlobalSearchDropDown(String dropDownValue) {
        By globalDropdownSelector = By.xpath("//*[@id='selectSearchId']");
        I.amPerforming().dropDownSelection().from(globalDropdownSelector).selectByVisibleText(dropDownValue);
    }

    /**
     * To save the todays date as well as date after one year
     */
    public void saveTodaysDate() {
        I.amPerforming().propertiesFileOperationsTo().saveValue("Todays Date", I.amPerforming().dateOperationsToGet().currentDateInDesiredFormat(DateTimeFormatter.ofPattern("M/d/yyyy")));
        I.amPerforming().propertiesFileOperationsTo().saveValue("Expiration Date", I.amPerforming().dateOperationsToGet().givenDateWithOffsetFromGivenDate(I.amPerforming().dateOperationsToGet().currentDateInDesiredFormat(DateTimeFormatter.ofPattern("M/d/yyyy")), 365, DateTimeFormatter.ofPattern("M/d/yyyy")));
    }

    /**
     * To verify User from ReassignTo lookup field
     */
    public void assertReassignedTo(String userName, boolean isSoftly, boolean canOrCannot) {
        By userLookupResultsLocator = By.xpath("//div[@id='select2-drop']//ul[contains(@class, 'select2-results')]/li/div");
        By userLookUpLocatorForReassign = By.xpath("//div[@id='targetUserId']//span[@class='select2-chosen']");
        By userLookupSearchLocator = By.xpath("//div[@id='select2-drop']/div[@class='select2-search']/input");
        I.amPerforming().click().on(userLookUpLocatorForReassign);
        I.amPerforming().textInput().in(userLookupSearchLocator, userName);

        List<String> presentUsers = I.amPerforming().getElementReference().forListOfElements().of(userLookupResultsLocator).stream().map(Elements::getText).collect(Collectors.toList());
        I.amPerforming().textInput().in(userLookupSearchLocator, Keys.ENTER.toString());

        if (isSoftly) {
            if (canOrCannot) {
                I.amPerforming().assertionsTo().assertThat(presentUsers.contains(userName)).isFalse();
            } else {
                I.amPerforming().assertionsTo().assertThat(presentUsers.contains(userName)).isTrue();
            }
        } else {
            if (canOrCannot) {
                Assert.assertFalse(presentUsers.contains(userName));
            } else {
                Assert.assertTrue(presentUsers.contains(userName));
            }
        }
    }

    public void NavigateToYopmailPortalForWithClickOnSubject(String emailId, String subject) {
        I.amPerforming().browserOperationsTo().navigateToUrl("http://www.yopmail.com/");
        I.amPerforming().textInput().toClear(By.xpath("//input[@id='login' and @type='text']"));
        I.amPerforming().textInput().in(By.xpath("//input[@id='login' and @type='text']"), emailId);
        I.amPerforming().click().on(By.xpath("//input[@type='submit']"));
        I.amPerforming().click().on(By.xpath("//div[@class='m']//div[@class='lms' and text()='" + subject + "']"));
    }
}