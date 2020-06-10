package com.ggproduct.automation.runner;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        glue = {"setup","com.ggproduct.automation.steps","com.automation.rei.govgrantsSteps","com.testingblaze.actionsfactory.gherkin","com.testingblaze.register"},
        features = {"src/test/resources/features"},
        plugin = {"json:target/cucumber-report/cucumber.json","html:target/cucumber-html","com.testingblaze.controller.ReportingLogsPlugin"},
        tags = {"@34721"},
        monochrome = true
)

public class IDERunner {

}
