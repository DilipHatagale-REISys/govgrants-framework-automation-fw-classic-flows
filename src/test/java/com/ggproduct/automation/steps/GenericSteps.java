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
	
	@When("^I quick search \"([^\"]*)\" on table \"([^\"]*)\"$")
	public void quickSearchOnTable(String searchText, String tableName) {
		genericPage.quickSearchOnTable(searchText, tableName);
	}

	@When("^I click on the \"([^\"]*)\" icon for the \"([^\"]*)\"$")
	public void clickOnFlexTableIcon(String iconName, String uniqueTextValue) {
		genericPage.clickOnFlexTableIcon(iconName, uniqueTextValue);
	}
	
	@When("^I click on \"([^\"]*)\" subtab$")
	public void clickOnSubtab(String subtabName) {
		genericPage.clickOnSubtab(subtabName);
	}
	
	@When("^I click on \"([^\"]*)\" button on \"([^\"]*)\" flextable$")
	public void clickOnFlextableButton(String buttonName, String flextableName) {
		genericPage.clickOnFlextableButton(buttonName, flextableName);
	}
	
	@When("^I click on the \"([^\"]*)\" icon for the \"([^\"]*)\" on the flextable \"([^\"]*)\"$")
	public void clickOnFlextableRowButton(String buttonName, String uniqueColumnvalue, String flexTableName) {
		genericPage.clickOnFlextableRowButton(buttonName, uniqueColumnvalue, flexTableName);
	}
	
	@When("^I enter \"([^\"]*)\" values from \"([^\"]*)\"$")
	public void enterFieldValues(String sheetName, String excelName) {
	    genericPage.enterFieldValues(sheetName, excelName);
	}
	
	@When("^I click on \"([^\"]*)\" on the approval decision box$")
    public void clickOnApprovalDecisionBox(String approvalDesicion){
	    genericPage.clickOnApprovalDecisionBox(approvalDesicion);
    }
	
	@Then("^I see that \"([^\"]*)\" is in status \"([^\"]*)\"$")
	public void assertStatus(String record, String status){
		genericPage.assertStatus(record,status);
	}
	
	@Then("^I see that \"([^\"]*)\" field is modified to \"([^\"]*)\"$")
	public void assertfieldValue(String fieldLabel,String text) {
		genericPage.assertfieldValue(fieldLabel,text);
	}
	
	@Then("^I see that the status is \"([^\"]*)\"$")
	public void assertStatusOnTable(String status) {
		genericPage.assertColumnValueOnTable(status);
	}
	
	@Then("^I see that \"([^\"]*)\" has been added in \"([^\"]*)\" flextable$")
	public void assertColumnOnTable(String columnUniqueValue, String flextableName){
		genericPage.assertColumnOnTable(columnUniqueValue, flextableName);
	}
}
