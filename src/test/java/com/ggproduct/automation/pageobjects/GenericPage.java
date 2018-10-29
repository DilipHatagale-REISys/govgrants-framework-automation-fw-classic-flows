package com.ggproduct.automation.pageobjects;

import org.openqa.selenium.By;

import org.testng.Assert;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.projectmanager.ProjectManager;

public class GenericPage extends ProjectManager {
    private final By headerOverviewPath, approvalDecisionComments, approvalDecisionSubmit, programChecklistFramePath,
            attachmentFramePath, attachmentClassificationPath, attachmentDescriptionPath, attachmentFilePath,
            programChecklistCloseButtonPath, attachmentCloseButtonPath, announcementCreationFramePath,
            announcementChecklistFramePath, announcementChecklistCloseButtonPath, announcementBudgetPeriodFramePath,
            announcementBudgetPeriodCloseButtonPath, lookUpSearchPath, lookUpIFramePath, selectPath,
            approverDescription, approverDueDate;

    public GenericPage(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
        headerOverviewPath = By.xpath("//div[@class='panel-heading overview-header']");
        approvalDecisionComments = By.xpath("//div[@id='ApprovalDecisionComponent']//textarea[@id='descriptionInput']");
        approvalDecisionSubmit = By.xpath("//div[@id='ApprovalDecisionComponent']//input[@value='Submit']");
        programChecklistFramePath = By.xpath("//iframe[@id='ProgramChecklistsiframeContentId']");
        attachmentFramePath = By.xpath("//iframe[contains(@id,'iframeAddAttContentId')]");
        attachmentClassificationPath = By.xpath("//select[@title='Classification']");
        attachmentDescriptionPath = By.xpath("//div//label[text()='Description']/..//textarea");
        attachmentFilePath = By.xpath(
                "//td//label[text()='File']/../..//input[@type='file'] | //div//label[text()='File']/..//input[@type='file']");
        programChecklistCloseButtonPath = By.xpath("//button[@id='ProgramChecklistsiframeContentIdButton']");
        attachmentCloseButtonPath = By.xpath(
                "//div[@class='clearfix']//span[text()=' Attachments']/..//p[text()='Add Attachments']/..//button");
        announcementCreationFramePath = By.xpath("//iframe[@id='ActiveFundingOpportunitiesCompitiveiframeContentId']");
        announcementChecklistFramePath = By.xpath("//iframe[@id='AnnouncementChecklistsiframeContentId']");
        announcementChecklistCloseButtonPath = By.xpath("//button[@id='AnnouncementChecklistsiframeContentIdButton']");
        announcementBudgetPeriodFramePath = By.xpath("//iframe[@id='AnnouncementBudgetPeriodiframeContentId']");
        announcementBudgetPeriodCloseButtonPath = By.xpath("//button[@id='AnnouncementBudgetPeriodmodalDivCloseIcon']");
        lookUpSearchPath = By.xpath("//span[@class='fa fa-search']");
        lookUpIFramePath = By.xpath("//iframe[@id='iframeCustomLookupModalId']");
        selectPath = By.xpath("//a[@title='Select']");
        approverDescription = By.xpath("//div/label[text()=' Description ']/../span/textarea");
        approverDueDate = By.xpath("//span[@class='dateInput dateOnlyInput']/input");
    }

    /**
     * Handles navigation to the given app
     * 
     * @param appName
     */
    public void toggleApp(String appName) {
        govgrants.mainPage().setUpCustomAppDropDown(appName);
    }

    /**
     * Handles navigation to the given tab/ module
     * 
     * @param tabName
     */
    public void navigateToTab(String tabName) {
        govgrants.mainPage().clickMainMenuBar(tabName);
    }

    /**
     * Handles clicking on the given left pans/ side bar option
     * 
     * @param sidebarContent
     * @param sidebarSubHeader
     */
    public void clickOnSidebar(String sidebarContent, String sidebarSubHeader) {
        govgrants.sideBar().getSideBarContent(sidebarSubHeader, sidebarContent).click();
    }

    /**
     * Handles clicking of subtab inside the record view page
     * 
     * @param subtabName
     */
    public void clickOnSubtab(String subtabName) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.JavaScript().scrollpageToSpecificElement(headerOverviewPath);
        govgrants.pageDetails().clickSubTabsInsideTableView(subtabName);
    }

    /**
     * Handles clicking on the given button
     * 
     * @param buttonName
     */
    public void clickOnButton(String buttonName) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.JavaScript().scrollPageDocumentJS("pageup", 0, 0);
        govgrants.pageDetails().clickAnyTopRightButton(buttonName);

        if (buttonName.equals("Submit For Approval")) {
            clickOKForAlert();
            govgrants.mainPage().waitForNavigationLogoToDisappear();
        }
    }

    /**
     * Handles clicking on the given button inside a modal
     * 
     * @param buttonName
     */
    public void clickOnModalButton(String buttonName, String CloseButtonPresent) {
        By closeButton = By.xpath("//button");
        if (CloseButtonPresent.equals("Budget Period")) {
            closeButton = announcementBudgetPeriodCloseButtonPath;
        }
        if (buttonName.equals("Save and Close")) {
            govgrants.modal().clickModalContentSpecificButton("Save");
            reiDriver.switchTo().switchToParentFrame();
            reiDriver.findMyElement().getElement(closeButton).click();
        } else {
            govgrants.modal().clickModalContentSpecificButton(buttonName);
        }
        govgrants.mainPage().waitForNavigationLogoToDisappear();
    }

    /**
     * Handles entering of field values
     * 
     * @param sheetName
     * @param excelName
     */
    public void enterFieldValues(String sheetName, String excelName) {
        enterInputForFormsFromExcelFile(excelName, sheetName);
    }

    /**
     * Handles entering of field values inside a modal
     * 
     * @param sheetName
     * @param excelName
     */
    public void enterFieldValuesInModal(String sheetName, String excelName, String framePath) {
        By popUpPath = By.xpath("//iframe");
        if (framePath.equals("Announcement Creation")) {
            popUpPath = announcementCreationFramePath;
        } else if (framePath.equals("Budget Period")) {
            popUpPath = announcementBudgetPeriodFramePath;
        }
        reiDriver.switchTo().switchToFrame(popUpPath);
        enterInputForFormsFromExcelFile(excelName, sheetName);
    }

    /**
     * Assert the status for overviewHeader
     * 
     * @param record
     * @param status
     */
    public void assertStatus(String record, String status) {
        Assert.assertTrue(isStatus(record, status));
    }

    /**
     * handles changing field values
     * 
     * @param fieldId
     * @param text
     */
    public void changeFieldValueText(String fieldId, String text) {
        reiDriver.textInput().clearText(getTextInputFields(fieldId));
        reiDriver.textInput().enterText(getTextInputFields(fieldId), text);
    }

    /**
     * Assert the text value for the given field label
     * 
     * @param fieldLabel
     * @param text
     */
    public void assertfieldValue(String fieldLabel, String text) {
        Assert.assertTrue(isFieldModified(fieldLabel, text));
    }

    /**
     * Handles toggling between different list views
     * 
     * @param tableViewName
     */
    public void changeFlexTableView(String tableViewName) {
        govgrants.phasePannel().clickDoubleArrowtoggle(tableViewName);
    }

    /**
     * Assert if a column value is present in a flextable
     * 
     * @param status
     */
    public void assertColumnValueOnTable(String status) {
        Assert.assertTrue(isStatusCorrect(status));
    }

    /**
     * Clicking on flextable top button when one flextable is present in the page
     * 
     * @param buttonName
     */
    public void clickOnFlexTableButton(String buttonName, String flextableName) {
        reiDriver.findMyElement().getElement(getFlextableTopBtton(buttonName, flextableName)).click();
    }

    /**
     * To perform quick search on a table
     * 
     * @param searchText
     * @param tableName
     */
    public void quickSearchOnTable(String searchText, String tableName) {
        govgrants.quickSearch().performTableSpecificQuickSearch(tableName, searchText);
    }

    /**
     * Handles clicking of an row level button against the given unique column value
     * 
     * @param iconName
     * @param uniqueTextValue
     */
    public void clickOnFlexTableIcon(String iconName, String uniqueTextValue) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        govgrants.flexTable().clickTableActionIcons(uniqueTextValue, iconName);
    }

    /**
     * Handles clicking on the top button of the given flextable
     * 
     * @param buttonName
     * @param flextableName
     */
    public void clickOnFlextableButton(String buttonName, String flextableName) {
        if (flextableName.equals(" Attachments")) {
            reiDriver.WaitFor().WaitForElementToBePresent(getButtonOnFlexTable(buttonName, flextableName)).click();
        } else {
            reiDriver.JavaScript().scrollElementToPageDetailCenter(getScrollToSection(flextableName));
            reiDriver.WaitFor().WaitForElementToBePresent(getButtonOnFlexTable(buttonName, flextableName)).click();
        }
    }

    /**
     * Clicks on flextable row level buttons in list view where there are number of
     * flextables
     * 
     * @param buttonName
     * @param uniqueColumnvalue
     * @param flextableName
     */
    public void clickOnFlexTableIconWithTableId(String iconName, String tableId, String searchText) {
        govgrants.quickSearch().performTableSpecificQuickSearch(tableId, searchText);
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        govgrants.flexTable().clickTableActionIcons(searchText, iconName);
    }

    /**
     * Asserts if a column value is present inside the given flextable
     * 
     * @param columnUniqueValue
     * @param flextableName
     */
    public void assertColumnOnTable(String columnUniqueValue, String flextableName) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        Assert.assertTrue(isColumnPresent(columnUniqueValue, flextableName));
    }

    /**
     * Handles closing modal
     * 
     * @param closeButtonId
     */
    public void closeModal(String closeButtonId) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.switchTo().switchToParentFrame();
        reiDriver.WaitFor().WaitForElementToBePresent(getCloseButtonPath(closeButtonId)).click();
        reiDriver.get().getRefresh();
    }

    /**
     * Clicks on flextable row level buttons inside the record view page where there
     * are number of flextables
     * 
     * @param buttonName
     * @param uniqueColumnvalue
     * @param flextableName
     */
    public void clickOnFlextableRowButton(String buttonName, String uniqueColumnvalue, String flextableName) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.JavaScript().scrollElementToPageDetailCenter(getScrollToSection(flextableName));
        try {
            govgrants.flexTable().clickTableActionIcons(uniqueColumnvalue, buttonName);
        } catch (Exception ex) {
            reiDriver.findMyElement()
                    .getElement(By.xpath("//td//span/*[contains(@title,'" + uniqueColumnvalue
                            + "') or contains(text(),'" + uniqueColumnvalue
                            + "')]/../../../../../../../following-sibling::td//span//a[@title='" + buttonName + "']"))
                    .click();
        }
    }

    /**
     * Handles association of various related records
     * 
     * @param recordName
     * @param recordUniqueName
     * @param buttonName
     */
    public void chooseRecordForAssociation(String buttonName, String recordUniqueName, String iFrameId) {
        reiDriver.WaitFor().WaitForElementClickAble(getIFramePath(iFrameId));
        reiDriver.switchTo().switchToFrame(getIFramePath(iFrameId));
        reiDriver.WaitFor().makeThreadSleep(1000);
        // govgrants.quickSearch().performModalSpecificQuickSearch("toggleFlexTablepopupflextable",
        // recordUniqueName);
        // reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.WaitFor().WaitForElementToBePresent(getUniqueRecordNameToSelect(recordUniqueName)).click();
        try {
            govgrants.phasePannel().clickAnyRightPannelButton("flexTableHeaderButtonspopupflextable", buttonName);
        } catch (Exception e) {
            govgrants.phasePannel().clickAnyRightPannelButton("flexTableHeaderButtonsSoleSourceAwardRecipientsTable",
                    buttonName);

        }
    }

    /**
     * Handles uploading of file
     * 
     * @param fileName
     * @param uploadSectionName
     */
    public void uploadFile(String fileName, String uploadSectionName, String attachmentType) {
        String defaultFilePath = System.getProperty("user.dir") + "/src/main/resources/";
        By popUpPath = By.xpath("//iframe");
        By closeButton = By.xpath("//button");

        if (uploadSectionName.equals("Checklist")) {
            if (attachmentType.equals("Program")) {
                popUpPath = programChecklistFramePath;
                closeButton = programChecklistCloseButtonPath;
            } else if (attachmentType.equals("Announcement")) {
                popUpPath = announcementChecklistFramePath;
                closeButton = announcementChecklistCloseButtonPath;
            }
            reiDriver.WaitFor().WaitForElementClickAble(popUpPath);
            reiDriver.switchTo().switchToFrame(popUpPath);
        } else {
            reiDriver.WaitFor().WaitForElementClickAble(attachmentFramePath);
            reiDriver.switchTo().switchToFrame(attachmentFramePath);
            reiDriver.findMyElement().getDropDown(attachmentClassificationPath).selectByValue(attachmentType);
            reiDriver.findMyElement().getElement(attachmentDescriptionPath).sendKeys(defaultLongText);
            closeButton = attachmentCloseButtonPath;
        }
        reiDriver.findMyElement().getElement(attachmentFilePath).sendKeys(defaultFilePath + fileName);
        govgrants.modal().clickModalContentSpecificButton("Save");
        reiDriver.switchTo().switchToParentFrame();
        reiDriver.findMyElement().getElement(closeButton).click();
    }

    /**
     * Handles selection of approver
     * 
     * @param approverName
     */
    public void fillInApproverDetails(String approverName, String iFrameId) {
        reiDriver.WaitFor().WaitForElementClickAble(getIFramePath(iFrameId));
        reiDriver.switchTo().switchToFrame(getIFramePath(iFrameId));
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.findMyElement().getElement(By.xpath("//span[@class='lookupInput']//input")).sendKeys(approverName);
        reiDriver.WaitFor().WaitForElementToBePresent(lookUpSearchPath).click();
        reiDriver.switchTo().switchToFrame(lookUpIFramePath);
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.WaitFor().WaitForElementToBePresent(selectPath).click();
        // govgrants.flexTable().clickTableActionIcons(approverName, "Select");
        reiDriver.switchTo().switchToParentFrame();
        reiDriver.WaitFor().WaitForElementClickAble(getIFramePath(iFrameId));
        reiDriver.switchTo().switchToFrame(getIFramePath(iFrameId));
        reiDriver.textInput().clearText(approverDescription);
        reiDriver.textInput().enterText(approverDescription, defaultLongText);
        reiDriver.textInput().enterText(approverDueDate, reiDriver.get().getCurrentDate_MMDDYYYY());
        reiDriver.WaitFor().makeThreadSleep(1000);
        govgrants.modal().clickModalContentSpecificButton("Save");
    }

    /**
     * Handles clicking on Approval Decision and clicks submit
     * 
     * @param approvalDesicion
     */
    public void clickOnApprovalDecisionBox(String approvalDesicion) {
        reiDriver.WaitFor().WaitForElementToBePresent(getApprovalDecisionRadioButton(approvalDesicion)).click();
        reiDriver.WaitFor().WaitForElementToBePresent(approvalDecisionComments).sendKeys(defaultLongText);
        reiDriver.WaitFor().WaitForElementToBePresent(approvalDecisionSubmit).click();
        govgrants.mainPage().waitForNavigationLogoToDisappear();
    }

    /**
     * Handles filling in the fields for attachment checklist
     */
    public void fillFieldsAttachmentChecklist() {
        reiDriver.findMyElement().getElement(By.xpath("//td//textarea")).sendKeys(defaultLongText);
        reiDriver.findMyElement()
                .getElement(By.xpath("//td//select/option[text()='Optional' or text()='Mandatory']/..")).click();
        reiDriver.findMyElement().getElement(By.xpath("//td//select/option[text()='Mandatory']")).click();
        reiDriver.findMyElement().getElement(By.xpath("//td//select/option[text()='Application' or text()='Award']/.."))
                .click();
        reiDriver.findMyElement().getElement(By.xpath("//td//select/option[text()='Application']")).click();
        reiDriver.findMyElement().getElement(By.xpath(
                "//div/a[contains(@title,'Supporting Documents')]/../..//div[@class='pull-right flex-grid-btns']//button[@title='Save']"))
                .click();
    }

    private By getTextInputFields(String fieldId) {
        return By.xpath("//span[@id='" + fieldId + "']/input[@type='text']");
    }

    private By getButtonOnFlexTable(String buttonName, String flextableName) {
        return By.xpath("//span[text()='" + flextableName + "']/..//div[contains(@class,'col-xs-6')]//button[text()='"
                + buttonName + "']");
    }

    private By getScrollToSection(String flextableName) {
        return By.xpath("//div[@class='panel-heading']//*[@title='" + flextableName + "']");
    }

    private By getFlextableTopBtton(String buttonName, String flextableName) {
        return By.xpath(
                "//div[contains(text(),'" + flextableName + "')]/../../../../..//*[text()='" + buttonName + "']");
    }

    private By getApprovalDecisionRadioButton(String approvalDesicion) {
        return By.xpath("//div[@id='ApprovalDecisionComponent']//input[@value='" + approvalDesicion + "']");
    }

    private By getIFramePath(String iFrameId) {
        return By.xpath("//iframe[@id='" + iFrameId + "']");
    }

    private By getUniqueRecordNameToSelect(String recordUniqueName) {
        return By.xpath("//td//span[text()='" + recordUniqueName
                + "']/../../../preceding-sibling::td//input[@type='checkbox']");
        // return By.xpath("//td//input[@type='checkbox']");
    }

    private By getCloseButtonPath(String closeButtonId) {
        return By.xpath("//button[@id='" + closeButtonId + "']");
    }

    private boolean isStatus(String record, String status) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        return reiDriver.WaitFor()
                .WaitForElementToBePresent(By.xpath("//span[text()='" + record
                        + "']/../../../../../../../..//div//dt/span[text()='Status']/../..//dd//span[text()='" + status
                        + "']"))
                .isDisplayed();
    }

    private boolean isFieldModified(String fieldLabel, String text) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//span[text()='" + fieldLabel + "']/../..//span"));
        return reiDriver.findMyElement()
                .getElement(By.xpath("//span[text()='" + fieldLabel + "']/../..//span[text()='" + text + "']"))
                .isDisplayed();
    }

    private boolean isStatusCorrect(String status) {
        reiDriver.WaitFor().WaitForElementListToBePresent(By.xpath("//table"));
        return reiDriver.findMyElement().getElement(govgrants.flexTable().getFlexTableColumn(status)).isDisplayed();
    }

    private boolean isColumnPresent(String columnUniqueValue, String flextableName) {
        reiDriver.WaitFor().WaitForElementListToBePresent(By.xpath("//span[text()='" + flextableName + "']"));
        reiDriver.JavaScript().scrollElementToPageDetailCenter(By.xpath("//span[text()='" + flextableName + "']"));
        return reiDriver.findMyElement()
                .getElement(By.xpath("//span[text()='" + columnUniqueValue
                        + "']/../../../../../../../../../../../../../../../../../..//span[text()='" + flextableName
                        + "'] | //span/*[text()='" + columnUniqueValue
                        + "']/../../../../../../../../../../../../../../../../../..//*[text()='" + flextableName
                        + "']"))
                .isEnabled();
    }

    private void clickOKForAlert() {
        reiDriver.switchTo().acceptAlert();
        reiDriver.switchTo().switchToParentFrame();
    }

}
