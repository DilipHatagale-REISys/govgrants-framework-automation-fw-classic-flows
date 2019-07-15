package com.ggproduct.automation.pageobjects;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;

import cucumber.api.DataTable;
import eyethink.automation.bots.controller.Controller;
import eyethink.automation.bots.controller.CoreHandlers;
import eyethink.automation.bots.exception.EyeThinkBotsCustomException;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.testng.Assert;

public class AwardPage extends ProjectManager {
    public AwardPage(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
    }

    /**
     * Handles creation of a Grant record from the sheet in an excel
     *
     * @param user
     * @param sheetName
     * @param excelFileName
     */
    public void creationOfStanAloneGrant(String user, String sheetName, String excelFileName, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        govgrants.mainPage().loginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), user);
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 2"));
        govgrants.sideBar().getSideBarContent(dataTableMap.get("Navigation").get("Step 3"),
                dataTableMap.get("FlexTable").get("Step 1")).click();
        govgrants.phasePannel().clickDoubleArrowDropDownAndSelectItem(dataTableMap.get("FlexTable").get("Step 3"));
        govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("FlexTable").get("Step 2"),
                dataTableMap.get("Creation").get("Step 1"));
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelFileName, sheetName);
        govgrants.modal().clickModalContentSpecificButton(dataTableMap.get("Creation").get("Step 2"));
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Creation").get("Step 3"));
    }

    /**
     * Handles creation of Award from FDM
     *
     * @param announcementName
     * @param applicationName
     */
    public void creationOfAwardFromFDM(String announcementName, String applicationName, String User,
                                       DataTable dataTable) throws EyeThinkBotsCustomException {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        govgrants.mainPage().loginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), User);
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 2"));
        govgrants.sideBar().getSideBarContent(dataTableMap.get("Navigation").get("Step 3"),
                dataTableMap.get("Navigation").get("Step 4")).click();
        govgrants.phasePannel().clickDoubleArrowDropDownAndSelectItem(dataTableMap.get("FlexTable").get("Step 3"));
        govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("FlexTable").get("Step 1"),
                announcementName);
        govgrants.flexTable().clickTableActionIcons(dataTableMap.get("FlexTable").get("Step 2"), announcementName);
        govgrants.flexTable().clickTableActionIcon(dataTableMap.get("FlexTable").get("Step 4"),
                dataTableMap.get("Buttons").get("Step 1"), applicationName);
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
        try {
            govgrants.flexTable().clickTableActionIcon(dataTableMap.get("Creation").get("Step 2"), dataTableMap.get("Creation").get("Step 3"), dataTableMap.get("Creation").get("Step 5"));
        } catch (Exception ex) {
            govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("Creation").get("Step 2"), dataTableMap.get("Creation").get("Step 3"));
        }
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelName, sheetName);
        govgrants.modal().clickModalContentSpecificButton(dataTableMap.get("Creation").get("Step 4"));
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
            throws IOException, EyeThinkBotsCustomException {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        govgrants.mainPage().reloginToggleToAppInNewPortal(dataTableMap.get("Login").get("Step 1"), subrecipientUser,
                dataTableMap.get("Login").get("Step 2"));
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 1"));
        govgrants.sideBar().getSideBarContent(dataTableMap.get("Navigation").get("Step 3"),
                dataTableMap.get("Navigation").get("Step 2")).click();
        if (awardName.equalsIgnoreCase("Record Id")) {
            govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("Navigation").get("Step 4"),
                    govgrants.pageDetails().idOfRecord);
            govgrants.flexTable().clickTableActionIcons(dataTableMap.get("Acceptance").get("Step 1"),
                    govgrants.pageDetails().idOfRecord);
        } else {
            govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("Navigation").get("Step 4"),
                    awardName);
            govgrants.flexTable().clickTableActionIcons(dataTableMap.get("Acceptance").get("Step 1"), awardName);
        }
        try {
            govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Acceptance").get("Step 2"));
        } catch (Exception ex) {
            govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Acceptance").get("Step 3"));
        }
        enteringCommentsOnConfirmation(comments, dataTableMap.get("Acceptance").get("Step 4"));
    }

    /**
     * To get the count of row values checked for field available in flex table
     * @param fieldName - Field API name
     * @return
     */
    private int getCheckedFieldValueCount(String fieldName){
        reiDriver.WaitFor().magicWait(By.xpath("//field[@field-name='"+fieldName+"']/i[contains(@class,'fa-check')]"));
        List<WebElement> checkSymbol = reiDriver.findMyElement().getElements(By.xpath("//field[@field-name='"+fieldName+"']/i[contains(@class,'fa-check')]"));
        return checkSymbol.size();
    }

    public void AssertFieldValueIsChecked(String fieldName,String count){
        Assert.assertEquals(Integer.parseInt(count),getCheckedFieldValueCount(fieldName));
    }


}
