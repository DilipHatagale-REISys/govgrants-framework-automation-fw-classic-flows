package com.ggproduct.automation.pageobjects;

import org.openqa.selenium.By;
import org.testng.Assert;

import com.automation.rei.controller.Controller;
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
	public LoginPage(Controller controller, Handlers handler) {
		super(controller,handler);
	}
	
	/**
     * Enter user name to login page
     */
	public void enterUserName(String userNameText) {
		reiDriver.textInput().enterText(reiDriver.govGrants().userName, userNameText);
	}
	
	/**
     * Enter password to login page
     */
	public void enterPassword(String passwordText) {
		reiDriver.textInput().enterText(reiDriver.govGrants().password, passwordText);
	}
	
	/**
     * Click on the login Button
     */
	public void clickLoginButton() {
		reiDriver.findMyElement().getElement(reiDriver.govGrants().loginButton).click();
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
		reiDriver.govGrants().login(new UsersAndURL().handleUsersForEnv(userName), defaultPassword);
	}
    
    public void reloginAsDifferentUser(String userName){
        reiDriver.govGrants().waitForNavigationLogoToDisappear();
        reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//img[@alt='User Avatar']/..//i[@class='fa fa-caret-down']")).click();
        reiDriver.govGrants().getLoginDropDownItems("Logout").click();
        try {
            navigateToURL("PRODUCT PORTAL");
        } catch(Exception e) {
            System.out.println(e);
        }
        reiDriver.govGrants().login(new UsersAndURL().handleUsersForEnv(userName), defaultPassword);
    }
}
