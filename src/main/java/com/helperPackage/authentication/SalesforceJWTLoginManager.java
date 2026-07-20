package com.helperPackage.authentication;

import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.WebDriverWait;
import java.net.URLEncoder;
public final class SalesforceJWTLoginManager {
    private final WebDriver driver;
    public SalesforceJWTLoginManager(WebDriver driver) {
        if (driver == null) {
            throw new IllegalArgumentException("WebDriver cannot be null.");
        }
        this.driver = driver;
    }
    public void login(String userType) {
        System.out.println("[JWT Login] Starting Salesforce JWT login...");
        System.out.println("[JWT Login] Requested user type: " + userType);
        String username =
                SalesforceJWTUserResolver.resolveUsername(userType);
        System.out.println("[JWT Login] Resolved Salesforce username: " + username);
        SalesforceJWTAuth jwtAuth = new SalesforceJWTAuth();
        SalesforceJWTAuthResponse authResponse =
                jwtAuth.authenticate(username);
        if (authResponse == null) {
            throw new IllegalStateException(
                    "Salesforce JWT authentication response is null for user type : "
                            + userType);
        }
        String frontdoorUrl = createFrontdoorUrl(authResponse);
        System.out.println("[JWT Login] JWT token obtained.");
        System.out.println("[JWT Login] Opening Salesforce Frontdoor...");
        driver.get(frontdoorUrl);
        waitForSalesforceSession();
        System.out.println("[JWT Login] Salesforce browser session established.");
        System.out.println("[JWT Login] Logged in user type : " + userType);
        System.out.println("[JWT Login] Logged in username : " + username);
        System.out.println("[JWT Login] Current URL : "
                + sanitizeUrl(driver.getCurrentUrl()));
    }
    /**
     * Frontdoor login for Salesforce Classic.
     */
    private String createFrontdoorUrl(
            SalesforceJWTAuthResponse response) {
        try {
// Open Classic Visualforce page
            String retUrl = "/apex/PhaseView?t=GrantorHome";
            return response.getInstanceUrl()
                    + "/secur/frontdoor.jsp"
                    + "?sid="
                    + URLEncoder.encode(
                    response.getAccessToken(),
                    "UTF-8")
                    + "&retURL="
                    + URLEncoder.encode(
                    retUrl,
                    "UTF-8");
        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to create Salesforce Frontdoor URL",
                    e);
        }
    }
    /**
     * Wait until Salesforce session is established.
     */
    private void waitForSalesforceSession() {
        try {
            WebDriverWait wait = new WebDriverWait(driver, 60);
            wait.until(webDriver -> {
                String currentUrl = webDriver.getCurrentUrl();
                String title = webDriver.getTitle();
                System.out.println(
                        "[JWT Login] Waiting : "
                                + sanitizeUrl(currentUrl));
                if (currentUrl.contains("UnifiedPasskeyVerificationUi")
                        || currentUrl.contains("AddPasskeyUi")) {
                    throw new IllegalStateException(
                            "Salesforce redirected to Passkey page.");
                }
                if (title != null
                        && title.contains("Verify Your Identity")) {
                    throw new IllegalStateException(
                            "Identity verification page detected.");
                }
                /*
                 * Login is successful if any Classic Visualforce page opens.
                 */
                return currentUrl.contains("vf.force.com")
                        && currentUrl.contains("/apex/");
            });
        } catch (TimeoutException e) {
            throw new IllegalStateException(
                    "Salesforce session was not established within 60 seconds.",
                    e);
        }
    }
    private String sanitizeUrl(String url) {
        if (url == null) {
            return "";
        }
        return url.replaceAll("(?i)(sid=)[^&]+", "$1***");
    }
}