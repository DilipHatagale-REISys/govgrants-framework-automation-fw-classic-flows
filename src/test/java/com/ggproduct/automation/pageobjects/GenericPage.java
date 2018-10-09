package com.ggproduct.automation.pageobjects;

import org.openqa.selenium.By;
import org.testng.Assert;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.projectmanager.ProjectManager;

public class GenericPage extends ProjectManager{
	
	public GenericPage(Controller controller, Handlers handler) {
		super(controller,handler);
	}
	
	/** Navigation to different App */
	public void toggleApp(String appName) {
		reiDriver.govGrants().setUpCustomAppDropDown(appName);
	}
	
	/** Navigation to any tab */
	public void navigateToTab(String tabName) {
		reiDriver.govGrants().clickMainMenuBar(tabName);
	}
	
	
	/** Clicking on Sidebar option */
	public void clickOnSidebar(String sidebarContent, String sidebarSubHeader) {
		reiDriver.govGrants().getSideBarContent(sidebarSubHeader, sidebarContent).click();
	}
	
	/** Clicking on the button*/
	public void clickOnButton(String buttonName) {
		reiDriver.govGrants().waitForNavigationLogoToDisappear();
		reiDriver.findMyElement().getElement(By.xpath("//button[@title='" +buttonName+"'] | //input[@value='"+ buttonName +"']")).click();
	}
	
	/** Assert for the record and status part1 */
	public void assertStatus(String record, String status){
		Assert.assertTrue(isStatus(record,status));
	}
	
	/** Assert for the record and status part2*/
	public boolean isStatus(String record, String status) {
		boolean recordHeading = reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//div[contains(@class,'overviewHeader')]/span[text()='"+ record +"']")).isDisplayed();
		boolean recordStatus = reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//div[@class='overview-pane']/div/div/div/dl/dd/span/span[text()='" + status + "']")).isDisplayed();
		return recordHeading && recordStatus;
	}
	
	/** Change text field value */
	public void changeFieldValueText(String fieldId,String text) {
		reiDriver.findMyElement().getElement(By.xpath("//span[@id='"+ fieldId +"']/input[@type='text']")).clear();
		reiDriver.findMyElement().getElement(By.xpath("//span[@id='"+ fieldId +"']/input[@type='text']")).sendKeys(text);
	}
	
	/** Assert modified text field value is to text part1 */
	public void assertfieldValue(String fieldLabel,String text) {
		Assert.assertTrue(isFieldModified(fieldLabel,text));
	}
	
	/** Assert modified text field value is to text part2 */
	public boolean isFieldModified(String fieldLabel,String text) {
		reiDriver.govGrants().waitForNavigationLogoToDisappear();
		reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//span[text()='" + fieldLabel +"']/../..//span"));
		return reiDriver.findMyElement().getElement(By.xpath("//span[text()='" + fieldLabel +"']/../..//span[text()='"+text+"']")).isDisplayed();
	}
	
	/** Toggles between different list view options */
	public void changeFlexTableView(String tableViewName){
		reiDriver.govGrants().clickDoubleArrowDropDown(tableViewName);
		//reiDriver.govGrants().clickDoubleArrowDropDown();
		//reiDriver.govGrants().getDoubleArrowDropDownItem(viewName).click();
	}
	
	/** Assert status of a record in a table part1 */
	public void assertStatusOnTable(String status) {
		Assert.assertTrue(isStatusCorrect(status));
	}
		
	/** Assert status of a record in a table part2 */
	public boolean isStatusCorrect(String status) {
		reiDriver.WaitFor().WaitForElementListToBePresent(By.xpath("//table"));
		return reiDriver.findMyElement().getElement(reiDriver.govGrants().getFlexTableColumn(status)).isDisplayed();
	}
	
	/** Clicking on Flex table top button When One flex table is present in the page */
	public void clickOnFlexTableButton(String buttonName){
		reiDriver.govGrants().clickRightHeaderButtonInsideFlexTableDetailPage(buttonName);
	}

}
