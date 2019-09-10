package com.ggproduct.automation.steps;

import com.ggproduct.automation.pageobjects.ProgressReport;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import org.springframework.context.annotation.Description;

public class ProgressReportSteps {
    private ProgressReport progressReport;

    public ProgressReportSteps(ProgressReport progressReport) {
        this.progressReport = progressReport;
    }

    @Description("To verify progress report schedules getting updated")
    @Then("^I see progress report table is getting updated with count \"([^\"]*)\" inside flextable with Id \"([^\"]*)\"$")
    public void iSeeProgressReportTableIsGettingUpdatedWithCountInsideFlextableWithId(String totalRecords, String tableID) {
        progressReport.verifyProgressReportSchedulesUpdated(totalRecords, tableID);
    }

    @Description("To verify toggle option is not present on flex table")
    @Then("^I cannot see toggle option \"([^\"]*)\" inside flex table id \"([^\"]*)\"$")
    public void iCannotSeeToggleOptionInsideFlexTableId(String anyItemToBeCheck, String flexTableId) {
        progressReport.assertToggleOptionNotDisplayed(anyItemToBeCheck, flexTableId);
    }

    @Description("To verify specified column values inside flex table")
    @Then("^I see all values \"([^\"]*)\" under column \"([^\"]*)\" inside flextable with id \"([^\"]*)\"$")
    public void iSeeAllValuesUnderColumnInsideFlextableWithId(String columnValue, String columnName, String flexTableId) {
        progressReport.verifyColumnValuesInFlexTable(columnValue, columnName, flexTableId);
    }

    @Description("To click on any hyperlink inside page details")
    @And("^I click on hyperlink containing value \"([^\"]*)\"$")
    public void iClickOnHyperlinkContainingValue(String linkName) {
        progressReport.clickOnLink(linkName);
    }

    @Description("To compare date field with todays date")
    @Then("I see field \"([^\"]*)\" is getting updated with todays date")
    public void iSeeFieldIsGettingUpdatedWithTodaysDate(String fieldLabel) {
        progressReport.compareDateFieldWithTodaysDate(fieldLabel);
    }

    @Description("To verify top right button on attachments flex table")
    @Then("^I cannot see top right button \"([^\"]*)\" for \"([^\"]*)\" flex table$")
    public void iCannotSeeTopRightButtonForFlexTable(String buttonName, String flextableHeaderName) {
        progressReport.assertTopRightButtonOnFlexTable(buttonName, flextableHeaderName);
    }

    @Description("To verify row level action button inside attachments flex table")
    @Then("^I cannot see row level action button \"([^\"]*)\" against Value \"([^\"]*)\" inside \"([^\"]*)\" flex table$")
    public void iCannotSeeRowLevelActionButtonAgainstValueInsideFlexTable(String buttonName, String uniqueValue, String flextableHeaderName) {
        progressReport.assertRowLevelActionButtonInsideFlexTable(buttonName,uniqueValue,flextableHeaderName);
    }
}
