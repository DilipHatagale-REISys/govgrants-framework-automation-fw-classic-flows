package com.ggproduct.automation.usersUrl;


import com.helperPackage.controller.UsersController;
import com.helperPackage.misclib.Properties_Logs;
import com.helperPackage.register.EnvironmentFactory;
import com.helperPackage.register.I;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class UsersAndURL implements UsersController {

    public UsersAndURL() {
        I.amPerforming().propertiesFileOperationsTo().saveValue("ADMIN Username", "Automation ADMIN");
        I.amPerforming().propertiesFileOperationsTo().saveValue("ADMIN1 Username", "Automation ADMIN1");
        I.amPerforming().propertiesFileOperationsTo().saveValue("EXE Username", "Automation EXE");
        I.amPerforming().propertiesFileOperationsTo().saveValue("FO Username", "Automation FO");
        I.amPerforming().propertiesFileOperationsTo().saveValue("PO Username", "Automation PO");
        I.amPerforming().propertiesFileOperationsTo().saveValue("FD Username", "Automation FD");
        I.amPerforming().propertiesFileOperationsTo().saveValue("PM Username", "Automation PM");
        I.amPerforming().propertiesFileOperationsTo().saveValue("PM1 Username", "Automation PM1");
        I.amPerforming().propertiesFileOperationsTo().saveValue("EXE1 Username", "Automation EXE1");
        I.amPerforming().propertiesFileOperationsTo().saveValue("FO1 Username", "Automation FO1");
        I.amPerforming().propertiesFileOperationsTo().saveValue("PO1 Username", "Automation PO1");
        I.amPerforming().propertiesFileOperationsTo().saveValue("FD1 Username", "Automation FD1");
        I.amPerforming().propertiesFileOperationsTo().saveValue("AUDITOR Username", "Automation AUDITOR");
        I.amPerforming().propertiesFileOperationsTo().saveValue("SPI Username", "Automation SPI");
        I.amPerforming().propertiesFileOperationsTo().saveValue("SPI3 Username", "Automation SPI3");
        I.amPerforming().propertiesFileOperationsTo().saveValue("SPA Username", "Automation SPA");
        I.amPerforming().propertiesFileOperationsTo().saveValue("SPI4 Username", "Automation SPI4");
        I.amPerforming().propertiesFileOperationsTo().saveValue("IND Username", "Automation IND");
        I.amPerforming().propertiesFileOperationsTo().saveValue("GRANTEE ADMIN Username", "Grantee ADMIN");
        I.amPerforming().propertiesFileOperationsTo().saveValue("GRANTEE PO Username", "Grantee PO");
        I.amPerforming().propertiesFileOperationsTo().saveValue("GRANTEE FD Username", "Grantee FD");
        I.amPerforming().propertiesFileOperationsTo().saveValue("GRANTEE PM Username", "Grantee PM");
        I.amPerforming().propertiesFileOperationsTo().saveValue("GRANTEE PM1 Username", "Grantee PM1");
        I.amPerforming().propertiesFileOperationsTo().saveValue("GRANTEE FO Username", "Grantee FO");
        I.amPerforming().propertiesFileOperationsTo().saveValue("GRANTEE EXE Username", "Grantee EXE");
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
        if ((EnvironmentFactory.getEnvironmentName() != null) && (EnvironmentFactory.getEnvironmentName().contains("FWCLASSIC"))) {
            userName = getQAEnvironmentUser(setUpUserLevel(userLevel));
        } else if ((EnvironmentFactory.getEnvironmentName() != null) && (EnvironmentFactory.getEnvironmentName().contains("TEST8"))) {
            userName = getTest8EnvironmentUser(setUpUserLevel(userLevel));
        } else if ((EnvironmentFactory.getEnvironmentName() != null) && (EnvironmentFactory.getEnvironmentName().contains("FWPATCH"))) {
            userName = getPATCHEnvironmentUser(setUpUserLevel(userLevel));
        } else {
            userName = getAUTOEnvironmentUser(setUpUserLevel(userLevel));
        }
        return userName;
    }

    @Override
    public String getPassword(String userLevel) {
        String password = null;
        if (EnvironmentFactory.getEnvironmentName().contains("FWCLASSIC")) {
            password = getQAEnvironmentPassword(setUpUserLevel(userLevel));
        } else if (EnvironmentFactory.getEnvironmentName().contains("TEST8")) {
            password = getTest8EnvironmentPassword(setUpUserLevel(userLevel));
        } else if (EnvironmentFactory.getEnvironmentName().contains("FWPATCH")) {
            password = getPATCHEnvironmentPassword(setUpUserLevel(userLevel));
        } else
            password = getAUTOEnvironmentPassword(setUpUserLevel(userLevel));
        return password;
    }

//    private String getQAEnvironmentPassword(String userLevel) {
//        String password;
//        switch (userLevel.toUpperCase()) {
//            case "SARAH PM":
//                password = "Salesforce@2025";
//                break;
//            case "SPI3":
//                password = "Salesforce2025";
//                break;
//            default:
//                password = "Salesforce2023";
//        }
//        return password;
//    }

    private String getQAEnvironmentPassword(String userType) {
        Map<String, String> password = new HashMap<>();
        password.put("ADMIN", "Test8@05dec");
        password.put("PO", "Test8@05dec");
        password.put("FD", "Test8@05dec");
        password.put("FD1","Test8@05dec");
        password.put("ADMIN1", "Test8@05dec");
        password.put("EXE", "exe@05dec");
        password.put("PO1","Test8@05dec");
        password.put("EXE1", "Test8@05dec");
        password.put("PM", "Test8@05dec");
        password.put("dynamicUser", "FWTest@02oct");
        password.put("FO", "Test8@05dec");
        password.put("FO1","Test8@05dec");
        password.put("SPI3", "Test8@05dec");
        password.put("SPA", "Test8@05dec");
        password.put("PM1", "Test8@05dec");
        if (userType.toUpperCase() != null) {
            return password.get(userType.toUpperCase());
        } else {
            return password.get("ADMIN");
        }
    }


    private String getTest8EnvironmentPassword(String userLevel) {
        String password;
        switch (userLevel.toUpperCase()) {
            case "ADMIN":
                password = "Salesforce@2032";
                break;
            case "ADMIN1":
                password = "Salesforce@2032";
                break;
            case "SPI3":
                password = "Salesforce@2033";
                break;
            case "SA":
                password = "Salesforce@2032";
                break;
            case "IND":
                password = "Salesforce@2033";
                break;
            case "PM":
                password = "Salesforce@2032";
                break;
            case "PM1":
                password = "Salesforce@2032";
                break;
            case "SPA":
                password = "Salesforce9090";
                break;
            default:
                password = "Salesforce@2032";
        }
        return password;
    }

    private String getAUTOEnvironmentPassword(String userLevel) {
        String password;
        switch (userLevel.toUpperCase()) {
            case "SPI4":
                password = "Salesforce@2028";
                break;
            case "SPA":
                password = "Salesforce2030";
                break;
            case "FD":
                password = "Salesforce2030";
                break;
            default:
                password = "Salesforce2030";
        }
        return password;
    }

    private String getPATCHEnvironmentPassword(String userType) {
        Map<String, String> password = new HashMap<>();
        password.put("PO", "Patch@02oct");
        password.put("FD", "Patch@02oct");
        password.put("PM", "Patch@02octo");
        password.put("EXE", "Patch@02oct");
        password.put("EXE1", "Patch@02oct");
        password.put("FO", "Patch@02oct");
        password.put("ADMIN", "Patch@02oct");
        password.put("ADMIN1", "Patch@02oct");
        password.put("SPI3", "Patch@02oct");
        password.put("dynamicUser", "Patch@02oct");
        password.put("PM1", "Patch@02oct");
        if (userType.toUpperCase() != null) {
            return password.get(userType.toUpperCase());
        } else {
            return password.get("Admin");
        }
    }

    private String getPATCHEnvironmentUser(String userLevel) {
        Map<String, String> username = new HashMap<>();
        username.put("PO", "test8.automationpo@yopmail.com.frwpatch");
        username.put("FD", "test8.automationfd@yopmail.com.frwpatch");
        username.put("PM", "donald_pm@ggp.test7.atm.frwpatch");
        username.put("EXE", "test@gmaildemo.com.atm.frwpatch");
        username.put("EXE1", "test8.exe1.automation@yopmail.com.frwpatch");
        username.put("FO", "auto.fm@auto.com.atm.frwpatch");
        username.put("ADMIN", "automationadminpatch@yopmail.com.atm.frwpatch");
        username.put("ADMIN1", "automationadminpatch@yopmail.com.atm.frwpatch");
        username.put("SPI3", "aspi4@grants.gov");
        username.put("dynamicUser", "donald_pm@ggp.test7.atm.frwpatch");
        username.put("PM1", "test8.pm1.automation@yopmail.com.frwpatch");
        if (userLevel.toUpperCase() != null) {
            return username.get(userLevel.toUpperCase());
        } else {
            return username.get("ADMIN");
        }
    }

    private String getQAEnvironmentUser(String userLevel) {
        Map<String, String> username = new HashMap<>();
        username.put("ADMIN", "govgrantsautomation5@yopmail.com.fwautomat");
        username.put("ADMIN1","admin1@yopmail.com.fwautomat");
        username.put("PM", "donald_pm@ggp.test8.atm.fwautomat");
        username.put("PM1", "pm1.automation@yopmail.com.fwautomat");
        username.put("PO", "test8.automationpo@yopmail.com.fwautomat");
        username.put("PO1", "automationpo1@yopmail.com.fwautomat");
        username.put("FD", "test8.automationfd@yopmail.com.fwautomat");
        username.put("FD1", "automationfd1@yopmail.com.fwautomat");
        username.put("EXE", "test@gmaildemo.com.atm.fwautomat");
        username.put("EXE1", "test8.exe1.automation@yopmail.com");
        username.put("FO", "auto.fm@auto.com.atm.fwautomat");
        username.put("FO1", "fo1.automation@yopmail.com.fwautomat");
        username.put("SPI3", "rreispi3@grants.gov");
        username.put("SPA", "tepippiddapro-4055@yopmail.com");


        if (userLevel.toUpperCase() != null) {
            return username.get(userLevel.toUpperCase());
        } else {
            return username.get("ADMIN");
        }
    }
//    private String getQAEnvironmentUser(String userLevel) {
//        Map<String, String> username = new HashMap<>();
//        username.put("ADMIN", "govgrantsautomation@yopmail.com.qaorg");
//        username.put("ADMIN1", "admin1@yopmail.com.qaorg");
//        username.put("EXE", "test@gmaildemo.com.qaorg");
//        username.put("PM", "pm.automation@yopmail.com.qaorg");
//        username.put("FO", "auto.fm@auto.com.atm.qaorg");
//        username.put("PO", "automationpo@yopmail.com.qaorg");
//        username.put("FD", "automationfd@yopmail.com.qaorg");
//        username.put("PM1", "pm1.automation@yopmail.com.qaorg");
//        username.put("EXE1", "exe1.automation@yopmail.com.qaorg");
//        username.put("PO1", "automationpo1@yopmail.com.qaorg");
//        username.put("FO1", "fo1.automation@yopmail.com.qaorg");
//        username.put("FD1", "automationfd1@yopmail.com.qaorg");
//        username.put("SPI3", "automationspi3@yopmail.com");
//        username.put("SPA", "spaautomation@yopmail.com");
//        username.put("SA", "automationspi212@yopmail.com");
//        username.put("AUDITOR", "automationauditor@yopmail.com.qaorg");
//        username.put("SARAH PM", "sarah.pm@ggp.test8.qaorg");
//
//        username.put("SIMON PM", "simon_pm@ggp.test7");
//        username.put("SARAH PO", "sarah_pm@ggp.test7.automation");
//        username.put("ALEX FO", "alex_fo@ggp.test7");
//        username.put("CATHY PM", "cathy_pm@ggp.test7");
//        username.put("OSCAR PM", "oscar_pm@ggp.test7");
//        username.put("Bill PM", "bill_pm@ggp.test7");
//
//        if (userLevel.toUpperCase() != null) {
//            return username.get(userLevel.toUpperCase());
//        } else {
//            return username.get("ADMIN");
//        }
//    }

    private String getAUTOEnvironmentUser(String userLevel) {
        Map<String, String> username = new HashMap<>();
        username.put("ADMIN", "govgrantsautomation@yopmail.com");
        username.put("ADMIN1", "admin1@yopmail.com.automation");
        username.put("EXE", "test@gmaildemo.com.atm.automation");
        username.put("PM", "donald_pm@ggp.test7.atm.automation");
        username.put("FO", "auto.fm@auto.com.atm.automation");
        username.put("FD", "automationfd@yopmail.com");
        username.put("PO", "automationpo@yopmail.com");
        username.put("SPI", "automation.spi@yopmail.com.automation");
        username.put("SPA", "automation.spa@yopmail.com");
        username.put("IND", "ind.automation@yopmail.com");
        username.put("SA", "automationspi1@yopmail.com");  // need to check this user.
        username.put("SPI3", "automationspi30@yopmail.com");
        username.put("AUDITOR", "automationauditor@yopmail.com");
        username.put("PM1", "pm1.automation@yopmail.com");
        username.put("EXE1", "exe1.automation@yopmail.com");
        username.put("PO1", "automationpo1@yopmail.com");
        username.put("FO1", "fo1.automation@yopmail.com");
        username.put("FD1", "automationfd1@yopmail.com");
        username.put("SME", "sme@yopmail.com.automation");
        username.put("SPI4", "signingauthority.sa@yopmail.com.automation");
        username.put("SARAH PM", "sarah.pm@ggp.test9.automation");

        username.put("SIMON PM", "simon@ggp.test8.automation");
        username.put("ALEX FO", "alex_fo@ggp.test7.automation");
        username.put("CATHY PM", "cathy_pm@ggp.test7.automation");
        username.put("OSCAR PM", "oscar_pm@ggp.test7.automation");
        username.put("Bill PM", "bill_pm@ggp.test7.automation");

        username.put("GRANTEE PM", "autopmgrantee@yopmail.com");
        username.put("GRANTEE PM1", "autopm1grantee@yopmail.com");
        username.put("GRANTEE FO", "automationfograntee@yopmail.com");
        username.put("GRANTEE FD", "autofdgrantee@yopmail.com");
        username.put("GRANTEE EXE", "automationexegrantee@yopmail.com");
        username.put("GRANTEE ADMIN", "autoadmingrantee@yopmail.com");
        username.put("GRANTEE PO", "autopograntee@yopmail.com");

        if (userLevel.toUpperCase() != null) {
            return username.get(userLevel.toUpperCase());
        } else {
            return username.get("ADMIN");
        }
    }

    private String getTest8EnvironmentUser(String userLevel) {
        Map<String, String> username = new HashMap<>();
        username.put("ADMIN", "govgrantsautomation@yopmail.com");
        username.put("ADMIN1", "manu.admin@ggp.test8");
        username.put("EXE", "test@gmaildemo.com.atm");
        username.put("PM", "donald_pm@ggp.test7.atm");
        username.put("FO", "auto.fm@auto.com.atm");
        username.put("SPA", "automation.spa@yopmail.com");
        username.put("IND", "ind1.automation@yopmail.com");
        username.put("SA", "automationspi1@yopmail.com");
        username.put("SPI3", "automationspi30@yopmail.com");
        username.put("AUDITOR", "test8.automationauditor@yopmail.com");
        username.put("PO", "test8.automationpo@yopmail.com");
        username.put("FD", "test8.automationfd@yopmail.com");
        username.put("PM1", "test8.pm1.automation@yopmail.com");
        username.put("EXE1", "test8.exe1.automation@yopmail.com");
        username.put("FO1", "test8.fo1.automation@yopmail.com");
        username.put("PO1", "test8.automationpo1@yopmail.com");
        username.put("FD1", "test8.automationfd1@yopmail.com");
        username.put("SME", "sme1@yopmail.com");
        username.put("SARAH PM", "sarah.pm@ggp.test8");


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
