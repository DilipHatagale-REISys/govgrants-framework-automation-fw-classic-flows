package com.ggproduct.automation.pageobjects;

import java.io.IOException;
import java.util.Map;

import com.automation.rei.controller.Controller;
import com.automation.rei.corelib.Properties_Logs;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;
import com.ggproduct.automation.projectmanager.UsersAndURL;

import cucumber.api.DataTable;

public class DefaultPage extends ProjectManager {
    public CoreHandlers reiDriver;
    public GovGrantsHandler govgrants;
    public final String defaultPassword = "SALESFORCE2018";
    public final String defaultLongText = "Automation test description";

    public DefaultPage(Controller controller, CoreHandlers reiDriver, GovGrantsHandler govgrants) {
        super(controller, reiDriver, govgrants);
        this.reiDriver = reiDriver;
        this.govgrants = govgrants;
    }

    /**
     * Performs login and toggles app
     * 
     * @param appName
     * @param userName
     */
    public void loginToggleToApp(String appName, String userName) {
        login(userName);
        govgrants.mainPage().setUpCustomAppDropDown(appName);
    }

    /**
     * Handles re-logging as a different user and toggling to the app specified
     * 
     * @param appName
     * @param userName
     * @throws IOException
     */
    public void reloginToggleToApp(String appName, String userName) throws IOException {
        reloginAsDifferentUser(userName);
        govgrants.mainPage().setUpCustomAppDropDown(appName);
    }

    /**
     * Handles re-logging as a different user and toggling to the app specified
     * 
     * @param appName
     * @param userName
     * @throws IOException
     */
    public void reloginToggleToAppInURL(String appName, String userName, String env) throws IOException {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.WaitFor().makeThreadSleep(1000);
        govgrants.mainPage().clickLoginDropDown();
        govgrants.mainPage().getLoginDropDownItems("Logout").click();
        reiDriver.eatCookies().deleteAllCookies();
        reiDriver.WaitFor().makeThreadSleep(500);
        reiDriver.get().navigateToUrl(new Properties_Logs().ReadPropertyFile("environment.properties", env));
        govgrants.mainPage().login(new UsersAndURL().handleUsersForEnv(userName),
                new Properties_Logs().ReadPropertyFile("environment.properties", "DEFAULTPASSWORD"));
        govgrants.mainPage().waitForEgmsHeader();
        govgrants.mainPage().setUpCustomAppDropDown(appName);
    }

    /**
     * Handles reviewing the announcement and completing the review process for an
     * announcement
     * 
     * @param reviewer
     * @param announcementType
     * @param announcementName
     * @param announcementOwner
     * @throws IOException
     */
    public void completePeerReview(String reviewer, String recordName, DataTable dataTable) throws IOException {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        reloginToggleToApp(dataTableMap.get("Reviewer Navigation").get("Step 1"), reviewer);
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Reviewer Navigation").get("Step 2"));
        govgrants.sideBar().getSideBarContent(dataTableMap.get("Reviewer Navigation").get("Step 4"),
                dataTableMap.get("Reviewer Navigation").get("Step 3"));
        govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("FlexTable").get("Step 1"),
                recordName);
        govgrants.flexTable().clickTableActionIcons(dataTableMap.get("FlexTable").get("Step 2"), recordName);
        govgrants.flexTable().clickTableActionIcon(dataTableMap.get("FlexTable").get("Step 3"),
                dataTableMap.get("FlexTable").get("Step 4"), dataTableMap.get("Enter Review").get("Step 1"));
        enterReview(dataTableMap.get("Enter Review").get("Step 2"));
        govgrants.modal().clickModalContentSpecificButton(dataTableMap.get("Enter Review").get("Step 3"));
        govgrants.modal().clickModalContentSpecificButton(dataTableMap.get("Enter Review").get("Step 4"));
        closeModal();
    }

    /**
     * Handles approving of any record by all approvers
     * 
     * @param programApprover
     * @param fiscalApprover
     * @param executiveApprover
     * @param announcementName
     * @throws IOException
     */
    public void approversApproveRecord(String noOfApprovers, String recordName, DataTable dataTable,
            String... approvers) throws IOException {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        int numberOfApprovers = Integer.parseInt(noOfApprovers);
        for (int i = 1; i <= numberOfApprovers; i++) {
            singleApproverApproval(recordName, approvers[i - 1], dataTableMap);
        }
    }

    public void reloginToViewRecord(String recordName, String recordOwner, DataTable dataTable) throws IOException {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        reloginToggleToApp(dataTableMap.get("Owner Navigation").get("Step 1"), recordOwner);
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Owner Navigation").get("Step 2"));
        govgrants.sideBar().getSideBarContent(dataTableMap.get("Owner Navigation").get("Step 4"),
                dataTableMap.get("Owner Navigation").get("Step 3"));
        changeFlexTableView(dataTableMap.get("Complete Review").get("Step 1"));
        govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("Complete Review").get("Step 2"),
                recordName);
        govgrants.flexTable().clickTableActionIcons(dataTableMap.get("Complete Review").get("Step 3"), recordName);
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Complete Review").get("Step 4"));
    }

    /**
     * Handles re-logging in and to view the given award
     * 
     * @param awardId
     * @param awardName
     * @param awardOwner
     * @throws IOException
     */
    public void reloginToViewAward(String awardState, String awardId, String awardName, String awardOwner,
            DataTable dataTable) throws IOException {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        try {
            loginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), awardOwner);
        } catch (Exception ex) {
            reloginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), awardOwner);
        }
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 2"));
        govgrants.sideBar().getSideBarContent(dataTableMap.get("Navigation").get("Step 4"),
                dataTableMap.get("Navigation").get("Step 3"));
        changeFlexTableView(awardState + " " + dataTableMap.get("FlexTable").get("Step 1"));
        govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("FlexTable").get("Step 2"), awardName);
        govgrants.flexTable().clickTableActionIcons(dataTableMap.get("FlexTable").get("Step 3"), awardName);
        govgrants.pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Subaward").get("Step 1"));
        govgrants.flexTable().clickTableActionIcon(dataTableMap.get("Subaward").get("Step 2"),
                dataTableMap.get("Subaward").get("Step 2"), awardId);
    }

    /**
     * Handles logging in as specified subrecipient and checking for task
     * 
     * @param subrecipient
     * @param uniqueColumnValue
     * @param dataTable
     * @throws IOException
     */
    public void subrecipientTask(String subrecipient, String uniqueColumnValue, DataTable dataTable)
            throws IOException {
        Map<String, Map<String, String>> dataTableMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        reloginToGrantsPortal(subrecipient);
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 1"));
        govgrants.sideBar().getSideBarContent(dataTableMap.get("Left Panel").get("Step 2"),
                dataTableMap.get("Left Panel").get("Step 1"));
        govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("FlexTable").get("Step 1"),
                uniqueColumnValue);
        govgrants.flexTable().clickTableActionIcons(dataTableMap.get("FlexTable").get("Step 2"), uniqueColumnValue);
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

    /******* "Local Methods with Limited functionality " **********/

    private void login(String userName) {
        govgrants.mainPage().login(new UsersAndURL().handleUsersForEnv(userName), defaultPassword);
    }

    private void enterReview(String rating) {
        govgrants.inputForms().inputFormDataByFieldApiName("fieldRating__c", rating);
        govgrants.inputForms().inputFormDataByFieldApiName("ReviewComments__c", "Automation Reviewer comments");
    }

    private void reloginAsDifferentUser(String userName) throws IOException {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.WaitFor().makeThreadSleep(1000);
        govgrants.mainPage().clickLoginDropDown();
        govgrants.mainPage().getLoginDropDownItems("Logout").click();
        reiDriver.eatCookies().deleteAllCookies();
        reiDriver.WaitFor().makeThreadSleep(500);
        navigateToURL("PRODUCT PORTAL");
        govgrants.mainPage().login(new UsersAndURL().handleUsersForEnv(userName), defaultPassword);
        govgrants.mainPage().waitForEgmsHeader();
    }

    private void singleApproverApproval(String recordName, String approver,
            Map<String, Map<String, String>> dataTableMap) throws IOException {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reloginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), approver);
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 2"));
        govgrants.sideBar().getSideBarContent(dataTableMap.get("FlexTable").get("Step 2"),
                dataTableMap.get("FlexTable").get("Step 1"));
        govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("FlexTable").get("Step 3"),
                recordName);
        govgrants.flexTable().clickTableActionIcons(dataTableMap.get("Approval").get("Step 1"), recordName);
        clickOnApprovalDecisionBox(dataTableMap.get("Approval").get("Step 2"));
    }

    private void singleReviewFormCompletion(String reviewer, Map<String, Map<String, String>> dataTableMap)
            throws IOException {
        reloginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), reviewer);
        govgrants.mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 2"));
        govgrants.sideBar().getSideBarContent(dataTableMap.get("Navigation").get("Step 4"),
                dataTableMap.get("Navigation").get("Step 3"));
        govgrants.quickSearch().performTableSpecificQuickSearch(dataTableMap.get("FlexTable").get("Step 2"),
                dataTableMap.get("FlexTable").get("Step 1"));
        govgrants.flexTable().clickTableActionIcons(dataTableMap.get("FlexTable").get("Step 3"),
                dataTableMap.get("FlexTable").get("Step 1"));
        govgrants.inputForms().completeFillingReviewForm();
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Button").get("Step 1"));
        govgrants.pageDetails().clickAnyTopRightButton(dataTableMap.get("Button").get("Step 2"));
    }

}
