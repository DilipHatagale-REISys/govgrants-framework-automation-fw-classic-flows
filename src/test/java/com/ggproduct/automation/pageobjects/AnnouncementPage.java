package com.ggproduct.automation.pageobjects;

import java.util.Map;

import java.util.List;
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
     * @param AnnouncementType
     * @param user
     * @param sheetName
     * @param excelFileName
     */
    public void creationOfAnnouncement(String AnnouncementType, String user, String sheetName, String excelFileName) {
        loginToggleToApp("As a Grantor", user);
        navigateToTab("Announcements");
        clickOnSidebar(AnnouncementType, "Announcements");
        changeFlexTableView("Draft Announcements");
        if(AnnouncementType.equals("Competitive")) {
            clickOnPhaseFlexTableButton("New", "ActiveFundingOpportunitiesCompitive");
        } else if(AnnouncementType.equals("Directed")) {
            clickOnPhaseFlexTableButton("New", "ActiveFundingOpportunities");
        } else {
            clickOnPhaseFlexTableButton("New", "ActiveFundingOpportunitiesFormula");
        }
        enterFieldValues(sheetName, excelFileName);
        clickOnModalButton("Save And Close");
        clickOnPageButton("Save");
    }

    /**
     * Handles filling up of field from a sheet in an excel
     * @param sheetName
     * @param excelFileName
     */
    public void editionOfAnnouncement(String sheetName, String excelFileName) {
        clickOnPageButton("Edit");
        enterFieldValues(sheetName, excelFileName);
        clickOnPageButton("Save");
    }
    
    /**
     * Handles associating an agency in case of directed announcement
     * @param agency
     */
    public void associateAgencyToAnnouncement(String agency) {
        clickOnSubtab("Overview");
        clickOnFlextableButton("Add Organizations", "Invited Applicants", "inlineEditGridFormulaGrantsAwardOrganizations");
        chooseRecordForAssociation("Add", agency, "SoleSourceAwardRecipientsTable");
        closeModal();
    }
    
    /**
     * Handles associating an agency and filling the amount in case of formula announcement
     * @param agency
     * @param amount
     */
    public void associateAgencyAmountToAnnouncement(String agency, DataTable rowValues) {
        associateAgencyToAnnouncement(agency);
        fillFieldsForInlineTable("inlineEditGridSoleSourceAwardOrganizations", "Edit", rowValues);
    }

    /**
     * Handles addition of funding account to an announcement
     * @param fundingAccount
     * @param amount
     */
    public void addFundingAccountToAnnouncement(String fundingAccount, DataTable rowValues) {
        clickOnSubtab("Financials");
        clickOnFlextableButton("Associate", "Funding Accounts", "flexGridAnnouncementFundingAccountGrantor");
        chooseRecordForAssociation("Add", fundingAccount, "popupflextable");
        closeModal();
        fillFieldsForInlineTable("flexGridAnnouncementFundingAccountGrantor", "Edit", rowValues);
    }

    /**
     * Handles addition of budget details to an announcement
     * @param budgetPeriod
     * @param sheetName
     * @param excelFileName
     */
    public void addBudgetPeriodToAnnouncement(String budgetPeriod, String sheetName, String excelFileName) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        clickOnSubtab("Financials");
        clickOnFlextableButton("Add Budget Period", "Budget Period Details ","AnnouncementBudgetPeriod");
        clickOnFlextableRowButton("Edit", budgetPeriod, "Budget Period Details");
        enterFieldValues(sheetName, excelFileName);
        clickOnModalButton("Save");
        closeModal();
    }

    /**
     * Handles association of contact, focus area and objective to an announcement
     * @param contact
     * @param focusArea
     * @param objective
     */
    public void associationOfRecordsToAnnouncement(String contact, String focusArea, String objective) {
        // Contact association
        clickOnSubtab("Overview");
        clickOnFlextableButton("Associate", "Contacts", "AnnouncementContacts");
        chooseRecordForAssociation("Add", contact, "AssociateAnnouncementContacts");
        closeModal();

        // Focus Area association
        clickOnSubtab("Setup");
        clickOnFlextableButton("Associate", "Focus Areas", "AnnouncementServiceArea1");
        chooseRecordForAssociation("Add", focusArea, "popupflextable");
        closeModal();

        // Objective association
        clickOnSubtab("Setup");
        clickOnFlextableButton("Associate", "Objectives", "AnnouncementGranteeStrategicGoalsObjectives");
        chooseRecordForAssociation("Add", objective, "popupflextable");
        closeModal();
    }

    /**
     * Handles assigning of approvers to an announcement
     * @param programApprover
     * @param fiscalApprover
     * @param executiveApprover
     */
    public void approverSelectionForAnnouncement(String programApprover, String fiscalApprover,
            String executiveApprover) {
        clickOnSubtab("Responsibilities");
        clickOnFlextableRowButton("Edit", "Program Approver", "Approvers");
        fillInApproverDetails(programApprover);
        switchToParentFrame();
        clickOnFlextableRowButton("Edit", "Fiscal Approver", "Approvers");
        fillInApproverDetails(fiscalApprover);
        switchToParentFrame();
        clickOnFlextableRowButton("Edit", "Executive Approver", "Approvers");
        fillInApproverDetails(executiveApprover);
        switchToParentFrame();
    }

    /**
     * Handles addition of checklist to an announcement
     * @param description
     * @param required
     * @param appliesTo
     * @param fileName
     */
    public void additionOfChecklistToAnnouncement(String fileName, List<Map<String, String>> rowValues) {
        clickOnSubtab("Setup");
        addFieldsForInlineTable("inlineEditGridAnnouncementChecklists", "Add", rowValues);
        clickOnFlextableRowButton("Upload Template", "Not Applicable", "Supporting Documents");
        uploadFile(fileName, "Checklist", "Announcement");
        closeModal();
    }

    /**
     * Handles addition of attachment to an announcement
     * @param fileName
     */
    public void additionOfAttachmentToAnnouncement(String fileName) {
        clickOnSubtab("Attachments");
        clickOnButtonForAttachmentNotesToOpenModal("Add", " Attachments");
        uploadFile(fileName, "Attachment", "Funding Opportunity Announcement");
        closeModal();
    }

    /**
     * Handles approving of an announcement by all approvers
     * @param programApprover
     * @param fiscalApprover
     * @param executiveApprover
     * @param announcementName
     */
    public void approversApproveAnnouncement(String programApprover, String fiscalApprover, String executiveApprover,
            String announcementName) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reloginToggleToApp("As a Grantor", programApprover);
        navigateToTab("Announcements");
        clickOnSidebar("Pending Tasks", "My Tasks");
        quickSearchOnTable(announcementName, "PhasePendingTasks");
        clickOnFlexTableIcon("Start", announcementName);
        clickOnApprovalDecisionBox("Approve");
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reloginToggleToApp("As a Grantor", fiscalApprover);
        navigateToTab("Announcements");
        clickOnSidebar("Pending Tasks", "My Tasks");
        quickSearchOnTable(announcementName, "PhasePendingTasks");
        clickOnFlexTableIcon("Start", announcementName);
        clickOnApprovalDecisionBox("Approve");
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reloginToggleToApp("As a Grantor", executiveApprover);
        navigateToTab("Announcements");
        clickOnSidebar("Pending Tasks", "My Tasks");
        quickSearchOnTable(announcementName, "PhasePendingTasks");
        clickOnFlexTableIcon("Start", announcementName);
        clickOnApprovalDecisionBox("Approve");
    }

    /**
     * Handles assigning of reviewer and initiating the review process
     * @param sheetName
     * @param excelFileName
     */
    public void initiateReviewForAnnouncement(String sheetName, String excelFileName) {
        clickOnSubtab("Responsibilities");
        clickOnFlextableButton("New", "Peer Reviewers", "flexGridApproverRoles");
        enterFieldValues(sheetName, excelFileName);
        clickOnModalButton("Save");
        closeModal();
        clickOnFlextableRowButton("Send for Review", "Created", "Peer Reviewers");
    }

    /**
     * Handles reviewing the announcement and completing the review process for an announcement
     * @param reviewer
     * @param announcementType
     * @param announcementName
     * @param announcementOwner
     */
    public void completeReviewForAnnouncement(String reviewer, String announcementType, String announcementName, String announcementOwner) {
        reloginToggleToApp("As a Grantor", reviewer);
        navigateToTab("Announcements");
        clickOnSidebar("Pending Tasks", "My Tasks");
        quickSearchOnTable(announcementName, "PhasePendingTasks");
        clickOnFlexTableIcon("Start", announcementName);
        clickOnFlextableRowButton("Enter Review", "Fiscal Reviewer", "Peer Reviewers");
        enterReview();
        clickOnModalButton("Save");
        clickOnModalButton("Submit Review");
        closeModal();
        reloginToggleToApp("As a Grantor", announcementOwner);
        navigateToTab("Announcements");
        clickOnSidebar(announcementType, "Announcements");
        changeFlexTableView("Draft Announcements");
        quickSearchOnTable(announcementName, "ActiveFundingOpportunitiesCompitive");
        clickOnFlexTableIcon("View", announcementName);
        clickOnPageButton("Complete Review");
    }
}
