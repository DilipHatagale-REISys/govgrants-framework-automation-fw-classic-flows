package com.ggproduct.automation.pageobjects.grantor;

import com.ggproduct.automation.projectmanager.ProjectManager;
import com.helperPackage.register.I;
import com.helperPackage.report.LogLevel;
import org.apache.commons.lang3.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.TimeoutException;

import java.util.List;
import java.util.stream.Collectors;

public class RegistrationPage extends ProjectManager {
    public String name;
    public By privacyPolicyText, captch;
    public By newPassword;
    public By confirmNewPassword;
    public By changePasswordBtn;

    /******* "Variables and Locators" *****************/


    public RegistrationPage() {
        privacyPolicyText = By.xpath("//div[contains(@class, 'help-desk-panel-body panel-body')]");
        captch = By.xpath("//iframe[contains(@src, 'www.google.com/recaptcha')]");
        newPassword = By.xpath("//input[@id='newpassword']");
        confirmNewPassword = By.xpath("//input[@id='confirmpassword']");
        changePasswordBtn = By.xpath("//button[@id='password-button']");
    }

    /**
     * Constructor to handle dependency injection and framework library
     */


    /******* "Key Methods with complete functionality - public" *****************/


    public void clickOfficeTypeButton(String officeType, String buttonName) {
        try {
            I.amPerforming().waitFor().ElementToBeClickable(getOfficeTypeButtonLocator(officeType, buttonName));
            I.amPerforming().click().on(getOfficeTypeButtonLocator(officeType, buttonName));
        } catch (TimeoutException e) {
            I.amPerforming().updatingOfReportWith().write(LogLevel.PROJECT_LAYER_ERROR,
                    String.format("Registration page button '%s' for office type '%s' was not able to be clicked.%n"
                                    + "These are the office types available:     %s%n"
                                    + "These are the buttons available for '%s': %s",
                            buttonName, officeType, officeType, getOfficeTypeButtonNames(officeType)));
            throw e;
        }
    }

    public void clickRegistrationType(String registrationType) {
        I.amPerforming().waitFor().ElementToBeClickable(By.xpath("//a[contains(text(),'" + registrationType + "')]"));
        I.amPerforming().click().on(By.xpath("//a[contains(text(),'" + registrationType + "')]"));

    }

    public By getOfficeTypeButtonLocator(String officeType, String buttonName) {
        return By.xpath("//div[contains(@class, 'panel-default') and .//text()[" + I.amPerforming().sanityOfXpathTo().equals(".", officeType) + "]]"
                + "//a[contains(@class, 'customBtn')][" + I.amPerforming().sanityOfXpathTo().equals("text()", buttonName) + "]");
    }

    public List<String> getOfficeTypeButtonNames(String officeType) {
        try {
            I.amPerforming().waitFor().ElementToBePresent(getOfficeTypeButtonsLocator(officeType), 2);
        } catch (Exception e) {
            /* Ignore Exception */
        }
        return I.amPerforming().getElementReference().forListOfElements().of(getOfficeTypeButtonsLocator(officeType), false)
                .stream().map(el -> StringUtils.normalizeSpace(el.getText())).collect(Collectors.toList());
    }

    public void assertCaptchaDisplayedOnPage(boolean shouldBeDisplayed) {
        try {
            I.amPerforming().waitFor().ElementToBePresent(captch, 2);
        } catch (Exception e) {
            /* Ignore Exception */
        }
        I.amPerforming().assertionsTo().assertThat(I.amPerforming().checkToSee().isDisplayed(captch, false))
                .as(name + " is displayed on page")
                .isEqualTo(shouldBeDisplayed);
    }

    public By getOfficeTypeButtonsLocator(String officeType) {
        return By.xpath("//div[contains(@class, 'panel-default') and .//text()[" + I.amPerforming().sanityOfXpathTo().equals(".", officeType) + "]]//a[contains(@class, 'customBtn')]");
    }

    public void assertTextMatches(String expectedString) {
        I.amPerforming().assertionsTo().assertThat(I.amPerforming().actionToGet().text(privacyPolicyText))
                .isEqualToNormalizingWhitespace(expectedString);
    }

    public void setPasswordForTheUser() {
        String passwordText = "SALESFORCE2020";
        I.amPerforming().textInput().in(newPassword, passwordText);
        I.amPerforming().textInput().in(confirmNewPassword, passwordText);
        I.amPerforming().click().on(changePasswordBtn);
    }

    /**
     * Method to navigate to the reset password link from an email
     *
     * @author komal.mukhekar
     */
    public void iNavigateToResetPasswordLink() {
        String setPasswordLink = "https" + I.amPerforming().actionToGet().text(By.xpath("//div[@id='mail']")).split("https")[1].split("\\s")[0].trim();
        I.amPerforming().browserOperationsTo().navigateToUrl(setPasswordLink);
    }

    /**
     * Method to navigate to an email with given subject
     *
     * @author komal.mukhekar
     */
    public void iClickOnMailWithSubject(String subject) {
        By mailSubject = By.xpath("//div[@class='m']//div[@class='lms' and text()='" + subject + "']");
        try {
            I.amPerforming().click().on(mailSubject);
        } catch (Exception e) {
            for (int i = 0; i < 15; i++) {
                I.amPerforming().waitFor().makeThreadSleep(5000);
                I.amPerforming().click().on(By.xpath("//button[@id='refresh']"));
                if (I.amPerforming().checkToSee().isElementDisplayed(mailSubject)) {
                    I.amPerforming().click().on(mailSubject);
                    break;
                }
            }
        }
    }
}