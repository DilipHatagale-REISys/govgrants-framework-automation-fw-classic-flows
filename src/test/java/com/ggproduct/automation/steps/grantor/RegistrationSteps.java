package com.ggproduct.automation.steps.grantor;

import com.ggproduct.automation.pageobjects.grantor.RegistrationPage;
import com.testingblaze.register.I;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import java.util.List;

public class RegistrationSteps {
    RegistrationPage registrationPage;

    public RegistrationSteps(RegistrationPage registrationPage) {
        this.registrationPage = registrationPage;
    }

    @When("^I begin \"([^\"]*)\" registration$")
    public void startRegistration(String officeType) {
        registrationPage.beginRegistration(officeType);
    }

    @When("^I enter value as \"([^\"]*)\" into \"([^\"]*)\" on old form$")
    public void enterValueIntoFieldAtDynamicFormsLayout(String enterValue, String labelName) {
        registrationPage.enterValueIntoFieldAtOldForms(enterValue, labelName);
    }

    @And("^I click on \"([^\"]*)\" button$")
    public void iClickOnButton(String buttonName) {
        registrationPage.clickCenterButton(buttonName);
    }

    @Then("I see the privacy policy text is as follows :")
    public void verifyCorrectNdaText(String expectedNdaText) {
        registrationPage.assertTextMatches(expectedNdaText);
    }

    @Then("I see the following buttons for office type {string} :")
    public void verifyCorrectOfficeTypeButtons(String officeType, List<String> expectedOfficeTypes) {
        I.amPerforming().assertionsTo().assertThat(registrationPage.getOfficeTypeButtonNames(officeType))
                .as(String.format("Verify buttons are as expected for office type '%s'", officeType))
                .containsExactlyInAnyOrderElementsOf(expectedOfficeTypes);
    }

    @Then("^I see the ReCaptcha input box")
    public void verifyReCaptchIsVisible() {
        registrationPage.assertCaptchaDisplayedOnPage(true);
    }

    @Then("I set password for the user")
    public void iSetPasswordForTheUser() {
        registrationPage.setPasswordForTheUser();
    }
}
