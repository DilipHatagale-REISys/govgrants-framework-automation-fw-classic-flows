package com.ggproduct.automation.webservices;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.helperPackage.controller.TestSetupController;
import com.helperPackage.register.EnvironmentFactory;
import com.helperPackage.register.I;
import io.restassured.response.Response;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Map;

public class ProjectWebServices {
    protected static final String endPoint = EnvironmentFactory.getEnvironmentUrl();
    protected static String tokenString;
    public static String appType;

    static {
        getAuthToken();
    }

    /**
     * get token for authentication of Delete request
     */
    protected static void getAuthToken() {
        getTokenEndPoint();
        Response response = I.amPerforming().restHttp().postCall(null, null, endPoint + getTokenEndPoint(), null, null, null);
        tokenString = response.body().jsonPath().getString("access_token");
    }

    protected static void assertStatusCode(Response response) {
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
        try {
            recordName = URLEncoder.encode(recordName, StandardCharsets.UTF_8.toString());
            objectType = URLEncoder.encode(objectType, StandardCharsets.UTF_8.toString());
        } catch (Exception e) {
        }
        String finalEndPoint = endPoint + "/services/apexrest/productAutomationDeletionApi?objectType=" + objectType
                + "&recordName=" + recordName;
        Response response = I.amPerforming().restHttp().DeleteCall(null, null, finalEndPoint, "Authorization", "Bearer " + tokenString,
                null);
        System.out.println(finalEndPoint);
        response.prettyPrint();
        System.out.println("Completed. ");
        assertStatusCode(response);
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
    public static Response getRecordId(String recordName, String fieldName, String objectType) {
        String finalEndPoint = endPoint + "/services/apexrest/productAutomationGetFieldValue?objectType=" + objectType
                + "&fieldValue=" + recordName + "&fieldName=" + fieldName;
        Response response = I.amPerforming().restHttp().getCall(finalEndPoint, "Authorization", "Bearer " + tokenString);
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
    public static Response getRecordId(String recordName, String fieldName, String objectType, String outputFieldName) {
        String finalEndPoint = endPoint + "/services/apexrest/productAutomationGetFieldValue?objectType=" + objectType
                + "&fieldValue=" + recordName + "&fieldName=" + fieldName + "&outputFieldName=" + outputFieldName;
        Response response = I.amPerforming().restHttp().getCall(finalEndPoint, "Authorization", "Bearer " + tokenString);
        response.prettyPrint();
        assertStatusCode(response);
        return response;
    }

    public static String getIdOf(String objectName, String findMyId) {
        String finalEndPoint = endPoint + "/services/apexrest/getRecordIds/v1";
        JsonObject parent = new JsonObject();
        JsonArray array = new JsonArray();
        array.add(findMyId);
        parent.add(objectName, array);

        Response response = I.amPerforming().restHttp().postCall(parent, null, finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        assertStatusCode(response);
        Map<String, String> map = response.jsonPath().getMap("$");
        return map.get(findMyId);
    }

    public static String getRecordTypeId(String objectName, String findMyId) {
        String endpoint = endPoint + "/services/apexrest/getRecordTypeIds/v1";
        JsonObject parent = new JsonObject();
        parent.addProperty(objectName, findMyId);

        Response response = I.amPerforming().restHttp().postCall(parent, null, endpoint, "Authorization", "Bearer " + tokenString, null);
        assertStatusCode(response);
        Map<String, String> map = response.jsonPath().getMap("$");
        return map.get(objectName);
    }

    public static Map<String, String> getMultipleIds(JsonObject jsonObject) {
        String finalEndPoint = endPoint + "/services/apexrest/getRecordIds/v1";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null, finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        assertStatusCode(response);
        return response.jsonPath().getMap("$");
    }

    public static void recaptchaChange(boolean shouldBeDisabled) {
        String finalEndPoint = endPoint + "/services/apexrest/recaptcha?shouldBeDisabled=" + shouldBeDisabled;
        Response response = I.amPerforming().restHttp().postCall(null, null, finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        assertStatusCode(response);
    }

    public static void changeUserActivationStatus(String usersToUpdate, boolean shouldBeActivated) {
        String finalEndPoint = endPoint + "/services/apexrest/Active/" + usersToUpdate;
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("isActive", shouldBeActivated);
        Response response = I.amPerforming().restHttp().patchCall(jsonObject, null, finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        assertStatusCode(response);
    }

    protected static String getTokenEndPoint() throws RuntimeException {
        String defaultEndPointGetToken = "";

        if (EnvironmentFactory.getEnvironmentName().contains("QA"))
            defaultEndPointGetToken = "/services/oauth2/token?grant_type=password&client_id=3MVG9EMJF5MdlzDpWtwqe6mmNu6pKIqddD1EHYQ5aFtdFg2byvYHIDmBSe9K0zEIIoEPMZOboCG7TDTSb3DQK&client_secret=E85D4B829EBD78A51880E666A9B43E933F42BE7F39155C7281D7D595A7F684C3&username=govgrantsautomation@yopmail.com.qaorg&password=Salesforce2023";
        else if (EnvironmentFactory.getEnvironmentName().contains("AUTO")) {
            if (EnvironmentFactory.getEnvironmentName().contains("GRANTEE")) {
                defaultEndPointGetToken = "/services/oauth2/token?grant_type=password&client_id=3MVG92DxHaawSd0luAabE5ir8xlXoKuHsm5noVyqnHFUOo829AX1MfWuFpJhCDn0__e7EWt_DixBbuY2yy1.H&client_secret=BAAC6A7374660FC52DFAF43304D80F6E4EF17DA8C3F9503F6E3380EEEEF20784&username=autoadmingrantee@yopmail.com&password=Salesforce2028";
            } else {
                defaultEndPointGetToken = "/services/oauth2/token?grant_type=password&client_id=3MVG9GYWKbMgBvbyCDACA.1wChOefQowEw_0xv3au_8wn2ehlFc5MDSsyGVhxl0BZai_gKr6J4fPaaBCR8Bal&client_secret=A5BE765FC5735EF5B73E55BBA5A0F916FFCDB14977FA092644BC78134B1FD6BB&username=govgrantsautomation@yopmail.com&password=Salesforce2028";
            }
        } else if (EnvironmentFactory.getEnvironmentName().contains("TEST8"))
            defaultEndPointGetToken = "/services/oauth2/token?grant_type=password&client_id=3MVG90D5vR7Utjboc8b3nxgWl_TIAtGV_TgV2OQsaOZNGnhetFSjnMGSvL67KfRN99.Z0ne32YZHHlzdyCb_a&client_secret=F1F4C218C1E6AB1ECA2DD46CDCFB204D66FCEFA2DB939003C5C4B207DAF0A736&username=govgrantsautomation@yopmail.com&password=Salesforce@2032";

        System.out.println(defaultEndPointGetToken);
        return defaultEndPointGetToken;
    }
}