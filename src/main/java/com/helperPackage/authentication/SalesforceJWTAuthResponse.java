package com.helperPackage.authentication;

public final class SalesforceJWTAuthResponse {

    private final String accessToken;

    private final String instanceUrl;

    public SalesforceJWTAuthResponse(
            String accessToken,
            String instanceUrl) {

        this.accessToken =
                accessToken;

        this.instanceUrl =
                instanceUrl;
    }

    public String getAccessToken() {

        return accessToken;
    }

    public String getInstanceUrl() {

        return instanceUrl;
    }
}