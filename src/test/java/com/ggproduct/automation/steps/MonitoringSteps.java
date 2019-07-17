package com.ggproduct.automation.steps;

import java.io.IOException;

import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.pageobjects.MonitoringPage;
import io.cucumber.java.en.*;
import io.cucumber.datatable.DataTable;
import eyethink.automation.bots.controller.Controller;
import eyethink.automation.bots.controller.CoreHandlers;

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
    public void creationOfAdhocPaymentRequest(String paymentRequestType, String sheetName, String excelName, DataTable dataTable) {
        monitoringPage.creationOfAdhocPaymentRequest(paymentRequestType, sheetName, excelName, dataTable);
    }

    @Given("^I create a closeout from sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void creationOfCloseoutRequest(String sheetName, String excelName, DataTable dataTable) {
        monitoringPage.creationOfCloseoutRequest(sheetName, excelName, dataTable);
    }
}
