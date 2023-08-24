package com.helperPackage.govgrants;

import com.helperPackage.objects.Elements;
import com.helperPackage.register.I;
import com.helperPackage.report.LogLevel;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;

import java.util.List;
import java.util.stream.Collectors;

public final class Approvals {
    private final By approvalDecisionLocator = By.xpath("//div[@id='ApprovalDecisionComponent']"),
            radioButtonsLocator = By.xpath("//div[@id='ApprovalDecisionComponent']//span[contains(@class, 'approval-actions')]"),
            userLookupLocator = By.xpath("//div[@id='ApprovalDecisionComponent']//span[@class='select2-chosen']"),
            userLookupSearchLocator = By.xpath("//div[@id='select2-drop']/div[@class='select2-search']/input"),
            userLookupResultsLocator = By.xpath("//div[@id='select2-drop']//ul[contains(@class, 'select2-results')]/li/div"),
            commentBoxLocator = By.xpath("//div[@id='ApprovalDecisionComponent']//textarea"),
            submitButtonLocator = By.xpath("//div[@id='ApprovalDecisionComponent']//input[@value='Submit']"),
            submitConfirmationLocator = By.xpath("//div[contains(@class,'modal-dialog')]/div[@class='modal-content']//button[contains(text(),'Continue')]"),
            approvalMessagesLocator = By.xpath("//div[@id='ApprovalDecisionComponent']//div[contains(@class, 'alert')]//span");

    private By radioButtonLocator(String buttonName) {
        return By.xpath("" +
                "//div[@id='ApprovalDecisionComponent']//span/input[@name='myRadio' and " + I.amPerforming().sanityOfXpathTo().equals("@value", buttonName) + "]" +
                " | " +
                "//div[@id='ApprovalDecisionComponent']//span[./text()[" + I.amPerforming().sanityOfXpathTo().equals(".", buttonName) + "]]/input[@name='myRadio']");
    }

    private By userLookupResultLocator(String userName) {
        return By.xpath("//div[@id='select2-drop']//ul//li/div[" + I.amPerforming().sanityOfXpathTo().contains(".", userName) + "]");
    }

    // Action Methods

    /**
     * Selects a given radio button in the approval decision
     *
     * @param radioButtonOption the radio button to select
     */
    public void selectRadioButton(String radioButtonOption) {
        try {
            I.amPerforming().click().on(radioButtonLocator(radioButtonOption));
        } catch (Exception e) {
            String error = e.getMessage();

            if (!isApprovalDecisionVisible()) {
                error = "Approval decision was not visible on the page";
            } else if (!areRadioButtonsVisible()) {
                error = "No approval radio buttons were visible on the page";
            } else if (!isRadioButtonVisible(radioButtonOption)) {
                error = String.format("Matching radio button was not found in the page.%nThe following radio buttons were found: %s", getApprovalOptions());
            }

            I.amPerforming().updatingOfReportWith().write(LogLevel.BUSINESS_LAYER_ERROR, String.format("Could not select radio button '%s' in the approval decision.", radioButtonOption));
            I.amPerforming().updatingOfReportWith().write(LogLevel.EMPTY_LABEL, error);

            throw e;
        }
    }

    /**
     * Selects a user from the user lookup in the approval decision
     *
     * @param userName The user to select from the lookup
     */
    public void selectUser(String userName) {
        try {
            I.amPerforming().click().on(userLookupLocator);
            I.amPerforming().textInput().in(userLookupSearchLocator, userName);
            I.amPerforming().click().on(userLookupResultLocator(userName));
        } catch (Exception e) {
            String error = e.getMessage();

            if (!isApprovalDecisionVisible()) {
                error = "Approval decision was not visible on the page";
            } else if (!isUserLookupVisible()) {
                error = "User lookup is not visible in the approval decision.";
            } else if (!isUserPresentInUserLookup(userName)) {
                error = String.format("User was not found in the user lookup in the approval decision.%nThe following users were found: %s", getApprovalUsers());
            }

            I.amPerforming().updatingOfReportWith().write(LogLevel.BUSINESS_LAYER_ERROR, String.format("Could not select user '%s' in the approval decision.", userName));
            I.amPerforming().updatingOfReportWith().write(LogLevel.EMPTY_LABEL, error);


            throw e;
        }
    }

    /**
     * Enters a comment in the comment box in the approval decision
     *
     * @param comment the comment to enter in the comment box
     */
    public void enterComment(String comment) {
        try {
            I.amPerforming().textInput().in(commentBoxLocator, comment);
        } catch (Exception e) {
            String error = e.getMessage();

            if (!isApprovalDecisionVisible()) {
                error = "Approval decision was not visible on the page";
            } else if (!isCommentBoxVisible()) {
                error = "Comment box is not visible in the approval decision.";
            }

            I.amPerforming().updatingOfReportWith().write(LogLevel.BUSINESS_LAYER_ERROR, String.format("Could not enter comment '%s' in the approval decision.", comment));
            I.amPerforming().updatingOfReportWith().write(LogLevel.EMPTY_LABEL, error);

            throw e;
        }
    }

    /**
     * Click the submit button to complete an approval decision
     */
    public void submitApproval(boolean doPostProcessing) {
        try {
            I.amPerforming().click().on(submitButtonLocator);

            if (doPostProcessing && I.amPerforming().checkToSee().IsElementPresentQuick(submitConfirmationLocator)) {
                I.amPerforming().click().on(submitConfirmationLocator);
            }
        } catch (Exception e) {
            String error = e.getMessage();

            if (!isApprovalDecisionVisible()) {
                error = "Approval decision was not visible on the page";
            } else if (!isSubmitButtonVisible()) {
                error = "Submit button is not visible in the approval decision.";
            }

            I.amPerforming().updatingOfReportWith().write(LogLevel.BUSINESS_LAYER_ERROR, "Could not submit the approval in the approval decision.");
            I.amPerforming().updatingOfReportWith().write(LogLevel.EMPTY_LABEL, error);

            throw e;
        }
    }

    // Boolean Methods

    /**
     * Checks is the approval decision box is present in the page details
     *
     * @return true if the approval decision is visible, false otherwise
     */
    public boolean isApprovalDecisionVisible() {
        return I.amPerforming().checkToSee().IsElementPresentQuick(approvalDecisionLocator) && I.amPerforming().checkToSee().isDisplayed(approvalDecisionLocator, false);
    }

    /**
     * Checks if any radio buttons are present in the approval decision
     *
     * @return true if radio button are present, false otherwise
     */
    public boolean areRadioButtonsVisible() {
        return I.amPerforming().checkToSee().IsElementPresentQuick(radioButtonsLocator) && I.amPerforming().checkToSee().isDisplayed(radioButtonsLocator, false);
    }

    /**
     * Checks if a given radio button is present in the approval decision
     *
     * @param expectedRadioButton the radio button to look for
     * @return true if the radio button is present, false otherwise
     */
    public boolean isRadioButtonVisible(String expectedRadioButton) {
        return getApprovalOptions().contains(expectedRadioButton);
    }

    /**
     * Checks if the user lookup is present in the approval decision
     *
     * @return true if the approval lookup is present, false otherwise
     */
    public boolean isUserLookupVisible() {
        return I.amPerforming().checkToSee().IsElementPresentQuick(userLookupLocator);
    }

    /**
     * Checks if a given user is present in the user lookup
     *
     * @param expectedUser The user to look for in the lookup
     * @return true if the given user is present in the look up, false otherwise
     */
    public boolean isUserPresentInUserLookup(String expectedUser) {
        return getApprovalUsers().contains(expectedUser);
    }

    /**
     * Checks if the comment box it present in the approval decision
     *
     * @return true if the comment box is present, false otherwise
     */
    public boolean isCommentBoxVisible() {
        return I.amPerforming().checkToSee().IsElementPresentQuick(commentBoxLocator) && I.amPerforming().checkToSee().isDisplayed(commentBoxLocator, false);
    }

    /**
     * Checks if the submit button is present in the approval decision
     *
     * @return true if the submit button is present, false otherwise
     */
    public boolean isSubmitButtonVisible() {
        return I.amPerforming().checkToSee().IsElementPresentQuick(submitButtonLocator) && I.amPerforming().checkToSee().isDisplayed(submitButtonLocator, false);
    }

    /**
     * Checks if a given message is present in the approval decision
     *
     * @param expectedMessage the message
     * @return true if the message is present, false otherwise
     */
    public boolean isMessageVisible(String expectedMessage) {
        return getApprovalMessages().contains(expectedMessage);
    }

    // List Methods

    /**
     * Gets a list of all the available radio buttons in the approval decision
     *
     * @return A List containing the names of all the radio buttons present in the approval decision
     */
    public List<String> getApprovalOptions() {
        return I.amPerforming().getElementReference().forListOfElements().of(radioButtonsLocator)
                .stream().filter(Elements::isDisplayed).map(Elements::getText).collect(Collectors.toList());
    }

    /**
     * Gets a list of all the available users in the user lookup of the approval decision.
     *
     * @return A list containing the names of all the users present in the user lookup of the approval decision
     */
    public List<String> getApprovalUsers() {
        boolean wasClosed = false;

        if (!I.amPerforming().checkToSee().IsElementPresentQuick(userLookupResultsLocator) || !I.amPerforming().checkToSee().isDisplayed(userLookupResultsLocator, false)) {
            wasClosed = true;
            I.amPerforming().click().on(userLookupLocator);
        }
        List<String> presentUsers = I.amPerforming().getElementReference().forListOfElements().of(userLookupResultsLocator)
                .stream().map(Elements::getText).collect(Collectors.toList());
        if (wasClosed) {
            I.amPerforming().textInput().in(userLookupSearchLocator, Keys.ENTER.toString());
        }
        return presentUsers;
    }

    /**
     * Gets a list of all the message present in the approval decision
     *
     * @return A list containing the messages which were found in the approval decision
     * @modified Jitendra Pisal
     * Updated : 25/08/202 - Added code to wait for approval message without waiting for loading spinner.
     */
    public List<String> getApprovalMessages() {
        int counter = 0;
        List<Elements> listOf = I.amPerforming().getElementReference().forListOfElements().of(approvalMessagesLocator, false);
        if (listOf.isEmpty()) {
            while (counter < 10) {
                listOf = I.amPerforming().getElementReference().forListOfElements().of(approvalMessagesLocator, false);
                if (listOf.isEmpty()) {
                    I.amPerforming().waitFor().makeThreadSleep(1000);
                    counter++;
                    continue;
                } else {
                    break;
                }
            }
        }
        return listOf.stream().filter(Elements::isDisplayed).map(Elements::getText).collect(Collectors.toList());
    }
}
