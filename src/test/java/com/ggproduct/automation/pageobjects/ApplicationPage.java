package com.ggproduct.automation.pageobjects;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.projectmanager.ProjectManager;

public class ApplicationPage extends ProjectManager {
    public ApplicationPage(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
    }
    
    /**
     * Handles qualifying an announcement
     * @param announcementName
     * @param user
     */
    public void qualifyAnnouncement(String announcementName, String user) {
        loginToggleToApp("Grants Portal", user);
        navigateToTab("Opportunities");
        clickOnSidebar("Active", "Opportunities");
        quickSearchOnTable(announcementName, "popupflextable");
        clickOnFlexTableIcon("View", announcementName);
        clickOnPageButton("Qualify");
    }
    
    /**
     * Handles creation of an application
     * @param sheetName
     * @param excelFileName
     */
    public void applicationCreation(String sheetName, String excelFileName) {
        clickOnPageButtonWithModalId("Create Application", "iframeActionModalIdViewLayout");
        enterFieldValues(sheetName, excelFileName);
        clickOnModalButton("Save And Close");
        clickOnPageButton("Save");
    }
    
    /**
     * Handles filling up of all fields in an application
     * @param sheetName
     * @param excelFileName
     */
    public void editionOfApplication(String sheetName, String excelFileName) {
        clickOnPageButton("Edit");
        enterFieldValues(sheetName, excelFileName);
        clickOnPageButton("Save");
    }
    
    /**
     * Handles addition of focus area for an application
     * @param focusArea
     */
    public void additionOfFocusAreaToApplication(String focusArea) {
        clickOnSubtab("Financials");
        clickOnFlextableButtonToOpenModal("Add Focus Area", "Focus Area", "FocusAreaAppiframeContentId");
        chooseRecordForAssociation("Add", focusArea, "popupflextable");
        closeModal("FocusAreaAppmodalDivCloseIcon");
    }
    
    /**
     * Handles addition of budget details to an application
     * @param awardBudget
     * @param cashMatch
     * @param nonCashMatch
     */
    public void additionOfBudgetToApplication(String awardBudget, String cashMatch, String nonCashMatch) {
        clickOnSubtab("Financials");
        expandGrid("BP01", "Budget Details");
        expandGrid("Proposed Budget", "Budget Details");
        clickButtonOnChildGrid("Edit", "Construction", "toggleFGridApplicationBudgetCategoryGrantorFlexGrid");
        fillFieldsForInlineTable("childTableId", "3", "text", awardBudget);
        fillFieldsForInlineTable("childTableId", "4", "text", cashMatch);
        fillFieldsForInlineTable("childTableId", "5", "text", nonCashMatch);
        clickOnFlextableButton("Save", "Budget Details");
    }
    
    /**
     * Handles addition of target values to a KPI in an application
     * @param target
     */
    public void additionOfTargetToKPIInApplication(String target) {
        clickOnSubtab("Proposal");
        clickOnFlextableRowButton("Edit", "KPI-0005", "Key Performance Indicators");
        fillFieldsForInlineTable("toggleFGridRecipientApplicationRelatedKPIs", "5", "text", target);
        clickOnFlextableButton("Save", "Key Performance Indicators");
        clickOnFlextableRowButton("Edit", "KPI-0006", "Key Performance Indicators");
        fillFieldsForInlineTable("toggleFGridRecipientApplicationRelatedKPIs", "5", "text", target);
        clickOnFlextableButton("Save", "Key Performance Indicators");
    }
    
    /**
     * Handles uploading of checklist files
     * @param fileName
     */
    public void uploadChecklistToApplication(String fileName) {
        clickOnSubtab("Attachments");
        clickOnFlextableRowButtontoOpenModal("Attach", "Not Applicable", "Attachment Checklist",
                "ApplicationChecklistsiframeContentId");
        uploadFile(fileName, "Checklist", "Application");
        closeModal("ApplicationChecklistsiframeContentIdButton");
        clickOnFlextableRowButtontoOpenModal("Attach", "Not Applicable", "Attachment Checklist",
                "ApplicationChecklistsiframeContentId");
        uploadFile(fileName, "Checklist", "Application");
        closeModal("ApplicationChecklistsiframeContentIdButton");
    }
    
    
}
