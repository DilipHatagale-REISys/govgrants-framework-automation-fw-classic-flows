package com.ggproduct.automation.projectmanager;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.testingblaze.register.EnvironmentFactory;
import com.testingblaze.register.I;
import io.restassured.response.Response;
import org.apache.commons.lang.StringUtils;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ProjectWebServices {
    private static String endPoint = EnvironmentFactory.getEnvironmentUrl();
    private static String defaultEndPointGetToken = "/services/oauth2/token" +
            "?grant_type=password" +
            "&client_id=3MVG9ic.6IFhNpPq_k9vYkenIh973gbcI2GBHkEu4.ukW4PZidcRmrQ6ma0lg.fdcZRtLB4IL1HgKKB87Y5Ab" +
            "&client_secret=6105591870206036129" +
            "&username=manu.sa@ggp.test7" +
            "&password=GoProduct@123";
    private static String tokenString;
    private String jobID;
    private String status;

    static {
        getAuthToken();
    }

    /**
     * get token for authentication of Delete request
     */
    public static void getAuthToken() {
        setDefaultEndPointGetToken();
        Response response = I.amPerforming().restHttp().postCall(null, null, endPoint + getDefaultEndPointGetToken(), null, null, null);
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

    private static String getDefaultEndPointGetToken() {
        return defaultEndPointGetToken;
    }

    private static void setDefaultEndPointGetToken() throws RuntimeException{
        String env = "";
        if (System.getProperty("env") != null)
            env = System.getProperty("env").toUpperCase();

        switch (env) {
            case "QA":
                defaultEndPointGetToken = "/services/oauth2/token?grant_type=password&client_id=3MVG9dZJodJWITSuFoeXeOau_jPysAF1tDTnpScZyZwXUGhS_ZudVpjPfvLFrO78TVtOgK6flv6R5a4OV8QnR&client_secret=1408645120361878326&username=mayuresh.g@ggp.test7&password=Salesforce_2019";
                break;
            case "AUTO":
                defaultEndPointGetToken = "/services/oauth2/token?grant_type=password&client_id=3MVG92DxHaawSd0luAabE5ir8xlXoKuHsm5noVyqnHFUOo829AX1MfWuFpJhCDn0__e7EWt_DixBbuY2yy1.H&client_secret=BAAC6A7374660FC52DFAF43304D80F6E4EF17DA8C3F9503F6E3380EEEEF20784&username=manu.admin@ggp.test8.automation&password=GoProduct@12345";
                break;
            case "TEST8":
                defaultEndPointGetToken = "/services/oauth2/token?grant_type=password&client_id=3MVG90D5vR7Utjboc8b3nxgWl_TIAtGV_TgV2OQsaOZNGnhetFSjnMGSvL67KfRN99.Z0ne32YZHHlzdyCb_a&client_secret=F1F4C218C1E6AB1ECA2DD46CDCFB204D66FCEFA2DB939003C5C4B207DAF0A736&username=manu.admin@ggp.test8.automation&password=GoProduct@1234";
                break;
            default:
                defaultEndPointGetToken = "/services/oauth2/token?grant_type=password&client_id=3MVG9dZJodJWITSuFoeXeOau_jPysAF1tDTnpScZyZwXUGhS_ZudVpjPfvLFrO78TVtOgK6flv6R5a4OV8QnR&client_secret=1408645120361878326&username=mayuresh.g@ggp.test7&password=Salesforce_2019";
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
    public Response automateGetApi(String recordName, String fieldName, String objectType, String outputFieldName) {
        String finalEndPoint = endPoint + "/services/apexrest/productAutomationGetFieldValue?objectType=" + objectType
                + "&fieldValue=" + recordName + "&fieldName=" + fieldName + "&outputFieldName=" + outputFieldName;
        Response response =  I.amPerforming().restHttp().getCall(finalEndPoint, "Authorization", "Bearer " + tokenString);
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
        objectApiName = objectName[0];
        finalEndPoint = endPoint + "/services/apexrest/productAutomationRunBatchJob?type=" + objectType + "&recordName="
                + recordName;

        response = I.amPerforming().restHttp().getCall(finalEndPoint, "Authorization", "Bearer " + tokenString);
        assertStatusCode(response);

        jobID = response.asString().replace("\"", "");
        finalEndPoint = endPoint + "/services/apexrest/productAutomationGetBatchJobStatus?batchId=" + jobID;
        I.amPerforming().waitFor().makeThreadSleep(20000);
        long apiWaitTimer = (System.currentTimeMillis()) / 1000 + 120;
        while (apiWaitTimer > System.currentTimeMillis() / 1000) {
            response = I.amPerforming().restHttp().getCall(finalEndPoint, "Authorization", "Bearer " + tokenString);
            assertStatusCode(response);
            status = response.asString().replace("\"", "");
            if (status.equalsIgnoreCase("Completed") || status.equalsIgnoreCase("Aborted")) {
                System.out.println("Batch Status is :" + status);
                break;
            }
            I.amPerforming().waitFor().makeThreadSleep(3000);
        }

        if (status.equalsIgnoreCase("Completed") && objectName.length == 1) {
            return automateGetApi(recordName, "Title__c", objectApiName);
        } else {
            return response;
        }
    }

    public Response riskAssessmentApi(String organizationName) {
        String finalEndPoint = endPoint + "/services/apexrest/productAutomationRiskAssessmentApi?recordName=" + organizationName;
        Response response = I.amPerforming().restHttp().getCall(finalEndPoint, "Authorization", "Bearer " + tokenString);
        response.prettyPrint();
        assertStatusCode(response);
        return response;
    }

    public String getIdOf(String objectName, String findMyId){
        String finalEndPoint= endPoint+"/services/apexrest/getRecordIds/v1";
        JsonObject parent = new JsonObject();
        JsonArray array = new JsonArray();
        array.add(findMyId);
        parent.add(objectName,array);

        Response response = I.amPerforming().restHttp().postCall(parent,null,finalEndPoint,"Authorization", "Bearer " + tokenString,null);
        assertStatusCode(response);
        Map<String, String> map = response.jsonPath().getMap("$");
        return map.get(findMyId);
    }

    public String getRecordTypeId(String objectName, String findMyId){
        String endpoint= endPoint+"/services/apexrest/getRecordTypeIds/v1";
        JsonObject parent = new JsonObject();
        parent.addProperty(objectName,findMyId);

        Response response = I.amPerforming().restHttp().postCall(parent,null,endpoint,"Authorization", "Bearer " + tokenString,null);
        assertStatusCode(response);
        Map<String, String> map = response.jsonPath().getMap("$");
        return map.get(objectName);
    }

    public void initiateApplicationReview(JsonObject jsonObject){
        String finalEndPoint = endPoint +"/services/apexrest/CreateFDM/v1";
        Response response = I.amPerforming().restHttp().postCall(jsonObject,null,
                finalEndPoint, "Authorization", "Bearer " + tokenString,null);
        assertStatusCode(response);
    }

    public Map<String, String> getMultipleIds(JsonObject jsonObject){
        String finalEndPoint= endPoint+"/services/apexrest/getRecordIds/v1";
        Response response = I.amPerforming().restHttp().postCall(jsonObject,null,finalEndPoint,"Authorization", "Bearer " + tokenString,null);
        assertStatusCode(response);
        return response.jsonPath().getMap("$");
    }

    public void approveDFMPostCall(JsonObject jsonObject, String applicationName) {
        String finalEndPoint = endPoint +"/services/apexrest/CreateFDM/v2?AppId="+getIdOf("Application__c",applicationName);
        Response response = I.amPerforming().restHttp().postCall(jsonObject,null,
                finalEndPoint, "Authorization", "Bearer " + tokenString,null);
        assertStatusCode(response);
    }

    public void createAwardFromFDMPostCall(JsonObject jsonObject){
        String finalEndPoint = endPoint +"/services/apexrest/activateAwardFromFDM/v1";
        I.amPerforming().waitFor().makeThreadSleep(5000);
        Response response = I.amPerforming().restHttp().postCall(jsonObject,null,
                finalEndPoint, "Authorization", "Bearer " + tokenString,null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    public void activateAwardFromFDMPostCall(JsonObject jsonObject,String applicationName){
        String finalEndPoint = endPoint +"/services/apexrest/activateAwardFromFDM/v2?GrantId="+getIdOf("Grant__c",applicationName);
        Response response = I.amPerforming().restHttp().postCall(jsonObject,null,
                finalEndPoint, "Authorization", "Bearer " + tokenString,null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    public void publishAnnouncementPostCall(JsonObject jsonObject) {
        String finalEndPoint = endPoint + "/services/apexrest/PublishAnnouncement";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    public void activateSubawardGetCall(JsonObject jsonObject,String awardName){
        String createAwardEndPoint = endPoint +"/services/apexrest/activateAwardFromGrant/v1";
        Response response = I.amPerforming().restHttp().postCall(jsonObject,null,
                createAwardEndPoint, "Authorization", "Bearer " + tokenString,null);
        response.prettyPrint();
        assertStatusCode(response);

        String activateAwardEndPoint = endPoint +"/services/apexrest/activateAwardFromGrant/v2?AwardId="+getIdOf("Award__c",awardName);
        Response response1 = I.amPerforming().restHttp().getCall(
                activateAwardEndPoint, "Authorization", "Bearer " + tokenString);
        response1.prettyPrint();
        assertStatusCode(response1);
    }

    public void deleteAward(String recordName){
        deletionApi(recordName,"Progress Report");
        deletionApi(recordName,"Progress Report");
        deletionApi(recordName,"Amendment Request");
        deletionApi(recordName,"Payment Request");
        deletionApi(recordName,"Award");
        deletionApi(recordName,"Grant");
    }

    public void deleteFDM(List<String> recordNames){

        for (String record : recordNames){
            if(StringUtils.containsIgnoreCase(record,"desk review")){
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"Desk Review");
            }
        }

        for (String record : recordNames){
            if(StringUtils.containsIgnoreCase(record,"site visit")){
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"Site Visit");
            }
        }

        for (String record : recordNames){
            if(StringUtils.containsIgnoreCase(record,"application")){
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"APPLICATION REVIEWS");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"PreApplication");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"Application");
            }
        }

        for (String record : recordNames){
            if(StringUtils.containsIgnoreCase(record,"announcement")){
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"Announcement");
            }
        }

        for (String record : recordNames){
            if(StringUtils.containsIgnoreCase(record,"fdm")){
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"Progress Report");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"FDM");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"subaward");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"Award");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"Grant");
            }
        }
    }

    public void deleteAnnouncement(String recordName){
        deletionApi(recordName,"APPLICATION REVIEWS");
        deletionApi(recordName,"Application");
        deletionApi(recordName,"PreApplication");
        deletionApi(recordName,"Announcement");
    }

    public void deleteFocusArea(String recordName){
        deletionApi(recordName,"Focus Area");
    }

    public void deleteFundingSource(String recordName){
        deletionApi(recordName,"Funding Source");
    }

    public void deleteKPI(String recordName){
        deletionApi(recordName,"KPI");
    }

    public void deleteProgram(String recordName){
        deletionApi(recordName,"Program");
    }

    public void deleteStrategicPlan(String recordName){
        deletionApi(recordName,"Strategic Plan");
    }

    public void deleteSiteVisit(String recordName){
        deletionApi(recordName,"Site Visit");
    }

    public void deleteRecordInHooks(){
        List<String> recordNameList = I.amPerforming().propertiesFileOperationsTo().getAllSavedKeys().stream()
                .filter(Keys -> Keys.startsWith("AUTOMATION RUNTIME")).collect(Collectors.toList());

        for (String record : recordNameList){
            if (StringUtils.containsIgnoreCase(record,"focus area")){
                deleteFocusArea(I.amPerforming().propertiesFileOperationsTo().getValue(record));
            }
            if (StringUtils.containsIgnoreCase(record,"funding source")){
                deleteFundingSource(I.amPerforming().propertiesFileOperationsTo().getValue(record));
            }
            if (StringUtils.containsIgnoreCase(record,"kpi")){
                deleteKPI(I.amPerforming().propertiesFileOperationsTo().getValue(record));
            }
            if (StringUtils.containsIgnoreCase(record,"program")){
                deleteProgram(I.amPerforming().propertiesFileOperationsTo().getValue(record));
            }
            if (StringUtils.containsIgnoreCase(record,"strategic plan")){
                deleteStrategicPlan(I.amPerforming().propertiesFileOperationsTo().getValue(record));
            }
            if (StringUtils.containsIgnoreCase(record,"site visit")){
                deleteSiteVisit(I.amPerforming().propertiesFileOperationsTo().getValue(record));
            }
            if (StringUtils.containsIgnoreCase(record,"desk")){
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"Desk Review");
            }
            if (StringUtils.containsIgnoreCase(record,"amendment")){
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"Amendment Request");
            }
            if (StringUtils.containsIgnoreCase(record,"payment")){
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"Payment Request");
            }
            if (StringUtils.containsIgnoreCase(record,"risk")){
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"ORGANIZATION RISKASSESSMENT");
            }
            if (StringUtils.containsIgnoreCase(record,"closeout")){
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"Closeout");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"Payment Request");
            }
            if (StringUtils.containsIgnoreCase(record,"contact")){
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"Contact");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"DUNS");
            }
            if (StringUtils.containsIgnoreCase(record,"application")){
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"APPLICATION REVIEWS");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"PreApplication");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record),"Application");
            }
        }

        if (recordNameList.stream().anyMatch(s -> s.toLowerCase().contains("award"))){
            for(String record : recordNameList){
                if (StringUtils.containsIgnoreCase(record,"award")){
                    deleteAward(I.amPerforming().propertiesFileOperationsTo().getValue(record));
                }
            }
        }

        if (recordNameList.stream().anyMatch(s -> s.toLowerCase().contains("announcement"))){
            for(String record : recordNameList){
                if (StringUtils.containsIgnoreCase(record,"announcement")){
                    deleteAnnouncement(I.amPerforming().propertiesFileOperationsTo().getValue(record));
                }
            }
        }

        if (recordNameList.stream().anyMatch(s -> s.toLowerCase().contains("fdm"))){
            deleteFDM(recordNameList);
        }
    }
}