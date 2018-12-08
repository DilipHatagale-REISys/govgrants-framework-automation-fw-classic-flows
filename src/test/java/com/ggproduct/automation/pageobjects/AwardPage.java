package com.ggproduct.automation.pageobjects;

import com.automation.rei.controller.Controller;
import java.util.Map;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;

public class AwardPage extends ProjectManager  {
    LoginPage loginPage;
    public AwardPage(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
        loginPage = new LoginPage(controller, handler, govgrants);
    }
    
    public void editionOfAward(String sheetName, String excelName) {
        clickOnPageButton("Edit");
        enterFieldValues(sheetName, excelName);
        clickOnPageButton("Save");
    }
    
    public void budgetAddtionInFundingAccountForAward(Map<String, Map<String, String>> rowValues) {
        clickOnSubtab("Budget");
        fillFieldsForInlineTable("flexGridAwardFundingAccounts", "Edit", rowValues);
    }
    
    public void budgetEditionForAward(String lineItem, Map<String, Map<String, String>> rowValues) {
        clickOnSubtab("Budget");
        clickOnFlextableRowButton("Add Line Items", lineItem, "Award Budget");
        fillFieldsForInlineTable("inlineEditGridLineItem", "Edit", rowValues);
        closeModal("AwardBudgetCategoryFlexGridiframeContentIdButton");
    }
    
    public void additionOfPaymentRequestToAward(String sheetName, String excelName) {
        clickOnSubtab("Management");
        clickOnFlextableButton("New", "Progress Report Schedule", "flexGridTnCSchedules");
        enterFieldValues(sheetName, excelName);
        clickOnModalButton("Save");
        closeModal("GranteeReportingRequirementsmodalDivCloseIcon");
    }
    
    public void additionOfProgressReportToAward(String sheetName, String excelName) {
        clickOnSubtab("Management");
        clickOnFlextableButton("New", "Payment Request Schedules", "flexGridPaymentSchedules");
        enterFieldValues(sheetName, excelName);
        clickOnModalButton("Save");
        closeModal("PaymentRequestSchedulemodalDivCloseIcon");
    }
    
    public void creationOfRiskAssessment(String sheetName, String excelName) {
        clickOnSubtab("Management");
        clickOnFlextableButton("New", "Risk Assessments", "flexGridAwardRiskAssessmentView");
        enterFieldValues(sheetName, excelName);
        clickOnPageButton("Save");
    }
    
    public void approverSelectionOfRiskAssessment(String pragramApprover, String fiscalApprover) {
        clickOnSubtab("Responsibilities");
        clickOnFlextableRowButton("Edit", "Program Approver", "Approvers");
        fillInApproverDetails(pragramApprover);
        closeModal("GrantorRiskAssessmentRolesandResponsibilitiesmodalDivCloseIcon");
        clickOnFlextableRowButton("Edit", "Fiscal Approver", "Approvers");
        fillInApproverDetails(fiscalApprover);
        closeModal("GrantorRiskAssessmentRolesandResponsibilitiesmodalDivCloseIcon");
    }
    
    public void approvalOfRiskAssessmentInAward(String pragramApprover, String fiscalApprover) {
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
    
    public void reloginToViewAward(String awardId, String awardName, String awardOwner) {
        reloginToggleToApp("As a Grantor", awardOwner);
        navigateToTab("Grants");
        clickOnSidebar("Grants and Subawards", "Grants, Awards & Amendments");
        changeFlexTableView("Draft Grants");
        quickSearchOnTable(awardName, "ActiveGrants");
        clickOnFlexTableIcon("View", awardName);
        clickOnSubtab("Subawards");
        clickOnFlextableRowButton("View", awardId, "Subawards");
    }
    
    public void approverSelectionOfAward(String pragramApprover, String fiscalApprover, String executiveApprover) {
        clickOnSubtab("Responsibilities");
        clickOnFlextableRowButton("Edit", "Program Approver", "Approvers");
        fillInApproverDetails(pragramApprover);
        closeModal("GrantorAwardApprovermodalDivCloseIcon");
        clickOnFlextableRowButton("Edit", "Fiscal Approver", "Approvers");
        fillInApproverDetails(fiscalApprover);
        closeModal("GrantorAwardApprovermodalDivCloseIcon");
        clickOnFlextableRowButton("Edit", "Fiscal Approver", "Approvers");
        fillInApproverDetails(executiveApprover);
        closeModal("GrantorAwardApprovermodalDivCloseIcon");
    }
    
    public void acceptanceOfAward(String subrecipientUser, String awardName, String comments) {
        loginPage.reloginToGrantsPortal(subrecipientUser);
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
    public void initiateReviewForAward(String sheetName, String excelFileName) {
        clickOnSubtab("Responsibilities");
        clickOnFlextableButton("New", "Peer Reviewers", "flexGridGrantorAwardReviewer");
        enterFieldValues(sheetName, excelFileName);
        clickOnModalButton("Save");
        closeModal("GrantorAwardReviewersTempmodalDivCloseIcon");
        clickOnFlextableRowButton("Send for Review", "Created", "Peer Reviewers");
    }
    
    public void completeReviewForAward(String reviewer, String awardId, String awardName, String awardOwner) {
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
        closeModal("GrantorAwardReviewersTempmodalDivCloseIcon");
        reloginToViewAward(awardId, awardName, awardOwner);
    }
    
    public void approversApproveAward(String programApprover, String fiscalApprover, String executiveApprover, String awardName) {
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
}
