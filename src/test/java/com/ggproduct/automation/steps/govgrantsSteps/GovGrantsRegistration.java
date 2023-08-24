package com.ggproduct.automation.steps.govgrantsSteps;

import com.helperPackage.govgrants.MainPage;
import com.helperPackage.handlers.govgrants;
import com.helperPackage.handlers.GovGrantsLibrary;
import com.helperPackage.controller.TestingBlazeGlobal;
import com.helperPackage.objects.InstanceRecording;
import io.cucumber.java.Before;
import io.cucumber.java.en.And;

public class GovGrantsRegistration {
    public GovGrantsRegistration(GovGrantsLibrary saas) {
        InstanceRecording.recordInstance(GovGrantsLibrary.class, saas);
        TestingBlazeGlobal.setVariable("processingHoldOnScreen",MainPage.navLogo);
    }
    @And("I create the user")
    public void iCreateTheUser() {
        govgrants.perform().registration().createUsers();
    }

    @And("^I perform operations on (yopmail|mailDropCC) with mail \"([^\"]*)\" and subject \"([^\"]*)\" with link \"([^\"]*)\"$")
    public void iPerformOperationsOnYopmailWithMail(String portal,String emailId, String subject, String expectedLink) {
        govgrants.perform().registration().performOperationsOnYopmailWithMail(portal, emailId, subject, expectedLink);
    }

    @Before(order = 1)
    public void setup() {}
}
