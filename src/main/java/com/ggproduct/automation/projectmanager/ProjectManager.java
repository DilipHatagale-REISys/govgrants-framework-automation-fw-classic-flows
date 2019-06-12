package com.ggproduct.automation.projectmanager;

import org.openqa.selenium.By;

import com.automation.rei.handlers.GovGrantsHandler;
import eyethink.automation.bots.controller.Controller;
import eyethink.automation.bots.controller.CoreHandlers;
import org.openqa.selenium.WebElement;
import org.testng.Assert;


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
        govgrants.pageDetails().getRecordId(recordIdLabel);
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
    public boolean isRecordPresentInTheFlexTable(String tableId) {
        try {
            return reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//div[@id='" + tableId + "']//p[contains(text(),'No records found')]")).isDisplayed();
        } catch (Exception e) {
        }
        return false;
    }

    /*handles to verify blank value is present inside flex table */
    public boolean isColumnValueBlank(String fieldName){
        reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//*[@field-name='"+fieldName+"' or @id='"+fieldName+"']"));
        WebElement fieldValue= reiDriver.findMyElement().getElement(By.xpath("//*[@field-name='"+fieldName+"' or @id='"+fieldName+"']"));
        String value =fieldValue.getText();
        if(value.equals("")) {
            return true;
        }
        return false;
    }

    public void assertColumnValuIsBlank(String fieldName){
        Assert.assertTrue(isColumnValueBlank(fieldName));
    }

}
