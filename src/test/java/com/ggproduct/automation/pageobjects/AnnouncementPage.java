package com.ggproduct.automation.pageobjects;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.projectmanager.ProjectManager;

public class AnnouncementPage extends ProjectManager {
    public AnnouncementPage(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
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
        clickOnFlexTableButtonToOpenModal("New", "Draft Announcements",
                "ActiveFundingOpportunitiesCompitiveiframeContentId");
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
        clickOnFlextableButtonToOpenModal("Add Organizations", "Invited Applicants", "FormulaGrantsAwardOrganizationsiframeContentId");
        chooseRecordForAssociation("Add", agency, "SoleSourceAwardRecipientsTable");
        closeModal("FormulaGrantsAwardOrganizationsiframeContentIdButton");
    }
    
    /**
     * Handles associating an agency and filling the amount in case of formula announcement
     * @param agency
     * @param amount
     */
    public void associateAgencyAmountToAnnouncement(String agency, String amount) {
        associateAgencyToAnnouncement(agency);
        clickOnFlextableRowButton("Edit", agency, "Invited Applicants");
        fillFieldsForInlineTable("toggleFGridSoleSourceAwardOrganizations", "5", "text", amount);
        clickOnFlextableButton("Save", "Invited Applicants");
    }

    /**
     * Handles addition of funding account to an announcement
     * @param fundingAccount
     * @param amount
     */
    public void addFundingAccountToAnnouncement(String fundingAccount, String amount) {
        clickOnSubtab("Financials");
        clickOnFlextableButtonToOpenModal("Associate", "Funding Accounts",
                "AnnouncementFundingAccountGrantoriframeContentId");
        chooseRecordForAssociation("Add", fundingAccount, "popupflextable");
        closeModal("AnnouncementFundingAccountGrantoriframeContentIdButton");
        clickOnFlextableRowButton("Edit", fundingAccount, "Funding Accounts");
        fillFieldsForInlineTable("toggleFGridAnnouncementFundingAccountGrantor", "5", "text", amount);
        clickOnFlextableButton("Save", "Funding Accounts");
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
        clickOnFlextableButton("Add Budget Period", "Budget Period Details ");
        reiDriver.WaitFor().makeThreadSleep(500);
        clickOnFlextableRowButtontoOpenModal("Edit", budgetPeriod, "Budget Period Details",
                "AnnouncementBudgetPeriodiframeContentId");
        enterFieldValues(sheetName, excelFileName);
        clickOnModalButton("Save");
        closeModal("AnnouncementBudgetPeriodmodalDivCloseIcon");
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
        clickOnFlextableButtonToOpenModal("Associate", "Contacts", "AnnouncementContactsiframeContentId");
        chooseRecordForAssociation("Add", contact, "AssociateAnnouncementContacts");
        closeModal("AnnouncementContactsmodalDivCloseIcon");

        // Focus Area association
        clickOnSubtab("Setup");
        clickOnFlextableButtonToOpenModal("Associate", "Focus Areas", "AnnouncementServiceArea1iframeContentId");
        chooseRecordForAssociation("Add", focusArea, "popupflextable");
        closeModal("AnnouncementServiceArea1modalDivCloseIcon");

        // Objective association
        clickOnSubtab("Setup");
        clickOnFlextableButtonToOpenModal("Associate", "Objectives",
                "AnnouncementGranteeStrategicGoalsObjectivesiframeContentId");
        chooseRecordForAssociation("Add", objective, "popupflextable");
        closeModal("AnnouncementGranteeStrategicGoalsObjectivesmodalDivCloseIcon");
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
        clickOnFlextableRowButtontoOpenModal("Edit", "Program Approver", "Approvers",
                "GrantorAnnouncementRolesandResponsibilitiesiframeContentId");
        fillInApproverDetails(programApprover, "GrantorAnnouncementRolesandResponsibilitiesiframeContentId");
        closeModal("GrantorAnnouncementRolesandResponsibilitiesmodalDivCloseIcon");
        clickOnFlextableRowButtontoOpenModal("Edit", "Fiscal Approver", "Approvers",
                "GrantorAnnouncementRolesandResponsibilitiesiframeContentId");
        fillInApproverDetails(fiscalApprover, "GrantorAnnouncementRolesandResponsibilitiesiframeContentId");
        closeModal("GrantorAnnouncementRolesandResponsibilitiesmodalDivCloseIcon");
        clickOnFlextableRowButtontoOpenModal("Edit", "Executive Approver", "Approvers",
                "GrantorAnnouncementRolesandResponsibilitiesiframeContentId");
        fillInApproverDetails(executiveApprover, "GrantorAnnouncementRolesandResponsibilitiesiframeContentId");
        closeModal("GrantorAnnouncementRolesandResponsibilitiesmodalDivCloseIcon");
    }

    /**
     * Handles addition of checklist to an announcement
     * @param description
     * @param required
     * @param appliesTo
     * @param fileName
     */
    public void additionOfChecklistToAnnouncement(String description, String required, String appliesTo,
            String fileName) {
        clickOnSubtab("Setup");
        clickOnFlextableButton("Add", "Supporting Documents");
        fillFieldsForInlineTable("toggleFGridAnnouncementChecklists", "1", "text", description);
        fillFieldsForInlineTable("toggleFGridAnnouncementChecklists", "2", "dropdown", required);
        fillFieldsForInlineTable("toggleFGridAnnouncementChecklists", "3", "dropdown", appliesTo);
        clickOnFlextableButton("Save", "Supporting Documents");
        clickOnFlextableRowButtontoOpenModal("Upload Template", "Not Applicable", "Supporting Documents",
                "AnnouncementChecklistsiframeContentId");
        uploadFile(fileName, "Checklist", "Announcement");
        closeModal("AnnouncementChecklistsiframeContentIdButton");
    }

    /**
     * Handles addition of attachment to an announcement
     * @param fileName
     */
    public void additionOfAttachmentToAnnouncement(String fileName) {
        clickOnSubtab("Attachments");
        clickOnButtonForAttachmentNotesToOpenModal("Add", " Attachments");
        uploadFile(fileName, "Attachment", "Funding Opportunity Announcement");
        closeModal("Attachment");
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
        reloginToggleToApp("As a Grantor", programApprover);
        navigateToTab("Announcements");
        clickOnSidebar("Pending Tasks", "My Tasks");
        quickSearchOnTable(announcementName, "PhasePendingTasks");
        clickOnFlexTableIcon("Start", announcementName);
        clickOnApprovalDecisionBox("Approve");
        reloginToggleToApp("As a Grantor", fiscalApprover);
        navigateToTab("Announcements");
        clickOnSidebar("Pending Tasks", "My Tasks");
        quickSearchOnTable(announcementName, "PhasePendingTasks");
        clickOnFlexTableIcon("Start", announcementName);
        clickOnApprovalDecisionBox("Approve");
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
        clickOnFlextableButtonToOpenModal("New", "Peer Reviewers", "GrantorAnnouncementReviewersTempiframeContentId");
        enterFieldValues(sheetName, excelFileName);
        clickOnModalButton("Save");
        closeModal("GrantorAnnouncementReviewersTempmodalDivCloseIcon");
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
        clickOnFlextableRowButtontoOpenModal("Enter Review", reviewer, "Peer Reviewers",
                "GrantorAnnouncementReviewersTempiframeContentId");
        enterReview();
        clickOnModalButton("Save");
        clickOnModalButton("Submit Review");
        closeModal("GrantorAnnouncementReviewersTempmodalDivCloseIcon");
        reloginToggleToApp("As a Grantor", announcementOwner);
        navigateToTab("Announcements");
        clickOnSidebar(announcementType, "Announcements");
        changeFlexTableView("Draft Announcements");
        quickSearchOnTable(announcementName, "ActiveFundingOpportunitiesCompitive");
        clickOnFlexTableIcon("View", announcementName);
        clickOnPageButton("Complete Review");
    }
}
