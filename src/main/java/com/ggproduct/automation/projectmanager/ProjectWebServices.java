package com.ggproduct.automation.projectmanager;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import com.jayway.restassured.response.Response;
import com.mongodb.util.JSON;

import eyethink.automation.bots.controller.EnvironmentFetcher;
import eyethink.automation.bots.webservices.RestfulWebServices;
import eyethink.automation.bots.controller.Controller;
import eyethink.automation.bots.controller.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;

public class ProjectWebServices {
    private RestfulWebServices apiCall = new RestfulWebServices();
    private static String endPoint = EnvironmentFetcher.environment;
    private String defaultEndPointGetToken = "/services/oauth2/token?grant_type=password&client_id=3MVG9ic.6IFhNpPq_k9vYkenIh973gbcI2GBHkEu4.ukW4PZidcRmrQ6ma0lg.fdcZRtLB4IL1HgKKB87Y5Ab&client_secret=6105591870206036129&username=manu.sa@ggp.test7&password=GoProduct@123";
    private static String tokenString;
    private String jobID;
    private String status;
    public CoreHandlers reiDriver;
    public Controller controller;
    public GovGrantsHandler govgrants;

    public ProjectWebServices() {
    }

    public ProjectWebServices(Controller controller, CoreHandlers reiDriver, GovGrantsHandler govgrants) {
        this.controller = controller;
        this.reiDriver = reiDriver;
        this.govgrants = govgrants;
    }

    /**
     * get token for authentication of Delete request
     */
    private void getAuthToken() {
        setDefaultEndPointGetToken(defaultEndPointGetToken);
        Response response = apiCall.postCall(null, null, endPoint + getDefaultEndPointGetToken(), null, null, null);
        tokenString = response.body().jsonPath().getString("access_token");
    }

    private void assertStatusCode(Response response) {
        response.then().statusCode(200);
        System.out.println("response code is " + response.getStatusCode());
        response.then().statusCode(200);
    }

    /**
     * calls the api to delete test data
     *
     * @param objectType - the object for which test data should be deleted.
     *                   Currently accepts Program, Announcement, Qualified
     *                   Announcement, Application, Award, Grant, Site Visit, Desk
     *                   Review, Payment Request, Progress Report, Closeout
     * @param recordName - the name or title of the record
     */
    public void automationDeletionApi(String recordName, String objectType) {
        getAuthToken();
        try {
        	recordName = URLEncoder.encode(recordName, StandardCharsets.UTF_8.toString());
        	objectType = URLEncoder.encode(objectType, StandardCharsets.UTF_8.toString());
        } catch (Exception e) {
        }
        
        
        String finalEndPoint = endPoint + "/services/apexrest/productAutomationDeletionApi?objectType=" + objectType
                + "&recordName=" + recordName;
        Response response = apiCall.DeleteCall(null, null, finalEndPoint, "Authorization", "Bearer " + tokenString,
                null);
        System.out.println(finalEndPoint);
        response.prettyPrint();
        assertStatusCode(response);
    }

    private String getDefaultEndPointGetToken() {
        return defaultEndPointGetToken;
    }

    private void setDefaultEndPointGetToken(String defaultEndPointGetToken) {
        if (System.getProperty("env") != null && System.getProperty("env").equalsIgnoreCase("demo")) {
            this.defaultEndPointGetToken = "/services/oauth2/token?grant_type=password&client_id=3MVG9AzPSkglhtpvenc1ubvIHNq.47G6r14CrPJYDMHpiIQqmNt84jq0.7dv3pQHq6Q5ijx1LbVhtm326_pxc&client_secret=2A8D181502C168F519E5A93B1AF611FE65FAB1862CBF37A7D7CC8857F3C55871&username=manu.sa@ggp.test7.demo7&password=GoProduct@123";
        } else if (System.getProperty("env") != null && System.getProperty("env").equalsIgnoreCase("auto")) {
            this.defaultEndPointGetToken = "/services/oauth2/token?grant_type=password&client_id=3MVG9dZJodJWITSuFoeXeOau_jPysAF1tDTnpScZyZwXUGhS_ZudVpjPfvLFrO78TVtOgK6flv6R5a4OV8QnR&client_secret=1408645120361878326&username=mayuresh.g@ggp.test7&password=Salesforce12";
        }
    }

    /*
     * calls the api to get the Record Id.
     * @param recordName - the name or title of the record
     * @param fieldName - the name of the field that stores the title like e.g. Title__c.
     * @param objectType - the object API name of the record from which you want to get the EGMS ID
     */
    public Response automateGetApi(String recordName, String fieldName, String objectType) {
        getAuthToken();
        String finalEndPoint = endPoint + "/services/apexrest/productAutomationGetFieldValue?objectType=" + objectType
                + "&fieldValue=" + recordName + "&fieldName=" + fieldName;
        Response response = apiCall.getCall(finalEndPoint, "Authorization", "Bearer " + tokenString);
        response.prettyPrint();
        assertStatusCode(response);
        return response;
    }

    /*
     * calls the api which will create post award records currently accepts PaymentRequest, ProgressReport, Closeout.
     *  @param objectType -: This is the batch job type. Currently supports 3 different values – PaymentRequest, ProgressReport, Closeout.
     *  @param recordName -: The name of the award (for payment/progress) or grant (for closeout) for which you want to run the batch job.
     *  @param objectApiName -: This is the object api name.
     */
    public Response automationBatchExecuteApi(String objectType, String recordName, String objectApiName) {
        int timer = 0;
        String finalEndPoint = "";
        Response response = null;
        getAuthToken();

        finalEndPoint = endPoint + "/services/apexrest/productAutomationRunBatchJob?type=" + objectType
                + "&recordName=" + recordName;

        response = apiCall.getCall(finalEndPoint, "Authorization", "Bearer " + tokenString);
        assertStatusCode(response);

        jobID = response.asString().replace("\"", "");
        finalEndPoint = endPoint + "/services/apexrest/productAutomationGetBatchJobStatus?batchId=" + jobID;
        reiDriver.WaitFor().makeThreadSleep(20);

        while (timer < 120) {
            response = apiCall.getCall(finalEndPoint, "Authorization", "Bearer " + tokenString);
            assertStatusCode(response);
            status = response.asString().replace("\"", "");
            if (status.equalsIgnoreCase("Completed") || status.equalsIgnoreCase("Aborted")) {
                System.out.println("Batch Status is :" + status);
                break;
            } else {
                reiDriver.WaitFor().makeThreadSleep(20);
                timer = timer + 20;
            }
        }

        if (status.equalsIgnoreCase("Completed")) {
            return automateGetApi(recordName, "Title__c", objectApiName);
        } else {
            return null;
        }
    }
}