package com.ggproduct.automation.pageobjects;

import com.automation.rei.controller.Controller;
import java.io.IOException;

import org.openqa.selenium.By;

import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;

import cucumber.api.DataTable;

public class AwardPage extends ProjectManager  {
    public AwardPage(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
    }
    
    /**
     * Handles creation of Award from FDM
     * @param announcementName
     * @param applicationName
     */
    public void creationOfAward(String announcementName, String applicationName) {
        loginToggleToApp("As a Grantor", "EXE");
        govgrants.mainPage().clickMainMenuBar("Applications");
        clickOnSidebar("Funding Decision Memo (FDM)", "Applications");
        govgrants.quickSearch().performTableSpecificQuickSearch("FDMList1", announcementName);
        govgrants.flexTable().clickTableActionIcons("View", announcementName);
        govgrants.flexTable().clickTableActionIcon("Create Subaward", applicationName, "Recommended Applications");
        clickOnConfirmationtBox("Yes");
        govgrants.pageDetails().clickAnyTopRightButton("Save");
    }
    
    /**
     * Handles edition of Award
     * @param sheetName
     * @param excelName
     */
    public void editionOfAward(String sheetName, String excelName) {
        govgrants.pageDetails().clickAnyTopRightButton("Edit");
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelName, sheetName);
        govgrants.pageDetails().clickAnyTopRightButton("Save");
    }
    
    /**
     * Handles addition of budget Funding Account to an award
     * @param rowValues
     */
    public void budgetAddtionInFundingAccountForAward(DataTable rowValues) {
        govgrants.pageDetails().clickSubTabsInsideTableView("Budget");
        govgrants.flexTable().editFlexTableRowsInline("flexGridAwardFundingAccounts", "Edit", rowValues);
    }
    
    /**
     * Handles edition of budget grid in an award
     * @param lineItem
     * @param rowValues
     */
    public void budgetEditionForAward(String lineItem, DataTable rowValues) {
        govgrants.pageDetails().clickSubTabsInsideTableView("Budget");
        govgrants.flexTable().clickTableActionIcon("Add Line Items", lineItem, "Award Budget");
        govgrants.flexTable().editFlexTableRowsInline("inlineEditGridLineItem", "Edit", rowValues);
        closeModal();
    }
    
    /**
     * Handles addition of Payment Request to an award
     * @param sheetName
     * @param excelName
     */
    public void additionOfPaymentRequestToAward(String sheetName, String excelName) {
        govgrants.pageDetails().clickSubTabsInsideTableView("Management");
        govgrants.flexTable().clickTableTopRightButton("flexGridTnCSchedules", "New");
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelName, sheetName);
        govgrants.modal().clickModalContentSpecificButton("Save");
        closeModal();
    }
    
    /**
     * Handles addition on Progress Report to an award
     * @param sheetName
     * @param excelName
     */
    public void additionOfProgressReportToAward(String sheetName, String excelName) {
        govgrants.pageDetails().clickSubTabsInsideTableView("Management");
        govgrants.flexTable().clickTableTopRightButton("flexGridPaymentSchedules", "New");
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelName, sheetName);
        govgrants.modal().clickModalContentSpecificButton("Save");
        closeModal();
    }
    
    /**
     * Handles creation of Risk Assessment to an award
     * @param sheetName
     * @param excelName
     */
    public void creationOfRiskAssessment(String sheetName, String excelName) {
        govgrants.pageDetails().clickSubTabsInsideTableView("Management");
        govgrants.flexTable().clickTableTopRightButton("flexGridAwardRiskAssessmentView", "New");
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelName, sheetName);
        govgrants.pageDetails().clickAnyTopRightButton("Save");
    }
    
    /**
     * Handles selection of approver to the award Risk Assessment
     * @param pragramApprover
     * @param fiscalApprover
     */
    public void approverSelectionOfRiskAssessment(String pragramApprover, String fiscalApprover) {
        govgrants.pageDetails().clickSubTabsInsideTableView("Responsibilities");
        govgrants.flexTable().clickTableActionIcon("Edit", "Program Approver", "Approvers");
        fillInApproverDetails(pragramApprover);
        closeModal();
        govgrants.flexTable().clickTableActionIcon("Edit", "Fiscal Approver", "Approvers");
        fillInApproverDetails(fiscalApprover);
        closeModal();
    }
    
    /**
     * Handles approval of Award Risk Assessment
     * @param pragramApprover
     * @param fiscalApprover
     * @throws IOException 
     */
    public void approvalOfRiskAssessmentInAward(String pragramApprover, String fiscalApprover) throws IOException {
        reloginToggleToApp("As a Grantor", pragramApprover);
        govgrants.mainPage().clickMainMenuBar("Monitoring");
        clickOnSidebar("Pending Tasks", "My Tasks");
        govgrants.quickSearch().performTableSpecificQuickSearch("PhasePendingTasks", "Approve Risk Assessment");
        govgrants.flexTable().clickTableActionIcons("Start", "Approve Risk Assessment");
        clickOnApprovalDecisionBox("Approve");
        reloginToggleToApp("As a Grantor", fiscalApprover);
        govgrants.mainPage().clickMainMenuBar("Monitoring");
        clickOnSidebar("Pending Tasks", "My Tasks");
        govgrants.quickSearch().performTableSpecificQuickSearch("PhasePendingTasks", "Approve Risk Assessment");
        govgrants.flexTable().clickTableActionIcons("Start", "Approve Risk Assessment");
        clickOnApprovalDecisionBox("Approve");
    }
    
    /**
     * Handles selection of approvers to an award
     * @param pragramApprover
     * @param fiscalApprover
     * @param executiveApprover
     */
    public void approverSelectionOfAward(String pragramApprover, String fiscalApprover, String executiveApprover) {
        govgrants.pageDetails().clickSubTabsInsideTableView("Responsibilities");
        govgrants.flexTable().clickTableActionIcon("Edit", "Program Approver", "Approvers");
        fillInApproverDetails(pragramApprover);
        closeModal();
        govgrants.flexTable().clickTableActionIcon("Edit", "Fiscal Approver", "Approvers");
        fillInApproverDetails(fiscalApprover);
        closeModal();
        govgrants.flexTable().clickTableActionIcon("Edit", "Fiscal Approver", "Approvers");
        fillInApproverDetails(executiveApprover);
        closeModal();
    }
    
    /**
     * Handles acceptance of Award by subrecipient before award approval
     * @param subrecipientUser
     * @param awardName
     * @param comments
     * @throws IOException 
     */
    public void acceptanceOfAward(String subrecipientUser, String awardName, String comments) throws IOException {
        reloginToGrantsPortal(subrecipientUser);
        govgrants.mainPage().clickMainMenuBar("Grants");
        clickOnSidebar("Pending Tasks", "My Tasks");
        govgrants.quickSearch().performTableSpecificQuickSearch("PhasePendingTasks", awardName);
        govgrants.flexTable().clickTableActionIcons("Start", awardName);
        try {
            govgrants.pageDetails().clickAnyTopRightButton("Accept");
        } catch (Exception ex) {
            govgrants.pageDetails().clickAnyTopRightButton("Accept after Approval");
        }
        enteringCommentsOnConfirmation(comments, "OK");
    }
    
    /**
     * Handles assigning of reviewer and initiating the review process for an award
     * @param sheetName
     * @param excelFileName
     */
    public void initiateReviewForAward(String sheetName, String excelName) {
        govgrants.pageDetails().clickSubTabsInsideTableView("Responsibilities");
        govgrants.flexTable().clickTableTopRightButton("flexGridGrantorAwardReviewer", "New");
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelName, sheetName);
        govgrants.modal().clickModalContentSpecificButton("Save");
        closeModal();
        govgrants.flexTable().clickTableActionIcon("Send for Review", "Created", "Peer Reviewers");
    }
    
    /**
     * Handles completion of review for the given award
     * @param reviewer
     * @param awardId
     * @param awardName
     * @param awardOwner
     * @throws IOException 
     */
    public void completeReviewForAward(String reviewer, String awardState, String awardId, String awardName, String awardOwner) throws IOException {
        reloginToggleToApp("As a Grantor", reviewer);
        govgrants.mainPage().clickMainMenuBar("Grants");
        clickOnSidebar("Pending Tasks", "My Tasks");
        govgrants.quickSearch().performTableSpecificQuickSearch("PhasePendingTasks", awardName);
        govgrants.flexTable().clickTableActionIcons("Start", awardName);
        govgrants.pageDetails().clickSubTabsInsideTableView("Responsibilities");
        govgrants.flexTable().clickTableActionIcon("Enter Review", "Automation FO", "Peer Reviewers");
        enterReview("Passed");
        govgrants.modal().clickModalContentSpecificButton("Save");
        govgrants.modal().clickModalContentSpecificButton("Submit Review");
        closeModal();
        reloginToViewAward(awardState, awardId, awardName, awardOwner);
    }
    
    /**
     * Handles approval of award
     * @param programApprover
     * @param fiscalApprover
     * @param executiveApprover
     * @param awardName
     * @throws IOException 
     */
    public void approversApproveAward(String programApprover, String fiscalApprover, String executiveApprover, String awardName) throws IOException {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reloginToggleToApp("As a Grantor", programApprover);
        govgrants.mainPage().clickMainMenuBar("Announcements");
        clickOnSidebar("Pending Tasks", "My Tasks");
        govgrants.quickSearch().performTableSpecificQuickSearch("PhasePendingTasks", awardName);
        govgrants.flexTable().clickTableActionIcons("Start", awardName);
        clickOnApprovalDecisionBox("Approve");
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reloginToggleToApp("As a Grantor", fiscalApprover);
        govgrants.mainPage().clickMainMenuBar("Announcements");
        clickOnSidebar("Pending Tasks", "My Tasks");
        govgrants.quickSearch().performTableSpecificQuickSearch("PhasePendingTasks", awardName);
        govgrants.flexTable().clickTableActionIcons("Start", awardName);
        clickOnApprovalDecisionBox("Approve");
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reloginToggleToApp("As a Grantor", executiveApprover);
        govgrants.mainPage().clickMainMenuBar("Announcements");
        clickOnSidebar("Pending Tasks", "My Tasks");
        govgrants.quickSearch().performTableSpecificQuickSearch("PhasePendingTasks", awardName);
        govgrants.flexTable().clickTableActionIcons("Start", awardName);
        clickOnApprovalDecisionBox("Approve");
    }
    
    /**
     * Handles initiating Site Visit in an award
     * @param sheetName
     * @param excelName
     */
    public void initiateSiteVisitInAward(String sheetName, String excelName) {
        govgrants.pageDetails().clickSubTabsInsideTableView("Management");
        govgrants.flexTable().clickTableTopRightButton("GrantorSiteVisitsAward", "Initiate Site Visit");
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelName, sheetName);
        govgrants.modal().clickModalContentSpecificButton("Save And Close");
        govgrants.pageDetails().clickAnyTopRightButton("Cancel");
        reiDriver.findMyElement().getElement(By.xpath("//a[contains(@id,'award__c')]")).click();
    }
    
    /**
     * Handles initiating Desk Review in an award
     * @param sheetName
     * @param excelName
     */
    public void initiateDeskReviewInAward(String sheetName, String excelName) {
        govgrants.pageDetails().clickSubTabsInsideTableView("Management");
        govgrants.flexTable().clickTableTopRightButton( "GrantorDeskReviewAward", "Initiate Desk Review");
        govgrants.inputForms().enterInputFieldsFromExcelFile(excelName, sheetName);
        govgrants.modal().clickModalContentSpecificButton("Save And Close");
        govgrants.pageDetails().clickAnyTopRightButton("Cancel");
        reiDriver.findMyElement().getElement(By.xpath("//a[contains(@id,'award__c')]")).click();
    }
}
