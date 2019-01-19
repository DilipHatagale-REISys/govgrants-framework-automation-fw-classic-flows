package com.ggproduct.automation.projectmanager;

import org.openqa.selenium.By;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.CoreHandlers;
import cucumber.api.DataTable;

/**
 * for Rei Systems
 * 
 * @author Handles generic/common methods and WebElements of the project.
 * 
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
        this.controller = controller;
        this.reiDriver = reiDriver;
        this.govgrants = govgrants;
    }

    /******
     * BELOW PATTREN IS CONSIDERED BEST IN CODING WORLD. ADD JAVA DOCS AND KEEP
     * LOCAL/KEY METHOD CATEGORIES
     ***/

    /******* "Key Methods with complete functionality" *****************/

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

    public DataTable seperateInlineDataTable(Map<String, Map<String, String>> dataTableMap) {
        List<String> inlineColumnTitleList = new ArrayList<String>();
        List<String> inlineValueList = new ArrayList<String>();
        for (String mainMapKey : dataTableMap.keySet()) {
            if (mainMapKey.equals("Inline Column Title")) {
                for (String innerMapKey : dataTableMap.get(mainMapKey).keySet()) {
                    inlineColumnTitleList.add(dataTableMap.get(mainMapKey).get(innerMapKey));
                }
            } else if (mainMapKey.contains("Inline values")) {
                for (String innerMapKey : dataTableMap.get(mainMapKey).keySet()) {
                    inlineValueList.add(dataTableMap.get(mainMapKey).get(innerMapKey));
                }
            }
        }
        List<List<String>> inlineInfoInTheRaw = Arrays.asList(inlineColumnTitleList, inlineValueList);
        DataTable inlineSeperatedDataTable = DataTable.create(inlineInfoInTheRaw);

        return inlineSeperatedDataTable;
    }
    
    public String getEGMSId() {
        String egmsId = null;
        egmsId = reiDriver.findMyElement().getElement(By.xpath("//dt/span[text()='EGMS ID']/../..//dd/span")).getText();
        return egmsId;
    }
}
