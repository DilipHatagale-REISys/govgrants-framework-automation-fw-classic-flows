package com.ggproduct.automation.runner;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        glue = {"setup","com.ggproduct.automation.steps","com.helperPackage.actionsfactory.gherkin","com.helperPackage.register"},
        features = {"src/test/resources/features"},
        plugin = {"json:target/cucumber-report/cucumber.json","html:target/cucumber-html"},
        tags = {"@vai"},
        monochrome = true
)

public class IDERunner {

}
