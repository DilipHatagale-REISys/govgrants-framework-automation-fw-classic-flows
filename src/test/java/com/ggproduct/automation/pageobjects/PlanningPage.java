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
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 2"));
        govgrants.sideBar().getSideBarContent(dataTableMap.get("Navigation").get("Step 3"), dataTableMap.get("FlexTable").get("Step 1"));
        changeFlexTableView(dataTableMap.get("FlexTable").get("Step 3"));
        govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("FlexTable").get("Step 2"),
                dataTableMap.get("Creation").get("Step 1"));
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelFileName, sheetName);
        govgrants.modal().clickModalContentSpecificButton(dataTableMap.get("Creation").get("Step 2"));
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Creation").get("Step 3"));
    }
}
