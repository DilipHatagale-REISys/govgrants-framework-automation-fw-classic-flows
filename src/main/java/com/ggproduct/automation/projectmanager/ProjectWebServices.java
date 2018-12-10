package com.ggproduct.automation.projectmanager;

import com.automation.rei.controller.EnvironmentFetcher;
import com.automation.rei.webservices.RestfulWebServices;
import com.jayway.restassured.response.Response;

public class ProjectWebServices {
    private RestfulWebServices apiCall = new RestfulWebServices();
    private static String endPoint = EnvironmentFetcher.environment;
    private String defaultEndPointGetToken = "/services/oauth2/token?grant_type=password&client_id=3MVG9ic.6IFhNpPq_k9vYkenIh973gbcI2GBHkEu4.ukW4PZidcRmrQ6ma0lg.fdcZRtLB4IL1HgKKB87Y5Ab&client_secret=6105591870206036129&username=manu.sa@ggp.test7&password=GoProduct@123";
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
    
    public void createEndPoint() {
        this.endPoint = EnvironmentFetcher.environment;
    }
    
    
}
