package com.ggproduct.automation.pageobjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

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
        clickButtonOnGrid("Edit", "Construction", "toggleFGridApplicationBudgetCategoryGrantorFlexGrid");
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
    
    public void completePreScreenReviewForApplication(String applicationName, String announcementOwner, String announcementName) {
        loginToggleToApp("As a Grantor", announcementOwner);
        navigateToTab("Applications");
        clickOnSidebar("Reviews", "Application Review");
        changeFlexTableView("Applications Under Review");
        quickSearchOnTable(announcementName, "flexTableRandomID1");
        clickOnFlexTableIcon("View", announcementName);
        clickOnSubtab("Related Logs");
        scrollToSection("Manage Reviews");
        clickButtonOnGrid("View", "Pre-Screen Review", "AnnouncementReviewStepsFlexToggle");
        clickOnCheckbox(applicationName, "Review Decisions");
        clickOnFlextableButton("Promote to Next Step", "Review Decisions");
        clickOnConfirmationtBox("Yes");
    }
    
    public void addReviewerForReview(String reviewer, String tableId) {
        reiDriver.findMyElement().getElement(By.xpath("//*[@id = '"+tableId+"']//following-sibling::td[1]//input")).sendKeys(reviewer);
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.findMyElement().getElement(By.xpath("//ul[@class='select2-results']//li//span[text()='"+reviewer+"']")).click();
    }
    
    public void enterDueInDaysSME(String dueInDays) {
        clickOnFlextableRowButton("Edit", "Program Review", "Review Forms");
        fillFieldsForInlineTable("RelatedReviewPanelGridresizable", "8", "text", dueInDays);
        clickOnFlextableButton("Save", "Review Forms");
        clickOnFlextableRowButton("Edit", "Fiscal Review", "Review Forms");
        fillFieldsForInlineTable("RelatedReviewPanelGridresizable", "8", "text", dueInDays);
        clickOnFlextableButton("Save", "Review Forms");
        clickOnFlextableRowButton("Edit", "Compliance Review", "Review Forms");
        fillFieldsForInlineTable("RelatedReviewPanelGridresizable", "8", "text", dueInDays);
        clickOnFlextableButton("Save", "Review Forms");
    }
    
    public void assignApplicationForReviewerSME(String programReviewer, String fiscalReviewer, String complianceReviewer) {
        expandGrid("Program Review", "Review Forms");
        clickOnFlextableButton("Add", "Reviewers");
        addReviewerForReview(programReviewer, "RelatedExternalReviewersGridresizable");
        clickOnFlextableButton("Save", "Review Forms");
        collapseGrid("Program Review", "Review Forms");
        expandGrid("Fiscal Review", "Review Forms");
        clickOnFlextableButton("Add", "Reviewers");
        addReviewerForReview(fiscalReviewer, "RelatedExternalReviewersGridresizable");
        clickOnFlextableButton("Save", "Review Forms");
        collapseGrid("Fiscal Review", "Review Forms");
        expandGrid("Compliance Review", "Review Forms");
        clickOnFlextableButton("Add", "Reviewers");
        addReviewerForReview(complianceReviewer, "RelatedExternalReviewersGridresizable");
        clickOnFlextableButton("Save", "Review Forms");
        collapseGrid("Compliance Review", "Review Forms");
    }
}
