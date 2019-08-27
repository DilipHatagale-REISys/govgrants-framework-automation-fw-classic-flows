package com.ggproduct.automation.steps;

import com.ggproduct.automation.pageobjects.ProgressReport;
import io.cucumber.java.en.Then;

public class ProgressReportSteps {
    ProgressReport progressReport;

    public ProgressReportSteps(){
        this.progressReport = new ProgressReport();
    }

}
