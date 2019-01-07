package com.ggproduct.automation.steps;

import java.io.IOException;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.pageobjects.MonitoringPage;

import cucumber.api.DataTable;
import cucumber.api.java.en.Given;

public class MonitoringSteps {
    MonitoringPage monitoringPage;

    public MonitoringSteps(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        monitoringPage = new MonitoringPage(controller, handler, govgrants);
    }
    
    @Given("^I re-login as \"([^\"]*)\" to view the monitoring record \"([^\"]*)\" for the award \"([^\"]*)\" with Id \"([^\"]*)\"$")
    public void navigateToMonitoringRecord(String user, String recordName, String awardName, String awardId, DataTable dataTable) throws IOException {
        monitoringPage.navigateToMonitoringRecord(user, recordName, awardName, awardId, dataTable);
    }
    
    @Given("^I create a adhoc \"([^\"]*)\" Payment Request from sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void creationOfAdhocPaymentRequest(String paymentRequestType, String sheetName, String excelName,  DataTable dataTable) {
        monitoringPage.creationOfAdhocPaymentRequest(paymentRequestType, sheetName, excelName, dataTable);
    }
}
