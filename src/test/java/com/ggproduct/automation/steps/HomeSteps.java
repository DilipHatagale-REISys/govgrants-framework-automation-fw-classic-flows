package com.ggproduct.automation.steps;

import com.ggproduct.automation.pageobjects.HomePage;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
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

    @Description("To verify files has been added in My Workspace Files")
    @Then("^I see \"([^\"]*)\" has been added in My Workspace Files$")
    public void iSeeHasBeenAddedInMyWorkspaceFiles(String recordID) {
        homePage.assertFileInWorkspace(recordID);
    }
}