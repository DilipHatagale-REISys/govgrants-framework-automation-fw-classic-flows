package com.ggproduct.automation.projectmanager;

import java.io.IOException;

import com.automation.rei.controller.UsersController;
import com.automation.rei.corelib.Properties_Logs;
import com.cucumber.listener.Reporter;

public class UsersAndURL implements UsersController{

    /**
     * @REI-Systems
     * @author nauman.shahid
     * @category Handles users based on different environments
     */

    /****
     * BELOW ARE SAMPLE METHODS TO HANDLE USERS BASED ON DIFFERENT ENVIRONEMNTS
     *******/
    /****
     * IT ALSO HANDLE ANY ADDITIONAL URL IN ADDITION TO STANDARD PROJECT
     **********/
    /****
     * SINCE THESE ARE GENERIC METHODS SO YOU MAY KEEP THE SAME WITH MODIFICTION
     ******/

    @Override
    public String handleUsersForEnv(String userLevel) {
        String userName = null;
        if (System.getProperty("env").equalsIgnoreCase("qa")) {
            userName = performLoginQAEnvironment(userLevel);
        } else if (System.getProperty("env").equalsIgnoreCase("uat")) {
            userName = performLoginUATEnvironment(userLevel);
        } else if (System.getProperty("env").equalsIgnoreCase("subportal")) {
            userName = performLoginSubPortalEnvironment(userLevel);
        }
        return userName;
    }
    
    @Override
    public String getAutomationPassword() {
        String defaultPassword = "SALESFORCE2018";
        return defaultPassword;
    }

    public String performLoginQAEnvironment(String userLevel) {
        String username;

        switch (userLevel.toUpperCase()) {
        case "ADMIN":
            username = "admin.automation@product.com";
            break;
        case "EXE":
            username = "test@gmaildemo.com";
            break;
        case "PM":
            username = "donald_pm@ggp.test7";
            break;
        case "PO":
            username = "sdgdg45435dj@gmail.com";
            break;
        case "FO":
            username = "auto.fm@auto.com";
            break;
        case "SPI":
            username = "gcooper@yopmail.com20";
            break;
        default:
            username = "admin.automation@product.com";
        }
        return username;
    }

    private String performLoginUATEnvironment(String userLevel) {
        String username;
        switch ("") {
        case "EXE":
            username = "To be implemented";
        default:
            username = "To be implemented";
            break;
        }
        return username;
    }

    public String performLoginSubPortalEnvironment(String userLevel) {
        String username;

        switch (userLevel.toUpperCase()) {
        case "SPI":
            username = "gcooper@yopmail.com20";
            break;
        case "FO":
            username = "auto.fm@auto.com";
            break;
        default:
            username = "admin.automation@subportal.com";
        }
        return username;
    }

    @Override
    public String navigateToAnyUrl(String urlName) throws IOException {
        String url = null;
        switch (urlName.toUpperCase()) {
        case "PRODUCT PORTAL":
            url = new Properties_Logs().ReadPropertyFile("environment.properties", "QA");
            Reporter.addScenarioLog("Scenario is running using External Link" + " & Url is " + url);
            break;
        case "SUBRECIPIENT PORTAL":
            url = new Properties_Logs().ReadPropertyFile("environment.properties", "SUBPORTAL");
            Reporter.addScenarioLog("Scenario is running using External Link" + " & Url is " + url);
            break;
        }
        return url;
    }

}
