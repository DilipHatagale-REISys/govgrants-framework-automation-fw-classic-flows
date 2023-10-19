package com.ggproduct.automation.steps.grantor;

import com.ggproduct.automation.pageobjects.grantor.ProgressReportPage;
import com.helperPackage.register.I;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;
import org.springframework.context.annotation.Description;

public class ProgressReportSteps {
    private ProgressReportPage progressReportPage;

    public ProgressReportSteps(ProgressReportPage progressReportPage) {
        this.progressReportPage = progressReportPage;
    }

    @Description("To verify progress report schedules getting updated")
    @Then("^I (softly see|see) progress report table is getting updated with count \"([^\"]*)\" inside flextable with Id \"([^\"]*)\"$")
    public void iSeeProgressReportTableIsGettingUpdatedWithCountInsideFlextableWithId(String usage, String totalRecords, String tableID) {
        progressReportPage.verifyProgressReportSchedulesUpdated(totalRecords, tableID, usage.contains("softly"));
    }

    @Description("To verify toggle option is not present on flex table")
    @Then("^I (cannot see|softly cannot see) toggle option \"([^\"]*)\" inside flex table id \"([^\"]*)\"$")
    public void iCannotSeeToggleOptionInsideFlexTableId(String usage, String anyItemToBeCheck, String flexTableId) {
        progressReportPage.assertToggleOptionNotDisplayed(anyItemToBeCheck,
                flexTableId,
                usage.contains("softly")
        );
    }

    @Description("To verify specified column values inside flex table")
    @Then("^I (see|softly see) all values \"([^\"]*)\" under column \"([^\"]*)\" inside flextable with id \"([^\"]*)\"$")
    public void iSeeAllValuesUnderColumnInsideFlextableWithId(String usage, String columnValue, String columnName, String flexTableId) {
        progressReportPage.verifyColumnValuesInFlexTable(columnValue,
                columnName,
                flexTableId,
                usage.contains("softly")
        );
    }

    @Description("To compare date field with todays date")
    @Then("^I (softly see|see) field \"([^\"]*)\" is getting updated with todays date$")
    public void iSeeFieldIsGettingUpdatedWithTodaysDate(String usage, String fieldLabel) {
        progressReportPage.compareDateFieldWithTodaysDate(fieldLabel, usage.contains("softly"));
    }

    @Description("To verify top right button on attachments flex table")
    @Then("^I (softly see|see|cannot see|softly cannot see) top right button \"([^\"]*)\" for \"([^\"]*)\" flex table$")
    public void iCannotSeeTopRightButtonForFlexTable(String shouldBeDisplayed, String buttonName, String flextableHeaderName) {
        progressReportPage.assertTopRightButtonOnFlexTable(shouldBeDisplayed,
                buttonName,
                flextableHeaderName,
                shouldBeDisplayed.contains("softly")
        );
    }

    @Description("To verify row level action button inside attachments flex table")
    @Then("^I (softly cannot see|cannot see) row level action button \"([^\"]*)\" against Value \"([^\"]*)\" inside \"([^\"]*)\" flex table$")
    public void iCannotSeeRowLevelActionButtonAgainstValueInsideFlexTable(String usage, String buttonName, String uniqueValue, String flextableHeaderName) {
        progressReportPage.assertRowLevelActionButtonInsideFlexTable(buttonName, uniqueValue, flextableHeaderName,
                usage.contains("softly")
        );
    }

    @Description("To verify row level action button inside table")
    @Then("^I (softly see|see) row level action button \"([^\"]*)\" inside \"([^\"]*)\" flex table$")
    public void iCannotSeeRowLevelActionButtonAgainstValueInsideFlexTable(String usage, String buttonName, String tableId) {
        progressReportPage.assertRowLevelActionButtonInsideFlexTableWithoutUniqueValue(buttonName, tableId,
                usage.contains("softly")
        );
    }

    @Description("To verify reported date field contains todays date")
    @Then("^I (softly see|see) the Reported Date field contains todays date$")
    public void iSeeTheReportedDateFieldContainsTodaysDate(String usage) {
        progressReportPage.assertReportedDateField(usage.contains("softly"));
    }

    @Description("To verify checkbox field is editable")
    @Then("^I (softly see|see) checkbox field \"([^\"]*)\" is editable$")
    public void iSeeCheckboxFieldIsEditable(String usage, String fieldLabel) {
        progressReportPage.assertCheckBoxFieldIsEditable(fieldLabel, usage.contains("softly"));
    }

    @Description("To verify radiobutton on approval decison box")
    @Then("^I (softly see|see|do not see|softly do not see) \"([^\"]*)\" option on approval decision box$")
    public void iDoNotSeeOptionOnApprovalDecisionBox(String seeornot, String radiobuttonOption) {
        if (seeornot.equals("see")) {
            Assert.assertTrue(progressReportPage.isbuttonDisplayedOnApprovalDecisionBox(radiobuttonOption));
        } else if (seeornot.equalsIgnoreCase("do not se")) {
            Assert.assertFalse(progressReportPage.isbuttonDisplayedOnApprovalDecisionBox(radiobuttonOption));
        } else if (seeornot.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(progressReportPage.isbuttonDisplayedOnApprovalDecisionBox(radiobuttonOption)).isTrue();
        } else if (seeornot.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(progressReportPage.isbuttonDisplayedOnApprovalDecisionBox(radiobuttonOption)).isFalse();
        }
    }

    @Description("To compare two saved values")
    @Then("^I (see|softly see) value \"([^\"]*)\" is \"([^\"]*)\" the value \"([^\"]*)\"$")
    public void iSeeValueIsTheValue(String usage, String savedValue1, String compare, String savedValue2) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(progressReportPage.compareTwoFieldValues(savedValue1, compare, savedValue2)).isTrue();
        } else {
            Assert.assertTrue(progressReportPage.compareTwoFieldValues(savedValue1, compare, savedValue2));
        }
    }

    @Description("To compare two saved values")
    @Then("^I (see|softly see) value \"([^\"]*)\" is \"([^\"]*)\" value \"([^\"]*)\"$")
    public void iSeeCompareTheValue(String usage, String savedValue1, String compare, String savedValue2) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(progressReportPage.compareTwoValues(savedValue1, compare, savedValue2)).isTrue();
        } else {
            Assert.assertTrue(progressReportPage.compareTwoValues(savedValue1, compare, savedValue2));
        }
    }

    @Description("To make Addition of two saved values")
    @Then("^I (see|softly see|softly do not see|do not see) addition of two fields \"([^\"]*)\" and \"([^\"]*)\" is equal to \"([^\"]*)\"$")
    public void iSeeAdditionValueValue(String usage, String savedValue1, String savedValue2, String expectedValue) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(progressReportPage.addTwoFieldValues(savedValue1, savedValue2, expectedValue)).isTrue();
        } else if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(progressReportPage.addTwoFieldValues(savedValue1, savedValue2, expectedValue));
        }
        else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(progressReportPage.addTwoFieldValues(savedValue1, savedValue2, expectedValue)).isFalse();
        }
        else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(progressReportPage.addTwoFieldValues(savedValue1, savedValue2, expectedValue));
        }
    }

    @Description("To make Substraction of two saved values")
    @Then("^I (see|softly see|softly do not see|do not see) substraction of two fields \"([^\"]*)\" and \"([^\"]*)\" is equal to \"([^\"]*)\"$")
    public void iSeeSubstractionValueValue(String usage, String savedValue1, String savedValue2, String expectedValue) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(progressReportPage.substractTwoFieldValues(savedValue1, savedValue2, expectedValue)).isTrue();
        } else if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(progressReportPage.substractTwoFieldValues(savedValue1, savedValue2, expectedValue));
        }
        else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(progressReportPage.substractTwoFieldValues(savedValue1, savedValue2, expectedValue)).isFalse();
        }
        else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(progressReportPage.substractTwoFieldValues(savedValue1, savedValue2, expectedValue));
        }
    }

    @When("^I click on \"([^\"]*)\" icon under attachment flex table$")
    public void clickOnRowLevelButton(String buttonName) {
        progressReportPage.clickRowLevelActionIconUnderAttachmentFlexTable(buttonName);
    }
}