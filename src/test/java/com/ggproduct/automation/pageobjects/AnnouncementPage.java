package com.ggproduct.automation.pageobjects;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.projectmanager.ProjectManager;

public class AnnouncementPage extends ProjectManager {
    public AnnouncementPage(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
    }

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

    public void editionOfAnnouncement(String sheetName, String excelFileName) {
        clickOnPageButton("Edit");
        enterFieldValues(sheetName, excelFileName);
        clickOnPageButton("Save");
    }
    
    public void associateAgencyToAnnouncement(String agency) {
        clickOnSubtab("Overview");
        clickOnFlextableButtonToOpenModal("Add Organizations", "Invited Applicants", "FormulaGrantsAwardOrganizationsiframeContentId");
        chooseRecordForAssociation("Add", agency, "SoleSourceAwardRecipientsTable");
        closeModal("FormulaGrantsAwardOrganizationsiframeContentIdButton");
    }
    
    public void associateAgencyAmountToAnnouncement(String agency, String amount) {
        associateAgencyToAnnouncement(agency);
        clickOnFlextableRowButton("Edit", agency, "Invited Applicants");
        fillFieldsForInlineTable("toggleFGridSoleSourceAwardOrganizations", "5", "text", amount);
        clickOnFlextableButton("Save", "Invited Applicants");
    }


    public void addFundingAccountToAnnouncement(String fundingAccount, String amount) {
        clickOnSubtab("Financials");
        clickOnFlextableButtonToOpenModal("Associate", "Funding Accounts",
                "AnnouncementFundingAccountGrantoriframeContentId");
        chooseRecordForAssociation("Add", fundingAccount, "popupflextable");
        closeModal("AnnouncementServiceArea1modalDivCloseIcon");
        clickOnFlextableRowButton("Edit", fundingAccount, "Funding Accounts");
        fillFieldsForInlineTable("toggleFGridAnnouncementFundingAccountGrantor", "5", "text", amount);
        clickOnFlextableButton("Save", "Funding Accounts");
    }

    public void addBudgetPeriodToAnnouncement(String budgetPeriod, String sheetName, String excelFileName) {
        clickOnSubtab("Financials");
        clickOnFlextableButton("Add Budget Period", "Budget Period Details");
        clickOnFlextableRowButtontoOpenModal("Edit", budgetPeriod, "Budget Period Details",
                "AnnouncementBudgetPeriodiframeContentId");
        enterFieldValues(sheetName, excelFileName);
        clickOnModalButton("Save");
        closeModal("AnnouncementBudgetPeriodmodalDivCloseIcon");
    }

    public void associationOfRecordsToAnnouncement(String contact, String focusArea, String objective) {
        // Contact association
        clickOnSubtab("Overview");
        clickOnFlextableButtonToOpenModal("Associate", "Contacts", "AnnouncementContactsiframeContentId");
        chooseRecordForAssociation("Add", contact, "AssociateAnnouncementContacts");
        closeModal("AnnouncementContactsmodalDivCloseIcon");

        // Focus Area association
        clickOnSubtab("Setup");
        clickOnFlextableButtonToOpenModal("Associate", "Focus Areas", "AnnouncementServiceArea1iframeContentId");
        chooseRecordForAssociation("Associate", focusArea, "popupflextable");
        closeModal("AnnouncementServiceArea1modalDivCloseIcon");

        // Objective association
        clickOnSubtab("Setup");
        clickOnFlextableButtonToOpenModal("Associate", "Objectives",
                "AnnouncementGranteeStrategicGoalsObjectivesiframeContentId");
        chooseRecordForAssociation("Add", objective, "popupflextable");
        closeModal("AnnouncementGranteeStrategicGoalsObjectivesmodalDivCloseIcon");
    }

    public void approverSelectionForAnnouncement(String programApprover, String fiscalApprover,
            String executiveApprover) {
        clickOnSubtab("Responsibilities");
        clickOnFlextableRowButtontoOpenModal("Edit", "Program Approver", "Approvers",
                "GrantorAnnouncementRolesandResponsibilitiesiframeContentId");
        fillInApproverDetails(programApprover, "GrantorAnnouncementRolesandResponsibilitiesiframeContentId");
        closeModal("GrantorAnnouncementRolesandResponsibilitiesmodalDivCloseIcon");
        clickOnFlextableRowButtontoOpenModal("Edit", "Program Approver", "Approvers",
                "GrantorAnnouncementRolesandResponsibilitiesiframeContentId");
        fillInApproverDetails(programApprover, "GrantorAnnouncementRolesandResponsibilitiesiframeContentId");
        closeModal("GrantorAnnouncementRolesandResponsibilitiesmodalDivCloseIcon");
        clickOnFlextableRowButtontoOpenModal("Edit", "Executive Approver", "Approvers",
                "GrantorAnnouncementRolesandResponsibilitiesiframeContentId");
        fillInApproverDetails(executiveApprover, "GrantorAnnouncementRolesandResponsibilitiesiframeContentId");
        closeModal("GrantorAnnouncementRolesandResponsibilitiesmodalDivCloseIcon");
    }

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

    public void additionOfAttachmentToAnnouncement(String fileName) {
        clickOnSubtab("Attachments");
        clickOnButtonForAttachmentNotesToOpenModal("Add", "Attachments");
        uploadFile(fileName, "Attachment", "Funding Opportunity Announcement");
        closeModal("Attachment");
    }

    public void approversApproveAnnouncement(String programApprover, String fiscalApprover, String executiveApprover,
            String announcementName) {
        reloginToggleToApp("As a Grantor", programApprover);
        navigateToTab("Planning");
        clickOnSidebar("Pending Tasks", "My Tasks");
        quickSearchOnTable(announcementName, "PhasePendingTasks");
        clickOnFlexTableIcon("Start", announcementName);
        clickOnApprovalDecisionBox("Approve");
        reloginToggleToApp("As a Grantor", executiveApprover);
        navigateToTab("Planning");
        clickOnSidebar("Pending Tasks", "My Tasks");
        quickSearchOnTable(announcementName, "PhasePendingTasks");
        clickOnFlexTableIcon("Start", announcementName);
        clickOnApprovalDecisionBox("Approve");
    }

    public void initiateReviewForAnnouncement(String sheetName, String excelFileName) {
        clickOnSubtab("Responsibilities");
        clickOnFlextableButtonToOpenModal("New", "Peer Reviewers", "GrantorAnnouncementReviewersTempiframeContentId");
        enterFieldValues(sheetName, excelFileName);
        clickOnModalButton("Save");
        closeModal("GrantorAnnouncementReviewersTempmodalDivCloseIcon");
        clickOnFlextableRowButton("Send for Review", "Created", "Peer Reviewers");
    }

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
