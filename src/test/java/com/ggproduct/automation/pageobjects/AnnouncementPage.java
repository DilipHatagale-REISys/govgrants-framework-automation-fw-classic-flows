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
        loginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), user);
        navigateToTab(dataTableMap.get("Navigation").get("Step 2"));
        clickOnSidebar(AnnouncementType, dataTableMap.get("FlexTable").get("Step 1"));
        changeFlexTableView(dataTableMap.get("FlexTable").get("Step 2"));
        if (AnnouncementType.equals("Competitive")) {
            clickOnPhaseFlexTableButton(dataTableMap.get("Creation").get("Step 1"),
                    dataTableMap.get("FlexTableId").get("Step 1"));
        } else if (AnnouncementType.equals("Directed")) {
            clickOnPhaseFlexTableButton(dataTableMap.get("Creation").get("Step 1"), dataTableMap.get("FlexTableId").get("Step 2"));
        } else {
            clickOnPhaseFlexTableButton(dataTableMap.get("Creation").get("Step 1"),
                    dataTableMap.get("FlexTableId").get("Step 3"));
        }
        enterFieldValues(sheetName, excelFileName);
        clickOnModalButton(dataTableMap.get("Creation").get("Step 2"));
        clickOnPageButton(dataTableMap.get("Creation").get("Step 3"));
    }

    /**
     * Handles associating an agency in case of directed announcement
     * 
     * @param agency
     */
    public void associateAgencyToAnnouncement(String agency) {
        clickOnSubtab("Overview");
        clickOnFlextableButton("Add Organizations",
                "inlineEditGridFormulaGrantsAwardOrganizations");
        chooseRecordForAssociation("Add", agency, "SoleSourceAwardRecipientsTable");
        closeModal();
    }

    /**
     * Handles associating an agency and filling the amount in case of formula
     * announcement
     * 
     * @param agency
     * @param amount
     */
    public void associateAgencyAmountToAnnouncement(String agency, DataTable rowValues) {
        associateAgencyToAnnouncement(agency);
        fillFieldsForInlineTable("inlineEditGridSoleSourceAwardOrganizations", "Edit", rowValues);
    }

    /**
     * Handles addition of funding account to an announcement
     * 
     * @param fundingAccount
     * @param amount
     */
    public void addFundingAccountToAnnouncement(String fundingAccount, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        DataTable inlineEditDataTable = seperateInlineDataTable(dataTableMap);
        clickOnSubtab(dataTableMap.get("Navigation").get("Step 1"));
        clickOnFlextableButton(dataTableMap.get("FlexTable").get("Step 1"), dataTableMap.get("FlexTable").get("Step 2"));
        chooseRecordForAssociation(dataTableMap.get("Funding Account").get("Step 1"), dataTableMap.get("Funding Account").get("Step 2"), fundingAccount.split(","));
        closeModal();
        fillFieldsForInlineTable(dataTableMap.get("FlexTable").get("Step 2"), dataTableMap.get("Button").get("Step 1"), inlineEditDataTable);
    }

    /**
     * Handles addition of budget details to an announcement
     * 
     * @param budgetPeriod
     * @param sheetName
     * @param excelFileName
     */
    public void addBudgetPeriodToAnnouncement(String budgetPeriod, String sheetName, String excelFileName, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        clickOnSubtab(dataTableMap.get("Navigation").get("Step 1"));
        clickOnFlextableButton(dataTableMap.get("Navigation").get("Step 2"), dataTableMap.get("Navigation").get("Step 3"));
        clickOnFlextableRowButton(dataTableMap.get("Navigation").get("Step 3"),dataTableMap.get("Flextable").get("Step 1"), budgetPeriod);
        enterFieldValues(sheetName, excelFileName);
        clickOnModalButton(dataTableMap.get("Flextable").get("Step 2"));
        closeModal();
    }

   
   
}
