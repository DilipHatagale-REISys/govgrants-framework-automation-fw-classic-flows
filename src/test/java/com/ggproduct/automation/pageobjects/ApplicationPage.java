package com.ggproduct.automation.pageobjects;

import java.io.IOException;
import org.openqa.selenium.By;
import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;
import cucumber.api.DataTable;

public class ApplicationPage extends ProjectManager {
    public ApplicationPage(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
    }

    /**
     * Handles qualifying an announcement
     * 
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
     * 
     * @param sheetName
     * @param excelFileName
     */
    public void applicationCreation(String sheetName, String excelFileName) {
        clickOnPageButton("Create Application");
        enterFieldValues(sheetName, excelFileName);
        clickOnModalButton("Save And Close");
        clickOnPageButton("Save");
    }

    /**
     * Handles filling up of all fields in an application
     * 
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
     * 
     * @param focusArea
     */
    public void additionOfFocusAreaToApplication(String focusArea) {
        clickOnSubtab("Budget");
        clickOnFlextableButton("Add Focus Area", "FocusAreaApp");
        chooseRecordForAssociation("Add", focusArea, "popupflextable");
        switchToParentFrame();
    }

    /**
     * Handles addition of budget details to an application
     * 
     * @param awardBudget
     * @param cashMatch
     * @param nonCashMatch
     */
    public void additionOfBudgetToApplication(DataTable rowValues) {
        clickOnSubtab("Budget");
        expandGrid("BP01");
        expandGrid("Proposed Budget");
        fillFieldsForInlineTable("inlineEditGridApplicationBudgetCategoryGrantorFlexGrid", "Edit", rowValues);
    }

    /**
     * Handles addition of target values to a KPI in an application
     * 
     * @param target
     */
    public void additionOfTargetToKPIInApplication(DataTable rowValues) {
        clickOnSubtab("Proposal");
        fillFieldsForInlineTable("flexGridRecipientApplicationRelatedKPIs", "Edit", rowValues);
    }

    /**
     * Handles uploading of checklist files
     * 
     * @param fileName
     */
    public void uploadChecklistToApplication(String fileName) {
        clickOnSubtab("Attachments");
        clickOnFlextableRowButton("Attach", "Not Applicable", "Supporting Documents Checklist");
        uploadFile(fileName, "Checklist", "Application");
        closeModal();
        clickOnFlextableRowButton("Attach", "Not Applicable", "Supporting Documents Checklist");
        uploadFile(fileName, "Checklist", "Application");
        closeModal();
    }

    /**
     * Handles completion of one review process by clicking on Promote to Next step
     * button for the passed application
     * 
     * @param reviewStep
     * @param applicationName
     * @param announcementOwner
     * @param announcementName
     * @throws IOException 
     */
    public void completeReviewStepForApplication(String reviewStep, String buttonName, String applicationName,
            String announcementOwner, String announcementName) throws IOException {
        try {
            loginToggleToApp("As a Grantor", announcementOwner);
        } catch (Exception ex) {
            reloginToggleToApp("As a Grantor", announcementOwner);
        }
        navigateToTab("Applications");
        clickOnSidebar("Reviews", "Application Review");
        changeFlexTableView("Applications Under Review");
        quickSearchOnTable(announcementName, "flexTableRandomID1");
        clickOnFlexTableIcon("View", announcementName);
        clickOnSubtab("Related Logs");
        scrollToSection("Manage Reviews");
        clickOnFlextableRowButton("AnnouncementReviewStepsFlexToggle", "View", reviewStep);
        clickOnMultipleCheckbox(applicationName, "flexGridPreScreenRelatedStepApplicationsFinal");
        clickOnFlextableButton(buttonName, "flexGridPreScreenRelatedStepApplicationsFinal");
        try {
            clickOnConfirmationtBox("Yes");
        } catch (Exception e) {

        }
    }

    /**
     * Handles adding reviewer to a review step
     * 
     * @param reviewer
     * @param tableId
     */
    public void addReviewerForReview(String reviewer, String tableId) {
        reiDriver.findMyElement().getElement(By.xpath("//*[@id = '" + tableId + "']//following-sibling::td[1]//input"))
                .sendKeys(reviewer);
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.findMyElement()
                .getElement(By.xpath("//ul[@class='select2-results']//li//span[text()='" + reviewer + "']")).click();
    }

    /**
     * Handles entering of due date for SME review
     * 
     * @param dueInDays
     */
    public void enterDueInDaysSME(DataTable rowValues) {
        fillFieldsForInlineTable("flexGridApplicationReviewTree", "Edit", rowValues);
    }

    /**
     * Handles adding reviewer to SME review
     * 
     * @param programReviewer
     * @param fiscalReviewer
     * @param complianceReviewer
     */
    public void addReviewerForReviewSME(String programReviewer, String fiscalReviewer, String complianceReviewer) {
        expandGrid("Program Review");
        clickOnFlextableButton("Add", "flexGridApplicationReviewTree");
        addReviewerForReview(programReviewer, "RelatedExternalReviewersGridresizable");
        clickOnFlextableButton("Save", "flexGridApplicationReviewTree");
        collapseGrid("Program Review");
        expandGrid("Fiscal Review");
        clickOnFlextableButton("Add", "flexGridApplicationReviewTree");
        addReviewerForReview(fiscalReviewer, "RelatedExternalReviewersGridresizable");
        clickOnFlextableButton("Save", "flexGridApplicationReviewTree");
        collapseGrid("Fiscal Review");
        expandGrid("Compliance Review");
        clickOnFlextableButton("Add", "flexGridApplicationReviewTree");
        addReviewerForReview(complianceReviewer, "RelatedExternalReviewersGridresizable");
        clickOnFlextableButton("Save", "flexGridApplicationReviewTree");
        collapseGrid("Compliance Review");
    }

    /**
     * Handles assigning of given application to the reviewer
     * 
     * @param applicationName
     */
    public void assignApplicationToReviewerSME(String applicationName) {
        expandGrid("Program Review");
        clickOnFlextableRowButton("Assign", "Automation PM", "Reviewers");
        chooseRecordForAssociation("Assign", applicationName, "AssignPanelApplicationsTable");
        switchToParentFrame();
        expandGrid("Fiscal Review");
        clickOnFlextableRowButton("Assign", "Automation FO", "Reviewers");
        chooseRecordForAssociation("Assign", applicationName, "AssignPanelApplicationsTable");
        switchToParentFrame();
        expandGrid("Compliance Review");
        clickOnFlextableRowButton("Assign", "Automation EXE", "Reviewers");
        chooseRecordForAssociation("Assign", applicationName, "AssignPanelApplicationsTable");
        switchToParentFrame();
    }

    /**
     * Handles choosing and sending the review records for review
     */
    public void chooseAndSendReviewsSME() {
        clickOnMultipleCheckbox("flexGridStepReviews", "Program Review", "Fiscal Review", "Compliance Review");
        clickOnFlextableButton("Send for Review", "flexGridStepReviews");
    }

    /**
     * Handles completing review form as a reviewer in SME review
     * @throws IOException 
     */
    public void completeReviewFormSME() throws IOException {
        reloginToggleToApp("As a Grantor", "PM");
        navigateToTab("Applications");
        clickOnSidebar("Pending Tasks", "My Tasks");
        quickSearchOnTable("SME Review", "PhasePendingTasks");
        clickOnFlexTableIcon("Start", "SME Review");
        fillInReviewForm();
        clickOnPageButton("Save");
        clickOnPageButton("Submit");
        reloginToggleToApp("As a Grantor", "FO");
        navigateToTab("Applications");
        clickOnSidebar("Pending Tasks", "My Tasks");
        quickSearchOnTable("SME Review", "PhasePendingTasks");
        clickOnFlexTableIcon("Start", "SME Review");
        fillInReviewForm();
        clickOnPageButton("Save");
        clickOnPageButton("Submit");
        reloginToggleToApp("As a Grantor", "EXE");
        navigateToTab("Applications");
        clickOnSidebar("Pending Tasks", "My Tasks");
        quickSearchOnTable("SME Review", "PhasePendingTasks");
        clickOnFlexTableIcon("Start", "SME Review");
        fillInReviewForm();
        clickOnPageButton("Save");
        clickOnPageButton("Submit");
    }

    /**
     * Handles entering of due in days for management review
     * 
     * @param dueInDays
     */
    public void enterDueInDaysManagement(DataTable rowValues) {
        fillFieldsForInlineTable("flexGridApplicationReviewTree", "Edit", rowValues);
    }

    /**
     * Handles adding of reviewer to the management review
     * 
     * @param managementReviewer
     */
    public void addReviewerForReviewManagement(String managementReviewer) {
        expandGrid("Management Review");
        clickOnFlextableButton("Add", "flexGridApplicationReviewTree");
        addReviewerForReview(managementReviewer, "RelatedExternalReviewersGridresizable");
        clickOnFlextableButton("Save", "flexGridApplicationReviewTree");
        collapseGrid("Management Review");
    }

    /**
     * Handles assigning of given application to reviewer
     * 
     * @param applicationName
     */
    public void assignApplicationToReviewerManagement(String applicationName) {
        expandGrid("Management Review");
        clickOnFlextableRowButton("Assign", "Automation EXE", "Reviewers");
        chooseRecordForAssociation("Assign", applicationName, "AssignPanelApplicationsTable");
        switchToParentFrame();
    }

    /**
     * Handles choosing and sending the review records for review
     */
    public void chooseAndSendReviewsManagement() {
        clickOnMultipleCheckbox("flexGridStepReviews", "Management Review");
        clickOnFlextableButton("Send for Review", "flexGridStepReviews");
    }

    /**
     * Handles completing review form as a reviewer in Management review
     * @throws IOException 
     */
    public void completeReviewFormManagement() throws IOException {
        reloginToggleToApp("As a Grantor", "EXE");
        navigateToTab("Applications");
        clickOnSidebar("Pending Tasks", "My Tasks");
        quickSearchOnTable("Management Review", "PhasePendingTasks");
        clickOnFlexTableIcon("Start", "Management Review");
        fillInReviewForm();
        clickOnPageButton("Save");
        clickOnPageButton("Submit");
    }

    /**
     * Handles entering the given value in Subaward Abbreviation in FDM
     * 
     * @param value
     */
    public void enterSubAwardAbbreviationFDM(String value) {
        clickOnPageButton("Edit");
        enterFieldValue("GrantCode__c", value);
        clickOnPageButton("Save");
    }

    /**
     * Handles entering of recommendation for the given application in FDM
     * 
     * @param recommendation
     * @param budget
     * @param applicationName
     * @param flextableName
     */
    public void enterRecommendationFDM(DataTable rowValues) {
        fillFieldsForInlineTable("inlineEditGridFundingDecisionMemoApplications", "Edit", rowValues);
    }

    /**
     * Handles assigning of approver to FDM
     * 
     * @param approverName
     * @param approverType
     */
    public void selectApproverFDM(String approverName, String approverType) {
        clickOnSubtab("Responsibilities");
        clickOnFlextableRowButton("Edit", approverType, "Responsibilities");
        fillInApproverDetails(approverName);
        switchToParentFrame();
    }

    /**
     * Handles filling up of any given review form
     */
    public void fillInReviewForm() {
        govgrants.inputForms().completeFillingReviewForm();
    }
}
