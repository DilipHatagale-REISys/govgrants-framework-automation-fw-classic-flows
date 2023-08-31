package com.ggproduct.automation.webservices;

import com.helperPackage.handlers.govgrants;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.helperPackage.register.I;
import io.restassured.response.Response;
import org.apache.commons.lang.StringUtils;

import java.util.List;
import java.util.stream.Collectors;

public class GrantorWebServices extends ProjectWebServices {
    private String jobID;
    private String status;
    GrantorPayloads projectApis = new GrantorPayloads();

    /*handles to get the record id of a record */
    public void getRecordIdFromResponse(String objectType, String recordName, String objectApiName) {
        String response = "";
        response = (automationBatchExecuteApi(objectType, recordName, objectApiName.split(","))).asString().replace("\"", "");
        if (!response.equalsIgnoreCase("Completed")) {
            govgrants.perform().pageDetails().idOfRecord = response;
            I.amPerforming().propertiesFileOperationsTo().saveValue("Record Id", govgrants.perform().pageDetails().idOfRecord);
        }
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
            I.amPerforming().waitFor().makeThreadSleep(7000);
        }

        if (status.equalsIgnoreCase("Completed") && objectName.length == 1 && !objectApiName.equalsIgnoreCase("closeout"))  {
            return getRecordId(recordName, "Title__c", objectApiName);
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

    public static void deleteAttachmentsForRecord(String recordName, String objectAPIName) {
        String recordId = getIdOf(objectAPIName, recordName);
        JsonObject parent = new JsonObject();
        JsonArray array = new JsonArray();
        array.add(recordId);
        parent.add("recordid", array);
        String finalEndPoint = endPoint + "/services/apexrest/deleteFiles";
        Response response = I.amPerforming().restHttp().postCall(parent, null, finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        assertStatusCode(response);
    }

    public void deleteRecordInHooks() {
        List<String> recordNameList = I.amPerforming().propertiesFileOperationsTo().getAllSavedKeys().stream()
                .filter(Keys -> Keys.startsWith("AUTOMATION RUNTIME")).collect(Collectors.toList());

        for (String record : recordNameList) {
            if (StringUtils.containsIgnoreCase(record, "focus area")) {
                deleteFocusArea(I.amPerforming().propertiesFileOperationsTo().getValue(record));
            }
            if (StringUtils.containsIgnoreCase(record, "funding source")) {
                deleteFundingSource(I.amPerforming().propertiesFileOperationsTo().getValue(record));
            }
            if (StringUtils.containsIgnoreCase(record, "kpi")) {
                deleteKPI(I.amPerforming().propertiesFileOperationsTo().getValue(record));
            }
            if (StringUtils.containsIgnoreCase(record, "program")) {
                deleteProgram(I.amPerforming().propertiesFileOperationsTo().getValue(record));
            }
            if (StringUtils.containsIgnoreCase(record, "strategic plan")) {
                deleteStrategicPlan(I.amPerforming().propertiesFileOperationsTo().getValue(record));
            }
            if (StringUtils.containsIgnoreCase(record, "site visit")) {
                deleteSiteVisit(I.amPerforming().propertiesFileOperationsTo().getValue(record));
            }
            if (StringUtils.containsIgnoreCase(record, "desk")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Desk Review");
            }
            if (StringUtils.containsIgnoreCase(record, "amendment")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Amendment Request");
            }
            if (StringUtils.containsIgnoreCase(record, "payment")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Payment Request");
            }
            if (StringUtils.containsIgnoreCase(record, "risk")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "ORGANIZATION RISKASSESSMENT");
            }
            if (StringUtils.containsIgnoreCase(record, "closeout")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Closeout");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Payment Request");
            }
            if (StringUtils.containsIgnoreCase(record, "contact")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Contact");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "DUNS");
            }
            if (StringUtils.containsIgnoreCase(record, "application")) {
                try {
                    deleteAttachmentsForRecord(I.amPerforming().propertiesFileOperationsTo().getValue(record), "PreApplication__c");
                } catch (AssertionError error) {
                }
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "APPLICATION REVIEWS");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "PreApplication");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Application");
            }
            if (StringUtils.containsIgnoreCase(record, "Organization")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "USER REGISTRATION");
            }
        }

        if (recordNameList.stream().anyMatch(s -> s.toLowerCase().contains("award"))) {
            for (String record : recordNameList) {
                if (StringUtils.containsIgnoreCase(record, "award")) {
                    deleteAward(I.amPerforming().propertiesFileOperationsTo().getValue(record));
                }
            }
        }

        if (recordNameList.stream().anyMatch(s -> s.toLowerCase().contains("announcement"))) {
            for (String record : recordNameList) {
                if (StringUtils.containsIgnoreCase(record, "announcement")) {
                    deleteAnnouncement(I.amPerforming().propertiesFileOperationsTo().getValue(record));
                }
            }
        }

        if (recordNameList.stream().anyMatch(s -> s.toLowerCase().contains("fdm"))) {
            deleteFDM(recordNameList);
        }
    }

    public void initateApplicationReviewOnAnnouncement(String applicationTitle, String announcementTitle, String filter) {
        initiateApplicationReview(projectApis.applicationReview(applicationTitle, announcementTitle, filter));
    }


    /**
     * @param applicationName name of application
     */
    public void approveDFM(String applicationName) {
        approveDFMPostCall(projectApis.defaultRequestPayroleForApprovedDFM(), applicationName);
    }

    public void reviewedApplication(String applicationName) {
        reviewApplicationPostCall(projectApis.defaultPayloadReviewApplication(), applicationName);
    }

    /**
     * @param announcementName name of announcement on which application is created with same name as announcement
     */
    public void createAwardFromFDM(String announcementName) {
        createAwardFromFDMPostCall(projectApis.defaultPayloadCreateAwardFromFDM(announcementName));
    }

    public void createAwardFromFDM(String announcementName, String... Type ) {
        if(Type.length>0)
            createAwardFromFDMPostCall(projectApis.PayloadCreateAwardFromFDM(announcementName,Type[0]));
        else
            createAwardFromFDMPostCall(projectApis.PayloadCreateAwardFromFDM(announcementName));
    }


    /**
     * @param applicationName name of application from which we have to create activate FDM
     * @see GrantorPayloads#defaultPayloadActivateAwardFromFDM()
     */
    public void activateFMD(String applicationName) {
        activateAwardFromFDMPostCall(projectApis.defaultPayloadActivateAwardFromFDM(), applicationName);
    }

    /**
     * @param annType type of announcement such as Formula, Competitive, Directed
     * @param annName name of announcement
     * @param filter  if we want to change anything from default payload then we can create
     *                our own filter in publishAnnPayload(String, String) method
     * @see GrantorPayloads#publishAnnPayload(String, String, String)
     */
    public void publishAnnouncment(String annType, String annName, String filter) {
        publishAnnouncementPostCall(projectApis.publishAnnPayload(annType, annName, filter));
    }

    /**
     * @param grantName name of award
     * @param filter    if we want to change anything from default payload then we can create
     *                  our own filter in payloadForCreateStandaloneAward(String, String) method
     * @see GrantorPayloads# payloadForCreateStandaloneAward(String, String, String,String)
     */
    public void activateSubaward(String grantName, String filter, String... Type) {
        if(Type.length>0)
            activateSubawardGetCall(projectApis.payloadForCreateStandaloneAward(grantName, filter, Type[0]), grantName);
        else
            activateSubawardGetCall(projectApis.payloadForCreateStandaloneAward(grantName, filter), grantName);
    }

    private void activateSubawardGetCall(JsonObject jsonObject, String awardName) {
        String createAwardEndPoint = endPoint + "/services/apexrest/activateAwardFromGrantCopy/v1";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                createAwardEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
        I.amPerforming().waitFor().makeThreadSleep(60000);
        String activateAwardEndPoint = endPoint + "/services/apexrest/activateAwardFromGrant/v2?AwardId=" + getIdOf("Award__c", awardName);
        Response response1 = I.amPerforming().restHttp().getCall(
                activateAwardEndPoint, "Authorization", "Bearer " + tokenString);
        response1.prettyPrint();
        assertStatusCode(response1);
    }

    private void publishAnnouncementPostCall(JsonObject jsonObject) {
        String finalEndPoint = endPoint + "/services/apexrest/PublishAnnouncementCopy";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    private void initiateApplicationReview(JsonObject jsonObject) {
        String finalEndPoint = endPoint + "/services/apexrest/CreateFDMCopy/v1";
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        assertStatusCode(response);
    }

    private void createAwardFromFDMPostCall(JsonObject jsonObject) {
        String finalEndPoint = endPoint + "/services/apexrest/activateAwardFromFDM/v1.1";
        I.amPerforming().waitFor().makeThreadSleep(5000);
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    private void reviewApplicationPostCall(JsonObject jsonObject, String applicationName) {
        String finalEndPoint = endPoint + "/services/apexrest/CreateFDM/v2?AppId=" + getIdOf("Application__c", applicationName);
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        assertStatusCode(response);
    }

    private void activateAwardFromFDMPostCall(JsonObject jsonObject, String applicationName) {
        String finalEndPoint = endPoint + "/services/apexrest/activateAwardFromFDM/v2?GrantId=" + getIdOf("Grant__c", applicationName);
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }

    private void approveDFMPostCall(JsonObject jsonObject, String applicationName) {
        String finalEndPoint = endPoint + "/services/apexrest/CreateFDM/v2?AppId=" + getIdOf("Application__c", applicationName);
        Response response = I.amPerforming().restHttp().postCall(jsonObject, null,
                finalEndPoint, "Authorization", "Bearer " + tokenString, null);
        assertStatusCode(response);
    }

    private void deleteAward(String recordName) {
        deletionApi(recordName, "Progress Report");
        deletionApi(recordName, "Progress Report");
        deletionApi(recordName, "Amendment Request");
        deletionApi(recordName, "Payment Request");
        deletionApi(recordName, "Award");
        deletionApi(recordName, "Grant");
    }

    private void deleteFDM(List<String> recordNames) {

        for (String record : recordNames) {
            if (StringUtils.containsIgnoreCase(record, "desk review")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Desk Review");
            }
        }

        for (String record : recordNames) {
            if (StringUtils.containsIgnoreCase(record, "site visit")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Site Visit");
            }
        }

        for (String record : recordNames) {
            if (StringUtils.containsIgnoreCase(record, "application")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "APPLICATION REVIEWS");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "PreApplication");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Application");
            }
        }

        for (String record : recordNames) {
            if (StringUtils.containsIgnoreCase(record, "announcement")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Announcement");
            }
        }

        for (String record : recordNames) {
            if (StringUtils.containsIgnoreCase(record, "fdm")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Progress Report");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "FDM");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "subaward");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Award");
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Grant");
            }
        }
    }

    public void deleteAnnouncement(String recordName) {
        deletionApi(recordName, "APPLICATION REVIEWS");
        deletionApi(recordName, "Application");
        deletionApi(recordName, "PreApplication");
        deletionApi(recordName, "Announcement");
    }

    private void deleteFocusArea(String recordName) {
        deletionApi(recordName, "Focus Area");
    }

    private void deleteFundingSource(String recordName) {
        deletionApi(recordName, "Funding Source");
    }

    private void deleteKPI(String recordName) {
        deletionApi(recordName, "KPI");
    }

    private void deleteProgram(String recordName) {
        deletionApi(recordName, "Program");
    }

    private void deleteStrategicPlan(String recordName) {
        deletionApi(recordName, "Strategic Plan");
    }

    private void deleteSiteVisit(String recordName) {
        deletionApi(recordName, "Site Visit");
    }

    private void deleteOrganization(String recordName) {
        deletionApi(recordName, "USER REGISTRATION");
    }
}
