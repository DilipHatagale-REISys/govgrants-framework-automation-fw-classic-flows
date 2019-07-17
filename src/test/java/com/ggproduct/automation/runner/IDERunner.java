package com.ggproduct.automation.runner;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        glue = {"setup","com.ggproduct.automation.steps","com.automation.rei.govgrantsSteps","eyethink.automation.bots.bdd"},
        features = {"features"},
        plugin = {"json:target/cucumber-report/cucumber.json"},
        tags = {"@validateChangeinTaskMenuSequence-gHome"},
        monochrome = true
)

public class IDERunner {

}
