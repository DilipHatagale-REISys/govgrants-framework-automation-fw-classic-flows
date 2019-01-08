package com.ggproduct.automation.pageobjects;

import org.openqa.selenium.By;

import org.testng.Assert;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;

/**
 * Handles all login related methods
 */
public class LoginPage extends ProjectManager{
	
	/**
     * Constructor to handle dependency injection and framework library
     */
	public LoginPage(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
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
}
