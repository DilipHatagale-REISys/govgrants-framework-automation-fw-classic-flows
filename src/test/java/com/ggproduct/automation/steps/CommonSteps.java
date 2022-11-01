package com.ggproduct.automation.steps;

import com.automation.rei.handlers.govgrants;
import com.ggproduct.automation.projectmanager.ProjectManager;
import com.ggproduct.automation.webservices.ProjectWebServices;
import com.testingblaze.register.I;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.springframework.context.annotation.Description;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
public class CommonSteps {
    ProjectManager projectManager;

    public CommonSteps(ProjectManager projectManager) {
        this.projectManager = projectManager;
    }

    /* ReCaptcha Steps */

    @Before("@recaptcha")
    public void turnOffRecaptcha() {
        ProjectWebServices.recaptchaChange(true);
    }

    @After("@recaptcha")
    public void turnOnRecaptcha() {
        ProjectWebServices.recaptchaChange(false);
    }

    @Given("^I delete the record \"([^\"]*)\" from the object \"([^\"]*)\"$")
    public void deleteTestData(String recordName, String objectType) {
        projectManager.deletionApi(recordName, objectType);
    }

    @When("I close the tab")
    public void closeCurrentTab() {
        I.amPerforming().browserOperationsTo().closeBrowserOrTab();
        I.amPerforming().switchTo().windowHandler(
                I.amPerforming().switchTo().getWindowsHandlers().size() - 1
        );
    }

    @Then("^I (softly see|do not see) the image \"([^\"]*)\" in page detail$")
    public void validateImageinPageDetail(String usage, String imageName) {
        projectManager.validateImage(usage, imageName);
    }

    @Then("^I see the page contains text \"([^\"]*)\"$")
    public void assertTextOnPage(String desiredText) {
        projectManager.assertTextOnPage(desiredText);
    }
}
