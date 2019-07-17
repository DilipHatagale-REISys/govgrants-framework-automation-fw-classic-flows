package com.ggproduct.automation.steps;

import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.pageobjects.AmendmentRequestPage;
import eyethink.automation.bots.controller.Controller;
import eyethink.automation.bots.controller.CoreHandlers;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;

public class AmendmentRequestSteps {
    AmendmentRequestPage amendmentRequestPage;

    public AmendmentRequestSteps(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        amendmentRequestPage = new AmendmentRequestPage(controller, handler, govgrants);
    }

    @Given("^I create Amendment Request from sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void creationOfAmendmentRequest(String sheetName, String excelFileName, DataTable dataTable) {
        amendmentRequestPage.creationOfAmendmentRequest(sheetName, excelFileName, dataTable);
    }

}
