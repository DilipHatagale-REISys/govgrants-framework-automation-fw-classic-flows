package com.ggproduct.automation.runner;

import cucumber.api.CucumberOptions;
import cucumber.api.testng.AbstractTestNGCucumberTests;
import eyethink.automation.bots.controller.CucumberRunnerManager;

/**
 * IDE runner class. Place any tag name in tags and it will run the specific tag
 * through IDE . Can be used to debug code as well.
 * Only designed to open chrome browser
 * @author nauman.shahid
 *
 */
@CucumberOptions(features = { "classpath:features" }, tags = { "@announcementCreatedDeleteAccessToOwnerFA" }, glue = {
        "com.ggproduct.automation.steps","com.automation.rei.govgrantsSteps"}, plugin = { "com.cucumber.listener.ExtentCucumberFormatter:" })

public class IDERunner extends AbstractTestNGCucumberTests {
    static {
        new CucumberRunnerManager();
    }

}
