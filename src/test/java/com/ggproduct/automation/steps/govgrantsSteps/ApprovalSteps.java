package com.ggproduct.automation.steps.govgrantsSteps;

import com.helperPackage.handlers.govgrants;
import com.helperPackage.register.I;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.assertj.core.api.ProxyableListAssert;

import java.util.List;

public class ApprovalSteps {

    // Single Action steps

    @When("I select radio button {string} in the approval decision")
    public void selectApprovalRadioButton(String radioButtonName) {
        govgrants.perform().approvals().selectRadioButton(radioButtonName);
    }

    @When("I select user {string} in the approval decision")
    public void selectApprovalUser(String radioButtonName) {
        govgrants.perform().approvals().selectUser(radioButtonName);
    }

    @When("I enter comment {string} in the approval decision")
    public void enterApprovalComment(String comment) {
        govgrants.perform().approvals().enterComment(comment);
    }

    /* TODO: Combine these two steps when we upgrade to Cucumber 5.0.0
             and can use @Repeatable annotations  */
    @When("I submit the approval in the approval decision")
    public void submitApproval() {
        govgrants.perform().approvals().submitApproval(true);
    }
    @When("I submit the approval in the approval decision without processing")
    public void submitApprovalWithoutProcessing() {
        govgrants.perform().approvals().submitApproval(false);
    }

    // Combined Actions steps

    @When("I {string} in the approval decision")
    public void completeApproval(String approvalType) {
        govgrants.perform().approvals().selectRadioButton(approvalType);
        if (govgrants.perform().approvals().isCommentBoxVisible()) {
            govgrants.perform().approvals().enterComment("Automation Testing");
        }
        govgrants.perform().approvals().submitApproval(true);
    }

    @When("I {string} to user {string} in the approval decision")
    public void completeApprovalWithUser(String approvalType, String user) {
        govgrants.perform().approvals().selectRadioButton(approvalType);
        govgrants.perform().approvals().selectUser(user);
        if (govgrants.perform().approvals().isCommentBoxVisible()) {
            govgrants.perform().approvals().enterComment("Automation testing");
        }
        govgrants.perform().approvals().submitApproval(true);
    }

    // Assertion Steps

    @Then("^I (can|cannot) see the approval decision$")
    public void verifyPresenceOfApprovalDecision(String canOrCannot) {
        I.amPerforming().assertionsTo().assertThat(govgrants.perform().approvals().isApprovalDecisionVisible() == canOrCannot.equalsIgnoreCase("can"))
                .as("Verifying that I %s see the approval decision.", canOrCannot)
                .isTrue();
    }

    @Then("I see {int} radio buttons in the approval decision")
    public void verifyNoRadioButtonsArePresent(int expectedNumber) {
        I.amPerforming().assertionsTo().assertThat(govgrants.perform().approvals().getApprovalOptions().size())
                .as("Verifying the number of radio buttons in the approval decision.")
                .isEqualTo(expectedNumber);
    }

    @Then("^I (can|cannot) see the radio button \"([^\"]*)\" in the approval decision$")
    public void verifyPresenceOfRadioButton(String canOrCannot, String expectedRadioButton) {
        I.amPerforming().assertionsTo().assertThat(govgrants.perform().approvals().isRadioButtonVisible(expectedRadioButton) == canOrCannot.equalsIgnoreCase("can"))
                .as("Verifying that I %s see the radio button '%s' in the approval decision.", canOrCannot, expectedRadioButton)
                .isTrue();
    }

    @Then("^I see( only)? the following( ordered)? radio buttons in the approval decision :$")
    public void verifyRadioButtonsPresentInApprovalDecision(String exactMatch, String orderedMatch, List<String> expectedRadioButtons) {
        ProxyableListAssert<String> assertion = I.amPerforming().assertionsTo()
                .assertThat(govgrants.perform().approvals().getApprovalOptions())
                .as("Verifying radio buttons in the approval decision.");

        if (exactMatch != null && orderedMatch != null) {
            assertion.containsExactlyElementsOf(expectedRadioButtons);
        } else if (exactMatch != null) {
            assertion.containsExactlyInAnyOrderElementsOf(expectedRadioButtons);
        } else if (orderedMatch != null) {
            assertion.containsSubsequence(expectedRadioButtons);
        } else {
            assertion.containsAll(expectedRadioButtons);
        }
    }

    @Then("^I (can|cannot) see the user lookup in the approval decision$")
    public void verifyPresenceOfUserLookup(String canOrCannot) {
        I.amPerforming().assertionsTo().assertThat(govgrants.perform().approvals().isUserLookupVisible() == canOrCannot.equalsIgnoreCase("can"))
                .as("Verifying that I %s see the user lookup in the approval decision.", canOrCannot)
                .isTrue();
    }

    @Then("I see {int} users in the user lookup in the approval decision")
    public void verifyNoUsersArePresentInUserLookup(int expectedNumber) {
        I.amPerforming().assertionsTo().assertThat(govgrants.perform().approvals().getApprovalUsers().size())
                .as("Verifying the number of users in the user lookup in the approval decision.")
                .isEqualTo(expectedNumber);
    }

    @Then("^I (can|cannot) see user \"([^\"]*)\" in the user lookup in the approval decision$")
    public void verifyPresenceOfUserInUserLookup(String canOrCannot, String user) {
        I.amPerforming().assertionsTo().assertThat(govgrants.perform().approvals().isUserPresentInUserLookup(user) == canOrCannot.equalsIgnoreCase("can"))
                .as("Verifying that I %s see the user '%s' in the user lookup in the approval decision.", canOrCannot, user)
                .isTrue();
    }

    @Then("^I see( only)? the following( ordered)? users in the user lookup in the approval decision :$")
    public void verifyUserPresentInUserLookupInApprovalDecision(String exactMatch, String orderedMatch, List<String> expectedUsers) {
        ProxyableListAssert<String> assertion = I.amPerforming().assertionsTo()
                .assertThat(govgrants.perform().approvals().getApprovalUsers())
                .as("Verifying users in the user lookup in the approval decision.");

        if (exactMatch != null && orderedMatch != null) {
            assertion.containsExactlyElementsOf(expectedUsers);
        } else if (exactMatch != null) {
            assertion.containsExactlyInAnyOrderElementsOf(expectedUsers);
        } else if (orderedMatch != null) {
            assertion.containsSubsequence(expectedUsers);
        } else {
            assertion.containsAll(expectedUsers);
        }
    }

    @Then("^I (can|cannot) see the comment box in the approval decision$")
    public void verifyPresenceOfCommentBox(String canOrCannot) {
        I.amPerforming().assertionsTo().assertThat(govgrants.perform().approvals().isCommentBoxVisible() == canOrCannot.equalsIgnoreCase("can"))
                .as("Verifying that I %s see the comment box in the approval decision.", canOrCannot)
                .isTrue();
    }

    @Then("^I (can|cannot) see the submit button in the approval decision$")
    public void verifyPresenceOfSubmitButton(String canOrCannot) {
        I.amPerforming().assertionsTo().assertThat(govgrants.perform().approvals().isSubmitButtonVisible() == canOrCannot.equalsIgnoreCase("can"))
                .as("Verifying that I %s see the submit button in the approval decision.", canOrCannot)
                .isTrue();
    }

    @Then("I see {int} messages in the approval decision")
    public void verifyNoMessagesPresentInApprovalDecision(int expectedNumber) {
        I.amPerforming().assertionsTo().assertThat(govgrants.perform().approvals().getApprovalMessages().size())
                .as("Verifying the number of messages in the approval decision.")
                .isEqualTo(expectedNumber);
    }

    @Then("^I (can|cannot) see the message \"([^\"]*)\" in the approval decision$")
    public void verifyPresenceOfMessageInApprovalDecision(String canOrCannot, String expectedMessage) {
        I.amPerforming().assertionsTo().assertThat(govgrants.perform().approvals().isMessageVisible(expectedMessage) == canOrCannot.equalsIgnoreCase("can"))
                .as("Verifying that I %s see the message '%s' in the approval decision.", canOrCannot, expectedMessage)
                .isTrue();
    }

    @Then("^I see( only)? the following( ordered)? messages in the approval decision :$")
    public void verifyMessagesPresentInApprovalDecision(String exactMatch, String orderedMatch, List<String> expectedApprovalMessages) {
        ProxyableListAssert<String> assertion = I.amPerforming().assertionsTo()
                .assertThat(govgrants.perform().approvals().getApprovalMessages())
                .as("Verifying messages in the approval decision.");

        if (exactMatch != null && orderedMatch != null) {
            assertion.containsExactlyElementsOf(expectedApprovalMessages);
        } else if (exactMatch != null) {
            assertion.containsExactlyInAnyOrderElementsOf(expectedApprovalMessages);
        } else if (orderedMatch != null) {
            assertion.containsSubsequence(expectedApprovalMessages);
        } else {
            assertion.containsAll(expectedApprovalMessages);
        }
    }

}
