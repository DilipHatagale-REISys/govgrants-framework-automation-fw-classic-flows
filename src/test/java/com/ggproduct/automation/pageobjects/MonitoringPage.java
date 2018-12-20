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
        navigateToTab(dataTableMap.get("Navigation").get("Step 2"));
        clickOnSidebar(dataTableMap.get("Left Panel").get("Step 1"), dataTableMap.get("Left Panel").get("Step 2"));
        expandGrid(awardName);
        expandGrid(awardName);
        quickSearchOnGridTable(dataTableMap.get("FlexTable").get("Step 2"), awardId, recordName);
        clickOnFlexTableIcon(dataTableMap.get("Button").get("Step 1"), recordName);
    }
}
