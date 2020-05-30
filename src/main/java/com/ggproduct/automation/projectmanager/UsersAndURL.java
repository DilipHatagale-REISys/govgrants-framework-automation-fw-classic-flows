package com.ggproduct.automation.projectmanager;


import com.testingblaze.controller.UsersController;
import com.testingblaze.misclib.Properties_Logs;
import com.testingblaze.register.EnvironmentFactory;
import com.testingblaze.register.I;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class UsersAndURL implements UsersController {

    public UsersAndURL(){
        I.amPerforming().propertiesFileOperationsTo().saveValue("EXE Username", "Automation EXE");
        I.amPerforming().propertiesFileOperationsTo().saveValue("FO Username", "Automation FO");
        I.amPerforming().propertiesFileOperationsTo().saveValue("PM Username", "Automation PM");
        I.amPerforming().propertiesFileOperationsTo().saveValue("AUDITOR Username", "Automation AUDITOR");
        I.amPerforming().propertiesFileOperationsTo().saveValue("SPI Username", "Automation SPI");
    }

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
        if ((EnvironmentFactory.getEnvironmentName() != null) && (EnvironmentFactory.getEnvironmentName().contains("QA"))) {
            userName = getQAEnvironmentUser(setUpUserLevel(userLevel));
        } else if ((EnvironmentFactory.getEnvironmentName() != null) && (EnvironmentFactory.getEnvironmentName().contains("TEST8"))) {
            userName = getTest8EnvironmentUser(setUpUserLevel(userLevel));
        } else {
            userName = getAUTOEnvironmentUser(setUpUserLevel(userLevel));
        }
        return userName;
    }

    @Override
    public String getPassword(String userLevel) {
        String password = null;
        if (EnvironmentFactory.getEnvironmentName().contains("QA")) {
            password = getQAEnvironmentPassword(setUpUserLevel(userLevel));
        } else if (EnvironmentFactory.getEnvironmentName().contains("TEST8")) {
            password = getTest8EnvironmentPassword(setUpUserLevel(userLevel));
        } else
            password = getAUTOEnvironmentPassword(setUpUserLevel(userLevel));
        return password;
    }

    private String getQAEnvironmentPassword(String userLevel) {
        String password;
        switch (userLevel.toUpperCase()) {
            case "SARAH PO":
                password = "test72018";
                break;
            case "ADMIN":
                password = "Salesforce_2019";
                break;
            default:
                password = "SALESFORCE2019";
        }
        return password;
    }

    private String getTest8EnvironmentPassword(String userLevel) {
        String password;
        switch (userLevel.toUpperCase()) {
            case "ADMIN":
                password = "GoProduct@1234";
                break;
            default:
                password = "SALESFORCE2019";
        }
        return password;
    }

    private String getAUTOEnvironmentPassword(String userLevel) {
        String password;
        switch (userLevel.toUpperCase()) {
            case "SARAH PO":
                password = "test72018";
                break;
            case "ADMIN":
                password = "GoProduct@12345";
                break;
            default:
                password = "SALESFORCE2021";
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

    private String getAUTOEnvironmentUser(String userLevel) {
        Map<String, String> username = new HashMap<>();
        username.put("ADMIN", "manu.admin@ggp.test8.automation");
        username.put("EXE", "test@gmaildemo.com.atm.automation");
        username.put("PM", "donald_pm@ggp.test7.atm.automation");
        username.put("FO", "auto.fm@auto.com.atm.automation");
        username.put("SPI", "spiauto@yopmail.com");
        username.put("SPA", "spaauto@yopmail.com");
        username.put("IND", "ind.automation@yopmail.com");
        username.put("SA", "saautomation@yopmail.com");
        username.put("SPI2", "automationspi2@yopmail.com");
        username.put("SPI3", "autopatricksa@yopmail.com");
        username.put("AUDITOR", "automationauditor@yopmail.com");

        username.put("SIMON PM", "simon@ggp.test8.automation");
        username.put("ALEX FO", "alex_fo@ggp.test7.automation");
        username.put("CATHY PM", "cathy_pm@ggp.test7.automation");
        username.put("OSCAR PM", "oscar_pm@ggp.test7.automation");
        username.put("Bill PM", "bill_pm@ggp.test7.automation");

        if (userLevel.toUpperCase() != null) {
            return username.get(userLevel.toUpperCase());
        } else {
            return username.get("ADMIN");
        }
    }

    private String getTest8EnvironmentUser(String userLevel) {
        Map<String, String> username = new HashMap<>();
        username.put("ADMIN", "manu.admin@ggp.test8.automation");
        username.put("EXE", "test@gmaildemo.com.atm.automation");
        username.put("PM", "donald_pm@ggp.test7.atm.automation");
        username.put("FO", "auto.fm@auto.com.atm.automation");
        username.put("SPI", "automationspi@yopmail.com");
        username.put("SPA", "automation.spa@yopmail.com");
        username.put("IND", "automationind123@yopmail.com");
        username.put("SA", "christopher.sa@yopmail.com.atm");
        username.put("SPI2", "david.schim@yopmail.com");
        username.put("SPI3", "automation.patricksa@yopmail.com20.atm");
        username.put("AUDITOR", "automation.auditor@yopmail.com");

        username.put("SIMON PM", "simon_pm@ggp.test7.automation");
        username.put("ALEX FO", "alex_fo@ggp.test7.automation");
        username.put("CATHY PM", "cathy_pm@ggp.test7.automation");
        username.put("OSCAR PM", "oscar_pm@ggp.test7.automation");
        username.put("Bill PM", "bill_pm@ggp.test7.automation");

        if (userLevel.toUpperCase() != null) {
            return username.get(userLevel.toUpperCase());
        } else {
            return username.get("ADMIN");
        }
    }

    /**
     * setup userLevel based on jvm property or default value or as passed from feature
     *
     * @param userType dynamicUser or EXE/PM
     * @return userLevel
     * @author nauman.shahid
     */
    private String setUpUserLevel(String userType) {
        return userType.equalsIgnoreCase("dynamicUser") && System.getProperty("userType") != null ? System.getProperty("userType") : !userType.equalsIgnoreCase("dynamicUser") ? userType : "PM";
    }

    /**
     * @param userType e.g (INTERNAL,EXTERNAL)
     * @return Will return map<username,password> of corresponding type of user saved in mail.properties file.
     */
    public Map<String, String> getUserCredentialsForMailNotification(String userType) {
        Map<String, String> credentials = new HashMap();
        String userAndPassword;
        String env = System.getProperty("env");
        if (env == null || "".equalsIgnoreCase(env)) {
            env = "QA";
        }
        try {
            userAndPassword = (new Properties_Logs()).ReadPropertyFile("mail.properties", env.toUpperCase() + userType.toUpperCase());
            credentials.put("username", userAndPassword.split(":")[0]);
            credentials.put("password", userAndPassword.split(":")[1]);
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("Property file mail.properties is not present");
        }
        return credentials;
    }
}
