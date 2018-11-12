package com.ggproduct.automation.pageobjects;

import org.openqa.selenium.By;
import org.testng.Assert;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.projectmanager.ProjectManager;
import com.ggproduct.automation.projectmanager.UsersAndURL;

public class GenericPage extends ProjectManager {
    private final By headerOverviewPath, attachmentClassificationPath,
            attachmentDescriptionPath, attachmentFilePath, lookUpSearchPath, lookUpIFramePath, approverDescription,
            acknowledgementCheckboxPath;

    public GenericPage(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
        headerOverviewPath = By.xpath("//div[@class='panel-heading overview-header']");
        attachmentClassificationPath = By.xpath("//select[@title='Classification']");
        attachmentDescriptionPath = By.xpath("//div//label[text()='Description']/..//textarea");
        attachmentFilePath = By.xpath(
                "//td//label[text()='File']/../..//input[@type='file'] | //div//label[text()='File']/..//input[@type='file']");
        lookUpSearchPath = By.xpath("//span[@class='fa fa-search']");
        lookUpIFramePath = By.xpath("//iframe[@id='iframeCustomLookupModalId']");
        approverDescription = By.xpath("//div/label[text()=' Description ']/../span/textarea");
        acknowledgementCheckboxPath = By.xpath("//input[@type='checkbox' and @value='I Agree']");
    }
    
    /**
     * Performs login and toggles app
     * @param appName
     * @param userName
     */
    public void loginToggleToApp(String appName, String userName) {
        login(userName);
        toggleApp(appName);
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
     * Handles clicking on the given page button
     * 
     * @param buttonName
     */
    public void clickOnPageButton(String buttonName) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.JavaScript().scrollPageDocumentJS("pageup", 0, 0);
        govgrants.pageDetails().clickAnyTopRightButton(buttonName);

        if (buttonName.equals("Submit For Approval") || buttonName.equals("Submit Application")) {
            clickOKForAlert();
            govgrants.mainPage().waitForNavigationLogoToDisappear();
        }
    }
    
    /**
     * Handles clicking on the given page button
     * 
     * @param buttonName
     */
    public void clickOnPageButtonWithModalId(String buttonName, String IframeId) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.JavaScript().scrollPageDocumentJS("pageup", 0, 0);
        govgrants.pageDetails().clickAnyTopRightButton(buttonName);
        reiDriver.switchTo().switchToFrame(getIFramePath(IframeId));
    }

    /**
     * Handles clicking on the given button inside a modal
     * 
     * @param buttonName
     */
    public void clickOnModalButton(String buttonName) {
        try {
            govgrants.modal().clickModalContentSpecificButton(buttonName);
        } catch (Exception e) {
            reiDriver.findMyElement()
                    .getElement(By.xpath("//div[@class='panel-footer']//button[@title='" + buttonName + "']")).click();
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
     * Assert the status for a record through progress bar
     * 
     * @param record
     * @param status
     */
    public void assertStatusProgressBar(String status) {
        Assert.assertTrue(isStatusProgressBar(status));
    }
    
    /**
     * Assert the status for a record through overview header
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
     * Handles re-logging as a different user and toggling to the app specified
     * @param appName
     * @param userName
     */
    public void reloginToggleToApp(String appName, String userName) {
        reloginAsDifferentUser(userName);
        toggleApp(appName);
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
        govgrants.phasePannel().clickDoubleArrowDropDownAndSelectItem(tableViewName);
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
        govgrants.phasePannel().clickTopRightButton(flextableName, buttonName);
    }

    /**
     * Clicking on flextable top button when one flextable is present in the page to
     * open a modal and switch to the frame
     * 
     * @param buttonName
     * @param flextableName
     * @param iFrameId
     */
    public void clickOnFlexTableButtonToOpenModal(String buttonName, String flextableName, String iFrameId) {
        govgrants.modal().clickTopRightButtonWithModalById(iFrameId, buttonName);
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
     * @param iFrameId
     */
    public void clickOnFlextableButton(String buttonName, String flextableName) {
        reiDriver.JavaScript().scrollElementToPageDetailCenter(getScrollToSection(flextableName));
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.WaitFor().WaitForElementToBePresent(getButtonOnFlexTable(buttonName, flextableName)).click();
    }

    /**
     * Handles entering of Peer review
     */
    public void enterReview() {
        reiDriver.findMyElement().getDropDown(By.xpath("//div[@id='fieldRating__c']//select"))
                .selectByVisibleText("Passed");
        reiDriver.findMyElement().getElement(By.xpath("//div[@id='fieldReviewComments__c']//textarea"))
                .sendKeys("Automation Reviewer comments");
    }

    /**
     * Handles clicking on the top button of the given flextable to open a modal and
     * switch to the modal frame
     * 
     * @param buttonName
     * @param flextableName
     * @param iFrameId
     */
    public void clickOnFlextableButtonToOpenModal(String buttonName, String flextableName, String iFrameId) {
            reiDriver.JavaScript().scrollElementToPageDetailCenter(getScrollToSection(flextableName));
            govgrants.modal().clickTopRightButtonWithModalById(iFrameId, buttonName);
        
    }
    
    /**
     * Handles clicking on the top button of the given flextable to open a modal and
     * switch to the modal frame
     * 
     * @param buttonName
     * @param flextableName
     */
    public void clickOnButtonForAttachmentNotesToOpenModal(String buttonName, String flextableName) {
        govgrants.modal().clickTopRightButtonForAttachmentNotes(flextableName, buttonName);
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
     * Handles sliding to the right of the child grid and clicking on the row level icon
     * @param buttonName
     * @param uniqueColumnName
     * @param tableId
     */
    public void clickButtonOnChildGrid(String iconName, String uniqueColumnValue, String tableId){
        reiDriver.Clickers().moveslider(reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//div[@id='"+tableId+"']//tfoot[@class='tbody-no-border-top']")));
        govgrants.flexTable().clickTableActionIcons(uniqueColumnValue, iconName);
    }
    
    /**
     * Handles acknowledging a record
     * @param sectionName
     */
    public void clickOnAcknowledgement(String sectionName) {
        reiDriver.JavaScript().scrollElementToPageDetailCenter(getScrollToSection(sectionName));
        reiDriver.findMyElement().getElement(acknowledgementCheckboxPath).click();
    }
    
    /**
     * Handles grid expansion
     * @param sectionName
     */
    public void expandGrid(String uniqueColumnValue, String gridName) {
        reiDriver.JavaScript().scrollElementToPageDetailCenter(getScrollToSection(gridName));
        govgrants.flexTable().expandOrCollapseNestedTable(uniqueColumnValue, true);
    }

    /**
     * Clicks on flextable row level buttons inside the record view page where there
     * are number of flextables
     * 
     * @param buttonName
     * @param uniqueColumnvalue
     * @param flextableName
     */
    public void clickOnFlextableRowButton(String iconName, String uniqueColumnvalue, String flextableName) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.JavaScript().scrollElementToPageDetailCenter(getScrollToSection(flextableName));
        govgrants.flexTable().clickTableActionIcons(uniqueColumnvalue, iconName);
    }

    /**
     * Clicks on flextable row level buttons inside the record view page where there
     * are number of flextables to open a modal
     * 
     * @param buttonName
     * @param uniqueColumnvalue
     * @param flextableName
     */
    public void clickOnFlextableRowButtontoOpenModal(String iconName, String uniqueColumnValue, String flextableName,
            String iFrameId) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.JavaScript().scrollElementToPageDetailCenter(getScrollToSection(flextableName));
        govgrants.modal().clickRowIconWithModalById(iFrameId, uniqueColumnValue, iconName);
    }

    /**
     * Handles association of various related records
     * 
     * @param recordName
     * @param recordUniqueName
     * @param buttonName
     */
    public void chooseRecordForAssociation(String buttonName, String recordUniqueName, String tableId) {
        reiDriver.WaitFor().makeThreadSleep(1000);
        govgrants.quickSearch().performModalSpecificQuickSearch(tableId, recordUniqueName);
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.WaitFor().WaitForElementToBePresent(getUniqueRecordNameToSelect(recordUniqueName)).click();
        govgrants.phasePannel().clickAnyRightPannelButton(tableId, buttonName);
    }

    /**
     * Handles uploading of file
     * 
     * @param fileName
     * @param uploadSectionName
     */
    public void uploadFile(String fileName, String uploadSectionName, String attachmentType) {
        String defaultFilePath = System.getProperty("user.dir") + "/src/main/resources/";
        if (!uploadSectionName.equals("Checklist")) {
            reiDriver.findMyElement().getDropDown(attachmentClassificationPath).selectByValue(attachmentType);
            reiDriver.findMyElement().getElement(attachmentDescriptionPath).sendKeys(defaultLongText);
        }
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.findMyElement().getElement(attachmentFilePath).sendKeys(defaultFilePath + fileName);
        govgrants.modal().clickModalContentSpecificButton("Save");
    }

    /**
     * Handles selection of approver
     * 
     * @param approverName
     */
    public void fillInApproverDetails(String approverName, String iFrameId) {
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.findMyElement().getElement(By.xpath("//span[@class='lookupInput']//input")).sendKeys(approverName);
        reiDriver.WaitFor().WaitForElementToBePresent(lookUpSearchPath).click();
        reiDriver.switchTo().switchToFrame(lookUpIFramePath);
        reiDriver.WaitFor().makeThreadSleep(1000);
        govgrants.flexTable().clickTableActionIcons(approverName, "Select");
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.switchTo().switchToParentFrame();
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.WaitFor().WaitForElementClickAble(getIFramePath(iFrameId));
        reiDriver.switchTo().switchToFrame(getIFramePath(iFrameId));
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.textInput().clearText(approverDescription);
        reiDriver.textInput().enterText(approverDescription, defaultLongText);
        reiDriver.WaitFor().makeThreadSleep(1000);
        govgrants.modal().clickModalContentSpecificButton("Save");
    }

    /**
     * Handles clicking on Approval Decision and clicks submit
     * 
     * @param approvalDesicion
     */
    public void clickOnApprovalDecisionBox(String approvalDesicion) {
        govgrants.approvals().completeApprovalFlow(approvalDesicion, defaultLongText);
        govgrants.mainPage().waitForNavigationLogoToDisappear();
    }

    /**
     * Handles filling in the fields for attachment checklist
     */
    public void fillFieldsForInlineTable(String tableId,String columnNumber,String inputType,String inputValue) {
        govgrants.flexTable().inlineEdit(tableId,columnNumber,inputType,inputValue);
    }
    
    private void login(String userName) {
        govgrants.mainPage().login(new UsersAndURL().handleUsersForEnv(userName), defaultPassword);
    }
    
    private void toggleApp(String appName) {
        govgrants.mainPage().setUpCustomAppDropDown(appName);
    }

    private By getTextInputFields(String fieldId) {
        return By.xpath("//span[@id='" + fieldId + "']/input[@type='text']");
    }

    private By getButtonOnFlexTable(String buttonName, String flextableName) {
        return By.xpath("//span[text()='" + flextableName + "']/..//div[contains(@class,'col-xs-6')]//button[text()='"
                + buttonName + "']");
    }

    private By getScrollToSection(String flextableName) {
        return By.xpath("//div[contains(@class,'panel-heading')]//*[@title='" + flextableName
                + "']|//div[contains(@class,'panel-heading')]//*[text()='" + flextableName + "']");
    }
    
    private void reloginAsDifferentUser(String userName){
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//img[@alt='User Avatar']/..//i[@class='fa fa-caret-down']")).click();
        govgrants.mainPage().getLoginDropDownItems("Logout").click();
        try {
            reiDriver.eatCookies().deleteAllCookies();
            reiDriver.WaitFor().makeThreadSleep(500);
            navigateToURL("PRODUCT PORTAL");
        } catch(Exception e) {
            System.out.println(e);
        }
        govgrants.mainPage().login(new UsersAndURL().handleUsersForEnv(userName), defaultPassword);
        govgrants.mainPage().waitForEgmsHeader();
    }

    private By getIFramePath(String iFrameId) {
        return By.xpath("//iframe[@id='" + iFrameId + "']");
    }

    private By getUniqueRecordNameToSelect(String recordUniqueName) {
        return By.xpath("//td//input[@type='checkbox']");
    }

    private By getCloseButtonPath(String closeButtonId) {
        if (closeButtonId.equals("Attachment")) {
            return By.xpath(
                    "//div[@class='clearfix']//span[text()=' Attachments']/..//p[text()='Add Attachments']/..//button");
        } else {
            return By.xpath("//button[@id='" + closeButtonId + "']");
        }
    }

    private boolean isStatusProgressBar(String status) {
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        return govgrants.pageDetails().isStepProgressBarStatusInSpecifiedColor(status, "green");
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
        return reiDriver.WaitFor().WaitForElementToBePresent(govgrants.flexTable().getFlexTableColumn(columnUniqueValue)).isDisplayed();
    }

    private void clickOKForAlert() {
        reiDriver.switchTo().acceptAlert();
        reiDriver.switchTo().switchToParentFrame();
    }

}
