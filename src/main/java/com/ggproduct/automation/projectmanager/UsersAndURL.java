package com.ggproduct.automation.projectmanager;

import com.automation.rei.controller.UsersController;

import eyethink.automation.bots.controller.EnvironmentFetcher;

import java.util.HashMap;
import java.util.Map;

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
     * SINCE THESE ARE GENERIC METHODS SO YOU MAY KEEP THE SAME WITH MODIFICATION
     ******/

    @Override
    public String getUserName(String userLevel) {
        String userName = null;
        if ((EnvironmentFetcher.environmentName != null) && (EnvironmentFetcher.environmentName.contains("QA"))) {
            userName = getQAEnvironmentUser(userLevel);
        }
        return userName;
    }

    @Override
    public String getPassword(String userLevel) {
        String password = null;
        if (EnvironmentFetcher.environmentName.contains("QA")) {
            password = getQAEnvironmentPassword(userLevel);
        }
        return password;
    }

    private String getQAEnvironmentPassword(String userLevel) {
        String password;
        switch (userLevel.toUpperCase()) {
            case "SARAH PO":
                password = "test72018";
                break;
            case "ADMIN":
                password = "Salesforce12";
                break;
            default:
                password = "SALESFORCE2019";
        }
        return password;
    }

    private String getQAEnvironmentUser(String userLevel) {
        Map<String, String> username = new HashMap<>();
        username.put("ADMIN", "mayuresh.g@ggp.test7");
        username.put("EXE", "test@gmaildemo.com");
        username.put("PM", "donald_pm@ggp.test7");
        username.put("FO", "auto.fm@auto.com");
        username.put("SPI", "kyle.farrell@reisystems.com21");
        username.put("SPA", "spaautomation@yopmail.com");

        username.put("PO", "sdgdg45435dj@gmail.com");
        username.put("SIMON PM", "simon_pm@ggp.test7");
        username.put("SARAH PO", "sarah_pm@ggp.test7.automation");
        username.put("ALEX FO", "alex_fo@ggp.test7");
        username.put("CATHY PM", "cathy_pm@ggp.test7");
        username.put("OSCAR PM", "oscar_pm@ggp.test7");
        username.put("Bill PM", "bill_pm@ggp.test7");

        if (userLevel.toUpperCase() != null) {
            return username.get(userLevel.toUpperCase());
        } else {
            return username.get("ADMIN");
        }
    }

}
