package com.ggproduct.automation.pageobjects.grantor;

import com.ggproduct.automation.projectmanager.ProjectManager;
import com.testingblaze.register.I;
import com.testingblaze.report.LogLevel;
import org.apache.commons.lang3.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.TimeoutException;

import java.util.List;
import java.util.stream.Collectors;

public class RegistrationPage extends ProjectManager {
    public String name;
    public By privacyPolicyText, captch;
    public By actualmMailText;
    public By actualmMailSubjectText;

    /******* "Variables and Locators" *****************/


    public RegistrationPage() {
        privacyPolicyText = By.xpath("//div[contains(@class, 'help-desk-panel-body panel-body')]");
        captch = By.xpath("//iframe[contains(@src, 'www.google.com/recaptcha')]");
        actualmMailText = By.xpath("//div[@id='mailmillieu']//div//center");
        actualmMailSubjectText = By.xpath("//div[@id='mailhaut']");
    }

    /**
     * Constructor to handle dependency injection and framework library
     */


    /******* "Key Methods with complete functionality - public" *****************/

    public void beginRegistration(String officeType) {
        navigateToProductReciepientPortal("SUBPORTAL");
        clickSignInLink("Register");
        clickRegistrationType(officeType);
        clickOfficeTypeButton(officeType, "Begin Registration");
    }

    /**
     * enter values in the fields at old form layout
     *
     * @param enterValue
     * @param labelName
     */
    public void enterValueIntoFieldAtOldForms(String enterValue, String labelName) {
        By getField = By.xpath("//span[text()='" + labelName + "']/ancestor::div/following-sibling::div//input");
        I.amPerforming().textInput().toClear(getField);
        I.amPerforming().textInput().in(getField, enterValue);
    }

    public void verifyTextOfTextArea(String text, String fieldName) {
        boolean flag = false;
        try {
            By fieldWrapperLocator = By.xpath("//div[@id='field" + fieldName + "' or @id='" + fieldName + "']//input[not(contains(@type,'hidden'))] | //div[@id='field" + fieldName + "' or @id='" + fieldName + "']//textarea |//div[@id='field" + fieldName + "' or @id='" + fieldName + "']//select");
            String givenText = I.amPerforming().actionToGet().attribute(fieldWrapperLocator, "value");
            if (givenText.equals(text)) {
                flag = true;
            }
        } catch (Exception e) {
        }
        I.amPerforming().assertionsTo().assertThat(flag).isTrue();
    }

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

    public void clickCenterButton(String buttonName) {
        I.amPerforming().click().on(By.xpath("//a[contains(@class, 'customBtn')][" + I.amPerforming().sanityOfXpathTo().equals("text()", buttonName) + "]"));
    }

    public void assertTextMatches(String expectedString) {
        I.amPerforming().assertionsTo().assertThat(I.amPerforming().actionToGet().text(privacyPolicyText))
                .isEqualToNormalizingWhitespace(expectedString);
    }

    public void assertMailTexMatches(String expectedMailText) {
        I.amPerforming().assertionsTo().assertThat(I.amPerforming().actionToGet().text(actualmMailText))
                .isEqualToNormalizingWhitespace(expectedMailText);
    }

    public void assertMailSubjectTexMatches(String subjectText) {
        I.amPerforming().assertionsTo().assertThat(I.amPerforming().actionToGet().text(actualmMailSubjectText))
                .isEqualToNormalizingWhitespace(subjectText);
    }
}