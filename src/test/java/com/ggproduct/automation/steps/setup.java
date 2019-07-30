package com.ggproduct.automation.steps;

import java.awt.AWTException;
import java.io.IOException;
import com.ggproduct.automation.projectmanager.UsersAndURL;
import eyethink.automation.bots.Report.CSS;
import eyethink.automation.bots.controller.CoreHandlers;
import eyethink.automation.bots.controller.TestSetupController;
import io.cucumber.java.Before;

/**
 * @author nauman.shahid
 * @for REI-Systems
 * @category Handle browser initialization , appium , hooks and environments
 */

public class setup {
    private TestSetupController userController;
    private static CSS report;
    private CoreHandlers eyeThink;

    public setup(TestSetupController userController) {
        this.userController = userController;
        if(report == null) {
            this.report = new CSS();
            report.reportConfigWriteUp(System.getProperty("user.dir"),"GovGrants Product Test Automation");
        }
    }

    @Before(order = 1)
    public void setUpUsers() throws IOException, AWTException {
        userController.usersController(new UsersAndURL());
    }


}
