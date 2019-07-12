package com.ggproduct.automation.projectmanager;

import org.openqa.selenium.By;
import com.automation.rei.handlers.GovGrantsHandler;
import eyethink.automation.bots.controller.Controller;
import eyethink.automation.bots.controller.CoreHandlers;
import org.openqa.selenium.WebElement;
import org.springframework.context.annotation.Description;
import org.testng.Assert;

import java.awt.*;
import java.io.File;
import java.util.List;


/**
 * for Rei Systems
 *
 * @author Handles generic/common methods and WebElements of the project.
 */
public class ProjectManager extends ProjectWebServices {
    public CoreHandlers reiDriver;
    public Controller controller;
    public GovGrantsHandler govgrants;
    public final String defaultLongText = "Automation test description";
    private String fieldValue;

    /**
     * Super Constructor
     *
     * @param controller
     * @param reiDriver
     */
    public ProjectManager(Controller controller, CoreHandlers reiDriver, GovGrantsHandler govgrants) {
        super(controller, reiDriver, govgrants);
        this.controller = controller;
        this.reiDriver = reiDriver;
        this.govgrants = govgrants;
    }

    /******
     * BELOW PATTREN IS CONSIDERED BEST IN CODING WORLD. ADD JAVA DOCS AND KEEP
     * LOCAL/KEY METHOD CATEGORIES
     ***/

    /******* "Key Methods with complete functionality" *****************/

    public void getRecordId(String recordIdLabel) {
        govgrants.pageDetails().getFieldValue(recordIdLabel);
    }

    /*
     * Handles association of various related records
     *
     * @param recordName
     * @param recordUniqueName
     * @param buttonName
     */
    public void chooseRecordForAssociation(String buttonName, String flexTableId, String... recordUniqueValues) {
        for (String recordUniqueValue : recordUniqueValues) {
            govgrants.quickSearch().performModalSpecificQuickSearch(flexTableId, recordUniqueValue);
            govgrants.mainPage().waitForNavigationLogoToDisappear();
            reiDriver.WaitFor().makeThreadSleep(1000);
            govgrants.flexTable().selectCheckBoxes(flexTableId, recordUniqueValue);
        }
        govgrants.phasePannel().clickAnyRightPannelButton(flexTableId, buttonName);
    }

    /**
     * Handles entering the comments in a confirmation box and click OK
     *
     * @param comments
     * @param confirmation
     */
    public void enteringCommentsOnConfirmation(String comments, String confirmation) {
        reiDriver.findMyElement().getElement(By.xpath("//form[@class='bootbox-form']//textarea")).sendKeys(comments);
        govgrants.modal().handleModalAlert(confirmation);
    }

    public void attemptDeletion(String columnValues, String tableId) {
        try {
            govgrants.flexTable().clickTableActionIcon(tableId, "Delete", columnValues);
        } catch (Exception e) {
        }
    }

    /*handles to get the record id of a record */
    public void getRecordIdFromResponse(String objectType, String recordName, String objectApiName) {
        govgrants.pageDetails().idOfRecord = (automationBatchExecuteApi(objectType, recordName, objectApiName)).asString().replace("\"", "");
    }

    /* handles to verify no record is present in flex table */
    public boolean isRecordPresentInTheFlexTable(String text, String tableId) {
        try {
            return reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//div[@id='" + tableId + "']//*[" + reiDriver.xpath().contains("text()", text) + "]")).isDisplayed();
        } catch (Exception e) {
        }
        return false;
    }

    /*handles to verify blank value is present inside flex table */
    public boolean isColumnValueBlank(String fieldName) {
        reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//*[@field-name='" + fieldName + "' or @id='" + fieldName + "']"));
        WebElement fieldValue = reiDriver.findMyElement().getElement(By.xpath("//*[@field-name='" + fieldName + "' or @id='" + fieldName + "']"));
        String value = fieldValue.getText();
        if (value.equals("")) {
            return true;
        }
        return false;
    }

    public void assertColumnValuIsBlank(String fieldName) {
        Assert.assertTrue(isColumnValueBlank(fieldName));
    }

    /* handles to veify total records present in flex table */
    public String totalRecordsCount(String tableId) {
        reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//div[@id='" + tableId + "']//following-sibling::span[contains(text(),'Total Records')]"));
        return (reiDriver.findMyElement().getElement(By.xpath("//div[@id='" + tableId + "']//following-sibling::span[contains(text(),'Total Records')]"))).getText();
    }

    public void AssertTotalRecordsCountInFlexTable(String totalRecord, String tableId) {
        Assert.assertEquals(totalRecord, totalRecordsCount(tableId));
    }

    public By pageBlock(String pageBlockName) {
        return By.xpath("//h3//a[contains(text(),'" + pageBlockName + "')]");
    }

    /**
     * @param pageblockName - page block name
     * @param assertcan     - can see|cannot see
     * @Author - Mahadev.hanme
     */
    public void AssertPageBlockDisplayed(String pageblockName, boolean assertcan) {
        List<WebElement> elements = reiDriver.findMyElement().getElements(pageBlock(pageblockName));
        if (assertcan) {
            Assert.assertNotEquals(elements.size(), 0);
        } else {
            Assert.assertEquals(elements.size(), 0);
        }

    }

    /*
     * handles to capture message on approval decision box
     * @param - message - message which needs to verify
     * @Author - Mahadev.hanme
     */
    public Boolean captureMessageOnApprovalDecisionBox(String message) {
        By expectedMsg = By.xpath("//div[@id='ApprovalDecisionComponent']//span[contains(text(),'" + message + "')]");

        try {
            reiDriver.findMyElement().getElement(expectedMsg);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    /*
     * To capture field value by passing field label
     * @param fieldName - Label of field
     * @param  subTabName - subTab Name
     * @Author - Mahadev.hanme
     */
    public void getFieldValue(String fieldName, String subTabName) {
        govgrants.pageDetails().clickSubTabsInsideTableView(subTabName);
        fieldValue = govgrants.pageDetails().getFieldValue(fieldName);
    }

    /**
     * To compare two different field values
     *
     * @param fieldName  - Label of field
     * @param subTabName - subTab Name
     * @Author - Mahadev.hanme
     */
    public Boolean compareTwoFieldValues(String fieldName, String subTabName) {
        govgrants.pageDetails().clickSubTabsInsideTableView(subTabName);
        if (fieldValue.equalsIgnoreCase(govgrants.pageDetails().getFieldValue(fieldName)))
            return true;
        else
            return false;
    }

    @Description("To verify two different field values are equal or not")
    public void assertTwoFieldValues(String targetValue, String subTabName) {
        Assert.assertTrue(compareTwoFieldValues(targetValue, subTabName));
    }

    /**
     * To verify any value is present specifically in attachment flex table or not
     *
     * @param value
     * @param flexTableHeader
     * @return
     */
    public Boolean iSeeValueInFlexTable(String value, String flexTableHeader) {
        reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//div[@id='myTabbedContent']//a[@title='" + flexTableHeader + "']/../../../following-sibling::div//tbody//td//span[text()='" + value + "']"));
        if (reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//div[@id='myTabbedContent']//a[@title='" + flexTableHeader + "']/../../../following-sibling::div//tbody//td//span[text()='" + value + "']")).isDisplayed())
            return true;
        else
            return false;
    }

    public void AssertFieldValueIsPresentInFlexTable(String valueToBeSearch, String flexTableHeader) {
        Assert.assertTrue(iSeeValueInFlexTable(valueToBeSearch, flexTableHeader));
    }

    /**
     * Handles to upload the file from workspace
     * @param fileNameFromWorkSpace - file which is to be upload
     */
    public void uploadAttachmentFromWorkspace(String fileNameFromWorkSpace) {
        reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//div[@id='myTabbedContent']//span[contains(text(),'Attachment')]/..//div[@class='panel-heading']//*[text()='Add']")).click();
        reiDriver.switchTo().switchToFrame(By.xpath("//iframe[contains(@ng-src, 'apex') or contains(@src,'apex')]"));
        reiDriver.WaitFor().magicWait(By.xpath("//div[@id='Attachmentadd']//span[text()='Upload file from Workspace']")).click();
        reiDriver.WaitFor().magicWait(By.xpath("//div[@id='Attachmentadd']//td[text()='" + fileNameFromWorkSpace + "']/..//input")).click();
        govgrants.modal().clickModalContentSpecificButton("Attach");
        govgrants.modal().closeModalByClickingTopRightCloseButton();
    }

    /**
     * save file using robot class
     *
     * @throws AWTException
     */
    public void saveFile() throws AWTException {
        reiDriver.switchTo().switchToWindowHandler(1);
        reiDriver.WaitFor().makeThreadSleep(20000);
        reiDriver.RobotActions().ctrl_Save();
        reiDriver.WaitFor().makeThreadSleep(2000);
        reiDriver.RobotActions().Robot_Enter();
        reiDriver.WaitFor().makeThreadSleep(20000);
    }

    public void clickRightHeaderBars(String title) {
        govgrants.phasePannel().clickParallelMenuBars(title);
    }

    public void assertThatFileIsDownloaded(String fileType){
        File file = new File(System.getProperty("user.dir") + "\\target");
        File[] directory = reiDriver.file().getCompleteFilesListOnLocalDirectory(file.getAbsolutePath());
        for (File files : directory) {
            if (files.getName().endsWith(".tmp")) {
                new File(files.getAbsolutePath().toString())
                        .renameTo(new File(file.getAbsolutePath() + "govgrant."+fileType+""));
                break;
            }
        }
        Assert.assertTrue(new File(file.getAbsolutePath() + "govgrant."+fileType+"").exists());

    }

    public By subTab(String subTabName) {
        return By.xpath("//div[@id='myTabs']//li//span[text()='"+ subTabName+"']/ancestor::li[1]");
    }

    /**
     *
     * @param subTabName
     * @param assertcan - can see | cannot see
     */
    public void AssertSubTabDisplayed(String subTabName,boolean assertcan){
        List<WebElement> elements = reiDriver.findMyElement().getElements(subTab(subTabName));
        if (assertcan) {
            Assert.assertNotEquals(elements.size(), 0);
        } else {
            Assert.assertEquals(elements.size(), 0);
        }

    }
}