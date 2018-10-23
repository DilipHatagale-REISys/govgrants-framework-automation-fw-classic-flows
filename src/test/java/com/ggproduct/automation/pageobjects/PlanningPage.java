package com.ggproduct.automation.pageobjects;

import org.openqa.selenium.By;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.projectmanager.ProjectManager;

public class PlanningPage extends ProjectManager {
    private final By lookUpIFramePath, lookUpSearchPath, selectPath, approverDetailsPopUpPath, approverDescription,
            approverDueDate, approverCloseButtonPath, focusAreaCloseButtonPath, goalsObjectivesCloseButtonPath,
            keyPerformanceIndicatorCloseButtonPath, contactCloseButtonPath, modalQuickSearchPath, modalSavePath,
            focusAreaPopUpPath, goalsObjectivesPopUpPath, keyPerformanceIndicatorPopUpPath, contactPopUpPath;

    public PlanningPage(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
        lookUpIFramePath = By.xpath("//iframe[@id='iframeCustomLookupModalId']");
        lookUpSearchPath = By.xpath("//span[@class='fa fa-search']");
        selectPath = By.xpath("//a[@title='Select']");
        contactPopUpPath = By.xpath("//iframe[@id='ProgramContactsiframeContentId']");
        contactCloseButtonPath = By.xpath("//button[@id='ProgramContactsiframeContentIdButton']");
        approverDetailsPopUpPath = By.xpath("//iframe[@id='ProgramRolesAndResponsibilitiesiframeContentId']");
        approverCloseButtonPath = By.xpath("//button[@id='ProgramRolesAndResponsibilitiesmodalDivCloseIcon']");
        approverDescription = By.xpath("//div/label[text()=' Description ']/../span/textarea");
        approverDueDate = By.xpath("//span[@class='dateInput dateOnlyInput']/input");
        focusAreaPopUpPath = By.xpath("//iframe[@id='GrantorServiceAreasProgramiframeContentId']");
        focusAreaCloseButtonPath = By.xpath("//button[@id='GrantorServiceAreasProgrammodalDivCloseIcon']");
        goalsObjectivesPopUpPath = By.xpath("//iframe[@id='RelatedProgramGoalsandObjectivesiframeContentId']");
        goalsObjectivesCloseButtonPath = By.xpath("//button[@id='RelatedProgramGoalsandObjectivesmodalDivCloseIcon']");
        keyPerformanceIndicatorPopUpPath = By.xpath("//iframe[@id='ProgramKeyOutcomesiframeContentId']");
        keyPerformanceIndicatorCloseButtonPath = By.xpath("//button[@id='ProgramKeyOutcomesmodalDivCloseIcon']");
        modalQuickSearchPath = By.xpath("//div[@class='quick-search']");
        modalSavePath = By.xpath("//input[@value='Save']");
    }

    /**
     * Handles selection of approver for a program
     * 
     * @param approverName
     */
    public void fillInApproverDetails(String approverName) {
        reiDriver.WaitFor().WaitForElementClickAble(approverDetailsPopUpPath);
        reiDriver.switchTo().switchToFrame(approverDetailsPopUpPath);
        reiDriver.WaitFor().makeThreadSleep(2000);
        reiDriver.WaitFor().WaitForElementToBePresent(lookUpSearchPath).click();
        reiDriver.WaitFor().WaitForElementClickAble(lookUpIFramePath);
        reiDriver.switchTo().switchToFrame(lookUpIFramePath);
        reiDriver.WaitFor().makeThreadSleep(3000);
        govgrants.quickSearch().performModalSpecificQuickSearch("lookuploading", approverName);
        reiDriver.WaitFor().makeThreadSleep(2000);
        reiDriver.WaitFor().WaitForElementToBePresent(selectPath).click();
        reiDriver.switchTo().switchToParentFrame();
        reiDriver.WaitFor().WaitForElementClickAble(approverDetailsPopUpPath);
        reiDriver.switchTo().switchToFrame(approverDetailsPopUpPath);
        reiDriver.textInput().clearText(approverDescription);
        reiDriver.textInput().enterText(approverDescription, defaultLongText);
        reiDriver.textInput().enterText(approverDueDate, reiDriver.get().getCurrentDate_MMDDYYYY());
        reiDriver.WaitFor().makeThreadSleep(5000);
        reiDriver.WaitFor().WaitForElementToBePresent(modalSavePath).click();
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.switchTo().switchToParentFrame();
        reiDriver.WaitFor().WaitForElementToBePresent(approverCloseButtonPath).click();
    }

    /**
     * Handles association of various related records to a program
     * 
     * @param recordName
     * @param recordUniqueName
     * @param buttonName
     */
    public void chooseRecordforAssociation(String recordName, String recordUniqueName, String buttonName) {
        By popUpPath = By.xpath("//iframe");
        By closeButton = By.xpath("//button");
        if (recordName.equals("Focus Area")) {
            popUpPath = focusAreaPopUpPath;
            closeButton = focusAreaCloseButtonPath;
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
        reiDriver.WaitFor().WaitForElementToBePresent(getUniqueRecordNameToSelect(recordUniqueName)).click();
        reiDriver.WaitFor().WaitForElementToBePresent(getModalButtonName(buttonName)).click();
        govgrants.mainPage().waitForNavigationLogoToDisappear();
        reiDriver.switchTo().switchToParentFrame();
        reiDriver.findMyElement().getElement(closeButton).click();
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
                "//div/a[contains(@title,'Checklist')]/../..//div[@class='pull-right flex-grid-btns']//button[@title='Save']"))
                .click();
    }

    private By getUniqueRecordNameToSelect(String recordUniqueName) {
        return By.xpath("//td//span[text()='" + recordUniqueName
                + "']/../../../preceding-sibling::td//input[@type='checkbox']");
    }

    private By getModalButtonName(String buttonName) {
        return By.xpath("//div[@id='modaltemp']//button[text()='" + buttonName + "']");
    }

}
