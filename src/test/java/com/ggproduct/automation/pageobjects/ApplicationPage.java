package com.ggproduct.automation.pageobjects;

import java.util.ArrayList;

import java.util.Collections;
import java.util.List;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;

public class ApplicationPage extends ProjectManager {
    private final By getTitles, ConflictOfInterestReviewFromPath;

    public ApplicationPage(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
        getTitles = By.xpath("//div[@class='panel-heading']//h3");
        ConflictOfInterestReviewFromPath = By.xpath("//span//input[@type='radio'][@value='I agree']");
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
        clickOnPageButtonWithModalId("Create Application", "iframeActionModalIdViewLayout");
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
        clickOnSubtab("Financials");
        clickOnFlextableButtonToOpenModal("Add Focus Area", "Focus Area");
        chooseRecordForAssociation("Add", focusArea, "popupflextable");
        closeModal("FocusAreaAppmodalDivCloseIcon");
    }

    /**
     * Handles addition of budget details to an application
     * 
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
     * 
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
     * 
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

    /**
     * Handles completion of one review process by clicking on Promote to Next step button for the passed application
     * @param reviewStep
     * @param applicationName
     * @param announcementOwner
     * @param announcementName
     */
    public void completeReviewStepForApplication(String reviewStep, String buttonName, String applicationName, String announcementOwner,
            String announcementName) {
        try {
            loginToggleToApp("As a Grantor", announcementOwner);
        } catch(Exception ex) {
            reloginToggleToApp("As a Grantor", announcementOwner);
        }
        navigateToTab("Applications");
        clickOnSidebar("Reviews", "Application Review");
        changeFlexTableView("Applications Under Review");
        quickSearchOnTable(announcementName, "flexTableRandomID1");
        clickOnFlexTableIcon("View", announcementName);
        clickOnSubtab("Related Logs");
        scrollToSection("Manage Reviews");
        clickButtonOnGrid("View", reviewStep, "AnnouncementReviewStepsFlexToggle");
        clickOnCheckbox(applicationName, "Review Decisions");
        clickOnFlextableButton(buttonName, "Review Decisions");
        clickOnConfirmationtBox("Yes");
    }

    /**
     * Handles adding reviewer to a review step
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
     * @param dueInDays
     */
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

    /**
     * Handles adding reviewer to SME review
     * @param programReviewer
     * @param fiscalReviewer
     * @param complianceReviewer
     */
    public void addReviewerForReviewSME(String programReviewer, String fiscalReviewer, String complianceReviewer) {
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

    /**
     * Handles assigning of given application to the reviewer
     * @param applicationName
     */
    public void assignApplicationToReviewerSME(String applicationName) {
        expandGrid("Program Review", "Review Forms");
        clickOnFlextableRowButtontoOpenModal("Assign", "Automation PM", "Reviewers",
                "RelatedExternalReviewersGridiframeContentId");
        chooseRecordForAssociation("Assign", applicationName, "AssignPanelApplicationsTable");
        switchToParentFrame();
        expandGrid("Fiscal Review", "Review Forms");
        clickOnFlextableRowButtontoOpenModal("Assign", "Automation PM", "Reviewers",
                "RelatedExternalReviewersGridiframeContentId");
        chooseRecordForAssociation("Assign", applicationName, "AssignPanelApplicationsTable");
        switchToParentFrame();
        expandGrid("Compliance Review", "Review Forms");
        clickOnFlextableRowButtontoOpenModal("Assign", "Automation PM", "Reviewers",
                "RelatedExternalReviewersGridiframeContentId");
        chooseRecordForAssociation("Assign", applicationName, "AssignPanelApplicationsTable");
        switchToParentFrame();
    }

    /**
     * Handles choosing and sending the review records for review
     */
    public void chooseAndSendReviewsSME() {
        clickOnCheckbox("Program Review", "Reviews");
        clickOnCheckbox("Fiscal Review", "Reviews");
        clickOnCheckbox("Compliance Review", "Reviews");
        clickOnFlextableButton("Send for Review", "Reviews");
    }

    /**
     * Handles completing review form as a reviewer in SME review
     */
    public void completeReviewFormSME() {
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
     * @param dueInDays
     */
    public void enterDueInDaysManagement(String dueInDays) {
        clickOnFlextableRowButton("Edit", "Management Review", "Review Forms");
        fillFieldsForInlineTable("RelatedReviewPanelGridresizable", "8", "text", dueInDays);
        clickOnFlextableButton("Save", "Review Forms");
    }
    
    /**
     * Handles adding of reviewer to the management review
     * @param managementReviewer
     */
    public void addReviewerForReviewManagement(String managementReviewer) {
        expandGrid("Program Review", "Review Forms");
        clickOnFlextableButton("Add", "Reviewers");
        addReviewerForReview(managementReviewer, "RelatedExternalReviewersGridresizable");
        clickOnFlextableButton("Save", "Review Forms");
    }
    
    /**
     * Handles assigning of given application to reviewer
     * @param applicationName
     */
    public void assignApplicationToReviewerManagement(String applicationName) {
        expandGrid("Management Review", "Review Forms");
        clickOnFlextableRowButtontoOpenModal("Assign", "Automation EXE", "Reviewers",
                "RelatedExternalReviewersGridiframeContentId");
        chooseRecordForAssociation("Assign", applicationName, "AssignPanelApplicationsTable");
        switchToParentFrame();
    }
    
    /**
     * Handles choosing and sending the review records for review
     */
    public void chooseAndSendReviewsManagement() {
        clickOnCheckbox("Management Review", "Reviews");
        clickOnFlextableButton("Send for Review", "Reviews");
    }
    
    /**
     * Handles completing review form as a reviewer in Management review
     */
    public void completeReviewFormManagement() {
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
     * @param value
     */
    public void enterSubAwardAbbreviationFDM(String value) {
        clickOnPageButton("Edit");
        enterFieldValue("GrantCode__c", value);
        clickOnPageButton("Save");
    }
    
    /**
     * Handles entering of recommendation for the given application in FDM
     * @param recommendation
     * @param budget
     * @param applicationName
     * @param flextableName
     */
    public void enterRecommendationFDM(String recommendation, String budget, String applicationName, String flextableName) {
        clickOnFlextableRowButton("Edit", applicationName, flextableName);
        fillFieldsForInlineTable("toggleFGridFundingDecisionMemoApplications", "6", "text", budget);
        fillFieldsForInlineTable("toggleFGridFundingDecisionMemoApplications", "8", "dropdown", recommendation);
        fillFieldsForInlineTable("toggleFGridFundingDecisionMemoApplications", "9", "text", defaultLongText);
        clickOnFlextableButton("Save", flextableName);
    }
    
    /**
     * Handles assigning of approver to FDM
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
        reiDriver.findMyElement().getElement(ConflictOfInterestReviewFromPath).click();
        for (int i = 0; i < getTitlesReviewForm().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewForm(getTitlesReviewForm().get(i)); j++) {
                reiDriver.textInput().clearText(getTextAreaReviewForm(getTitlesReviewForm().get(i), j));
                reiDriver.textInput().enterText(getTextAreaReviewForm(getTitlesReviewForm().get(i), j),
                        defaultLongText);
            }
        }

        for (int i = 0; i < getTitlesReviewForm().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewForm(getTitlesReviewForm().get(i)); j++) {
                if (checkTextInputScorePresentReviewForm(getTitlesReviewForm().get(i), j) > 0) {
                    reiDriver.textInput().clearText(getTextInputScoreReviewForm(getTitlesReviewForm().get(i), j));
                    reiDriver.textInput().enterText(getTextInputScoreReviewForm(getTitlesReviewForm().get(i), j), "3");
                }
                continue;
            }
        }

        for (int i = 0; i < getTitlesReviewForm().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewForm(getTitlesReviewForm().get(i)); j++) {
                if (checkDropdownPresentReviewForm(getTitlesReviewForm().get(i), j) > 0) {
                    clickYesOnDropdownReviewForm(getTitlesReviewForm().get(i), j);
                }
                continue;
            }
        }

        for (int i = 0; i < getTitlesReviewForm().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewForm(getTitlesReviewForm().get(i)); j++) {
                if (checkTextInputPercentPresentReviewForm(getTitlesReviewForm().get(i), j) > 0) {
                    reiDriver.textInput().clearText(getTextInputPercentReviewForm(getTitlesReviewForm().get(i), j));
                    reiDriver.textInput().enterText(getTextInputPercentReviewForm(getTitlesReviewForm().get(i), j),
                            "25");
                }
                continue;
            }
        }

        for (int i = 0; i < getTitlesReviewForm().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewForm(getTitlesReviewForm().get(i)); j++) {
                if (checkTextInputDollarPresentReviewForm(getTitlesReviewForm().get(i), j) > 0) {
                    reiDriver.textInput().clearText(getTextInputDollarReviewForm(getTitlesReviewForm().get(i), j));
                    reiDriver.textInput().enterText(getTextInputDollarReviewForm(getTitlesReviewForm().get(i), j),
                            "1000");
                }
                continue;
            }
        }

        for (int i = 0; i < getTitlesReviewForm().size(); i++) {
            for (int j = 1; j <= getcountForRowsReviewForm(getTitlesReviewForm().get(i)); j++) {
                if (checkTextInputDatePresentReviewForm(getTitlesReviewForm().get(i), j) > 0) {
                    reiDriver.textInput().clearText(getTextInputDateReviewForm(getTitlesReviewForm().get(i), j));
                    reiDriver.textInput().enterText(getTextInputDateReviewForm(getTitlesReviewForm().get(i), j),
                            "05/05/2020");
                }
                continue;
            }
        }
    }

    private List<String> getTitlesReviewForm() {
        List<String> applicationReviewFormTitles = new ArrayList<String>();
        for (WebElement myElement : reiDriver.findMyElement().getElements(getTitles)) {
            if (myElement.getText().equalsIgnoreCase("Conflict of Interest")
                    || myElement.getText().equalsIgnoreCase("Overview")) {
                continue;
            }
            Collections.addAll(applicationReviewFormTitles, myElement.getText());
        }
        return applicationReviewFormTitles;
    }

    private int getcountForRowsReviewForm(String title) {
        return reiDriver.findMyElement().getElements(By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow']")).size();
    }

    private By getTextAreaReviewForm(String title, int qNumber) {
        return By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                + "]//textarea");
    }

    private int checkTextInputScorePresentReviewForm(String title, int qNumber) {
        return reiDriver.findMyElement()
                .getElements(By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                        + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                        + "]//input[@placeholder='Enter a number']"))
                .size();
    }

    private By getTextInputScoreReviewForm(String title, int qNumber) {
        return By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                + "]//input[@placeholder='Enter a number']");
    }

    private int checkTextInputPercentPresentReviewForm(String title, int qNumber) {
        return reiDriver.findMyElement()
                .getElements(By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                        + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                        + "]//input[@placeholder='Enter a percentage']"))
                .size();
    }

    private By getTextInputPercentReviewForm(String title, int qNumber) {
        return By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                + "]//input[@placeholder='Enter a percentage']");
    }

    private int checkTextInputDollarPresentReviewForm(String title, int qNumber) {
        return reiDriver.findMyElement()
                .getElements(By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                        + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                        + "]//input[@placeholder='Enter a dollar value']"))
                .size();
    }

    private By getTextInputDollarReviewForm(String title, int qNumber) {
        return By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                + "]//input[@placeholder='Enter a dollar value']");
    }

    private int checkTextInputDatePresentReviewForm(String title, int qNumber) {
        return reiDriver.findMyElement()
                .getElements(By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                        + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                        + "]//input[@placeholder='mm/dd/yyyy']"))
                .size();
    }

    private By getTextInputDateReviewForm(String title, int qNumber) {
        return By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                + "]//input[@placeholder='mm/dd/yyyy']");
    }

    private int checkDropdownPresentReviewForm(String title, int qNumber) {
        return reiDriver.findMyElement()
                .getElements(By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                        + "']/../../..//div[contains(@class,'panel-body')]/div[@class='row reviewRow'][" + qNumber
                        + "]//select"))
                .size();
    }

    private void clickYesOnDropdownReviewForm(String title, int qNumber) {
        try {
            reiDriver.findMyElement()
                    .getDropDown(By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                            + "']/../../..//div[contains(@class,'panel-body')]/div[" + qNumber + "]//select"))
                    .selectByValue("Yes");
        } catch (Exception ex) {
            try {
                reiDriver.findMyElement()
                        .getDropDown(By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                                + "']/../../..//div[contains(@class,'panel-body')]/div[" + qNumber + "]//select"))
                        .selectByValue("Medium");
            } catch (Exception e) {
                reiDriver.findMyElement()
                        .getDropDown(By.xpath("//div[@class='panel-heading']//h3[text()='" + title
                                + "']/../../..//div[contains(@class,'panel-body')]/div[" + qNumber + "]//select"))
                        .selectByValue("Recommended");
            }
        }
    }
}
