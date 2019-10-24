package com.ggproduct.automation.projectmanager;

import eyethink.automation.bots.Register.EnvironmentFetcher;
import eyethink.automation.bots.Register.EyeThink;
import io.restassured.response.Response;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class ProjectWebServices {
    private static String endPoint = EnvironmentFetcher.getEnvironmentUrl();
    private String defaultEndPointGetToken = "/services/oauth2/token?grant_type=password&client_id=3MVG9ic.6IFhNpPq_k9vYkenIh973gbcI2GBHkEu4.ukW4PZidcRmrQ6ma0lg.fdcZRtLB4IL1HgKKB87Y5Ab&client_secret=6105591870206036129&username=manu.sa@ggp.test7&password=GoProduct@123";
    private static String tokenString;
    private String jobID;
    private String status;

    /**
     * get token for authentication of Delete request
     */
    private void getAuthToken() {
        setDefaultEndPointGetToken();
        Response response = EyeThink.core().apiCall().postCall(null, null, endPoint + getDefaultEndPointGetToken(), null, null, null);
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
     * @param objectType - the object for which test data should be deleted. Currently
     *                   accepts Program, Announcement, Qualified Announcement,
     *                   Application, Award, Grant, Site Visit, Desk Review, Payment
     *                   Request, Progress Report, Closeout
     * @param recordName - the name or title of the record
     */
    public void deletionApi(String recordName, String objectType) {
        System.out.print("Making API call... ");
        getAuthToken();
        try {
            recordName = URLEncoder.encode(recordName, StandardCharsets.UTF_8.toString());
            objectType = URLEncoder.encode(objectType, StandardCharsets.UTF_8.toString());
        } catch (Exception e) {
        }
        String finalEndPoint = endPoint + "/services/apexrest/productAutomationDeletionApi?objectType=" + objectType
                + "&recordName=" + recordName;
        Response response = EyeThink.core().apiCall().DeleteCall(null, null, finalEndPoint, "Authorization", "Bearer " + tokenString,
                null);
        System.out.println(finalEndPoint);
        response.prettyPrint();
        System.out.println("Completed. ");
        assertStatusCode(response);
    }

    private String getDefaultEndPointGetToken() {
        return defaultEndPointGetToken;
    }

    private void setDefaultEndPointGetToken() throws RuntimeException{
        String env = "";
        if (System.getProperty("env") != null)
            env = System.getProperty("env").toUpperCase();

        switch (env) {
            case "QA":
                this.defaultEndPointGetToken = "/services/oauth2/token?grant_type=password&client_id=3MVG9dZJodJWITSuFoeXeOau_jPysAF1tDTnpScZyZwXUGhS_ZudVpjPfvLFrO78TVtOgK6flv6R5a4OV8QnR&client_secret=1408645120361878326&username=mayuresh.g@ggp.test7&password=Salesforce_2019";
                break;
            case "AUTO":
                this.defaultEndPointGetToken = "/services/oauth2/token?grant_type=password&client_id=3MVG9zJJ_hX_0bb8yUWurIZ11JwpQ3xRQa3fdQZvVgPIaFuhkm9u3rePUeB9c10k_Cf3gxuAyJ3nl9Q7kZpst&client_secret=8EFE7BB41D889DF5731E00526750FF8C98F62FE903703DEB4DE1DCAF0ACA4820&username=manu.admin@ggp.test7.atm&password=1508@Govgrants";
                break;
            case "TEST8":
                this.defaultEndPointGetToken = "/services/oauth2/token?grant_type=password&client_id=3MVG9GYWKbMgBvbyCDACA.1wChOefQowEw_0xv3au_8wn2ehlFc5MDSsyGVhxl0BZai_gKr6J4fPaaBCR8Bal&client_secret=A5BE765FC5735EF5B73E55BBA5A0F916FFCDB14977FA092644BC78134B1FD6BB&username=manu.admin@ggp.test8&password=GoProduct@1234";
                break;
            default:
                this.defaultEndPointGetToken = "/services/oauth2/token?grant_type=password&client_id=3MVG9dZJodJWITSuFoeXeOau_jPysAF1tDTnpScZyZwXUGhS_ZudVpjPfvLFrO78TVtOgK6flv6R5a4OV8QnR&client_secret=1408645120361878326&username=mayuresh.g@ggp.test7&password=Salesforce_2019";
        }
    }

    /*
     * calls the api to get the Record Id.
     *
     * @param recordName - the name or title of the record
     *
     * @param fieldName - the name of the field that stores the title like e.g.
     * Title__c.
     *
     * @param objectType - the object API name of the record from which you want to
     * get the EGMS ID
     */
    public Response automateGetApi(String recordName, String fieldName, String objectType) {
        getAuthToken();
        String finalEndPoint = endPoint + "/services/apexrest/productAutomationGetFieldValue?objectType=" + objectType
                + "&fieldValue=" + recordName + "&fieldName=" + fieldName;
        Response response = EyeThink.core().apiCall().getCall(finalEndPoint, "Authorization", "Bearer " + tokenString);
        response.prettyPrint();
        assertStatusCode(response);
        return response;
    }

    /*
     * calls the api to get the Record Id.
     *
     * @param recordName - the name or title of the record
     *
     * @param fieldName - the name of the field that stores the title like e.g.
     * Title__c.
     *
     * @param objectType - the object API name of the record from which you want to
     * get the field value
     *
     * @param outputFieldName - use it in case you want to get any field value other than EGMS ID.
     */
    public Response automateGetApi(String recordName, String fieldName, String objectType, String outputFieldName) {
        getAuthToken();
        String finalEndPoint = endPoint + "/services/apexrest/productAutomationGetFieldValue?objectType=" + objectType
                + "&fieldValue=" + recordName + "&fieldName=" + fieldName + "&outputFieldName=" + outputFieldName;
        Response response =  EyeThink.core().apiCall().getCall(finalEndPoint, "Authorization", "Bearer " + tokenString);
        response.prettyPrint();
        assertStatusCode(response);
        return response;
    }

    /*
     * calls the api which will create post award records currently accepts
     * PaymentRequest, ProgressReport, Closeout.
     *
     * @param objectType -: This is the batch job type. Currently supports 3
     * different values – PaymentRequest, ProgressReport, Closeout.
     *
     * @param recordName -: The name of the award (for payment/progress) or grant
     * (for closeout) for which you want to run the batch job.
     *
     * @param objectApiName -: This is the object api name.
     */
    public Response automationBatchExecuteApi(String objectType, String recordName, String... objectName) {
        String finalEndPoint, objectApiName = "";
        Response response = null;
        getAuthToken();
        objectApiName = objectName[0];
        finalEndPoint = endPoint + "/services/apexrest/productAutomationRunBatchJob?type=" + objectType + "&recordName="
                + recordName;

        response = EyeThink.core().apiCall().getCall(finalEndPoint, "Authorization", "Bearer " + tokenString);
        assertStatusCode(response);

        jobID = response.asString().replace("\"", "");
        finalEndPoint = endPoint + "/services/apexrest/productAutomationGetBatchJobStatus?batchId=" + jobID;
        EyeThink.core().WaitFor().makeThreadSleep(20000);
        long apiWaitTimer = (System.currentTimeMillis()) / 1000 + 120;
        while (apiWaitTimer > System.currentTimeMillis() / 1000) {
            response = EyeThink.core().apiCall().getCall(finalEndPoint, "Authorization", "Bearer " + tokenString);
            assertStatusCode(response);
            status = response.asString().replace("\"", "");
            if (status.equalsIgnoreCase("Completed") || status.equalsIgnoreCase("Aborted")) {
                System.out.println("Batch Status is :" + status);
                break;
            }
            EyeThink.core().WaitFor().makeThreadSleep(3000);
        }

        if (status.equalsIgnoreCase("Completed") && objectName.length == 1) {
            return automateGetApi(recordName, "Title__c", objectApiName);
        } else {
            return response;
        }
    }

    public Response riskAssessmentApi(String organizationName) {
        getAuthToken();
        String finalEndPoint = endPoint + "/services/apexrest/productAutomationRiskAssessmentApi?recordName=" + organizationName;
        Response response = EyeThink.core().apiCall().getCall(finalEndPoint, "Authorization", "Bearer " + tokenString);
        response.prettyPrint();
        assertStatusCode(response);
        return response;
    }
}