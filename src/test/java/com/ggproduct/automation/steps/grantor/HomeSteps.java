package com.ggproduct.automation.steps.grantor;

import com.ggproduct.automation.pageobjects.grantor.HomePage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
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
    @Then("^I (softly see|see) task count for \"([^\"]*)\" phase with the total records of flex table id \"([^\"]*)\"$")
    public void iSeeTaskCountForPhaseWithTheTotalRecordsOfFlexTableId(String usage, String phaseName, String tableID) {
        homePage.assertTaskCount(phaseName,tableID, usage.contains("softly"));
    }

    @Description("To verify files has been added in My Workspace Files")
    @Then("^I (softly see|see) \"([^\"]*)\" has been added in My Workspace Files$")
    public void iSeeHasBeenAddedInMyWorkspaceFiles(String usage, String recordID) {
        homePage.assertFileInWorkspace(recordID, usage.contains("softly"));
    }

    @Description("To select value from global drop down selector")
    @And("I select {string} from dropdown for Global search")
    public void iSelectFromDropdownForGlobalSearch(String dropDownValue) {
        homePage.selectValueFromGlobalSearchDropDown(dropDownValue);
    }

    @Description("To add notes on home tab")
    @When("I enter notes with title {string} and description {string}")
    public void iEnterNotesWithTitleAndDescription(String title, String description) {
        homePage.enterNotesValues(title, description);
    }

    @And("I save Todays Date")
    public void iSaveTodaysDate() {
        homePage.saveTodaysDate();
    }

    @Description("* To verify the user in the ReassignTo box")
    @When("^I (softly cannot see|softly see|see|cannot) user \"([^\"]*)\" in the reassign box$")
    public void iReassignTo(String usage, String userName) {
        homePage.assertReassignedTo(userName, usage.contains("softly"), usage.contains("cannot"));
    }

    @And("I navigate to yopmail portal for {string} with subject {string}")
    public void iNavigateToYopmailPortalForWithSubject(String emailId, String subject) {
        homePage.NavigateToYopmailPortalForWithSubject(emailId,subject);
    }

    @And("I navigate to yopmail portal for {string} with click on subject {string}")
    public void iNavigateToYopmailPortalForWithClickOnSubject(String emailId, String subject) {
        homePage.NavigateToYopmailPortalForWithClickOnSubject(emailId,subject);
    }

    /*@When("I login to portal")
    public void iLoginToPortal() {
        I.amPerforming().textInput().in(ByUsing.healingWebIdName("loginPage_userName"), TestSetupController.usersController.getUserName("Admin"));
        I.amPerforming().textInput().in(ByUsing.healingWebXpathName("loginPage_password"),TestSetupController.usersController.getPassword("Admin"));
    }*/
}
