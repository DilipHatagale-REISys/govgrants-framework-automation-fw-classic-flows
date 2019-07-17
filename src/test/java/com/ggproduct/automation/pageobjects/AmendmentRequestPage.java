package com.ggproduct.automation.pageobjects;

import java.util.Map;

import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.controller.Controller;
import eyethink.automation.bots.controller.CoreHandlers;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;

public class AmendmentRequestPage extends ProjectManager {
    public AmendmentRequestPage(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
    }

    @Given("^I create Amendment Request \"([^\"]*)\" from sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void creationOfAmendmentRequest(String sheetName, String excelFileName, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Sub tab").get("Step 1"));
        govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("Flextable").get("Step 2"),
                dataTableMap.get("Flextable").get("Step 1"));
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelFileName, sheetName);
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Buttons").get("Step 1"));
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Buttons").get("Step 2"));
    }

}
