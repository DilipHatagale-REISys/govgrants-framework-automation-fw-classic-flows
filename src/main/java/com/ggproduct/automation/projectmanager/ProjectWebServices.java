package com.ggproduct.automation.projectmanager;

import com.automation.rei.controller.EnvironmentFetcher;
import com.automation.rei.webservices.RestfulWebServices;
import com.jayway.restassured.response.Response;

public class ProjectWebServices {
    RestfulWebServices apiCall = new RestfulWebServices();
    private static String endPoint;
 
    /**
     * Handle all Api calls for deletion based on pathway
     * 
     * @param pathway
     */

    public void createEndPoint() {
        this.endPoint = EnvironmentFetcher.environment;
    }

    private void assertStatusCode(Response response) {
        response.then().statusCode(200);
    }
}
