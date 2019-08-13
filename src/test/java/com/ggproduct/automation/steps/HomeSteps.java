package com.ggproduct.automation.steps;

import com.ggproduct.automation.pageobjects.HomePage;
import cucumber.api.java.en.Then;
import io.cucumber.java.en.And;
import org.springframework.context.annotation.Description;

public  class HomeSteps {
    HomePage homePage;

    public HomeSteps(){ this.homePage = new HomePage();    }

    @Description("To reassign the records from my tasks")
    @And("^I reassign task to \"([^\"]*)\"$")
    public void iReassignTaskTo(String userName) {
        homePage.reassignUser(userName);
    }

    @Description("To verify task summary phase count on home module")
    @Then("^I see task count for \"([^\"]*)\" phase with the total records of flex table id \"([^\"]*)\"$")
    public void iSeeTaskCountForPhaseWithTheTotalRecordsOfFlexTableId(String phaseName, String tableID) {
        homePage.assertTaskCount(phaseName,tableID);
    }
}