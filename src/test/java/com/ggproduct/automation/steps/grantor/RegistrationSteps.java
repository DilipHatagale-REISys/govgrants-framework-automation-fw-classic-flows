package com.ggproduct.automation.steps.grantor;

import com.ggproduct.automation.pageobjects.grantor.RegistrationPage;
import com.helperPackage.register.I;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import jdk.jfr.Description;

import java.util.List;

public class RegistrationSteps {
    RegistrationPage registrationPage;

    public RegistrationSteps(RegistrationPage registrationPage) {
        this.registrationPage = registrationPage;
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

   /* @Then("^I see the ReCaptcha input box")
    public void verifyReCaptchIsVisible() {
        registrationPage.assertCaptchaDisplayedOnPage(true);
    }*/

    @Then("I set password for the user")
    public void iSetPasswordForTheUser() {
        registrationPage.setPasswordForTheUser();
    }

    @Description("To generate unique emailID, EIN, SSN, UEI or random number")
    @When("^I generate the random (EIN|SSN|EmailID|digits|UEI) and save as \"([^\"]*)\"$")
    public void generateAndSaveRandomDigits(String usage, String fieldKey) {
        String randomNumbers = String.valueOf(I.amPerforming().addOnsTo().getRandomNumber()).substring(0, 5);
        if (usage.equalsIgnoreCase("EmailID"))
            I.amPerforming().propertiesFileOperationsTo().saveValue(fieldKey, ("AutomationRuntime" + randomNumbers + "@yopmail.com"));
        else if (usage.equalsIgnoreCase("EIN") || usage.equalsIgnoreCase("SSN")) {
            String randomEmail = randomNumbers + randomNumbers.substring(0, 4);
            I.amPerforming().propertiesFileOperationsTo().saveValue(fieldKey, randomEmail);
        } else if (usage.equalsIgnoreCase("UEI")) {
            String randomEmail = randomNumbers + randomNumbers + randomNumbers.substring(0, 2);
            I.amPerforming().propertiesFileOperationsTo().saveValue(fieldKey, randomEmail);
        } else
            I.amPerforming().propertiesFileOperationsTo().saveValue(fieldKey, randomNumbers);
    }

    @And("I navigate to reset password link")
    public void iNavigateToResetPasswordPage() {
        registrationPage.iNavigateToResetPasswordLink();
    }

    @And("I click on mail with subject \"([^\"]*)\"$")
    public void iClickOnMailWithSubject(String subject) {
        registrationPage.iClickOnMailWithSubject(subject);
    }

}
