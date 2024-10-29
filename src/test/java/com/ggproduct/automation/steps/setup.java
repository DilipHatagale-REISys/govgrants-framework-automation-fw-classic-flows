package com.ggproduct.automation.steps;

import com.ggproduct.automation.usersUrl.UsersAndURL;
import com.ggproduct.automation.webservices.GranteeWebServices;
import com.ggproduct.automation.webservices.GrantorWebServices;
//import com.ggproduct.automation.webservices.ProjectWebServices;
import com.helperPackage.controller.TestSetupController;
import com.helperPackage.register.EnvironmentFactory;
import com.helperPackage.report.CSS;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import org.apache.commons.lang.StringUtils;

import java.awt.*;
import java.io.IOException;

/**
 * @author nauman.shahid
 * @for REI-Systems
 * @category Handle browser initialization , appium , hooks and environments
 */

public class setup {
    private final TestSetupController userController;
    private static CSS report;
    GrantorWebServices grantorWebServices;
    GranteeWebServices granteeWebServices;

    public setup(TestSetupController userController, GrantorWebServices grantorWebServices, GranteeWebServices granteeWebServices) {
        this.userController = userController;
        this.grantorWebServices = grantorWebServices;
        this.granteeWebServices = granteeWebServices;
        if (report == null) {
            report = new CSS();
            EnvironmentFactory.setProjectName("GovGrants Product Test Automation");
            EnvironmentFactory.setOrgName("REI Systems [Saas Business Unit]");
            EnvironmentFactory.setProjectPath(System.getProperty("user.dir"));
            report.reportConfigWriteUp();
        }
    }

    @Before(order = 2)
    public void setUpUsers() throws IOException, AWTException {
        userController.usersController(new UsersAndURL());
    }

    @After(order = 1)
    public void deleteMe() {
       if (StringUtils.containsIgnoreCase(EnvironmentFactory.getEnvironmentName(), "GRANTOR"))
            grantorWebServices.deleteRecordInHooks();
       else if (StringUtils.containsIgnoreCase(EnvironmentFactory.getEnvironmentName(), "GRANTEE"))
           granteeWebServices.deleteRecordInHooks();
//        It will deactivate the activated users.
//        ProjectWebServices.changeUserActivationStatus("automationinternal", false);
    }
}