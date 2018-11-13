package com.ggproduct.automation.pageobjects;


import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.projectmanager.ProjectManager;

public class ProgramPage extends ProjectManager {
    public ProgramPage(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
    }
    
    public void creationOfProgram() {
        loginToggleToApp("As a Grantor", "EXE");
        navigateToTab("Planning");
        clickOnSidebar("Internal Programs", "Programs");
        clickOnFlexTableButton("New", "Draft Internal Programs");
        enterFieldValues("RequiredForSave", "Program_Field_Values.xlsx");
        clickOnPageButton("Save and Continue");
        clickOnPageButton("Save");
    }
    
    public void editionOfProgram() {
        clickOnPageButton("Edit");
        clickOnSubtab("Overview");
        enterFieldValues("RequiredForSubmit", "Program_Field_Values.xlsx");
        clickOnPageButton("Save");
    }
    
    public void associationOfRecordsToProgram() {
        //Contact association
        clickOnSubtab("Overview");
        clickOnFlextableButtonToOpenModal("Associate", "Contacts", "ProgramContactsiframeContentId");
        chooseRecordForAssociation("Add", "Automation EXE", "AssociateProgramContacts");
        closeModal("ProgramContactsmodalDivCloseIcon");
        
        //Focus Area association
        clickOnSubtab("Setup");
        clickOnFlextableButtonToOpenModal("Associate", "Focus Areas", "GrantorServiceAreasProgramiframeContentId");
        chooseRecordForAssociation("Associate", "00005", "popupflextable");
        closeModal("GrantorServiceAreasProgrammodalDivCloseIcon");
        
        //Objective association
        clickOnSubtab("Setup");
        clickOnFlextableButtonToOpenModal("Associate", "Objectives", "RelatedProgramGoalsandObjectivesiframeContentId");
        chooseRecordForAssociation("Add", "SPO-0006", "popupflextable");
        closeModal("RelatedProgramGoalsandObjectivesmodalDivCloseIcon");
    }
    
    public void approverSelectionForProgram() {
        clickOnSubtab("Responsibilities");
        clickOnFlextableRowButtontoOpenModal("Edit", "Program Approver", "Approvers", "ProgramRolesAndResponsibilitiesiframeContentId");
        fillInApproverDetails("Automation PM", "ProgramRolesAndResponsibilitiesiframeContentId");
        closeModal("ProgramRolesAndResponsibilitiesmodalDivCloseIcon");
        clickOnFlextableRowButtontoOpenModal("Edit", "Executive Approver", "Approvers", "ProgramRolesAndResponsibilitiesiframeContentId");
        fillInApproverDetails("Automation PM", "ProgramRolesAndResponsibilitiesiframeContentId");
        closeModal("ProgramRolesAndResponsibilitiesmodalDivCloseIcon");
    }
    
    public void additionOfChecklistToProgram() {
        clickOnSubtab("Setup");
        clickOnFlextableButton("Add", "Supporting Documents Checklist");
        fillFieldsForInlineTable("flexGridHeaderButtonsProgramChecklists", "1", "text", "Automation test description");
        fillFieldsForInlineTable("flexGridHeaderButtonsProgramChecklists", "2", "dropdown", "Mandatory");
        fillFieldsForInlineTable("flexGridHeaderButtonsProgramChecklists", "3", "dropdown", "Application");
        clickOnFlextableButton("Save", "Supporting Documents Checklist");
        clickOnFlextableRowButtontoOpenModal("Upload Template", "Not Applicable", "Supporting Documents Checklist", "ProgramChecklistsiframeContentId");
        uploadFile("Program_Field_Values.xlsx", "Checklist", "Program");
        closeModal("ProgramChecklistsiframeContentIdButton");
    }
    
    public void additionOfAttachmentToProgram() {
        clickOnSubtab("Attachments");
        clickOnButtonForAttachmentNotesToOpenModal("Add", "Attachments");
        uploadFile("InternalOrganization_Field_Values.xlsx", "Attachment", "Program Artifacts");
        closeModal("Attachment");
    }
    
    public void approversApproveProgram() {
        reloginToggleToApp("As a Grantor", "PM");
        navigateToTab("Planning");
        clickOnSidebar("Pending Tasks", "MyTasks");
        quickSearchOnTable("Automation Program", "PhasePendingTasks");
        clickOnFlexTableIcon("Start", "Automation Program");
        clickOnApprovalDecisionBox("Approve");
        reloginToggleToApp("As a Grantor", "EXE");
        navigateToTab("Planning");
        clickOnSidebar("Pending Tasks", "MyTasks");
        quickSearchOnTable("Automation Program", "PhasePendingTasks");
        clickOnFlexTableIcon("Start", "Automation Program");
        clickOnApprovalDecisionBox("Approve");
    }
}
