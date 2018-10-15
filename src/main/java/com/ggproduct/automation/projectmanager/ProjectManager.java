package com.ggproduct.automation.projectmanager;

import java.io.IOException;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.Handlers;

/**
 * for Rei Systems
 * 
 * @author Handles generic/common methods and WebElements of the project. 
 *         
 */
public class ProjectManager extends ProjectWebServices {
    public Handlers reiDriver;
    public Controller controller;
    public final String defaultPassword="SALESFORCE2018";
    public final String defaultLongText="Automation test description";
    
    /**
     * Super Constructor
     * 
     * @param controller
     * @param reiDriver
     */
    public ProjectManager(Controller controller, Handlers reiDriver) {
        this.controller = controller;
        this.reiDriver = reiDriver;
    }
    
    /********* BELOW ARE ONLY EXAMPLE METHODS AND SHALL BE REMOVED ************/
    /****** BELOW PATTREN IS CONSIDERED BEST IN CODING WORLD. ADD JAVA DOCS AND KEEP LOCAL/KEY METHOD CATEGORIES ***/
    
    

    /******* "Key Methods with complete functionality" *****************/

    /**
     * navigate to a url
     * @param urlName
     * @throws IOException 
     */
    public void navigateToURL(String urlName) throws IOException {
        reiDriver.get().navigateToUrl(new UsersAndURL().navigateToAnyUrl(urlName));
    }
    

    /**
     * get main menu tab name to click on it. e.g; planning,announcements etc
     * 
     * @param menuItem
     */
    public void clickMainMenuTab(String menuItem) {
        reiDriver.WaitFor().WaitForElementToBePresent(
                By.xpath("//div/ul[@class='nav navbar-nav']/li/a[@title='" + menuItem + "']")).click();
    }


    /******* "Local Methods with Limited functionality " **********/

    /**
     * get any specific column value in pending tasks (Assigned to me)
     */
    private List<WebElement> getToPendingTasksAssignedToMeDesiredColumn(String mycolumnValue) {
        return reiDriver.findMyElement()
                .getElements(By.xpath("//div/table/tbody/tr/td/span/span/span[text()='" + mycolumnValue + "']"));
    }

   

}
