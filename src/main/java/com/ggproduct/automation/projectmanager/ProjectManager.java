package com.ggproduct.automation.projectmanager;

import com.helperPackage.handlers.govgrants;
import com.ggproduct.automation.usersUrl.UsersAndURL;
import com.ggproduct.automation.webservices.ProjectWebServices;
import com.helperPackage.actionsfactory.api.ByUsing;
import com.helperPackage.register.I;
import com.helperPackage.report.LogLevel;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.TimeoutException;

import java.util.List;
import java.util.stream.Collectors;


/**
 * for Rei Systems
 *
 * @author Handles generic/common methods and WebElements of the project.
 */
public class ProjectManager extends ProjectWebServices {
    UsersAndURL usersAndURL = new UsersAndURL();

    public void navigateToProductReciepientPortal(String portalName) {
        By pageConnectionReset = By.xpath("//*[text()='The connection was reset.' or text()='A network change was detected.'] | //div[@id='AppBodyHeader']");
        govgrants.perform().mainPage().navigateToPortal(portalName);
        for (int i = 0; i < 5 && I.amPerforming().checkToSee().IsElementPresentQuick(pageConnectionReset); i++) {
            govgrants.perform().mainPage().navigateToPortal(portalName);
        }
    }

    public void clickSignInLink(String linkText) {
        try {
            I.amPerforming().waitFor().ElementToBeClickable(getSignInLinkLocator(linkText));
            I.amPerforming().click().on(getSignInLinkLocator(linkText));
        } catch (TimeoutException e) {
            I.amPerforming().updatingOfReportWith().write(LogLevel.PROJECT_LAYER_ERROR,
                    String.format("Form Link '%s' was not able to be clicked.%n"
                            + "These are the form Links available to click: %s", linkText, getSignInLinkNames()));
            throw e;
        }
    }

    public By getSignInLinkLocator(String linkText) {
        return By.xpath("//form//a[" + I.amPerforming().sanityOfXpathTo().equals("text()", linkText) + "]"
                + " | "
                + "//form//input[@type='submit' and " + I.amPerforming().sanityOfXpathTo().equals("@value", linkText) + "]");
    }

    public List<String> getSignInLinkNames() {
        try {
            I.amPerforming().waitFor().ElementToBePresent(getSignInLinksLocator(), 2);
        } catch (Exception e) {
            /* Ignore Exception */
        }
        return I.amPerforming().getElementReference().forListOfElements().of(getSignInLinksLocator(), false).stream()
                .map(el -> el.getAttributes("value") == null ? el.getText().trim() : el.getAttributes("value").trim())
                .collect(Collectors.toList());
    }

    public By getSignInLinksLocator() {
        return By.xpath("//form//a[text()]"
                + " | "
                + "//form//input[@type='submit' and @value]");
    }

    public void validateImage(String usage, String imageName) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(imageIsVisibleOrNot(imageName)).isTrue();
        } else if (usage.equalsIgnoreCase("do not see")) {
            I.amPerforming().assertionsTo().assertThat(imageIsVisibleOrNot(imageName)).isFalse();
        }
    }

    private boolean imageIsVisibleOrNot(String imageName) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(I.amPerforming().getElementReference().of(ByUsing.xpath("//img[contains(@title,'" + imageName + "')] | //img[contains(@alt,'" + imageName + "')]")))) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * Method to validate partial/full text on page
     *
     * @param desiredText
     * @author- vaibhav.chandratre
     */
    public void assertTextOnPage(String desiredText) {
        Assert.assertTrue(I.amPerforming().getElementReference().of(By.xpath("//div[@class='messageText'] | //div[@class='tabheaderinstruction']//div"))
                .getAttribute("innerText").contains(desiredText));
    }

    /**
     * assert if message with quotes is displayed on confirmation box pop up
     *
     * @param message
     * @author komal.mukhekar
     */
    public void assertMessageOfConfirmationBoxPopUp(String message, boolean isSoftly) {
        By confirmationBoxMessage = By.xpath("//div[contains(@class,'modal-dialog')]//div[contains(@class, 'bootbox-body')]");
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(message).isEqualTo(
                    I.amPerforming().actionToGet().attribute(confirmationBoxMessage, "innerText").replaceAll("\\u00a0", " ")
            );
        } else {
            Assert.assertEquals(I.amPerforming().actionToGet().attribute(confirmationBoxMessage, "innerText").replaceAll("\\u00a0", " "), message);
        }
    }

    public void assertFieldIsNotInEditMode(String fieldAPIName, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(isFieldNotInEditMode(fieldAPIName)).isFalse();
        } else {
            Assert.assertFalse(isFieldNotInEditMode(fieldAPIName));
        }
    }

    private boolean isFieldNotInEditMode(String fieldAPIName) {
        boolean flag = true;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//field[@field-name='" + fieldAPIName + "']/input")))
                flag = true;
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    public void assertLengthOfFieldValues(String usage, String fieldLabel, String charCount) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(assertLengthOfFieldValuewithLabel(fieldLabel, charCount)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(assertLengthOfFieldValuewithLabel(fieldLabel, charCount)).isFalse();
        }
    }

    private boolean assertLengthOfFieldValuewithLabel(String fieldLabel, String charCount) {
        Boolean flag = false;
        By fieldAPIName = By.xpath("//div[@id='" + fieldLabel + "']");
        String actualValue = I.amPerforming().getElementReference().of(fieldAPIName).getText();
        try {
            return actualValue.length() == Integer.parseInt(charCount) ? true : false;
        } catch (Exception e) {
            /* Ignore Exception */
        }
        return flag;

    }

    public void clickOnCOIOption(String radioButtonName) {
        try {
            By ConflictOfInterestReviewFromPath = By.xpath("//span//input[@type='radio'][@value='"+radioButtonName+"']");
            if (I.amPerforming().checkToSee().IsElementPresentQuick(ConflictOfInterestReviewFromPath)) {
                I.amPerforming().click().on(ConflictOfInterestReviewFromPath);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void assertCOISectionInViewMode(String radioButtonName, boolean isSoftly) {
        By pageBlockFields = By.xpath("//span//label[text()='"+radioButtonName+"']/../input[@readonly or @disabled]");
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().checkToSee().isDisplayed(pageBlockFields)).isTrue();
        } else {
            Assert.assertTrue(I.amPerforming().checkToSee().isDisplayed(pageBlockFields));
        }
    }
}
