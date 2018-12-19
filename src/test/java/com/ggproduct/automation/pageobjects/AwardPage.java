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
        navigateToTab("Applications");
        clickOnSidebar("Funding Decision Memo (FDM)", "Applications");
        quickSearchOnTable(announcementName, "FDMList1");
        clickOnFlexTableIcon("View", announcementName);
        clickOnFlextableRowButton("Create Subaward", applicationName, "Recommended Applications");
        clickOnConfirmationtBox("Yes");
        clickOnPageButton("Save");
    }
    
    /**
     * Handles edition of Award
     * @param sheetName
     * @param excelName
     */
    public void editionOfAward(String sheetName, String excelName) {
        clickOnPageButton("Edit");
        enterFieldValues(sheetName, excelName);
        clickOnPageButton("Save");
    }
    
    /**
     * Handles addition of budget Funding Account to an award
     * @param rowValues
     */
    public void budgetAddtionInFundingAccountForAward(DataTable rowValues) {
        clickOnSubtab("Budget");
        fillFieldsForInlineTable("flexGridAwardFundingAccounts", "Edit", rowValues);
    }
    
    /**
     * Handles edition of budget grid in an award
     * @param lineItem
     * @param rowValues
     */
    public void budgetEditionForAward(String lineItem, DataTable rowValues) {
        clickOnSubtab("Budget");
        clickOnFlextableRowButton("Add Line Items", lineItem, "Award Budget");
        fillFieldsForInlineTable("inlineEditGridLineItem", "Edit", rowValues);
        closeModal();
    }
    
    /**
     * Handles addition of Payment Request to an award
     * @param sheetName
     * @param excelName
     */
    public void additionOfPaymentRequestToAward(String sheetName, String excelName) {
        clickOnSubtab("Management");
        clickOnFlextableButton("New", "flexGridTnCSchedules");
        enterFieldValues(sheetName, excelName);
        clickOnModalButton("Save");
        closeModal();
    }
    
    /**
     * Handles addition on Progress Report to an award
     * @param sheetName
     * @param excelName
     */
    public void additionOfProgressReportToAward(String sheetName, String excelName) {
        clickOnSubtab("Management");
        clickOnFlextableButton("New", "flexGridPaymentSchedules");
        enterFieldValues(sheetName, excelName);
        clickOnModalButton("Save");
        closeModal();
    }
    
    /**
     * Handles creation of Risk Assessment to an award
     * @param sheetName
     * @param excelName
     */
    public void creationOfRiskAssessment(String sheetName, String excelName) {
        clickOnSubtab("Management");
        clickOnFlextableButton("New", "flexGridAwardRiskAssessmentView");
        enterFieldValues(sheetName, excelName);
        clickOnPageButton("Save");
    }
    
    /**
     * Handles selection of approver to the award Risk Assessment
     * @param pragramApprover
     * @param fiscalApprover
     */
    public void approverSelectionOfRiskAssessment(String pragramApprover, String fiscalApprover) {
        clickOnSubtab("Responsibilities");
        clickOnFlextableRowButton("Edit", "Program Approver", "Approvers");
        fillInApproverDetails(pragramApprover);
        closeModal();
        clickOnFlextableRowButton("Edit", "Fiscal Approver", "Approvers");
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
        navigateToTab("Monitoring");
        clickOnSidebar("Pending Tasks", "My Tasks");
        quickSearchOnTable("Approve Risk Assessment", "PhasePendingTasks");
        clickOnFlexTableIcon("Start", "Approve Risk Assessment");
        clickOnApprovalDecisionBox("Approve");
        reloginToggleToApp("As a Grantor", fiscalApprover);
        navigateToTab("Monitoring");
        clickOnSidebar("Pending Tasks", "My Tasks");
        quickSearchOnTable("Approve Risk Assessment", "PhasePendingTasks");
        clickOnFlexTableIcon("Start", "Approve Risk Assessment");
        clickOnApprovalDecisionBox("Approve");
    }
    
    /**
     * Handles re-logging in and to view the given award
     * @param awardId
     * @param awardName
     * @param awardOwner
     * @throws IOException 
     */
    public void reloginToViewAward(String awardId, String awardName, String awardOwner) throws IOException {
        try {
            loginToggleToApp("As a Grantor", awardOwner);
        } catch (Exception ex) {
            reloginToggleToApp("As a Grantor", awardOwner);
        }
        navigateToTab("Grants");
        clickOnSidebar("Grants and Subawards", "Grants, Awards & Amendments");
        changeFlexTableView("Draft Grants");
        quickSearchOnTable(awardName, "ActiveGrants");
        clickOnFlexTableIcon("View", awardName);
        clickOnSubtab("Subawards");
        clickOnFlextableRowButton("View", awardId, "Subawards");
    }
    
    /**
     * Handles selection of approvers to an award
     * @param pragramApprover
     * @param fiscalApprover
     * @param executiveApprover
     */
    public void approverSelectionOfAward(String pragramApprover, String fiscalApprover, String executiveApprover) {
        clickOnSubtab("Responsibilities");
        clickOnFlextableRowButton("Edit", "Program Approver", "Approvers");
        fillInApproverDetails(pragramApprover);
        closeModal();
        clickOnFlextableRowButton("Edit", "Fiscal Approver", "Approvers");
        fillInApproverDetails(fiscalApprover);
        closeModal();
        clickOnFlextableRowButton("Edit", "Fiscal Approver", "Approvers");
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
        navigateToTab("Grants");
        clickOnSidebar("Pending Tasks", "My Tasks");
        quickSearchOnTable(awardName, "PhasePendingTasks");
        clickOnFlexTableIcon("Start", awardName);
        try {
            clickOnPageButton("Accept");
        } catch (Exception ex) {
            clickOnPageButton("Accept after Approval");
        }
        enteringCommentsOnConfirmation(comments, "OK");
    }
    
    /**
     * Handles assigning of reviewer and initiating the review process for an award
     * @param sheetName
     * @param excelFileName
     */
    public void initiateReviewForAward(String sheetName, String excelName) {
        clickOnSubtab("Responsibilities");
        clickOnFlextableButton("New", "flexGridGrantorAwardReviewer");
        enterFieldValues(sheetName, excelName);
        clickOnModalButton("Save");
        closeModal();
        clickOnFlextableRowButton("Send for Review", "Created", "Peer Reviewers");
    }
    
    /**
     * Handles completion of review for the given award
     * @param reviewer
     * @param awardId
     * @param awardName
     * @param awardOwner
     * @throws IOException 
     */
    public void completeReviewForAward(String reviewer, String awardId, String awardName, String awardOwner) throws IOException {
        reloginToggleToApp("As a Grantor", reviewer);
        navigateToTab("Grants");
        clickOnSidebar("Pending Tasks", "My Tasks");
        quickSearchOnTable(awardName, "PhasePendingTasks");
        clickOnFlexTableIcon("Start", awardName);
        clickOnSubtab("Responsibilities");
        clickOnFlextableRowButton("Enter Review", "Automation FO", "Peer Reviewers");
        enterReview();
        clickOnModalButton("Save");
        clickOnModalButton("Submit Review");
        closeModal();
        reloginToViewAward(awardId, awardName, awardOwner);
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
        navigateToTab("Announcements");
        clickOnSidebar("Pending Tasks", "My Tasks");
        quickSearchOnTable(awardName, "PhasePendingTasks");
        clickOnFlexTableIcon("Start", awardName);
        clickOnApprovalDecisionBox("Approve");
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reloginToggleToApp("As a Grantor", fiscalApprover);
        navigateToTab("Announcements");
        clickOnSidebar("Pending Tasks", "My Tasks");
        quickSearchOnTable(awardName, "PhasePendingTasks");
        clickOnFlexTableIcon("Start", awardName);
        clickOnApprovalDecisionBox("Approve");
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reloginToggleToApp("As a Grantor", executiveApprover);
        navigateToTab("Announcements");
        clickOnSidebar("Pending Tasks", "My Tasks");
        quickSearchOnTable(awardName, "PhasePendingTasks");
        clickOnFlexTableIcon("Start", awardName);
        clickOnApprovalDecisionBox("Approve");
    }
    
    /**
     * Handles initiating Site Visit in an award
     * @param sheetName
     * @param excelName
     */
    public void initiateSiteVisitInAward(String sheetName, String excelName) {
        clickOnSubtab("Management");
        clickOnFlextableButton("Initiate Site Visit", "GrantorSiteVisitsAward");
        enterFieldValues(sheetName, excelName);
        clickOnModalButton("Save And Close");
        clickOnPageButton("Cancel");
        reiDriver.findMyElement().getElement(By.xpath("//a[contains(@id,'award__c')]")).click();
    }
    
    /**
     * Handles initiating Desk Review in an award
     * @param sheetName
     * @param excelName
     */
    public void initiateDeskReviewInAward(String sheetName, String excelName) {
        clickOnSubtab("Management");
        clickOnFlextableButton("Initiate Desk Review", "GrantorDeskReviewAward");
        enterFieldValues(sheetName, excelName);
        clickOnModalButton("Save And Close");
        clickOnPageButton("Cancel");
        reiDriver.findMyElement().getElement(By.xpath("//a[contains(@id,'award__c')]")).click();
    }
}
