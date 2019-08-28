package com.ggproduct.automation.pageobjects;

import com.automation.rei.govgrantsSteps.GovGrantsAssertionObjects;
import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.Register.EyeThink;
import org.junit.Assert;

public class ProgressReport extends ProjectManager {
    private GovGrantsAssertionObjects ggAssertionObjects;

    public ProgressReport(GovGrantsAssertionObjects ggAssertionObject ){
        this.ggAssertionObjects = ggAssertionObject;
    }

    public void verifyProgressReportSchedulesUpdated(String totalRecords, String tableID){
        Assert.assertEquals(EyeThink.core().Properties().getValue("EGMSID1"),EyeThink.core().Properties().getValue("EGMSID2"));
       AssertTotalRecordsCountInFlexTable(totalRecords,tableID);
    }
}
