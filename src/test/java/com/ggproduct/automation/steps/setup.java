package com.ggproduct.automation.steps;

import java.awt.AWTException;
import java.io.IOException;

import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;
import com.ggproduct.automation.projectmanager.UsersAndURL;
import eyethink.automation.bots.Register.AuthorizedProject;
import eyethink.automation.bots.Register.EyeThink;
import eyethink.automation.bots.Report.CSS;
import eyethink.automation.bots.controller.TestSetupController;
import eyethink.automation.bots.objects.InstanceRecording;
import io.cucumber.java.Before;

/**
 * @author nauman.shahid
 * @for REI-Systems
 * @category Handle browser initialization , appium , hooks and environments
 */

public class setup {
    private TestSetupController userController;
    private static CSS report;

    public setup(TestSetupController userController, GovGrantsHandler saasLayer) {
        this.userController = userController;
        EyeThink.setRegister(AuthorizedProject.SAAS_GOVGRANTS_PRODUCT);
        InstanceRecording.recordInstance(GovGrantsHandler.class, saasLayer);
        if(report == null) {
            this.report = new CSS();
            report.reportConfigWriteUp(System.getProperty("user.dir"),"GovGrants Product Test Automation");
        }
    }

    @Before(order = 1)
    public void setUpUsers() throws IOException, AWTException {
        userController.usersController(new UsersAndURL());
        new ProjectManager().initData();
    }


}
