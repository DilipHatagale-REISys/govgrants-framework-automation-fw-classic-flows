package com.ggproduct.automation.pageobjects;

import org.openqa.selenium.By;
import org.testng.Assert;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.projectmanager.ProjectManager;

public class PlanningPage extends ProjectManager{
	private final By programTitlePath = By.xpath("//span[@id='ProgramName__c']/input[@type='text']");
	private final By programTypePath = By.xpath("//span/select");
	private final By primaryFundingOrganizationPath = By.xpath("//span[@id='PrimaryFundingOrganization__cparentCustomLookup']/span/span[@class='lookupInput']/a");
	private final By LookUpPath = By.xpath("//iframe[@id='iframeCustomLookupModalId']");
	private final By selectPath = By.xpath("//a[@title='Select']");
	private final By contactLookUpPath = By.xpath("//iframe[@id='ProgramContactsiframeContentId']");
	
	public PlanningPage(Controller controller, Handlers handler) {
		super(controller,handler);
	}
	
	public void fillInProgramCreationFields(String title, String programType, String primaryFundingOrganization){
		reiDriver.findMyElement().getElement(programTitlePath).sendKeys(title);
		reiDriver.findMyElement().getDropDown(programTypePath).selectByValue(programType);
		reiDriver.findMyElement().getElement(primaryFundingOrganizationPath).click();
		reiDriver.WaitFor().WaitForElementClickAble(LookUpPath);
		reiDriver.switchTo().switchToFrame(LookUpPath);
		reiDriver.govGrants().performModalSpecificQuickSearch("lookuploading", primaryFundingOrganization);
		reiDriver.findMyElement().getElement(selectPath).click();
		reiDriver.switchTo().switchToParentFrame();
	}
	
	public void chooseContact(String contactName) {
		reiDriver.WaitFor().WaitForElementClickAble(contactLookUpPath);
		reiDriver.switchTo().switchToFrame(contactLookUpPath);
		reiDriver.findMyElement().getElement(By.xpath("//span[@class='fa fa-search']")).click();
		
			reiDriver.WaitFor().WaitForElementClickAble(LookUpPath);
			reiDriver.switchTo().switchToFrame(LookUpPath);
			reiDriver.govGrants().performModalSpecificQuickSearch("lookuploading", contactName);
			reiDriver.WaitFor().makeThreadSleep(1000);
			reiDriver.WaitFor().WaitForElementToBePresent(selectPath).click();
			reiDriver.switchTo().switchToParentFrame();
			reiDriver.WaitFor().WaitForElementClickAble(contactLookUpPath);
			reiDriver.switchTo().switchToFrame(contactLookUpPath);
		
	    reiDriver.govGrants().clickModalContentSpecificButton("Save");
		//reiDriver.findMyElement().getElement(By.xpath("//input[@value='Save']")).click();
	    reiDriver.govGrants().waitForNavigationLogoToDisappear();
	    reiDriver.switchTo().switchToParentFrame();
		
	}
	
	

}
