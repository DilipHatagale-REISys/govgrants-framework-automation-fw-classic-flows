package com.helperPackage.authentication;

import com.ggproduct.automation.usersUrl.UsersAndURL;

public final class SalesforceJWTUserResolver {

    private SalesforceJWTUserResolver() {
        // Utility class
    }

    public static String resolveUsername(String userType) {

        if (userType == null || userType.trim().isEmpty()) {
            throw new IllegalArgumentException(
                    "Salesforce JWT user type cannot be null or empty."
            );
        }

        String username = UsersAndURL.resolveSalesforceUsername(userType);

        if (username == null || username.trim().isEmpty()) {
            throw new IllegalArgumentException(
                    "No Salesforce username configured for user type: "
                            + userType
            );
        }

        System.out.println("[JWT User Resolver] Requested user type: " + userType);
        System.out.println("[JWT User Resolver] Salesforce username: " + username);

        return username;
    }
}