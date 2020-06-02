package com.ggproduct.automation.steps;

import com.ggproduct.automation.projectmanager.ProjectManager;
import io.cucumber.java.en.Given;

public class CommonSteps {
    ProjectManager projectManager;

    public CommonSteps(ProjectManager projectManager) {
        this.projectManager = projectManager;
    }

    @Given("^I delete the record \"([^\"]*)\" from the object \"([^\"]*)\"$")
    public void deleteTestData(String recordName, String objectType) {
        projectManager.deletionApi(recordName, objectType);
    }
}
