package com.ggproduct.automation.pageobjects;

import com.automation.rei.govgrantsSteps.GovGrantsAssertionObjects;
import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.Register.EyeThink;

public class ProgressReport extends ProjectManager {
    public GovGrantsAssertionObjects ggAssertionObjects;

    public ProgressReport(GovGrantsAssertionObjects ggAssertionObject ){
        this.ggAssertionObjects = ggAssertionObject;
    }

    public void verifyProgressReportSchedulesUpdated(String totalRecords, String tableID){
       ggAssertionObjects.assertValuesAreInFlexTableWithColumnTitle(EyeThink.core().Properties().getValue("EGMSID"),"EGMS ID","RelatedPRSchedulesFlexToggle",true);
       AssertTotalRecordsCountInFlexTable(totalRecords,tableID);
    }
}
