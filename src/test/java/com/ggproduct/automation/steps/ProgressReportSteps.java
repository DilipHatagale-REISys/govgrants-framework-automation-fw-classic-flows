package com.ggproduct.automation.steps;

import com.ggproduct.automation.pageobjects.ProgressReport;
import io.cucumber.java.en.Then;

public class ProgressReportSteps {
    private ProgressReport progressReport;

    public ProgressReportSteps(ProgressReport progressReport){
        this.progressReport = progressReport;
    }

    @Then("I see progress report table is getting updated")
    public void iSeeProgressReportTableIsGettingUpdated() {
        progressReport.verifyProgressReportSchedulesUpdated();
    }
}
