package com.ggproduct.automation.pageobjects;

import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.Register.EyeThink;
import org.junit.Assert;
import org.openqa.selenium.By;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class HomePage extends ProjectManager {

    /**
     * handles to reassign the record to particular user
     * @param userName - username which needs to be selected from drop down to reassign the records
     * @author - Mahadev.hanme
     */
    public void reassignUser(String userName) {
        try {
            EyeThink.core().findMyElement().getElement(By.xpath("//div[contains(@class,'panel-body')]//span[@class='select2-chosen']")).click();
            EyeThink.core().textInput().enterText(By.xpath("//div[@id='select2-drop']//div/input"),userName);
            EyeThink.core().findMyElement().getElement(By.xpath("//div[contains(@class,'select2-search')]/following-sibling::ul//li//span[text()='" + userName + "']")).click();
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
        String pendingTaskCount="";
        EyeThink.saas().sideBar().clickSideBarContent("My Tasks", "Pending Tasks");
        try {
            pendingTaskCount    = totalRecordsCount(tableID);
            Pattern p = Pattern.compile("\\d+");
            Matcher m = p.matcher(pendingTaskCount);
            if (m.find())
                pendingTaskCount = m.group(0);
        }catch (Exception e){
            pendingTaskCount  ="0";
        }

        EyeThink.saas().mainPage().clickMainMenuBar("Home");
        return pendingTaskCount;
    }

    public void assertTaskCount(String tabName, String tableID) {
        String finalCount = EyeThink.core().findMyElement().getElement(By.xpath("//div[@class='container-fluid']//li//span[text()='" + tabName + "']/../..//span[contains(@ng-bind,'taskCount')]")).getText();
        Assert.assertEquals(findTaskCount(tabName, tableID), finalCount);
    }
}