package com.ggproduct.automation.pageobjects;

import org.openqa.selenium.By;
import org.testng.Assert;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.projectmanager.ProjectManager;
import com.ggproduct.automation.projectmanager.UsersAndURL;

/**
 * Handles all login related methods
 */
public class LoginPage extends ProjectManager{
	
	/**
     * Constructor to handle dependency injection and framework library
     */
	public LoginPage(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
		super(controller,handler,govgrants);
	}
	
	/**
     * Assert presence of home tab
     */
	public void assertHomeTab() {
		Assert.assertTrue(isHometabPresent());
	}
	
	 /**
     * check if home tab is present
     */
    public boolean isHometabPresent() {
        return reiDriver.findMyElement().getElement(By.xpath("//div/ul/li/a[@title='HOME']")).isDisplayed();
    }
	
    /**
     * Handles logging into the system
     * @param userName
     */
    public void login(String userName) {
		govgrants.mainPage().login(new UsersAndURL().handleUsersForEnv(userName), defaultPassword);
	}
    
    public void reloginAsDifferentUser(String userName){
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//img[@alt='User Avatar']/..//i[@class='fa fa-caret-down']")).click();
        govgrants.mainPage().getLoginDropDownItems("Logout").click();
        try {
            reiDriver.eatCookies().deleteAllCookies();
            reiDriver.WaitFor().makeThreadSleep(500);
            navigateToURL("PRODUCT PORTAL");
        } catch(Exception e) {
            System.out.println(e);
        }
        govgrants.mainPage().login(new UsersAndURL().handleUsersForEnv(userName), defaultPassword);
        govgrants.mainPage().waitForEgmsHeader();
    }
}
