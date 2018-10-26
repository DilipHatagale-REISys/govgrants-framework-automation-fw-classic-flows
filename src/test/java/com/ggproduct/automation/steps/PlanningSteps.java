package com.ggproduct.automation.steps;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.pageobjects.PlanningPage;

import cucumber.api.java.en.When;

public class PlanningSteps {
	PlanningPage planningPage;
	
	public PlanningSteps(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
		planningPage=new PlanningPage(controller,handler,govgrants);
	}

	@When("^I fill in the \"([^\"]*)\" for the Approver details for program$")
	public void fillInApproverDetails(String approverName) {
		planningPage.fillInApproverDetails(approverName);
	}
	
	@When("^I choose the \"([^\"]*)\" with \"([^\"]*)\" and click \"([^\"]*)\" button for program$")
	public void chooseRecordforProgramAssociation(String recordName, String recordUniqueName, String buttonName) {
		planningPage.chooseRecordforProgramAssociation(recordName, recordUniqueName, buttonName);
	}
}
