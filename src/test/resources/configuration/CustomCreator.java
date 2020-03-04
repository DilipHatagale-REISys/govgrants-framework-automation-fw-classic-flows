package com.framework.automation.steps;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        glue = {"setup","com.ggproduct.automation.steps","com.automation.rei.govgrantsSteps","eyethink.automation.bots.bdd","eyethink.automation.bots.Register"},
        features = {"target/parallel/features/[CUCABLE:FEATURE].feature"},
        plugin = {"json:target/cucumber-report/[CUCABLE:RUNNER].json","eyethink.automation.bots.controller.ReportingLogsPlugin"},
        tags = {"not @wip"},
        monochrome = true,
        strict=true
)
public class CustomCreator {

}

