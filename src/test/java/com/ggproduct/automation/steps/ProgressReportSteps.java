package com.ggproduct.automation.steps;

import com.ggproduct.automation.pageobjects.ProgressReportPage;
import eyethink.automation.bots.Register.EyeThink;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.By;
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

    @Description("To click on any hyperlink inside page details")
    @And("^I click on hyperlink containing value \"([^\"]*)\"$")
    public void iClickOnHyperlinkContainingValue(String linkName) {
        progressReportPage.clickOnLink(linkName);
    }

    @And("^I click on Link containing value \"([^\"]*)\" in flex table id \"([^\"]*)\"$")
    public void clickOnLink(String linkText, String tableId) {
        EyeThink.core().click().on(By.xpath("//*[@id='"+tableId+"']//a[contains(text(),'"+linkText+"')]"));
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

    @Description("To verify reported date field contains todays date")
    @Then("^I (softly see|see) the Reported Date field contains todays date$")
    public void iSeeTheReportedDateFieldContainsTodaysDate(String usage) {
        progressReportPage.assertReportedDateField(usage.contains("softly"));
    }

    @Then("^I (softly see|see) field \"([^\"]*)\" is not editable$")
    public void iSeeFieldIsNotEditable(String usage, String fieldAPIName) {
        progressReportPage.assertFieldIsEditableOrNot(fieldAPIName, usage.contains("softly"));
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
            EyeThink.core().assertion().assertThat(progressReportPage.isbuttonDisplayedOnApprovalDecisionBox(radiobuttonOption)).isTrue();
        } else if (seeornot.equalsIgnoreCase("softly do not see")) {
            EyeThink.core().assertion().assertThat(progressReportPage.isbuttonDisplayedOnApprovalDecisionBox(radiobuttonOption)).isFalse();
        }
    }

    @Description("To click on hyperlink containing some text + todays date")
    @And("I click on hyperlink which contains todays date with text {string}")
    public void iClickOnHyperlinkForSnapshotContainingValue(String linkName) {
        progressReportPage.clickOnHyperLinkContainingDate(linkName);
    }

    @Description("To compare two saved values")
    @Then("^I (see|softly see) value \"([^\"]*)\" is \"([^\"]*)\" the value \"([^\"]*)\"$")
    public void iSeeValueIsTheValue(String usage, String savedValue1, String compare, String savedValue2) {
        if (usage.contains("softly")) {
            EyeThink.core().assertion().assertThat(progressReportPage.compareTwoFieldValues(savedValue1, compare, savedValue2)).isTrue();
        } else {
            Assert.assertTrue(progressReportPage.compareTwoFieldValues(savedValue1, compare, savedValue2));
        }
    }

    @When("^I click on \"([^\"]*)\" icon under attachment flex table$")
    public void clickOnRowLevelButton(String buttonName) {
        progressReportPage.clickRowLevelActionIconUnderAttachmentFlexTable(buttonName);
    }
}
