package com.ggproduct.automation.steps;


import java.io.IOException;
import com.automation.rei.controller.Controller;
import com.automation.rei.controller.SetupController;
import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;

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
        setupController.callDocker();
    }

    @Before
    public void startUp() throws IOException {
        setupController.initializer();
    }

    @After
    public void wrapUp(Scenario scenario) {
        setupController.theEnd(scenario);
    }
}
