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

	@When("^I fill in the \"([^\"]*)\" for the Approver details$")
	public void fillInApproverDetails(String approverName) {
		planningPage.fillInApproverDetails(approverName);
	}
	
	@When("^I choose the \"([^\"]*)\" with \"([^\"]*)\" and click \"([^\"]*)\" button$")
	public void chooseRecordforAssociation(String recordName, String recordUniqueName, String buttonName) {
		planningPage.chooseRecordforAssociation(recordName, recordUniqueName, buttonName);
	}
	
	@When("^I fill in the attachment checklist fields$")
	public void fillFieldsAttachmentChecklist(){
	    planningPage.fillFieldsAttachmentChecklist();
	}
}
