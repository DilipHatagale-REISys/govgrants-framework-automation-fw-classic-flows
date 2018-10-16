package com.ggproduct.automation.steps;

import org.springframework.context.annotation.Description;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.pageobjects.LoginPage;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class LoginSteps {
	LoginPage loginpage;
	
	public LoginSteps(Controller controller, Handlers handler) {
		loginpage=new LoginPage(controller,handler);
	}
	
	@Description("Log in using any user type")
	@Given("^I login as \"([^\"]*)\" User$")
	public void login(String userName) {
		loginpage.login(userName);
	}
	
	@Given("^I enter my user \"([^\"]*)\"$")
	public void enterUserName(String userName) {
		loginpage.enterUserName(userName);
	}

	@Given("^I enter my password \"([^\"]*)\"$")
	public void enterPassword(String password){
		loginpage.enterPassword(password);
	}

	@When("^I login$")
	public void clickLoginButton(){
		loginpage.clickLoginButton();
		
	}
	
	@When("^I re-login as \"([^\"]*)\" User$")
	public void reloginAsDifferentUser(String userName){
	    loginpage.reloginAsDifferentUser(userName);
	}
	
	@Then("^I see that i am on the homepage \"([^\"]*)\"$")
	public void assertHomeTab(){
		loginpage.assertHomeTab();
	}
	
}
