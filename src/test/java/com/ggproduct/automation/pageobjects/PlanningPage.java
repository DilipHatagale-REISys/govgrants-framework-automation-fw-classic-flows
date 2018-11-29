package com.ggproduct.automation.pageobjects;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;

public class PlanningPage extends ProjectManager {
    public PlanningPage(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
    }
    
    /**
     * Handles creation of a program from the sheet in an excel
     * @param user
     * @param sheetName
     * @param excelFileName
     */
    public void creationOfProgram(String user, String sheetName, String excelFileName) {
        loginToggleToApp("As a Grantor", user);
        navigateToTab("Planning");
        clickOnSidebar("Internal Programs", "Programs");
        changeFlexTableView("Draft Internal Programs");
        clickOnFlexTableButtonToOpenModal("New", "Programs");
        enterFieldValues(sheetName, excelFileName);
        clickOnModalButton("Save And Close");
        clickOnPageButton("Save");
    }
    
    /**
     * Handles filling up of fields from the sheet in an excel
     * @param sheetName
     * @param excelFileName
     */
    public void editionOfProgram(String sheetName, String excelFileName) {
        clickOnPageButton("Edit");
        enterFieldValues(sheetName, excelFileName);
        clickOnPageButton("Save");
    }
    
    /**
     * Handles association of contact, focus area and objective to a program
     * @param contact
     * @param focusArea
     * @param objective
     */
    public void associationOfRecordsToProgram(String contact, String focusArea, String objective) {
        //Contact association
        clickOnSubtab("Overview");
        clickOnFlextableButtonToOpenModal("Associate", "Contacts");
        chooseRecordForAssociation("Add", contact, "AssociateProgramContacts");
        closeModal("ProgramContactsmodalDivCloseIcon");
        
        //Focus Area association
        clickOnSubtab("Setup");
        clickOnFlextableButtonToOpenModal("Associate", "Focus Areas");
        chooseRecordForAssociation("Associate", focusArea, "popupflextable");
        closeModal("GrantorServiceAreasProgrammodalDivCloseIcon");
        
        //Objective association
        clickOnSubtab("Setup");
        clickOnFlextableButtonToOpenModal("Associate", "Objectives");
        chooseRecordForAssociation("Add", objective, "popupflextable");
        closeModal("RelatedProgramGoalsandObjectivesmodalDivCloseIcon");
    }
    
    /**
     * Handles assigning of approvers to a program
     * @param programApprover
     * @param executiveApprover
     */
    public void approverSelectionForProgram(String programApprover, String executiveApprover) {
        clickOnSubtab("Responsibilities");
        clickOnFlextableRowButtontoOpenModal("Edit", "Program Approver", "Approvers", "ProgramRolesAndResponsibilitiesiframeContentId");
        fillInApproverDetails(programApprover);
        switchToParentFrame();
        clickOnFlextableRowButtontoOpenModal("Edit", "Executive Approver", "Approvers", "ProgramRolesAndResponsibilitiesiframeContentId");
        fillInApproverDetails(executiveApprover);
        switchToParentFrame();
    }
    
    /**
     * Handles adition of checklist to a program
     * @param description
     * @param required
     * @param appliesTo
     * @param fileName
     */
    public void additionOfChecklistToProgram(String description, String required, String appliesTo, String fileName) {
        clickOnSubtab("Setup");
        clickOnFlextableButton("Add", "inlineEditGridProgramChecklists");
        fillFieldsForInlineTable("flexGridHeaderButtonsProgramChecklists", "1", "text", description);
        fillFieldsForInlineTable("flexGridHeaderButtonsProgramChecklists", "2", "dropdown", required);
        fillFieldsForInlineTable("flexGridHeaderButtonsProgramChecklists", "3", "dropdown", appliesTo);
        clickOnFlextableButton("Save", "Supporting Documents Checklist");
        clickOnFlextableRowButtontoOpenModal("Upload Template", "Not Applicable", "Supporting Documents Checklist", "ProgramChecklistsiframeContentId");
        uploadFile(fileName, "Checklist", "Program");
        closeModal("ProgramChecklistsiframeContentIdButton");
    }
    
    /**
     * Handles adding an attachment to a program
     * @param fileName
     */
    public void additionOfAttachmentToProgram(String fileName) {
        clickOnSubtab("Attachments");
        clickOnButtonForAttachmentNotesToOpenModal("Add", "Attachments");
        uploadFile(fileName, "Attachment", "Program Artifacts");
        closeModal("Attachment");
    }
    
    /**
     * Handles approving a program by the assigned approvers
     * @param programApprover
     * @param executiveApprover
     * @param programName
     */
    public void approversApproveProgram(String programApprover, String executiveApprover, String programName) {
        reloginToggleToApp("As a Grantor", programApprover);
        navigateToTab("Planning");
        clickOnSidebar("Pending Tasks", "MyTasks");
        quickSearchOnTable(programName, "PhasePendingTasks");
        clickOnFlexTableIcon("Start", programName);
        clickOnApprovalDecisionBox("Approve");
        reloginToggleToApp("As a Grantor", executiveApprover);
        navigateToTab("Planning");
        clickOnSidebar("Pending Tasks", "MyTasks");
        quickSearchOnTable(programName, "PhasePendingTasks");
        clickOnFlexTableIcon("Start", programName);
        clickOnApprovalDecisionBox("Approve");
    }
}
