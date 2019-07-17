package com.ggproduct.automation.steps;

import java.awt.AWTException;
import java.io.IOException;

import com.automation.rei.controller.SetupController;
import com.ggproduct.automation.projectmanager.UsersAndURL;
import eyethink.automation.bots.Report.CSS;
import eyethink.automation.bots.controller.Controller;
import eyethink.automation.bots.controller.CoreHandlers;
import io.cucumber.core.api.Scenario;
import io.cucumber.java.After;
import io.cucumber.java.Before;

/**
 * @author nauman.shahid
 * @for REI-Systems
 * @category Handle browser initialization , appium , hooks and environments
 */

public class setup {
    private SetupController setupController;
    private static CSS report;
    private CoreHandlers eyeThink;

    public setup(Controller controller , CoreHandlers eyeThink) {
        this.setupController = new SetupController(controller);
        this.eyeThink=eyeThink;
        if(report == null) {
            this.report = new CSS();
            report.reportConfigWriteUp(System.getProperty("user.dir"),"GovGrants Product Test Automation");
        }
    }

    @Before
    public void startUp(Scenario scenario) throws IOException, AWTException {
        setupController.getAccessToSetup().initializer(scenario,eyeThink);
        setupController.getAccessToSetup().usersController(new UsersAndURL());
    }

    @After
    public void wrapUp(Scenario scenario) throws IOException {
        setupController.getAccessToSetup().theEnd(scenario);
    }
}
