package com.ggproduct.automation.steps;

import java.awt.AWTException;
import java.io.IOException;
import com.automation.rei.controller.SetupController;
import com.ggproduct.automation.projectmanager.UsersAndURL;
import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import eyethink.automation.bots.controller.Controller;

/**
 * @for REI-Systems
 * @author nauman.shahid
 * @category Handle browser initialization , appium , hooks and environments
 */

public class setup { 
    private SetupController setupController;

    public setup(Controller controller) {
        this.setupController = new SetupController(controller);
    }

    @Before(order = 0)
    public void beforeAll() {
        setupController.getAccessToSetup().callDocker();
    }

    @Before
    public void startUp() throws IOException, AWTException {
        setupController.getAccessToSetup().initializer();
        setupController.usersController(new UsersAndURL());
    }

    @After
    public void wrapUp(Scenario scenario) throws IOException {
        setupController.getAccessToSetup().theEnd(scenario);
    }
}
