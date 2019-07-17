package com.ggproduct.automation.pageobjects;

import java.util.Map;

import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.controller.Controller;
import eyethink.automation.bots.controller.CoreHandlers;
import io.cucumber.datatable.DataTable;

public class AnnouncementPage extends ProjectManager {
    public AnnouncementPage(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
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
