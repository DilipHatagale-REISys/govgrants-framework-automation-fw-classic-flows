package com.ggproduct.automation.pageobjects;

import org.openqa.selenium.By;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.projectmanager.ProjectManager;

public class PlanningPage extends ProjectManager{
	private final By programTitlePath = By.xpath("//span[@id='ProgramName__c']/input[@type='text']");
	private final By programTypePath = By.xpath("//span/select");
	private final By primaryFundingOrganizationPath = By.xpath("//span[@id='PrimaryFundingOrganization__cparentCustomLookup']/span/span[@class='lookupInput']/a");
	private final By primaryFundingLookUpPath = By.xpath("//iframe[@id='iframeCustomLookupModalId']");
	
	public PlanningPage(Controller controller, Handlers handler) {
		super(controller,handler);
	}
	
	public void fillInProgramCreationFields(String title, String programType, String primaryFundingOrganization){
		reiDriver.findMyElement().getElement(programTitlePath).sendKeys(title);
		reiDriver.findMyElement().getDropDown(programTypePath).selectByValue(programType);
		reiDriver.findMyElement().getElement(primaryFundingOrganizationPath).click();
		reiDriver.WaitFor().WaitForElementClickAble(primaryFundingLookUpPath);
		reiDriver.switchTo().switchToFrame(primaryFundingLookUpPath);
		reiDriver.govGrants().performModalSpecificQuickSearch("lookuploading", primaryFundingOrganization);
		reiDriver.findMyElement().getElement(By.xpath("//a[@title='Select']")).click();
		reiDriver.switchTo().switchToParentFrame();
	}
	
	public void quickSearchOnTable(String searchText, String tableName) {
		reiDriver.govGrants().performTableSpecificQuickSearch(tableName, searchText);
	}
	
	public void clickOnFlexTableIcon(String iconName, String uniqueTextValue) {
		reiDriver.govGrants().waitForNavigationLogoToDisappear();
		reiDriver.govGrants().clickTableActionIcons(uniqueTextValue, iconName);
	}

}
