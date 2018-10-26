package com.ggproduct.automation.pageobjects;

import org.openqa.selenium.By;
import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;

import com.ggproduct.automation.projectmanager.ProjectManager;

public class AnnouncementPage extends ProjectManager {
    private final By focusAreaCloseButtonPath, goalsObjectivesCloseButtonPath, keyPerformanceIndicatorCloseButtonPath,
            contactCloseButtonPath, modalQuickSearchPath, focusAreaPopUpPath, goalsObjectivesPopUpPath,
            keyPerformanceIndicatorPopUpPath, contactPopUpPath, fundingAccountPopUpPath, fundingAccountCloseButtonPath,
            approverDetailsPopUpPath, lookUpIFramePath, lookUpSearchPath, selectPath, approverDescription,
            approverDueDate, modalSavePath, approverCloseButtonPath;

    public AnnouncementPage(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
        contactPopUpPath = By.xpath("//iframe[@id='AnnouncementContactsiframeContentId']");
        contactCloseButtonPath = By.xpath("//button[@id='AnnouncementContactsmodalDivCloseIcon']");
        fundingAccountPopUpPath = By.xpath("//iframe[@id='AnnouncementFundingAccountGrantoriframeContentId']");
        fundingAccountCloseButtonPath = By
                .xpath("//button[@id='AnnouncementFundingAccountGrantoriframeContentIdButton']");
        focusAreaPopUpPath = By.xpath("//iframe[@id='AnnouncementServiceArea1iframeContentId']");
        focusAreaCloseButtonPath = By.xpath("//button[@id='AnnouncementServiceArea1modalDivCloseIcon']");
        goalsObjectivesPopUpPath = By
                .xpath("//iframe[@id='AnnouncementGranteeStrategicGoalsObjectivesiframeContentId']");
        goalsObjectivesCloseButtonPath = By
                .xpath("//button[@id='AnnouncementGranteeStrategicGoalsObjectivesmodalDivCloseIcon']");
        keyPerformanceIndicatorPopUpPath = By.xpath("//iframe[@id='ProgramKeyOutcomesiframeContentId']");
        keyPerformanceIndicatorCloseButtonPath = By.xpath("//button[@id='ProgramKeyOutcomesmodalDivCloseIcon']");
        modalQuickSearchPath = By.xpath("//div[@class='quick-search']");
        approverDetailsPopUpPath = By
                .xpath("//iframe[@id='GrantorAnnouncementRolesandResponsibilitiesiframeContentId']");
        approverCloseButtonPath = By.xpath("//button[@id='GrantorAnnouncementRolesandResponsibilitiesmodalDivCloseIcon']");
        lookUpIFramePath = By.xpath("//iframe[@id='iframeCustomLookupModalId']");
        lookUpSearchPath = By.xpath("//span[@class='fa fa-search']");
        selectPath = By.xpath("//a[@title='Select']");
        approverDescription = By.xpath("//div/label[text()=' Description ']/../span/textarea");
        approverDueDate = By.xpath("//span[@class='dateInput dateOnlyInput']/input");
        modalSavePath = By.xpath("//input[@value='Save']");
    }

    /**
     * Handles association of various related records to a Announcement
     * 
     * @param recordName
     * @param recordUniqueName
     * @param buttonName
     */
    public void chooseRecordforAnnouncementAssociation(String recordName, String recordUniqueName, String buttonName) {
        By popUpPath = By.xpath("//iframe");
        By closeButton = By.xpath("//button");
        if (recordName.equals("Focus Area")) {
            popUpPath = focusAreaPopUpPath;
            closeButton = focusAreaCloseButtonPath;
        } else if (recordName.equals("Funding Account")) {
            popUpPath = fundingAccountPopUpPath;
            closeButton = fundingAccountCloseButtonPath;
        } else if (recordName.equals("Objectives")) {
            popUpPath = goalsObjectivesPopUpPath;
            closeButton = goalsObjectivesCloseButtonPath;
        } else if (recordName.equals("Key Performance Indicators")) {
            popUpPath = keyPerformanceIndicatorPopUpPath;
            closeButton = keyPerformanceIndicatorCloseButtonPath;
        } else if (recordName.equals("Contact")) {
            popUpPath = contactPopUpPath;
            closeButton = contactCloseButtonPath;
        }

        reiDriver.WaitFor().WaitForElementClickAble(popUpPath);
        reiDriver.switchTo().switchToFrame(popUpPath);
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.WaitFor().WaitForElementListToBePresent(modalQuickSearchPath);
        reiDriver.JavaScript().scrollpageToSpecificElement(modalQuickSearchPath);
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.WaitFor().WaitForElementToBePresent(getUniqueRecordNameToSelect(recordUniqueName)).click();
        reiDriver.WaitFor().WaitForElementToBePresent(getModalButtonName(buttonName)).click();
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.switchTo().switchToParentFrame();
        reiDriver.findMyElement().getElement(closeButton).click();
        reiDriver.get().getRefresh();
    }

    /**
     * Handles the filling in of funding account fields
     * 
     * @param flextableName
     */
    public void fillInFundingAccountFields(String flextableName) {

        reiDriver.findMyElement().getElement(By.xpath("//td//input")).sendKeys("100000");
        reiDriver.findMyElement().getElement(By.xpath("//div/a[contains(@title,'" + flextableName
                + "')]/../..//div[@class='pull-right flex-grid-btns']//button[@title='Save']")).click();
    }

    /**
     * Handles selection of approver for a program
     * 
     * @param approverName
     */
    public void fillInApproverDetails(String approverName) {
        reiDriver.WaitFor().WaitForElementClickAble(approverDetailsPopUpPath);
        reiDriver.switchTo().switchToFrame(approverDetailsPopUpPath);
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.WaitFor().WaitForElementToBePresent(lookUpSearchPath).click();
        reiDriver.WaitFor().WaitForElementClickAble(lookUpIFramePath);
        reiDriver.switchTo().switchToFrame(lookUpIFramePath);
        reiDriver.WaitFor().makeThreadSleep(1000);
        govgrants.quickSearch().performModalSpecificQuickSearch("lookuploading", approverName);
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.WaitFor().WaitForElementToBePresent(selectPath).click();
        reiDriver.switchTo().switchToParentFrame();
        reiDriver.WaitFor().WaitForElementClickAble(approverDetailsPopUpPath);
        reiDriver.switchTo().switchToFrame(approverDetailsPopUpPath);
        reiDriver.textInput().clearText(approverDescription);
        reiDriver.textInput().enterText(approverDescription, defaultLongText);
        reiDriver.textInput().enterText(approverDueDate, reiDriver.get().getCurrentDate_MMDDYYYY());
        reiDriver.WaitFor().makeThreadSleep(1000);
        reiDriver.WaitFor().WaitForElementToBePresent(modalSavePath).click();
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.switchTo().switchToParentFrame();
        reiDriver.WaitFor().WaitForElementToBePresent(approverCloseButtonPath).click();
        reiDriver.get().getRefresh();
    }

    private By getUniqueRecordNameToSelect(String recordUniqueName) {
        return By.xpath("//td//span[text()='" + recordUniqueName
                + "']/../../../preceding-sibling::td//input[@type='checkbox']");
    }

    private By getModalButtonName(String buttonName) {
        return By.xpath("//div[@id='modaltemp']//button[text()='" + buttonName + "']");
    }

}
