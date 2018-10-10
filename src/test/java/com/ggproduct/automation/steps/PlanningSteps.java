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
	
	@When("^I choose the \"([^\"]*)\" as the contact$")
	public void chooseContact(String contactName) {
		planningPage.chooseContact(contactName);
	}
	

}
