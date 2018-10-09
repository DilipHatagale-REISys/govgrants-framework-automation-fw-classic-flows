package com.ggproduct.automation.steps;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.pageobjects.GenericPage;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class GenericSteps {
	GenericPage genericPage;
	
	public GenericSteps(Controller controller, Handlers handler) {
		genericPage=new GenericPage(controller,handler);
	}
	
	@When("^I navigate to \"([^\"]*)\" tab$")
	public void navigateToTab(String tabName) {
		genericPage.navigateToTab(tabName);
	}
	
	@When("^I toggle to \"([^\"]*)\" app$")
	public void toggleApp(String appName) {
		genericPage.toggleApp(appName);
	}
	
	@When("^I click \"([^\"]*)\" inside side bar \"([^\"]*)\"$")
	public void clickOnSidebar(String sidebarContent, String sidebarSubHeader) {
		genericPage.clickOnSidebar(sidebarContent, sidebarSubHeader);
	}
	
	@When("^I click on \"([^\"]*)\" button$")
	public void clickOnButton(String buttonName) {
		genericPage.clickOnButton(buttonName);
	}
	
	@When("^I change the \"([^\"]*)\" field to \"([^\"]*)\"$")
	public void changeFieldValue(String fieldId, String text) {
		genericPage.changeFieldValueText(fieldId,text);
	}
	
	@When("^I click on flextable and toggle to \"([^\"]*)\"$")
	public void changeFlexTableView(String tableViewName){
		genericPage.changeFlexTableView(tableViewName);
	}
	
	@When("^I click on \"([^\"]*)\" button on the flextable$")
	public void clickOnFlexTableButton(String buttonName){
		genericPage.clickOnFlexTableButton(buttonName);
	}
	
	@Then("^I see that \"([^\"]*)\" is created in status \"([^\"]*)\"$")
	public void assertStatus(String record, String status){
		genericPage.assertStatus(record,status);
	}
	
	@Then("^I see that \"([^\"]*)\" field is modified to \"([^\"]*)\"$")
	public void assertfieldValue(String fieldLabel,String text) {
		genericPage.assertfieldValue(fieldLabel,text);
	}
	
	@Then("^I see that the status is \"([^\"]*)\"$")
	public void assertStatusOnTable(String status) {
		genericPage.assertStatusOnTable(status);
	}
}
