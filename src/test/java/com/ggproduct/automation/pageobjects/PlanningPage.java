package com.ggproduct.automation.pageobjects;

import com.automation.rei.controller.Controller;

import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;

import cucumber.api.DataTable;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PlanningPage extends ProjectManager {
    public PlanningPage(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
    }

    /**
     * Handles creation of a program from the sheet in an excel
     * 
     * @param user
     * @param sheetName
     * @param excelFileName
     */
    public void creationOfProgram(String user, String sheetName, String excelFileName, DataTable dataTable) {
        Map<String, Map<String, String>> parameterMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        loginToggleToApp(parameterMap.get("Program Navigation").get("Value 1"), user);
        navigateToTab(parameterMap.get("Program Navigation").get("Value 2"));
        clickOnSidebar(parameterMap.get("Program FlexTable").get("Value 1"),
                parameterMap.get("Program FlexTable").get("Value 2"));
        changeFlexTableView(parameterMap.get("Program FlexTable").get("Value 3"));
        clickOnPhaseFlexTableButton(parameterMap.get("Program Creation").get("Value 1"),
                parameterMap.get("Program FlexTable").get("Value 2"));
        enterFieldValues(sheetName, excelFileName);
        clickOnModalButton(parameterMap.get("Program Creation").get("Value 2"));
        clickOnPageButton(parameterMap.get("Program Creation").get("Value 3"));
    }

    /**
     * Handles filling up of fields from the sheet in an excel
     * 
     * @param sheetName
     * @param excelFileName
     */
    public void editionOfProgram(String sheetName, String excelFileName, DataTable dataTable) {
        Map<String, Map<String, String>> parameterMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);
        Map<String, String> firstMap = parameterMap.get("Actions");
        clickOnPageButton("Edit");
        enterFieldValues(sheetName, excelFileName);
        clickOnPageButton("Save");
    }

    /**
     * Handles association of contact, focus area and objective to a program
     * 
     * @param contact
     * @param focusArea
     * @param objective
     */
    public void associationOfRecordsToProgram(String contact, String focusArea, String objective) {
        // Contact association
        clickOnSubtab("Overview");
        clickOnFlextableButton("Associate", "Contacts", "ProgramContacts");
        chooseRecordForAssociation("Add", contact, "AssociateProgramContacts");
        closeModal();

        // Focus Area association
        clickOnSubtab("Setup");
        clickOnFlextableButton("Associate", "Related Focus Areas", "flexGridGrantorServiceAreasProgram");
        chooseRecordForAssociation("Associate", focusArea, "popupflextable");
        closeModal();

        // Objective association
        clickOnSubtab("Setup");
        clickOnFlextableButton("Associate", "Objectives", "RelatedProgramGoalsandObjectives");
        chooseRecordForAssociation("Add", objective, "popupflextable");
        closeModal();
    }

    /**
     * Handles assigning of approvers to a program
     * 
     * @param programApprover
     * @param executiveApprover
     */
    public void approverSelectionForProgram(String programApprover, String executiveApprover) {
        clickOnSubtab("Responsibilities");
        clickOnFlextableRowButton("Edit", "Program Approver", "Approvers");
        fillInApproverDetails(programApprover);
        switchToParentFrame();
        clickOnFlextableRowButton("Edit", "Executive Approver", "Approvers");
        fillInApproverDetails(executiveApprover);
        switchToParentFrame();
    }

    /**
     * Handles addition of checklist to a program
     * 
     * @param description
     * @param required
     * @param appliesTo
     * @param fileName
     */
    public void additionOfChecklistToProgram(String fileName, DataTable dataTable) {
        List<Map<String, String>> inlineDataTableList = new ArrayList<Map<String, String>>();
        Map<String, String> inlineMap = new HashMap<String, String>();
        Map<String, Map<String, String>> parameterMap = govgrants.flexTable().convertDataTableToMapOfMaps(dataTable);

        for (String forString : parameterMap.keySet()) {
            System.out.println("forString " + forString);
            if (forString.equals("Inline Column Title")) {
                for (String innerFor : parameterMap.get(forString).keySet()) {
                    System.out.println("innerFor " + innerFor);
                    inlineMap.put(parameterMap.get(forString).get(innerFor),
                            parameterMap.get("Inline values").get(innerFor));
                    System.out.println("inlineMap " + inlineMap);
                }
                inlineDataTableList.add(inlineMap);
                System.out.println("inlineDataTableList " + inlineDataTableList);
            }
        }

        clickOnSubtab(parameterMap.get("Checklist Navigation").get("Value 1"));
        addFieldsForInlineTable(parameterMap.get("Checklist FlexTable").get("Value 1"),
                parameterMap.get("Checklist FlexTable").get("Value 2"), inlineDataTableList);
        clickOnFlextableRowButton(parameterMap.get("Upload Modal").get("Value 1"),
                parameterMap.get("Upload Modal").get("Value 2"),
                parameterMap.get("Upload Modal").get("Value 3"));
        uploadFile(fileName, parameterMap.get("Upload file").get("Value 1"), parameterMap.get("Upload file").get("Value 2"));
        closeModal();
    }

    /**
     * Handles adding an attachment to a program
     * 
     * @param fileName
     */
    public void additionOfAttachmentToProgram(String fileName) {
        clickOnSubtab("Attachments");
        clickOnButtonForAttachmentNotesToOpenModal("Add", " Attachments");
        uploadFile(fileName, "Attachment", "Program Artifacts");
        closeModal();
    }

    /**
     * Handles approving a program by the assigned approvers
     * 
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
