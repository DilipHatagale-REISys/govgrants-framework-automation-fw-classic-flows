package com.ggproduct.automation.steps;

import com.ggproduct.automation.projectmanager.ProjectManager;
import com.ggproduct.automation.webservices.ProjectWebServices;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;

public class CommonSteps {
    ProjectManager projectManager;

    public CommonSteps(ProjectManager projectManager) {
        this.projectManager = projectManager;
    }

    /* ReCaptcha Steps */

    @Before("@recaptcha")
    public void turnOffRecaptcha() {
        ProjectWebServices.recaptchaChange(true);
    }

    @After("@recaptcha")
    public void turnOnRecaptcha() {
        ProjectWebServices.recaptchaChange(false);
    }


    @Given("^I delete the record \"([^\"]*)\" from the object \"([^\"]*)\"$")
    public void deleteTestData(String recordName, String objectType) {
        projectManager.deletionApi(recordName, objectType);
    }
}
