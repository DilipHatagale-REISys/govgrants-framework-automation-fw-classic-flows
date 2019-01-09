package com.ggproduct.automation.pageobjects;

import java.util.Map;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;

import cucumber.api.DataTable;

public class AnnouncementPage extends ProjectManager {
    public AnnouncementPage(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
    }

    /**
     * Handles creation of an announcement from the sheet in an excel
     * 
     * @param AnnouncementType
     * @param user
     * @param sheetName
     * @param excelFileName
     */
    public void creationOfAnnouncement(String AnnouncementType, String user, String sheetName, String excelFileName,
            DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        govgrants.mainPage().loginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), user);
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 2"));
        govgrants.sideBar().getSideBarContent(dataTableMap.get("FlexTable").get("Step 1"), AnnouncementType);
        govgrants.phasePannel().clickDoubleArrowDropDownAndSelectItem(dataTableMap.get("FlexTable").get("Step 2"));
        if (AnnouncementType.equals("Competitive")) {
            govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("FlexTableId").get("Step 1"),
                    dataTableMap.get("Creation").get("Step 1"));
        } else if (AnnouncementType.equals("Directed")) {
            govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("FlexTableId").get("Step 2"),
                    dataTableMap.get("Creation").get("Step 1"));
        } else {
            govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("FlexTableId").get("Step 3"),
                    dataTableMap.get("Creation").get("Step 1"));
        }
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelFileName, sheetName);
        govgrants.modal().clickModalContentSpecificButton(dataTableMap.get("Creation").get("Step 2"));
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Creation").get("Step 3"));
    }

    /**
     * Handles addition of budget details to an announcement
     * 
     * @param budgetPeriod
     * @param sheetName
     * @param excelFileName
     */
    public void addBudgetPeriodToAnnouncement(String budgetPeriod, String sheetName, String excelFileName,
            DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Navigation").get("Step 1"));
        govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("Navigation").get("Step 3"),
                dataTableMap.get("Navigation").get("Step 2"));
        govgrants.flexTable().clickTableActionIcon(dataTableMap.get("Navigation").get("Step 3"),
                dataTableMap.get("Flextable").get("Step 1"), budgetPeriod);
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelFileName, sheetName);
        govgrants.modal().clickModalContentSpecificButton(dataTableMap.get("Flextable").get("Step 2"));
        govgrants.modal().closeModalByClickingTopRightCloseButton();
    }

}
