package com.ggproduct.automation.projectmanager;

import com.automation.rei.controller.UsersController;

import eyethink.automation.bots.controller.EnvironmentFetcher;

public class UsersAndURL implements UsersController {

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
    public String getUserName(String userLevel) {
        String userName = null;
        if ((EnvironmentFetcher.environmentName != null) && (EnvironmentFetcher.environmentName.contains("QA"))) {
            userName = getQAEnvironmentUser(userLevel);
        } else if ((EnvironmentFetcher.environmentName != null)
                && (EnvironmentFetcher.environmentName.contains("UAT"))) {
            // To be implemented
        } else if ((EnvironmentFetcher.environmentName != null)
                && (EnvironmentFetcher.environmentName.contains("DEMO"))) {
            userName = getDemoEnvironmentUser(userLevel);
        } else if ((EnvironmentFetcher.environmentName != null)
                && (EnvironmentFetcher.environmentName.contains("AUTO"))) {
            userName = getAutoEnvironmentUser(userLevel);
        } else {
            userName = getQAEnvironmentUser(userLevel);
        }
        return userName;
    }

    @Override
    public String getPassword(String userLevel) {
        String password = null;
        if (EnvironmentFetcher.environmentName.contains("QA")) {
            password = getQAEnvironmentPassword(userLevel);
        } else if (EnvironmentFetcher.environmentName.contains("uat")) {
            // To be implemented
        } else if (EnvironmentFetcher.environmentName.contains("DEMO")) {
            password = getDemoEnvironmentPassword(userLevel);
        } else if (EnvironmentFetcher.environmentName.contains("AUTO")) {
            password = getAutoEnvironmentPassword(userLevel);
        }
        return password;
    }

    private String getAutoEnvironmentPassword(String userLevel) {
        String password;
        switch(userLevel.toUpperCase()) {
        case "SARAH PO":
            password = "test72018";
            break;
        case "ADMIN":
            password = "GoProduct@123";
            break;
        default:
            password = "SALESFORCE2018";
        }
        return password;
    }

    private String getQAEnvironmentPassword(String userLevel) {
        String password;
        switch(userLevel.toUpperCase()) {
        case "SARAH PO":
            password = "test72018";
            break;
        case "ADMIN":
            password = "GoProduct@123";
            break;
        default:
            password = "SALESFORCE2018";
        }
        return password;
    }

    public String getDemoEnvironmentPassword(String userLevel) {
        String password;
        switch(userLevel.toUpperCase()) {
        case "SARAH PO":
            password = "SALESFORCE2018";
            break;
        case "ADMIN":
            password = "GoProduct@123";
            break;
        default:
            password = "SALESFORCE2018";
        }
        return password;
    }

    private String getQAEnvironmentUser(String userLevel) {
        String username;

        switch(userLevel.toUpperCase()) {
        case "ADMIN":
            username = "manu.sa@ggp.test7";
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
            username = "kyle.farrell@reisystems.com21";
            break;
        case "SIMON PM":
            username = "simon_pm@ggp.test7";
            break;
        case "SARAH PO":
            username = "sarah_po@ggp.test7";
            break;
        case "ALEX FO":
            username = "alex_fo@ggp.test7";
            break;
        case "TOMMY EXE":
            username = "tommy_exe@ggp.test7";
            break;
        case "CATHY PM":
            username = "cathy_pm@ggp.test7";
            break;
        case "OSCAR PM":
            username = "oscar_pm@ggp.test7";
            break;
        case "Bill PM":
            username = "bill_pm@ggp.test7";
            break;
        default:
            username = "manu.sa@ggp.test7";
        }
        return username;
    }

    private String getDemoEnvironmentUser(String userLevel) {
        String username;

        switch(userLevel.toUpperCase()) {
        case "ADMIN":
            username = "manu.sa@ggp.test7.demo7";
            break;
        case "EXE":
            username = "test@gmaildemo.com.demo7";
            break;
        case "PM":
            username = "donald_pm@ggp.test7.demo7";
            break;
        case "PO":
            username = "sdgdg45435dj@gmail.com.demo7";
            break;
        case "FO":
            username = "auto.fm@auto.com.demo7";
            break;
        case "SPI":
            username = "kyle.farrell@reisystems.com21.demo7";
            break;
        case "SIMON PM":
            username = "simon_pm@ggp.test7.demo7";
            break;
        case "SARAH PO":
            username = "sarah_po@ggp.test7.demo7";
            break;
        case "ALEX FO":
            username = "alex_fo@ggp.test7.demo7";
            break;
        case "TOMMY EXE":
            username = "tommy_exe@ggp.test7.demo7";
            break;
        case "CATHY PM":
            username = "cathy_pm@ggp.test7.demo7";
            break;
        case "OSCAR PM":
            username = "oscar_pm@ggp.test7.demo7";
            break;
        default:
            username = "manu.sa@ggp.test7.demo7";
        }
        return username;
    }

    private String getAutoEnvironmentUser(String userLevel) {
        String username;

        switch(userLevel.toUpperCase()) {
        case "ADMIN":
            username = "manu.sa@ggp.test7.automation";
            break;
        case "EXE":
            username = "test@gmaildemo.com.automation";
            break;
        case "PM":
            username = "donald_pm@ggp.test7.automation";
            break;
        case "PO":
            username = "sdgdg45435dj@gmail.com";
            break;
        case "FO":
            username = "auto.fm@auto.com.automation";
            break;
        case "SPI":
            username = "kyle.farrell@reisystems.com21.automation";
            break;
        case "SIMON PM":
            username = "simon_pm@ggp.test7.automation";
            break;
        case "SARAH PO":
            username = "sarah_pm@ggp.test7.automation";
            break;
        case "ALEX FO":
            username = "alex_fo@ggp.test7.automation";
            break;
        case "TOMMY EXE":
            username = "tommy_exe@ggp.test7.automation";
            break;
        case "CATHY PM":
            username = "cathy_pm@ggp.test7.automation";
            break;
        case "OSCAR PM":
            username = "oscar_pm@ggp.test7.automation";
            break;
        case "Bill PM":
            username = "bill_pm@ggp.test7.automation";
            break;
        default:
            username = "manu.sa@ggp.test7.automation";
        }
        return username;
    }

    public String performLoginSubPortalEnvironment(String userLevel) {
        String username;

        switch(userLevel.toUpperCase()) {
        case "SPI":
            username = "gcooper@yopmail.com20";
            break;
        case "FO":
            username = "auto.fm@auto.com.demo7";
            break;
        default:
            username = "admin.automation@subportal.com";
        }
        return username;
    }
}
