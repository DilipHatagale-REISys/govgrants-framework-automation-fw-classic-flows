package com.helperPackage.authentication;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;

import java.security.interfaces.RSAPrivateCrtKey;

import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.RSAPublicKeySpec;

import java.time.Instant;

import java.util.Base64;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class SalesforceJWTAuth {

    private static final Pattern ACCESS_TOKEN_PATTERN =
            Pattern.compile(
                    "\"access_token\"\\s*:\\s*\"([^\"]+)\""
            );

    private static final Pattern INSTANCE_URL_PATTERN =
            Pattern.compile(
                    "\"instance_url\"\\s*:\\s*\"([^\"]+)\""
            );


    /**
     * Authenticate the requested Salesforce user.
     *
     * The username is resolved by SalesforceJWTUserResolver
     * before this method is called.
     *
     * @param username exact Salesforce Username
     * @return Salesforce JWT authentication response
     */
    public SalesforceJWTAuthResponse authenticate(
            String username) {

        try {

            System.out.println(
                    "[JWT] Starting Salesforce JWT authentication..."
            );

            System.out.println(
                    "[JWT] Requested Salesforce username: "
                            + username
            );


            /*
             * STEP 1:
             * Validate framework JWT configuration
             * and requested Salesforce username.
             */
            validateConfiguration(
                    username
            );


            /*
             * STEP 2:
             * Load RSA PKCS#8 private key.
             */
            PrivateKey privateKey =
                    loadPrivateKey();


            /*
             * STEP 3:
             * Generate JWT assertion for the
             * requested Salesforce user.
             */
            String assertion =
                    createJWTAssertion(
                            privateKey,
                            username
                    );


            /*
             * STEP 4:
             * Debug JWT structure.
             *
             * Complete JWT is never logged.
             */
            debugJWTAssertion(
                    assertion
            );


            /*
             * STEP 5:
             * Verify generated JWT signature locally.
             */
            verifyJWTSignature(
                    assertion,
                    privateKey
            );


            /*
             * STEP 6:
             * Exchange JWT assertion for
             * Salesforce OAuth access token.
             */
            return exchangeJWTForAccessToken(
                    assertion
            );


        } catch (Exception e) {

            System.err.println(
                    "[JWT] Salesforce JWT authentication failed."
            );

            System.err.println(
                    "[JWT] Username: "
                            + username
            );

            System.err.println(
                    "[JWT] Exception class: "
                            + e.getClass().getName()
            );

            System.err.println(
                    "[JWT] Exception message: "
                            + e.getMessage()
            );


            throw new RuntimeException(
                    "Salesforce JWT authentication failed "
                            + "for username: "
                            + username,
                    e
            );
        }
    }


    /**
     * Validate JWT configuration and dynamic Salesforce user.
     */
    private void validateConfiguration(
            String username) {

        /*
         * Validate common JWT configuration.
         */
        SalesforceJWTConfiguration.validate();


        String clientId =
                SalesforceJWTConfiguration
                        .getClientId();


        String loginUrl =
                SalesforceJWTConfiguration
                        .getLoginUrl();


        String privateKeyPath =
                SalesforceJWTConfiguration
                        .getPrivateKeyPath();


        /*
         * Username is dynamic.
         *
         * Do NOT read the username from:
         *
         * SalesforceJWTConfiguration.getUsername()
         */
        requireValue(
                "Salesforce JWT username",
                username
        );


        requireValue(
                "Salesforce JWT Client ID",
                clientId
        );


        requireValue(
                "Salesforce JWT Login URL",
                loginUrl
        );


        requireValue(
                "Salesforce JWT Private Key Path",
                privateKeyPath
        );


        System.out.println(
                "[JWT DEBUG] Configuration validation successful."
        );


        System.out.println(
                "[JWT DEBUG] Username: "
                        + username
        );


        System.out.println(
                "[JWT DEBUG] Login URL: "
                        + loginUrl
        );


        System.out.println(
                "[JWT DEBUG] Client ID length: "
                        + clientId.length()
        );


        System.out.println(
                "[JWT DEBUG] Client ID prefix: "
                        + clientId.substring(
                        0,
                        Math.min(
                                8,
                                clientId.length()
                        )
                )
        );


        System.out.println(
                "[JWT DEBUG] Private key path: "
                        + privateKeyPath
        );
    }


    /**
     * Validate required configuration value.
     */
    private void requireValue(
            String propertyName,
            String value) {

        if (value == null
                || value.trim().isEmpty()) {

            throw new IllegalStateException(
                    propertyName
                            + " is not configured."
            );
        }
    }


    /**
     * Create Salesforce JWT assertion for
     * the dynamically requested Salesforce user.
     */
    private String createJWTAssertion(
            PrivateKey privateKey,
            String username)
            throws Exception {

        String clientId =
                SalesforceJWTConfiguration
                        .getClientId();


        String audience =
                SalesforceJWTConfiguration
                        .getLoginUrl();


        long currentEpochSeconds =
                Instant.now()
                        .getEpochSecond();


        /*
         * Salesforce JWT assertion lifetime.
         */
        long expirationEpochSeconds =
                currentEpochSeconds + 180;


        System.out.println(
                "[JWT] Creating Salesforce JWT assertion..."
        );


        System.out.println(
                "[JWT] Username: "
                        + username
        );


        System.out.println(
                "[JWT] Audience: "
                        + audience
        );


        System.out.println(
                "[JWT DEBUG] Current epoch seconds: "
                        + currentEpochSeconds
        );


        System.out.println(
                "[JWT DEBUG] Expiration epoch seconds: "
                        + expirationEpochSeconds
        );


        System.out.println(
                "[JWT DEBUG] JWT lifetime: "
                        + (
                        expirationEpochSeconds
                                - currentEpochSeconds
                )
                        + " seconds"
        );


        /*
         * JWT Header.
         */
        String header =
                "{"
                        + "\"alg\":\"RS256\","
                        + "\"typ\":\"JWT\""
                        + "}";


        /*
         * Salesforce JWT Payload.
         *
         * iss = External Client App Consumer Key
         * sub = Exact Salesforce Username
         * aud = Salesforce login URL
         * exp = Expiration epoch seconds
         */
        String payload =
                "{"

                        + "\"iss\":\""
                        + escapeJson(
                        clientId
                )
                        + "\","

                        + "\"sub\":\""
                        + escapeJson(
                        username
                )
                        + "\","

                        + "\"aud\":\""
                        + escapeJson(
                        audience
                )
                        + "\","

                        + "\"exp\":"
                        + expirationEpochSeconds

                        + "}";


        System.out.println(
                "[JWT DEBUG] Raw header: "
                        + header
        );


        /*
         * Payload is printed only for debugging.
         *
         * It contains no access token or password.
         */
        System.out.println(
                "[JWT DEBUG] Raw payload: "
                        + payload
        );


        Base64.Encoder encoder =
                Base64
                        .getUrlEncoder()
                        .withoutPadding();


        String encodedHeader =
                encoder.encodeToString(
                        header.getBytes(
                                StandardCharsets.UTF_8
                        )
                );


        String encodedPayload =
                encoder.encodeToString(
                        payload.getBytes(
                                StandardCharsets.UTF_8
                        )
                );


        String signingInput =
                encodedHeader
                        + "."
                        + encodedPayload;


        /*
         * Salesforce JWT Bearer Flow requires RS256.
         */
        Signature signature =
                Signature.getInstance(
                        "SHA256withRSA"
                );


        signature.initSign(
                privateKey
        );


        signature.update(
                signingInput.getBytes(
                        StandardCharsets.UTF_8
                )
        );


        byte[] signatureBytes =
                signature.sign();


        String encodedSignature =
                encoder.encodeToString(
                        signatureBytes
                );


        String assertion =
                signingInput
                        + "."
                        + encodedSignature;


        System.out.println(
                "[JWT DEBUG] JWT assertion created successfully."
        );


        return assertion;
    }


    /**
     * Load Salesforce JWT PKCS#8 RSA private key.
     */
    private PrivateKey loadPrivateKey()
            throws Exception {

        String privateKeyPath =
                SalesforceJWTConfiguration
                        .getPrivateKeyPath();


        System.out.println(
                "[JWT] Loading private key..."
        );


        Path keyPath =
                Paths.get(
                                privateKeyPath
                        )
                        .toAbsolutePath()
                        .normalize();


        System.out.println(
                "[JWT DEBUG] Resolved private key path: "
                        + keyPath
        );


        if (!Files.exists(
                keyPath
        )) {

            throw new IllegalStateException(
                    "Private key does not exist: "
                            + keyPath
            );
        }


        if (!Files.isRegularFile(
                keyPath
        )) {

            throw new IllegalStateException(
                    "Private key path is not a file: "
                            + keyPath
            );
        }


        long fileSize =
                Files.size(
                        keyPath
                );


        System.out.println(
                "[JWT DEBUG] Private key file size: "
                        + fileSize
                        + " bytes"
        );


        String privateKeyContent =
                new String(
                        Files.readAllBytes(
                                keyPath
                        ),
                        StandardCharsets.UTF_8
                );


        boolean pkcs8Header =
                privateKeyContent.contains(
                        "-----BEGIN PRIVATE KEY-----"
                );


        boolean pkcs1Header =
                privateKeyContent.contains(
                        "-----BEGIN RSA PRIVATE KEY-----"
                );


        System.out.println(
                "[JWT DEBUG] PKCS8 header detected: "
                        + pkcs8Header
        );


        System.out.println(
                "[JWT DEBUG] PKCS1 header detected: "
                        + pkcs1Header
        );


        if (pkcs1Header) {

            throw new IllegalStateException(
                    "PKCS#1 RSA private key detected. "
                            + "A PKCS#8 private key is required."
            );
        }


        if (!pkcs8Header) {

            throw new IllegalStateException(
                    "Expected PKCS#8 PRIVATE KEY header."
            );
        }


        privateKeyContent =
                privateKeyContent
                        .replace(
                                "-----BEGIN PRIVATE KEY-----",
                                ""
                        )
                        .replace(
                                "-----END PRIVATE KEY-----",
                                ""
                        )
                        .replaceAll(
                                "\\s",
                                ""
                        );


        byte[] keyBytes =
                Base64
                        .getDecoder()
                        .decode(
                                privateKeyContent
                        );


        PKCS8EncodedKeySpec keySpec =
                new PKCS8EncodedKeySpec(
                        keyBytes
                );


        KeyFactory keyFactory =
                KeyFactory.getInstance(
                        "RSA"
                );


        PrivateKey privateKey =
                keyFactory.generatePrivate(
                        keySpec
                );


        System.out.println(
                "[JWT] Private key loaded successfully."
        );


        System.out.println(
                "[JWT DEBUG] Private key algorithm: "
                        + privateKey.getAlgorithm()
        );


        System.out.println(
                "[JWT DEBUG] Private key format: "
                        + privateKey.getFormat()
        );


        return privateKey;
    }


    /**
     * Debug generated JWT structure.
     *
     * Complete JWT assertion is never printed.
     */
    private void debugJWTAssertion(
            String assertion) {

        String[] parts =
                assertion.split(
                        "\\."
                );


        System.out.println(
                "[JWT DEBUG] JWT part count: "
                        + parts.length
        );


        if (parts.length != 3) {

            throw new IllegalStateException(
                    "JWT must contain exactly 3 parts."
            );
        }


        Base64.Decoder decoder =
                Base64.getUrlDecoder();


        String header =
                new String(
                        decoder.decode(
                                parts[0]
                        ),
                        StandardCharsets.UTF_8
                );


        String payload =
                new String(
                        decoder.decode(
                                parts[1]
                        ),
                        StandardCharsets.UTF_8
                );


        System.out.println(
                "[JWT DEBUG] Header: "
                        + header
        );


        System.out.println(
                "[JWT DEBUG] Payload: "
                        + payload
        );


        System.out.println(
                "[JWT DEBUG] Encoded signature length: "
                        + parts[2].length()
        );


        /*
         * Never print the complete JWT assertion.
         */
    }


    /**
     * Verify generated JWT signature locally.
     */
    private void verifyJWTSignature(
            String assertion,
            PrivateKey privateKey)
            throws Exception {

        System.out.println(
                "[JWT DEBUG] Verifying JWT signature locally..."
        );


        if (!(privateKey
                instanceof RSAPrivateCrtKey)) {

            throw new IllegalStateException(
                    "Private key is not an RSA CRT private key."
            );
        }


        String[] parts =
                assertion.split(
                        "\\."
                );


        if (parts.length != 3) {

            throw new IllegalStateException(
                    "JWT must contain exactly 3 parts "
                            + "before signature verification."
            );
        }


        String signingInput =
                parts[0]
                        + "."
                        + parts[1];


        byte[] signatureBytes =
                Base64
                        .getUrlDecoder()
                        .decode(
                                parts[2]
                        );


        RSAPrivateCrtKey rsaPrivateKey =
                (RSAPrivateCrtKey)
                        privateKey;


        RSAPublicKeySpec publicKeySpec =
                new RSAPublicKeySpec(
                        rsaPrivateKey.getModulus(),
                        rsaPrivateKey.getPublicExponent()
                );


        KeyFactory keyFactory =
                KeyFactory.getInstance(
                        "RSA"
                );


        PublicKey publicKey =
                keyFactory.generatePublic(
                        publicKeySpec
                );


        Signature verifier =
                Signature.getInstance(
                        "SHA256withRSA"
                );


        verifier.initVerify(
                publicKey
        );


        verifier.update(
                signingInput.getBytes(
                        StandardCharsets.UTF_8
                )
        );


        boolean valid =
                verifier.verify(
                        signatureBytes
                );


        System.out.println(
                "[JWT DEBUG] Local signature valid: "
                        + valid
        );


        if (!valid) {

            throw new IllegalStateException(
                    "JWT signature failed local verification."
            );
        }
    }


    /**
     * Exchange JWT assertion for Salesforce OAuth access token.
     */
    private SalesforceJWTAuthResponse exchangeJWTForAccessToken(
            String assertion)
            throws Exception {

        String loginUrl =
                SalesforceJWTConfiguration
                        .getLoginUrl();


        String tokenEndpoint =
                loginUrl
                        + "/services/oauth2/token";


        System.out.println(
                "[JWT DEBUG] Token endpoint: "
                        + tokenEndpoint
        );


        System.out.println(
                "[JWT DEBUG] Grant type: "
                        + "urn:ietf:params:oauth:grant-type:jwt-bearer"
        );


        System.out.println(
                "[JWT DEBUG] Assertion present: "
                        + (
                        assertion != null
                                && !assertion
                                .trim()
                                .isEmpty()
                )
        );


        URL tokenUrl =
                new URL(
                        tokenEndpoint
                );


        HttpURLConnection connection =
                (HttpURLConnection)
                        tokenUrl.openConnection();


        try {

            connection.setRequestMethod(
                    "POST"
            );


            connection.setDoOutput(
                    true
            );


            connection.setConnectTimeout(
                    30000
            );


            connection.setReadTimeout(
                    30000
            );


            connection.setRequestProperty(
                    "Content-Type",
                    "application/x-www-form-urlencoded"
            );


            connection.setRequestProperty(
                    "Accept",
                    "application/json"
            );


            String grantType =
                    "urn:ietf:params:oauth:grant-type:jwt-bearer";


            String requestBody =
                    "grant_type="
                            + URLEncoder.encode(
                            grantType,
                            StandardCharsets.UTF_8.name()
                    )

                            + "&assertion="

                            + URLEncoder.encode(
                            assertion,
                            StandardCharsets.UTF_8.name()
                    );


            System.out.println(
                    "[JWT] Requesting Salesforce access token..."
            );


            try (OutputStream outputStream =
                         connection.getOutputStream()) {

                outputStream.write(
                        requestBody.getBytes(
                                StandardCharsets.UTF_8
                        )
                );
            }


            int responseCode =
                    connection.getResponseCode();


            System.out.println(
                    "[JWT] Salesforce token response code: "
                            + responseCode
            );


            InputStream responseStream =
                    responseCode >= 200
                            && responseCode < 300

                            ? connection.getInputStream()

                            : connection.getErrorStream();


            String responseBody =
                    readResponse(
                            responseStream
                    );


            if (responseCode < 200
                    || responseCode >= 300) {

                throw new IllegalStateException(
                        "Salesforce token endpoint returned HTTP "
                                + responseCode
                                + ". Response: "
                                + sanitizeResponse(
                                responseBody
                        )
                );
            }


            String accessToken =
                    extractJsonValue(
                            responseBody,
                            ACCESS_TOKEN_PATTERN,
                            "access_token"
                    );


            String instanceUrl =
                    extractJsonValue(
                            responseBody,
                            INSTANCE_URL_PATTERN,
                            "instance_url"
                    );


            System.out.println(
                    "[JWT] Salesforce JWT authentication successful."
            );


            System.out.println(
                    "[JWT] Instance URL: "
                            + instanceUrl
            );


            return new SalesforceJWTAuthResponse(
                    accessToken,
                    instanceUrl
            );


        } finally {

            connection.disconnect();
        }
    }


    /**
     * Read Salesforce HTTP response.
     */
    private String readResponse(
            InputStream inputStream)
            throws Exception {

        if (inputStream == null) {

            return "";
        }


        StringBuilder response =
                new StringBuilder();


        try (BufferedReader reader =
                     new BufferedReader(
                             new InputStreamReader(
                                     inputStream,
                                     StandardCharsets.UTF_8
                             )
                     )) {

            String line;


            while ((line = reader.readLine())
                    != null) {

                response.append(
                        line
                );
            }
        }


        return response.toString();
    }


    /**
     * Extract value from Salesforce JSON response.
     */
    private String extractJsonValue(
            String response,
            Pattern pattern,
            String fieldName) {

        Matcher matcher =
                pattern.matcher(
                        response
                );


        if (!matcher.find()) {

            throw new IllegalStateException(
                    "Salesforce response does not contain "
                            + fieldName
            );
        }


        return matcher.group(
                1
        );
    }


    /**
     * Escape JSON string values.
     */
    private String escapeJson(
            String value) {

        if (value == null) {

            return "";
        }


        return value
                .replace(
                        "\\",
                        "\\\\"
                )
                .replace(
                        "\"",
                        "\\\""
                );
    }


    /**
     * Sanitize Salesforce response before logging.
     *
     * Access token must never be printed.
     */
    private String sanitizeResponse(
            String response) {

        if (response == null) {

            return "";
        }


        return response.replaceAll(
                "\"access_token\"\\s*:\\s*\"[^\"]+\"",
                "\"access_token\":\"***\""
        );
    }
}