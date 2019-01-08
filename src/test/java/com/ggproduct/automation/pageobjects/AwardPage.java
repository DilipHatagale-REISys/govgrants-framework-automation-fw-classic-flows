package com.ggproduct.automation.pageobjects;

import com.automation.rei.controller.Controller;
import java.io.IOException;
import java.util.Map;

import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;

import cucumber.api.DataTable;

public class AwardPage extends ProjectManager {
    public AwardPage(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
    }

    /**
     * Handles creation of Award from FDM
     * 
     * @param announcementName
     * @param applicationName
     */
    public void creationOfAward(String announcementName, String applicationName, String User, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        govgrants.mainPage().loginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), User);
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 2"));
        govgrants.sideBar().getSideBarContent(dataTableMap.get("Navigation").get("Step 3"),
                dataTableMap.get("Navigation").get("Step 4"));
        govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("FlexTable").get("Step 1"), announcementName);
        govgrants.flexTable().clickTableActionIcons(dataTableMap.get("FlexTable").get("Step 2"), announcementName);
        govgrants.flexTable().clickTableActionIcon(dataTableMap.get("FlexTable").get("Step 3"), applicationName, dataTableMap.get("FlexTable").get("Step 4"));
        govgrants.modal().handleModalAlert(dataTableMap.get("Buttons").get("Step 1"));
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Buttons").get("Step 2"));
    }

    /**
     * Handles edition of budget grid in an award
     * 
     * @param lineItem
     * @param rowValues
     */
    public void budgetEditionForAward(String lineItem, DataTable rowValues) {
        govgrants.pageDetails().clickSubTabsInsideTableView("Budget");
        govgrants.flexTable().clickTableActionIcon("Add Line Items", lineItem, "Award Budget");
        govgrants.flexTable().editFlexTableRowsInline("inlineEditGridLineItem", "Edit", rowValues);
        govgrants.modal().closeModalByClickingTopRightCloseButton();
    }

    /**
     * Handles creation of Risk Assessment to an award
     * 
     * @param sheetName
     * @param excelName
     */
    public void creationOfMonitoringRecord(String sheetName, String excelName, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Creation").get("Step 1"));
        govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("Creation").get("Step 2"),
                dataTableMap.get("Creation").get("Step 3"));
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelName, sheetName);
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Creation").get("Step 4"));
    }

    /**
     * Handles acceptance of Award by subrecipient before award approval
     * 
     * @param subrecipientUser
     * @param awardName
     * @param comments
     * @throws IOException
     */
    public void acceptanceOfAward(String subrecipientUser, String awardName, String comments, DataTable dataTable)
            throws IOException {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        govgrants.mainPage().reloginToggleToAppInURL(dataTableMap.get("Login").get("Step 1"), subrecipientUser, dataTableMap.get("Login").get("Step 2"));
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 1"));
        govgrants.sideBar().getSideBarContent(dataTableMap.get("Navigation").get("Step 3"),
                dataTableMap.get("Navigation").get("Step 2"));
        govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("Navigation").get("Step 4"),
                awardName);
        govgrants.flexTable().clickTableActionIcons(dataTableMap.get("Acceptance").get("Step 1"), awardName);
        try {
            govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Acceptance").get("Step 2"));
        } catch (Exception ex) {
            govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Acceptance").get("Step 3"));
        }
        enteringCommentsOnConfirmation(comments, dataTableMap.get("Acceptance").get("Step 4"));
    }
}
