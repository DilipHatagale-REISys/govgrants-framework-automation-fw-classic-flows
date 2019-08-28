package com.ggproduct.automation.pageobjects;

import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.Register.EyeThink;
import org.junit.Assert;

public class ProgressReport extends ProjectManager {

    public void verifyProgressReportSchedulesUpdated(String totalRecords, String tableID){
        Assert.assertEquals(EyeThink.core().Properties().getValue("EGMSID1"),EyeThink.core().Properties().getValue("EGMSID2"));
       AssertTotalRecordsCountInFlexTable(totalRecords,tableID);
    }
}
