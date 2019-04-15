package com.ggproduct.automation.projectmanager;

import org.openqa.selenium.By;

import com.automation.rei.handlers.GovGrantsHandler;
import eyethink.automation.bots.controller.Controller;
import eyethink.automation.bots.controller.CoreHandlers;


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
    public String egmsId;

    /**
     * Super Constructor
     *
     * @param controller
     * @param reiDriver
     */
    public ProjectManager(Controller controller, CoreHandlers reiDriver, GovGrantsHandler govgrants) {
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

    /**
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

    public void getRecordIdFromResponse(String recordName, String fieldName, String objectType) {
        govgrants.pageDetails().idOfRecord = (automateGetApi(recordName, fieldName, objectType).asString()).replace("\"", "");
    }

}
