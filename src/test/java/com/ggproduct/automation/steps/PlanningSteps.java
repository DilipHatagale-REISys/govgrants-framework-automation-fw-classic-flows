package com.ggproduct.automation.steps;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.pageobjects.PlanningPage;

import cucumber.api.java.en.When;

public class PlanningSteps {
	PlanningPage planningPage;
	
	public PlanningSteps(Controller controller, Handlers handler) {
		planningPage=new PlanningPage(controller,handler);
	}

	@When("^I fill the fields \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
	public void fillInProgramCreationFields(String title, String programType, String primaryFundingOrganization){
		planningPage.fillInProgramCreationFields(title, programType, primaryFundingOrganization);
	}
	
	@When("^I quick search \"([^\"]*)\" on table \"([^\"]*)\"$")
	public void quickSearchOnTable(String searchText, String tableName) {
		planningPage.quickSearchOnTable(searchText, tableName);
	}

	@When("^I click on the \"([^\"]*)\" icon for the \"([^\"]*)\"$")
	public void clickOnFlexTableIcon(String iconName, String uniqueTextValue) {
		planningPage.clickOnFlexTableIcon(iconName, uniqueTextValue);
	}

}
