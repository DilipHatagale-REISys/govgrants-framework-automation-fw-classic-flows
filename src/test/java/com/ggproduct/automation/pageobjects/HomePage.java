package com.ggproduct.automation.pageobjects;

import org.openqa.selenium.By;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.projectmanager.ProjectManager;

public class HomePage extends ProjectManager {
	private final By scrollTo = By.xpath("//tfoot");
	private final By internalOrgName = By.xpath("//span[@id='Name']/div/input");
	private final By code = By.xpath("//span[@id='Code__c']/input[@type='text']");
	private final By EIN = By.xpath("//span[@id='EINText__c']/input[@type='text']");
	private final By grantingAgencyCheck = By.xpath("//span[@id='IsGrantingAgency__c']/input[@type='checkbox']");
	private final By isActiveAgency = By.xpath("//span[@id='IsActiveAgency__c']/input[@type='checkbox']");
	private final By internalOrgViewIcon = By.xpath("//span[@title='Internal Automation Organization']/../../../following-sibling::td/div//span/a/span/i[@class='fa fa-eye']");
	
	public HomePage(Controller controller, Handlers handler) {
		super(controller,handler);
	}
	
	/** Clicking on New button on Draft Internal Organization flex table*/
	public void clickOnFlexTableButton(String buttonName) {
		reiDriver.WaitFor().WaitForElementListToBePresent(scrollTo);
		reiDriver.JavaScript().scrollpageToSpecificElement(scrollTo);
		reiDriver.govGrants().clickRightHeaderButtonInsideFlexTableDetailPage(buttonName);
	}
	
	/** Filling the fields with values for Internal Organization */
	public void fillInFieldsforInternalOrganization() {
		reiDriver.findMyElement().getElement(internalOrgName).sendKeys("Internal Automation Organization");
		reiDriver.findMyElement().getElement(code).sendKeys("IntAutOrg1");
		reiDriver.findMyElement().getElement(EIN).sendKeys("987587646");
		reiDriver.findMyElement().getElement(grantingAgencyCheck).click();
		reiDriver.findMyElement().getElement(isActiveAgency).click();
	}
	
	/** Click on View icon on a flex table */
	public void clickOnViewIcon(String iconName){
		reiDriver.WaitFor().WaitForElementListToBePresent(scrollTo);
		reiDriver.JavaScript().scrollpageToSpecificElement(scrollTo);
		reiDriver.findMyElement().getElement(internalOrgViewIcon).click();
	}
	
	

}

