package com.helperPackage.authentication;


import com.ggproduct.automation.webservices.ProjectWebServices;
import com.helperPackage.register.EnvironmentFactory;

import java.util.Properties;

public final class SalesforceJWTConfiguration {

    /*
     * Salesforce JWT authentication is enabled
     * directly from the framework.
     */
    private static final boolean JWT_ENABLED = true;

    /*
     * External Client App Consumer Key / Client ID.
     *
     * IMPORTANT:
     * Use Consumer Key.
     * Do NOT use Consumer Secret.
     */

    /*
     * PKCS#8 private key used for JWT signing.
     */
    private static final String PRIVATE_KEY_PATH =
            "config/salesforce-jwt-pkcs8.key";

    /*
     * Package Org is a Salesforce Sandbox.
     */
    private static final String LOGIN_URL =
            "https://test.salesforce.com";


    private SalesforceJWTConfiguration() {

        /*
         * Utility class.
         */
    }


    public static boolean isEnabled() {

        return JWT_ENABLED;
    }


    public static String getClientId() {
        try {
            Properties p = new Properties();
            if (EnvironmentFactory.getEnvironmentName().startsWith("FWCLASSIC-GRANTOR")) {
                p.load(ProjectWebServices.class.getResourceAsStream("/properties/QAEnvData.properties"));
            } else if (EnvironmentFactory.getEnvironmentName().startsWith("UAT")) {
                p.load(ProjectWebServices.class.getResourceAsStream("/properties/QAEnvData.properties"));
            } else if (EnvironmentFactory.getEnvironmentName().startsWith("FULLCOPY")) {
                p.load(ProjectWebServices.class.getResourceAsStream("/properties/QAEnvData.properties"));
            } else {
                throw new IllegalStateException(
                        "Unsupported Environment : "
                                + EnvironmentFactory.getEnvironmentName());
            }
            String clientId = p.getProperty("JWT_CLIENT_ID");
            requireValue("Salesforce JWT Client ID", clientId);
            return clientId;
        } catch (Exception e) {
            throw new RuntimeException("Unable to load Salesforce JWT Client ID.", e);
        }
    }


    public static String getPrivateKeyPath() {

        return PRIVATE_KEY_PATH;
    }


    public static String getLoginUrl() {

        return LOGIN_URL;
    }


    public static void validate() {

        if (!JWT_ENABLED) {

            return;
        }

        requireValue(
                "Salesforce JWT Client ID",
                getClientId()
        );

        requireValue(
                "Salesforce JWT Private Key Path",
                PRIVATE_KEY_PATH
        );

        requireValue(
                "Salesforce JWT Login URL",
                LOGIN_URL
        );

        System.out.println(
                "[JWT Configuration] Configuration validation successful."
        );
    }


    private static void requireValue(
            String name,
            String value) {

        if (value == null
                || value.trim().isEmpty()) {

            throw new IllegalStateException(
                    name + " is not configured."
            );
        }
    }
}