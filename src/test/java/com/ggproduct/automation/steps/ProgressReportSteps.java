package com.ggproduct.automation.steps;

import com.ggproduct.automation.pageobjects.ProgressReport;
import io.cucumber.java.en.Then;
import org.springframework.context.annotation.Description;

public class ProgressReportSteps {
    private ProgressReport progressReport;

    public ProgressReportSteps(ProgressReport progressReport){
        this.progressReport = progressReport;
    }

    @Description("To verify total records available under flex table")
    @Then("^I see progress report table is getting updated with count \"([^\"]*)\" inside flextable with Id \"([^\"]*)\"$")
    public void iSeeProgressReportTableIsGettingUpdatedWithCountInsideFlextableWithId(String totalRecords, String tableID) {
        progressReport.verifyProgressReportSchedulesUpdated(totalRecords,tableID);
    }

    @Description("To verify toggle optin is not present on flex table")
    @Then("^I cannot see toggle option \"([^\"]*)\" inside flex table id \"([^\"]*)\"$")
    public void iCannotSeeToggleOptionInsideFlexTableId(String anyItemToBeCheck, String flexTableId) {
        progressReport.assertToggleOptionNotDisplayed(anyItemToBeCheck,flexTableId);
    }

    @Description("To verify specified column values inside flex table")
    @Then("^I see all values \"([^\"]*)\" under column \"([^\"]*)\" inside flextable with id \"([^\"]*)\"$")
    public void iSeeAllValuesUnderColumnInsideFlextableWithId(String columnValue, String columnName, String flexTableId) {
        progressReport.verifyColumnValuesInFlexTable(columnValue,columnName,flexTableId);
    }
}
