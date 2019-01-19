package com.ggproduct.automation.projectmanager;

import java.io.IOException;

import com.automation.rei.controller.EnvironmentFetcher;
import com.automation.rei.controller.UsersController;
import com.automation.rei.corelib.Properties_Logs;

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
    public String getUserName(String userLevel) {
        String userName = null;
        if ((EnvironmentFetcher.environmentName != null) && (EnvironmentFetcher.environmentName.contains("QA"))) {
            userName = getQAEnvironmentUser(userLevel);
        } else if ((EnvironmentFetcher.environmentName != null) && (EnvironmentFetcher.environmentName.contains("UAT"))) {
            // To be implemented
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
        }
        return password;
    }
    
    public String getQAEnvironmentPassword(String userLevel) {
        String password;
        password = "SALESFORCE2018";
        return password;
    }

    public String getQAEnvironmentUser(String userLevel) {
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
    public  String getPortalUrl(String portalType) {
        String url = null;
        switch (portalType.toUpperCase()) {
        case "QA":
            try {
                url = new Properties_Logs().ReadPropertyFile("environment.properties", "QA");
            } catch (IOException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
            break;
        case "SUBPORTAL":
            try {
                url= new Properties_Logs().ReadPropertyFile("environment.properties",EnvironmentFetcher.environmentName+portalType);
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return url;
    }
}
