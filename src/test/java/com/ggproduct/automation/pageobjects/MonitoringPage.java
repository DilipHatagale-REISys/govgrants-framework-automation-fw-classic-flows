package com.ggproduct.automation.pageobjects;

import java.io.IOException;
import java.util.Map;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;

import cucumber.api.DataTable;

public class MonitoringPage extends ProjectManager {
    public MonitoringPage(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
    }

    public void navigateToMonitoringRecord(String user, String recordName, String awardName, String awardId,
            DataTable dataTable) throws IOException {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        reloginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), user);
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 2"));
        govgrants.sideBar().getSideBarContent(dataTableMap.get("Left Panel").get("Step 2"),
                dataTableMap.get("Left Panel").get("Step 1"));
        expandGrid(awardName);
        expandGrid(awardName);
        govgrants.quickSearch().performEnhancedGridSearch(dataTableMap.get("FlexTable").get("Step 2"), awardId,
                recordName);
        govgrants.flexTable().clickTableActionIcons(dataTableMap.get("Button").get("Step 1"), recordName);
    }

    public void creationOfAdhocPaymentRequest(String paymentRequestType, String sheetName, String excelName,
            DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Navigation").get("Step 1"));
        if(paymentRequestType.equals("Reimbursement")) {
            govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("FlexTable").get("Step 1"),
                dataTableMap.get("Navigation").get("Step 2"));
        } else if(paymentRequestType.equals("Advance")) {
            govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("FlexTable").get("Step 1"),
                    dataTableMap.get("Navigation").get("Step 3"));
        }
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelName, sheetName);
        govgrants.modal().clickModalContentSpecificButton(dataTableMap.get("FlexTable").get("Step 2"));
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("FlexTable").get("Step 3"));
    }
}
