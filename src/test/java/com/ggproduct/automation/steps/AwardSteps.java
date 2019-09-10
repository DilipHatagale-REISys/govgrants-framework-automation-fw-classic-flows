package com.ggproduct.automation.steps;

import com.ggproduct.automation.pageobjects.AwardPage;
import io.cucumber.java.en.When;
import org.springframework.context.annotation.Description;

public class AwardSteps {
    private AwardPage awardPage;

    public AwardSteps(AwardPage awardPage){this.awardPage = awardPage;}

    @Description("To enter comments in confirmation popup modal after accepting award")
    @When("^I enter \"([^\"]*)\" for comments and click \"([^\"]*)\"$")
    public void iEnterForCommentsAndClick(String comments, String buttonName) {
        awardPage.enterCommentsOnConfirmation(comments,buttonName);
    }
}
