package com.ggproduct.automation.projectmanager;

import com.jayway.restassured.response.Response;

import eyethink.automation.bots.controller.EnvironmentFetcher;
import eyethink.automation.bots.webservices.RestfulWebServices;

public class ProjectWebServices {
    private RestfulWebServices apiCall = new RestfulWebServices();
    private static String endPoint = EnvironmentFetcher.environment;
    private String defaultEndPointGetToken = "/services/oauth2/token?grant_type=password&client_id=3MVG9AzPSkglhtpvenc1ubvIHNq.47G6r14CrPJYDMHpiIQqmNt84jq0.7dv3pQHq6Q5ijx1LbVhtm326_pxc&client_secret=2A8D181502C168F519E5A93B1AF611FE65FAB1862CBF37A7D7CC8857F3C55871&username=manu.sa@ggp.test7.demo7&password=GoProduct@123";
    private static String tokenString;
    
    /**
     * get token for authentication of Delete request
     */
    private void getAuthToken() {
        Response response = apiCall.postCall(null,null, endPoint + defaultEndPointGetToken, null, null, null);
        tokenString = response.body().jsonPath().getString("access_token");
    }
    
    private void assertStatusCode(Response response) {
        System.out.println("response code is " +response.getStatusCode());
        response.then().statusCode(200); 
    }
    
    /**
     * calls the api to delete test data
     *
     * @param objectType - the object for which test data should be deleted.
     *                  Currently accepts Program, Announcement, Qualified Announcement, Application, Award,
     *                  Grant, Site Visit, Desk Review, Payment Request, Progress Report, Closeout
     * @param recordName - the name or title of the record            
     */
    public void automationDeletionApi(String recordName, String objectType) {
        getAuthToken();
        String finalEndPoint = endPoint + "/services/apexrest/productAutomationDeletionApi?objectType=" + objectType + "&recordName=" +recordName;
        Response response = apiCall.DeleteCall(null, null, finalEndPoint,
                "Authorization", "Bearer " + tokenString, null);
        response.prettyPrint();
        assertStatusCode(response);
    }
}
