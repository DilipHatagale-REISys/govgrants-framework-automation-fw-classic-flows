package com.ggproduct.automation.steps;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.pageobjects.GenericPage;
import com.ggproduct.automation.pageobjects.HomePage;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class HomeSteps {
	HomePage homepage;
	
	public HomeSteps(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
		homepage=new HomePage(controller,handler,govgrants);
	}

	@When("^I click on \"([^\"]*)\" button on the Draft Internal Organizations$")
	public void clickOnFlexTableButton(String buttonName) {
		homepage.clickOnFlexTableButton(buttonName);
	}
	
	@When("^I click on \"([^\"]*)\" icon on the Draft Internal Organizations$")
	public void clickOnflexTableIcon(String iconName){
		homepage.clickOnflexTableIcon(iconName);
	}
	
}
