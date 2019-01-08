package com.ggproduct.automation.steps;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.pageobjects.LoginPage;

import cucumber.api.java.en.Then;

public class LoginSteps {
	LoginPage loginpage;
	
	public LoginSteps(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
		loginpage=new LoginPage(controller,handler,govgrants);
	}
	
	@Then("^I see that i am on the homepage \"([^\"]*)\"$")
	public void assertHomeTab(){
		loginpage.assertHomeTab();
	}
	
}
