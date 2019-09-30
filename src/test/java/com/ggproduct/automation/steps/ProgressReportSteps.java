package com.ggproduct.automation.steps;

import com.ggproduct.automation.pageobjects.ProgressReportPage;
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
    @Then("^I see progress report table is getting updated with count \"([^\"]*)\" inside flextable with Id \"([^\"]*)\"$")
    public void iSeeProgressReportTableIsGettingUpdatedWithCountInsideFlextableWithId(String totalRecords, String tableID) {
        progressReportPage.verifyProgressReportSchedulesUpdated(totalRecords, tableID);
    }

    @Description("To verify toggle option is not present on flex table")
    @Then("^I cannot see toggle option \"([^\"]*)\" inside flex table id \"([^\"]*)\"$")
    public void iCannotSeeToggleOptionInsideFlexTableId(String anyItemToBeCheck, String flexTableId) {
        progressReportPage.assertToggleOptionNotDisplayed(anyItemToBeCheck, flexTableId);
    }

    @Description("To verify specified column values inside flex table")
    @Then("^I see all values \"([^\"]*)\" under column \"([^\"]*)\" inside flextable with id \"([^\"]*)\"$")
    public void iSeeAllValuesUnderColumnInsideFlextableWithId(String columnValue, String columnName, String flexTableId) {
        progressReportPage.verifyColumnValuesInFlexTable(columnValue, columnName, flexTableId);
    }

    @Description("To click on any hyperlink inside page details")
    @And("^I click on hyperlink containing value \"([^\"]*)\"$")
    public void iClickOnHyperlinkContainingValue(String linkName) {
        progressReportPage.clickOnLink(linkName);
    }

    @Description("To compare date field with todays date")
    @Then("I see field \"([^\"]*)\" is getting updated with todays date")
    public void iSeeFieldIsGettingUpdatedWithTodaysDate(String fieldLabel) {
        progressReportPage.compareDateFieldWithTodaysDate(fieldLabel);
    }

    @Description("To verify top right button on attachments flex table")
    @Then("^I cannot see top right button \"([^\"]*)\" for \"([^\"]*)\" flex table$")
    public void iCannotSeeTopRightButtonForFlexTable(String buttonName, String flextableHeaderName) {
        progressReportPage.assertTopRightButtonOnFlexTable(buttonName, flextableHeaderName);
    }

    @Description("To verify row level action button inside attachments flex table")
    @Then("^I cannot see row level action button \"([^\"]*)\" against Value \"([^\"]*)\" inside \"([^\"]*)\" flex table$")
    public void iCannotSeeRowLevelActionButtonAgainstValueInsideFlexTable(String buttonName, String uniqueValue, String flextableHeaderName) {
        progressReportPage.assertRowLevelActionButtonInsideFlexTable(buttonName, uniqueValue, flextableHeaderName);
    }

    @When("I download the attachment present in attachment table")
    public void iDownloadTheAttachmentPresentInAttachmentTable() {
        progressReportPage.downloadAttachment();
    }

    @Description("To verify reported date field contains todays date")
    @Then("^I see the Reported Date field contains todays date$")
    public void iSeeTheReportedDateFieldContainsTodaysDate() {
        progressReportPage.assertReportedDateField();
    }

    @Then("^I see field \"([^\"]*)\" is not editable$")
    public void iSeeFieldIsNotEditable(String fieldAPIName) {
        progressReportPage.assertFieldIsEditableOrNot(fieldAPIName);
    }

    @Description("To verify checkbox field is editable")
    @Then("^I see checkbox field \"([^\"]*)\" is editable$")
    public void iSeeCheckboxFieldIsEditable(String fieldAPIName) {
        progressReportPage.assertCheckBoxFieldIsEditable(fieldAPIName);
    }

    @Description("To verify radiobutton on approval decison box")
    @Then("^I (see|do not see) \"([^\"]*)\" option on approval decision box$")
    public void iDoNotSeeOptionOnApprovalDecisionBox(String seeornot,String radiobuttonOption) {
        if (seeornot.equals("see")){
            Assert.assertTrue(progressReportPage.isbuttonDisplayedOnApprovalDecisionBox(radiobuttonOption));
        } else {
            Assert.assertFalse(progressReportPage.isbuttonDisplayedOnApprovalDecisionBox(radiobuttonOption));
        }
    }

    @Description("To click on hyperlink containing some text + todays date")
    @And("I click on hyperlink for snapshot containing value {string}")
    public void iClickOnHyperlinkForSnapshotContainingValue(String linkName) {
        progressReportPage.clickOnHyperLink(linkName);
    }
}
