package com.ggproduct.automation.pageobjects;

import java.io.IOException;

import java.util.Map;
import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;
import cucumber.api.DataTable;

public class ApplicationPage extends ProjectManager {
    public ApplicationPage(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
    }

    /**
     * Handles qualifying an announcement
     * 
     * @param announcementName
     * @param user
     */
    public void qualifyAnnouncement(String announcementName, String user, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        loginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), user);
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 2"));
        clickOnSidebar(dataTableMap.get("Navigation").get("Step 3"), dataTableMap.get("Navigation").get("Step 4"));
        govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("FlexTable").get("Step 1"), announcementName);
        govgrants.flexTable().clickTableActionIcons(dataTableMap.get("FlexTable").get("Step 2"), announcementName);
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("FlexTable").get("Step 3"));
    }

    /**
     * Handles creation of an application
     * 
     * @param sheetName
     * @param excelFileName
     */
    public void applicationCreation(String sheetName, String excelFileName, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Creation").get("Step 1"));
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelFileName, sheetName);
        govgrants.modal().clickModalContentSpecificButton(dataTableMap.get("Creation").get("Step 2"));
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Creation").get("Step 3"));
    }

    /**
     * Handles addition of focus area for an application
     * 
     * @param focusArea
     */
    public void additionOfFocusAreaToApplication(DataTable dataTable, String... focusArea) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Navigation").get("Step 1"));
        govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("Navigation").get("Step 3"),
                dataTableMap.get("Navigation").get("Step 2"));
        chooseRecordForAssociation(dataTableMap.get("FlexTable").get("Step 1"),
                dataTableMap.get("FlexTable").get("Step 2"), focusArea);
        reiDriver.switchTo().switchToParentFrame();
    }

    /**
     * Handles addition of budget details to an application
     * 
     * @param awardBudget
     * @param cashMatch
     * @param nonCashMatch
     */
    public void additionOfBudgetToApplication(DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        DataTable inlineEditDataTable = seperateInlineDataTable(dataTableMap);
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Navigation").get("Step 1"));
        expandGrid(dataTableMap.get("Navigation").get("Step 2"));
        expandGrid(dataTableMap.get("Navigation").get("Step 3"));
        govgrants.flexTable().editFlexTableRowsInline(dataTableMap.get("FlexTable").get("Step 1"),
                dataTableMap.get("FlexTable").get("Step 2"), inlineEditDataTable);
    }

    /**
     * Handles addition of target values to a KPI in an application
     * 
     * @param target
     */
    public void additionOfTargetToKPIInApplication(DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        DataTable inlineEditDataTable = seperateInlineDataTable(dataTableMap);
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Navigation").get("Step 1"));
        govgrants.flexTable().editFlexTableRowsInline(dataTableMap.get("FlexTable").get("Step 1"),
                dataTableMap.get("FlexTable").get("Step 2"), inlineEditDataTable);
    }

    /**
     * Handles completion of one review process by clicking on Promote to Next step
     * button for the passed application
     * 
     * @param reviewStep
     * @param applicationName
     * @param announcementOwner
     * @param announcementName
     * @throws IOException
     */
    public void completeReviewStepForApplication(String reviewStep, String buttonName, String applicationName,
            String announcementOwner, String announcementName, DataTable dataTable) throws IOException {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        try {
            loginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), announcementOwner);
        } catch (Exception ex) {
            reloginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), announcementOwner);
        }
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 2"));
        clickOnSidebar(dataTableMap.get("Navigation").get("Step 3"), dataTableMap.get("Navigation").get("Step 4"));
        changeFlexTableView(dataTableMap.get("FlexTable").get("Step 1"));
        govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("FlexTable").get("Step 2"),
                announcementName);
        govgrants.flexTable().clickTableActionIcons(dataTableMap.get("FlexTable").get("Step 3"), announcementName);
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("FlexTable").get("Step 4"));
        scrollToSection(dataTableMap.get("Review").get("Step 2"));
        govgrants.flexTable().clickTableActionIcon(dataTableMap.get("Review").get("Step 1"),
                dataTableMap.get("Review").get("Step 3"), reviewStep);
        clickOnMultipleCheckbox(dataTableMap.get("Promotion").get("Step 1"), applicationName);
        govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("Promotion").get("Step 1"), buttonName);
        try {
            clickOnConfirmationtBox(dataTableMap.get("Promotion").get("Step 2"));
        } catch (Exception e) {

        }
    }

    /**
     * Handles entering of due date for SME review
     * 
     * @param dueInDays
     */
    public void enterDueInDays(String flexTableId, String iconName, DataTable rowValues) {
        govgrants.flexTable().editFlexTableRowsInline(flexTableId, iconName, rowValues);
    }

    /**
     * Handles assigning of given application to the reviewer
     * 
     * @param applicationName
     */
    public void assignApplicationToReviewer(String applicationName, String noOfReviewers, DataTable dataTable,
            String... reviewer) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        int numberOfReviewers = Integer.parseInt(noOfReviewers);
        for (int i = 1; i <= numberOfReviewers; i++) {
            singleApplicationAssignmentToReviewer(i, applicationName, reviewer[i - 1], dataTableMap);
        }
    }

    /**
     * Handles choosing and sending the review records for review
     */
    public void chooseAndSendReviews(DataTable dataTable, String... reviews) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        clickOnMultipleCheckbox(dataTableMap.get("FlexTable").get("Step 1"), reviews);
        govgrants.flexTable().clickTableTopRightButton(dataTableMap.get("FlexTable").get("Step 1"),
                dataTableMap.get("FlexTable").get("Step 2"));
    }

    /**
     * Handles completing review form as a reviewer in SME review
     * 
     * @throws IOException
     */
    public void completeReviewForm(String noOfReviewers, DataTable dataTable, String... reviewers) throws IOException {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        int numberOfReviewers = Integer.parseInt(noOfReviewers);
        for (int i = 1; i <= numberOfReviewers; i++) {
            singleReviewFormCompletion(reviewers[i - 1], dataTableMap);
        }
    }

    /**
     * Handles entering the given value in Subaward Abbreviation in FDM
     * 
     * @param value
     */
    public void enterSubAwardAbbreviationFDM(String value, DataTable dataTable) {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Field").get("Step 1"));
        govgrants.inputForms().inputFormDataByFieldApiName(dataTableMap.get("Field").get("Step 2"), value);
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Field").get("Step 3"));
    }

    /**
     * Handles entering of recommendation for the given application in FDM
     * 
     * @param recommendation
     * @param budget
     * @param applicationName
     * @param flextableName
     */
    public void enterRecommendationFDM(String flexTableId, String iconName, DataTable dataTable) {
        govgrants.flexTable().editFlexTableRowsInline(flexTableId, iconName, dataTable);
    }

    private void singleApplicationAssignmentToReviewer(int qNumber, String applicationName, String reviewer,
            Map<String, Map<String, String>> dataTableMap) {
        expandGrid(dataTableMap.get("Review").get("Step " + qNumber));
        govgrants.flexTable().clickTableActionIcon(dataTableMap.get("FlexTable").get("Step 2"),
                dataTableMap.get("FlexTable").get("Step 1"), reviewer);
        chooseRecordForAssociation(dataTableMap.get("Application").get("Step 1"), applicationName,
                dataTableMap.get("Application").get("Step 2"));
        reiDriver.switchTo().switchToParentFrame();
    }

    private void singleReviewFormCompletion(String reviewer, Map<String, Map<String, String>> dataTableMap)
            throws IOException {
        reloginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), reviewer);
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 2"));
        clickOnSidebar(dataTableMap.get("Navigation").get("Step 3"), dataTableMap.get("Navigation").get("Step 4"));
        govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("FlexTable").get("Step 2"),
                dataTableMap.get("FlexTable").get("Step 1"));
        govgrants.flexTable().clickTableActionIcons(dataTableMap.get("FlexTable").get("Step 3"),
                dataTableMap.get("FlexTable").get("Step 1"));
        govgrants.inputForms().completeFillingReviewForm();
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Button").get("Step 1"));
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Button").get("Step 2"));
    }
}
