package com.ggproduct.automation.webservices;

import com.google.gson.JsonObject;
import com.helperPackage.register.I;
import io.restassured.response.Response;
import org.apache.commons.lang.StringUtils;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.List;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class GranteeWebServices extends ProjectWebServices {

    /**
     * calls the API's to create the Grants Records
     * needs to be parametrized:- Grant number, Award Type,Budget Period Start Date,Budget Period End Date,Amendment Type
     *
     * @param
     * @param ppStartDate
     */
    public void createGrantsRecord(String grantTitle, String grantNumber, String awardType, String fainNumber, String amendmentType, String ppStartDate, String ppEndDate, String bpStartDate, String bpEndDate) {
        LocalDate projectPeriodStartDate = LocalDate.now().plusDays(Long.parseLong(ppStartDate));
        LocalDate projectPeriodEndDate = LocalDate.now().plusDays(Long.parseLong(ppEndDate));
        LocalDate budgetPeriodStartDate = LocalDate.now().plusDays(Long.parseLong(bpStartDate));
        LocalDate budgetPeriodEndDate = LocalDate.now().plusDays(Long.parseLong(bpEndDate));

        if (!Pattern.compile("[0-9]").matcher(grantTitle).find()) {
            String newGrantTitle = grantTitle + I.amPerforming().addOnsTo().getStringRandomNumber();
            I.amPerforming().propertiesFileOperationsTo().saveValue(grantTitle, newGrantTitle);
            grantTitle = newGrantTitle;

            fainNumber = fainNumber + I.amPerforming().addOnsTo().getStringRandomNumber();
            I.amPerforming().propertiesFileOperationsTo().saveValue("fainNumber", fainNumber);
        }

        if (I.amPerforming().propertiesFileOperationsTo().getSavedValuesMap().containsKey("GRANTNUMBER") && grantNumber.startsWith("20")) {
            var updatedGrantNum = I.amPerforming().propertiesFileOperationsTo().getValue("GRANTNUMBER").replaceFirst("19", "20");
            I.amPerforming().propertiesFileOperationsTo().saveValue("grantNumber", updatedGrantNum);
        } else {
            I.amPerforming().propertiesFileOperationsTo().saveValue("grantNumber", grantNumber + I.amPerforming().addOnsTo().getStringRandomNumber());
        }

        String finalEndPoint = endPoint + "/services/data/v47.0/sobjects/PPLSFTGrant__c";
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("GrantDescription__c", "Automation Grant Award Description");
        jsonObject.addProperty("ProjectPeriodStartDate__c", String.valueOf(projectPeriodStartDate));
        jsonObject.addProperty("ProjectPeriodEndDate__c", String.valueOf(projectPeriodEndDate));
        jsonObject.addProperty("GrantNumber__c", I.amPerforming().propertiesFileOperationsTo().getValue("grantNumber"));
        jsonObject.addProperty("AwardType__c", awardType);
        jsonObject.addProperty("GrantTitle__c", grantTitle);
        jsonObject.addProperty("ShortTitle__c", "G2");
        jsonObject.addProperty("SponsorCode__c", "6622335CD");
        jsonObject.addProperty("InternalOrganization__c", "52100");
        jsonObject.addProperty("BPStartDate__c", String.valueOf(budgetPeriodStartDate));
        jsonObject.addProperty("BPEndDate__c", String.valueOf(budgetPeriodEndDate));
        jsonObject.addProperty("AmendmentTypes__c", amendmentType);
        jsonObject.addProperty("AmendmentNumber__c", "1");
        jsonObject.addProperty("DocumentID__c", "123456");
        jsonObject.addProperty("SubAccountNumber__c", "12345");
        jsonObject.addProperty("forwardAmount__c", 12345.0);
        jsonObject.addProperty("ContactId__c", "101");
        jsonObject.addProperty("FAIN__c", fainNumber);
        I.amPerforming().restHttp().postCall(jsonObject, null, finalEndPoint, null, null, "Bearer" + tokenString);
    }

    /**
     * calls the API's to create the project focus area
     *
     * @param
     */
    public void createProjectsFocusArea(String grantId, String fainNumber) {
        String finalEndPoint = endPoint + "/services/data/v47.0/sobjects/PPLSFTGrantFocusArea__c";
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("ProjectCode__c", "PC-01");
        jsonObject.addProperty("Title__c", "Internal Focus Area");
        jsonObject.addProperty("GrantId__c", grantId);
        jsonObject.addProperty("AmenmentNumber__c", "AMED-001");
        jsonObject.addProperty("FAIN__c", fainNumber);
        I.amPerforming().restHttp().postCall(jsonObject, null, finalEndPoint, null, null, "Bearer" + tokenString);
    }

    /**
     * calls the API's to enter the project budget details
     *
     * @param
     */
    public void createProjectsBudgetFocusAreaDetails(String awardId, String fainNumber, String fundCode) {
        String finalEndPoint = endPoint + "/services/data/v47.0/sobjects/PPLSFTGrantBudgetCategory__c";
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("AwardId__c", awardId);
        jsonObject.addProperty("AmenmentNumber__c", "AMED-001");
        jsonObject.addProperty("Code__c", "10F");
        jsonObject.addProperty("StateBudgetCategory__c", "E1110");
        jsonObject.addProperty("FocusAreaCode__c", "PC-01");
        jsonObject.addProperty("Budget__c", "20000");
        jsonObject.addProperty("FundCode__c", fundCode);
        jsonObject.addProperty("FAIN__c", fainNumber);
        I.amPerforming().restHttp().postCall(jsonObject, null, finalEndPoint, null, null, "Bearer" + tokenString);
    }

    /**
     * calls the API's to enter the expenditure creation details
     *
     * @param
     */
    public void creationExpenditureDetails(String awardId, String fainNumber, String fundCode, String documentId, String transactionAmount) {
        String finalEndPoint = endPoint + "/services/data/v47.0/sobjects/PPLSFTProjectExpenditure__c";
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("AwardId__c", awardId);
        jsonObject.addProperty("ProjectCode__c", "PC-01");
        jsonObject.addProperty("AmendmentNumber__c", "AMED-001");
        jsonObject.addProperty("Code__c", "10F");
        jsonObject.addProperty("StateBudgetCategory__c", "E1110");
        jsonObject.addProperty("FundCode__c", fundCode);
        jsonObject.addProperty("FiscalYear__c", "2019");
        jsonObject.addProperty("TransactionAmount__c", transactionAmount);
        jsonObject.addProperty("DocumentID__c", documentId);
        jsonObject.addProperty("PurchaseOrderNumber__c", "120");
        jsonObject.addProperty("PaymentID__c", "1234567890");
        jsonObject.addProperty("PEOPLESOFTID__c", "012345678");
        jsonObject.addProperty("FAIN__c", fainNumber);
        I.amPerforming().restHttp().postCall(jsonObject, null, finalEndPoint, null, null, "Bearer" + tokenString);
    }

    /**
     * calls the API's to enter the expenditure creation details
     *
     * @param
     */
    public void creationDrawdownsDetails(String awardId, String fainNumber, String code, String stateBudgetCategory, String amount) {
        I.amPerforming().propertiesFileOperationsTo().saveValue("codeNumber", code);
        I.amPerforming().propertiesFileOperationsTo().saveValue("statusBudgetCategory", stateBudgetCategory);
        I.amPerforming().propertiesFileOperationsTo().saveValue("amountValue", amount);

        String finalEndPoint = endPoint + "/services/data/v47.0/sobjects/PPLSFTDrawdown__c";
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("AwardId__c", awardId);
        jsonObject.addProperty("AmendmentNumber__c", "AMED-001");
        jsonObject.addProperty("Code__c", code);
        jsonObject.addProperty("StateBudgetCategory__c", stateBudgetCategory);
        jsonObject.addProperty("FundCode__c", "012");
        jsonObject.addProperty("FiscalYear__c", "2019");
        jsonObject.addProperty("Amount__c", amount);
        jsonObject.addProperty("DocumentID__c", "000012345");
        jsonObject.addProperty("DepositID__c", "1234567890");
        jsonObject.addProperty("PEOPLESOFTID__c", "012345678");
        jsonObject.addProperty("FAIN__c", fainNumber);
        I.amPerforming().restHttp().postCall(jsonObject, null, finalEndPoint, null, null, "Bearer" + tokenString);
    }


    /**
     * calls the api to execute batch file for report/record generation
     *
     * @param operationType
     * @param batchName
     */
    public void executeBatchFileApi(String operationType, String batchName, String objectType, String recordName, String opportunitynumber) {
        System.out.print("Making API call to execute batch file");
        String finalEndPoint = endPoint;
        try {
            operationType = URLEncoder.encode(operationType, StandardCharsets.UTF_8.toString());
            batchName = URLEncoder.encode(batchName, StandardCharsets.UTF_8.toString());
        } catch (Exception e) {
        }
        if (!operationType.equalsIgnoreCase("CreateRecord")) {
            finalEndPoint += "/services/apexrest/productAutomationDataCreationApi?operationType=" + operationType
                    + "&batchName=" + batchName + "&recordName=" + recordName;
        } else {
            String newRecordTitle = recordName + I.amPerforming().addOnsTo().getStringRandomNumber();
            I.amPerforming().propertiesFileOperationsTo().saveValue(recordName, newRecordTitle);
            recordName = newRecordTitle;
            String newOpportunityNumber = opportunitynumber + I.amPerforming().addOnsTo().getStringRandomNumber();
            I.amPerforming().propertiesFileOperationsTo().saveValue(opportunitynumber, newOpportunityNumber);
            opportunitynumber = newOpportunityNumber;

            finalEndPoint += "/services/apexrest/productAutomationDataCreationApi?operationType=" + operationType
                    + "&objectType=" + objectType + "&recordName=" + recordName + "&opportunitynumber=" + opportunitynumber;
        }
        Response response = I.amPerforming().restHttp().postCall(null, null, finalEndPoint, "Authorization", "Bearer " + tokenString,
                null);
        System.out.println(finalEndPoint);
        response.prettyPrint();
        System.out.println("Batch file executed");
        assertStatusCode(response);
    }

    public void deleteRecordInHooks() {
        List<String> recordNameList = I.amPerforming().propertiesFileOperationsTo().getAllSavedKeys().stream()
                .filter(Keys -> Keys.startsWith("AUTOMATION RUNTIME")).collect(Collectors.toList());
        for (String record : recordNameList) {
            if (StringUtils.containsIgnoreCase(record, "focus area")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Focus Area");
            }
            if (StringUtils.containsIgnoreCase(record, "contact")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Contact");
            }
            if (StringUtils.containsIgnoreCase(record, "grant")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Grant");
            }
            if (StringUtils.containsIgnoreCase(record, "lead")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Foa Lead");
            }
            if (StringUtils.containsIgnoreCase(record, "lead")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Qualified Lead");
            }
            if (StringUtils.containsIgnoreCase(record, "NF Program")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Program");
            }
            if (StringUtils.containsIgnoreCase(record, "Internal Program")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Program");
            }
            if (StringUtils.containsIgnoreCase(record, "KPI")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "KPI");
            }
            if (StringUtils.containsIgnoreCase(record, "Strategic")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Strategic Plan");
            }
            if (StringUtils.containsIgnoreCase(record, "NF Organization")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "Account");
            }
            if (StringUtils.containsIgnoreCase(record, "Lead")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "PREAPPLICATION");
            }
            if (StringUtils.containsIgnoreCase(record, "Lead")) {
                deletionApi(I.amPerforming().propertiesFileOperationsTo().getValue(record), "APPLICATION");
            }
        }
    }
}
