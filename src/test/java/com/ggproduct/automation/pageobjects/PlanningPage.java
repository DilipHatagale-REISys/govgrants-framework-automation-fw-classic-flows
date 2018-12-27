package com.ggproduct.automation.pageobjects;

import java.util.Map;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;

import cucumber.api.DataTable;

public class PlanningPage extends ProjectManager {
    public PlanningPage(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
    }
    
    /**
     * Handles creation of a program record from the sheet in an excel
     * 
     * @param user
     * @param sheetName
     * @param excelFileName
     */
    public void creationOfPrrogram(String user, String sheetName, String excelFileName, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        loginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), user);
        navigateToTab(dataTableMap.get("Navigation").get("Step 2"));
        clickOnSidebar(dataTableMap.get("FlexTable").get("Step 1"), dataTableMap.get("Navigation").get("Step 3"));
        changeFlexTableView(dataTableMap.get("FlexTable").get("Step 3"));
        clickOnFlextableButton(dataTableMap.get("Creation").get("Step 1"),
                dataTableMap.get("FlexTable").get("Step 2"));
        enterFieldValues(sheetName, excelFileName);
        clickOnModalButton(dataTableMap.get("Creation").get("Step 2"));
        clickOnPageButton(dataTableMap.get("Creation").get("Step 3"));
    }
}
