package com.ggproduct.automation.webservices;

import com.google.gson.JsonArray;
import com.google.gson.JsonNull;
import com.google.gson.JsonObject;
import com.helperPackage.register.EnvironmentFactory;
import com.helperPackage.register.I;

import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;
import java.util.Map;


public class GrantorPayloads {

    public JsonObject applicationReview(String applicationName, String announcementName, String filter) {
        JsonObject defaultJson = defaultPayloadApplicationReview(applicationName, announcementName);

        String user = "";

        if (filter.toLowerCase().contains("user")) {
            user = filter.split("-")[1].split("user")[0].trim();
            updateAppOwnerAndContact(defaultJson, user);
            filter = filter.split("-")[0];
        } else {
            filter = filter.toUpperCase();
        }
        switch (filter) {
            case "APPLICATION":
                break;
            case "BUDGETCATEGORY":
                break;
            case "BUDGETCATEGORY_NO_FOCUSAREA":
                return updateBudgetCategorNoFocusAreas(defaultJson);
            case "SECOND_BUDGET_CATEGORY":
                return updateBudgetCategoryForTwoFocusAreas(defaultJson);
            case "FIRST_BUDGET_CATEGORY":
                return updateBudgetCategoryForFirstFocusAreas(defaultJson);
            case "FIRST_BUDGET_CATEGORY_NO_FOCUS_AREA":
                return updateBudgetCategoryForFirstFocusAreasNoFocusArea(defaultJson);
            case "TWO_BUD_CAT_FIFTEEN_HUNDRED_AMT":
                return updateBudgetCategoryForTwoFocusAreasFifteenHundredAmt(defaultJson);
            case "SECOND_BUDGET_CAT_DETAILS_BUD_YES":
                return updateBudgetCategoryForTwoFocusAreasDetailsBudgetYes(defaultJson);
            case "KYECONTACTS":
                break;
            case "KEYOUTCOME":
                break;
            default:
                return defaultJson;
        }
        return defaultJson;
    }

    private JsonObject updateBudgetCategoryForTwoFocusAreasDetailsBudgetYes(JsonObject defaultJson) {
        JsonArray budgetCategoryArray = new JsonArray();
//        JsonObject budgetCategory2 = defaultJson.getAsJsonArray("BudgetCategory").get(0).getAsJsonObject();

        JsonObject budgetCategory1 = new JsonObject();
        budgetCategory1.addProperty("Title", "Construction");
        budgetCategory1.addProperty("Narrative", "Construction");
        budgetCategory1.addProperty("BudgetRequest", 500);
        budgetCategory1.addProperty("CashMatch", 100);
        budgetCategory1.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory1.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory1.addProperty("ServiceAreaTitle", "Automation Permanent Focus Area");
        budgetCategoryArray.add(budgetCategory1);

        JsonObject budgetCategory2 = new JsonObject();
        budgetCategory2.addProperty("Title", "Construction");
        budgetCategory2.addProperty("Narrative", "Construction");
        budgetCategory2.addProperty("BudgetRequest", 500);
        budgetCategory2.addProperty("CashMatch", 100);
        budgetCategory2.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory2.addProperty("ServiceAreaTitle", "Automation Permanent Focus Area2");
        budgetCategoryArray.add(budgetCategory2);
        defaultJson.add("BuildUpItems", budgetCategoryArray);
        return defaultJson;
    }

    private JsonObject updateBudgetCategoryForFirstFocusAreasNoFocusArea(JsonObject defaultJson) {
        JsonArray budgetCategoryArray = new JsonArray();
        JsonObject budgetCategory2 = defaultJson.getAsJsonArray("BudgetCategory").get(0).getAsJsonObject();

        JsonObject budgetCategory1 = new JsonObject();
        budgetCategory1.addProperty("BudgetCategory", "Construction");
        budgetCategory1.addProperty("BudgetRequest", 1000);
        budgetCategory1.addProperty("CashMatch", 100);
        budgetCategory1.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory1.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory1.addProperty("ServiceAreaTitle", "Standard Focus Area");
        budgetCategoryArray.add(budgetCategory1);
        defaultJson.add("BudgetCategory", budgetCategoryArray);
        return defaultJson;
    }

    private JsonObject updateBudgetCategoryForTwoFocusAreasFifteenHundredAmt(JsonObject json) {
        JsonArray budgetCategoryArray = new JsonArray();
        JsonObject budgetCategory2 = json.getAsJsonArray("BudgetCategory").get(0).getAsJsonObject();

        JsonObject budgetCategory1 = new JsonObject();
        budgetCategory1.addProperty("BudgetCategory", "Construction");
        budgetCategory1.addProperty("BudgetRequest", 1500);
        budgetCategory1.addProperty("CashMatch", 100);
        budgetCategory1.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory1.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory1.addProperty("ServiceAreaTitle", "Automation Permanent Focus Area");
        budgetCategoryArray.add(budgetCategory1);

        budgetCategory2.addProperty("BudgetCategory", "Construction");
        budgetCategory2.addProperty("BudgetRequest", 1500);
        budgetCategory2.addProperty("CashMatch", 100);
        budgetCategory2.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory2.addProperty("ServiceAreaTitle", "Automation Permanent Focus Area2");
        budgetCategoryArray.add(budgetCategory2);
        json.add("BudgetCategory", budgetCategoryArray);
        return json;
    }

    private JsonObject updateBudgetCategorNoFocusAreas(JsonObject json) {
        JsonArray budgetCategoryArray = new JsonArray();
        JsonObject budgetCategory2 = json.getAsJsonArray("BudgetCategory").get(0).getAsJsonObject();

        JsonObject budgetCategory1 = new JsonObject();
        budgetCategory1.addProperty("BudgetCategory", "Construction");
        budgetCategory1.addProperty("BudgetRequest", 1000);
        budgetCategory1.addProperty("CashMatch", 100);
        budgetCategory1.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory1.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory1.addProperty("ServiceAreaTitle", "Standard Focus Area");
        budgetCategoryArray.add(budgetCategory1);
        json.add("BudgetCategory", budgetCategoryArray);
        return json;
    }

    private JsonObject updateBudgetCategoryForFirstFocusAreas(JsonObject defaultJson) {
        JsonArray budgetCategoryArray = new JsonArray();
        JsonObject budgetCategory2 = defaultJson.getAsJsonArray("BudgetCategory").get(0).getAsJsonObject();

        JsonObject budgetCategory1 = new JsonObject();
        budgetCategory1.addProperty("BudgetCategory", "Construction");
        budgetCategory1.addProperty("BudgetRequest", 500);
        budgetCategory1.addProperty("CashMatch", 100);
        budgetCategory1.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory1.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory1.addProperty("ServiceAreaTitle", "Automation Permanent Focus Area");
        budgetCategoryArray.add(budgetCategory1);
        defaultJson.add("BudgetCategory", budgetCategoryArray);
        return defaultJson;
    }

    private JsonObject updateBudgetCategoryForTwoFocusAreas(JsonObject json) {
        JsonArray budgetCategoryArray = new JsonArray();
        JsonObject budgetCategory2 = json.getAsJsonArray("BudgetCategory").get(0).getAsJsonObject();

        JsonObject budgetCategory1 = new JsonObject();
        budgetCategory1.addProperty("BudgetCategory", "Construction");
        budgetCategory1.addProperty("BudgetRequest", 500);
        budgetCategory1.addProperty("CashMatch", 100);
        budgetCategory1.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory1.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory1.addProperty("ServiceAreaTitle", "Automation Permanent Focus Area");
        budgetCategoryArray.add(budgetCategory1);

        budgetCategory2.addProperty("BudgetCategory", "Construction");
        budgetCategory2.addProperty("BudgetRequest", 500);
        budgetCategory2.addProperty("CashMatch", 100);
        budgetCategory2.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory2.addProperty("ServiceAreaTitle", "Automation Permanent Focus Area2");
        budgetCategoryArray.add(budgetCategory2);
        json.add("BudgetCategory", budgetCategoryArray);
        return json;
    }

    private void updateAppOwnerAndContact(JsonObject json, String user) {
        JsonObject jsonObject = json.getAsJsonArray("Application").get(0).getAsJsonObject();
        JsonArray aappOwner = new JsonArray();
        jsonObject.addProperty("OwnerId", ProjectWebServices.getIdOf("User", user));
        aappOwner.add(jsonObject);
        json.add("Application", aappOwner);

        JsonObject jsonObject1 = json.getAsJsonArray("KeyContact").get(0).getAsJsonObject();
        JsonArray keyContact = new JsonArray();
        jsonObject1.addProperty("Contact", ProjectWebServices.getIdOf("Contact", user)); // Automation SPI id
        keyContact.add(jsonObject1);
        json.add("KeyContact", keyContact);
    }

    public JsonObject defaultPayloadApplicationReview(String applicationName, String announcementName) {

        String ownerName = "Automation SPI3";
        String contactName = "Automation SPI3";
        String kpiName = "Automation Permanent KPI";

        JsonObject parent = new JsonObject();

        JsonObject application = new JsonObject();
        JsonArray applicationArray = new JsonArray();
        application.addProperty("Title", applicationName);
        application.addProperty("AddressLine1", "3 Capitol Hill Blvd");
        application.addProperty("City", "Montana");
        application.addProperty("County", "RI");
        application.addProperty("State", "UT");
        application.addProperty("ZipCode", "02908");
        application.addProperty("ProjectAbstract", "Test");
        application.addProperty("Justification", "this is Justification");
        application.addProperty("Announcement", ProjectWebServices.getIdOf("Announcement__c", announcementName));
        application.add("PreApplication", JsonNull.INSTANCE);
        application.addProperty("RecordTypeId", ProjectWebServices.getRecordTypeId("Application__c", "Grantor"));
        application.addProperty("OwnerId", ProjectWebServices.getIdOf("User", ownerName));
        applicationArray.add(application);
        parent.add("Application", applicationArray);

        JsonObject budgetCategory = new JsonObject();
        JsonArray budgetCategoryArray = new JsonArray();
        budgetCategory.addProperty("BudgetCategory", "Construction");
        budgetCategory.addProperty("BudgetRequest", 1000);
        budgetCategory.addProperty("CashMatch", 100);
        budgetCategory.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategory.addProperty("ServiceAreaTitle", "Automation Permanent Focus Area");
        budgetCategoryArray.add(budgetCategory);
        parent.add("BudgetCategory", budgetCategoryArray);

        JsonObject keyContacts = new JsonObject();
        JsonArray keyContactsArray = new JsonArray();
        keyContacts.addProperty("ProjectRole", "Project Director/Manager");
        keyContacts.addProperty("Contact", ProjectWebServices.getIdOf("Contact", contactName)); // Automation SPI id
        keyContacts.addProperty("IsKeyContact", true);
        keyContactsArray.add(keyContacts);
        parent.add("KeyContact", keyContactsArray);

        JsonObject keyOutcome = new JsonObject();
        JsonArray keyOutcomeArray = new JsonArray();
        keyOutcome.addProperty("MasterKPI", ProjectWebServices.getIdOf("MasterKPI__c", kpiName)); // KPI id
        keyOutcome.addProperty("Target", "10");
        keyOutcomeArray.add(keyOutcome);
        parent.add("KeyOutcome", keyOutcomeArray);

        return parent;
    }

    private JsonObject getIdsOfUsers(List<String> users) {
        JsonObject idsApi = new JsonObject();
        JsonArray usersArray = new JsonArray();
        for (String user : users) {
            usersArray.add(user);
        }
        idsApi.add("User", usersArray);
        return idsApi;
    }

    public JsonObject defaultRequestPayroleForApprovedDFM() {
        Map<String, String> map = ProjectWebServices.getMultipleIds(getIdsOfUsers(Arrays.asList("Automation EXE", "Automation FO", "Automation PM")));
        JsonObject parent = new JsonObject();

        JsonArray reviewStepsArray = new JsonArray();
        JsonObject complianceReview = new JsonObject();
        complianceReview.addProperty("Reviewer", map.get("Automation EXE"));
        complianceReview.addProperty("FormName", "Compliance Review");
        complianceReview.addProperty("DueInDays", 7);

        JsonObject programReview = new JsonObject();
        programReview.addProperty("Reviewer", map.get("Automation PM"));
        programReview.addProperty("FormName", "Program Review");
        programReview.addProperty("DueInDays", 7);

        JsonObject fiscalReview = new JsonObject();
        fiscalReview.addProperty("Reviewer", map.get("Automation FO"));
        fiscalReview.addProperty("FormName", "Fiscal Review");
        fiscalReview.addProperty("DueInDays", 7);

        JsonObject managementReview = new JsonObject();
        managementReview.addProperty("Reviewer", map.get("Automation FO"));
        managementReview.addProperty("FormName", "Management Review");
        managementReview.addProperty("DueInDays", 7);

        JsonObject preScreen = new JsonObject();
        preScreen.addProperty("Reviewer", map.get("Automation FO"));
        preScreen.addProperty("FormName", "Pre-Screen");
        preScreen.addProperty("DueInDays", 7);

        reviewStepsArray.add(complianceReview);
        reviewStepsArray.add(programReview);
        reviewStepsArray.add(fiscalReview);
        reviewStepsArray.add(managementReview);
        reviewStepsArray.add(preScreen);

        parent.add("ReviewSteps", reviewStepsArray);

        JsonObject FDM = new JsonObject();
        JsonArray FDMArray = new JsonArray();
        FDM.addProperty("SubawardAbbreviation", "AWD");
        FDM.addProperty("RecommendedForAward", "Yes");
        FDM.addProperty("RecommendedAmount", 1000);
        FDM.addProperty("TotalCommitmentAmount",1000);
        FDMArray.add(FDM);

        parent.add("FDM", FDMArray);

        return parent;
    }

    public JsonObject getIdsForCreateAwardFromFDM(String annName) {

        JsonObject ids = new JsonObject();

        JsonArray fdmA = new JsonArray();
        fdmA.add(annName);
        ids.add("ReviewStep__c", fdmA);

        JsonArray user = new JsonArray();
        user.add("Automation PM");
        ids.add("User", user);

        JsonArray service_area = new JsonArray();
        service_area.add("Automation Permanent Focus Area");
        ids.add("ServiceArea__c", service_area);

        JsonArray strategic_plan = new JsonArray();
        strategic_plan.add("Automation Permanent Strategic Plan");
        ids.add("StrategicPlan__c", strategic_plan);

        JsonArray kpi = new JsonArray();
        kpi.add("Automation Permanent KPI for Regression");
        ids.add("MasterKPI__c", kpi);

        JsonArray contact = new JsonArray();
        contact.add("Automation SPI3");
        ids.add("Contact", contact);

        return ids;
    }

    public JsonObject defaultPayloadCreateAwardFromFDM(String announcementName) {
        JsonObject parent = new JsonObject();
        Map<String, String> map = ProjectWebServices.getMultipleIds(getIdsForCreateAwardFromFDM(announcementName));

        JsonObject grant = new JsonObject();
        JsonArray grantArray = new JsonArray();
        grant.addProperty("FDM", map.get(announcementName));
        grant.addProperty("RecordTypeId", ProjectWebServices.getRecordTypeId("Grant__c", "Grantor"));
        grant.addProperty("OwnerId", map.get("Automation PM"));
        grantArray.add(grant);
        parent.add("Grant", grantArray);

        JsonObject award = new JsonObject();
        JsonArray awardArray = new JsonArray();
        award.addProperty("GrantAwardDescription", "Award Created From Automation API");
        award.addProperty("BudgetPeriodEndDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(150, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        award.addProperty("PM", ProjectWebServices.getIdOf("User", "Automation PM"));
        award.addProperty("FO", ProjectWebServices.getIdOf("User", "Automation FO"));
        award.addProperty("EXE", ProjectWebServices.getIdOf("User", "Automation EXE"));
        awardArray.add(award);
        parent.add("Award", awardArray);

        JsonObject awardFundingAccount = new JsonObject();
        JsonArray awardFundingAccountArray = new JsonArray();
        awardFundingAccount.addProperty("PreEncumbranceAmount", "1000");
        awardFundingAccountArray.add(awardFundingAccount);
        parent.add("AwardFundingAccount", awardFundingAccountArray);

//        JsonObject awardBudgetCategory = new JsonObject();
//        JsonArray awardBudgetCategoryArray = new JsonArray();
//        awardBudgetCategory.addProperty("BudgetCategory", "Construction");
//        awardBudgetCategory.addProperty("AwardedBudget", "1000");
//        awardBudgetCategory.addProperty("CashMatch", "100");
//        awardBudgetCategory.add("OtherLeverage", JsonNull.INSTANCE);
//        awardBudgetCategoryArray.add(awardBudgetCategory);
//        parent.add("AwardBudgetCategory", awardBudgetCategoryArray);

        JsonObject awardServiceArea = new JsonObject();
        JsonArray awardServiceAreaArray = new JsonArray();
        awardServiceArea.addProperty("ServiceArea", map.get("Automation Permanent Focus Area"));
        awardServiceArea.addProperty("GATStartDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(50, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceArea.addProperty("GATEndDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(150, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaArray.add(awardServiceArea);
        parent.add("AwardServiceArea", awardServiceAreaArray);

        JsonObject kpiGoalsObjectives = new JsonObject();
        JsonArray kpiGoalsObjectivesArrays = new JsonArray();
        kpiGoalsObjectives.addProperty("StrategicPlan", map.get("Automation Permanent Strategic Plan"));
        kpiGoalsObjectivesArrays.add(kpiGoalsObjectives);
        parent.add("KPIGoalsObjectives", kpiGoalsObjectivesArrays);

        JsonObject keyOutcome = new JsonObject();
        JsonArray keyOutcomeArray = new JsonArray();
        keyOutcome.addProperty("MasterKPI", map.get("Automation Permanent KPI"));
        keyOutcome.addProperty("Target", "10");
        keyOutcomeArray.add(keyOutcome);
        parent.add("KeyOutcome", keyOutcomeArray);

        JsonObject keyContacts = new JsonObject();
        JsonArray keyContactsArray = new JsonArray();
        keyContacts.addProperty("ProjectRole", "Project Director/Manager");
        keyContacts.addProperty("Contact", map.get("Automation SPI3"));
        keyContacts.addProperty("IsKeyContact", true);
        keyContactsArray.add(keyContacts);
        parent.add("KeyContacts", keyContactsArray);

        return parent;
    }

    /**
     * @return
     */
    public JsonObject defaultPayloadActivateAwardFromFDM() {
        JsonObject parent = new JsonObject();
        JsonArray termConditionSchedule = new JsonArray();

        JsonObject paymentRequest = new JsonObject();
        paymentRequest.addProperty("SubmissionTitle", "Payment Request Schedule");
        paymentRequest.addProperty("CalReportingStartDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(50, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        paymentRequest.addProperty("CalReportingEndDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(150, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        paymentRequest.addProperty("Frequency", "Bi-Monthly");
        paymentRequest.addProperty("ScheduleBase", "Reporting Period");
        paymentRequest.addProperty("SubmissionType", "Payment Request");

        termConditionSchedule.add(paymentRequest);

        JsonObject progressReport = new JsonObject();
        progressReport.addProperty("SubmissionTitle", "Progress Report Schedule");
        progressReport.addProperty("CalReportingStartDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(50, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReport.addProperty("CalReportingEndDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(150, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReport.addProperty("Frequency", "Bi-Monthly");
        progressReport.addProperty("ScheduleBase", "Reporting Period");
        progressReport.addProperty("SubmissionType", "Progress Report");
        termConditionSchedule.add(progressReport);

        parent.add("TermConditionSchedule", termConditionSchedule);

        return parent;
    }


    /**
     * @param annType
     * @param annName
     * @param filter
     * @return This method include switch cases. If we wants to change the some parameter from the default payload returned by method
     * @see #getDefaultPayloadPublishAnn(String, String) then we can simply create our own method having parameter(this parameter would be json object return
     * by method getDefaultPayloadPublishAnn(String,String)) and then we can create out own swtich case and call that method under this switch case. And pass
     * this switch cases from feature step....
     * e.g take a look at BUDGETPERIODDATES case below...
     */
    public JsonObject publishAnnPayload(String annType, String annName, String filter) {
        JsonObject json = getDefaultPayloadPublishAnn(annType, annName);
        String user = "";

        if (filter.toLowerCase().contains("user")) {
            user = filter.split("-")[1].split("user")[0].trim();
            updateAnnouncementOwner(json, user);
            filter = filter.split("-")[0];
        } else {
            filter = filter.toUpperCase();
        }

        switch (filter) {
            case "BUDGETPERIODDATES":
                return updateBudgetPeridDateForAnnouncement(json);
            case "NO_RISK_ASSESSMENT":
                return updateRiskAssesmentAsNoForAnnouncement(json);
            case "PRE_APPLICATION_YES":
                return updatePreApplicationAsYesForAnnouncement(json);
            case "PRE_APPLICATION_YES_WITH_IND_ORG":
                return updatePreApplicationAsYesForAnnouncementWithIndOrg(json);
            case "PRE_APPLICATION_NEGOTIATION_YES":
                return updatePreApplicationAndNegotiationAsYesForAnnouncement(json);
            case "PRE_APP_YES_NEGO_YES_FOCUS_AREA_NO":
                return updatePreApplicationAndNegotiationAsYesAndFocusAreaNoForAnnouncement(json);
            case "FOCUS_AREA_NO":
                return updateFocusAreaForAnnouncement(json, "No");
            case "NEGOTIATION":
                return negotiationYesForAnnouncement(json);
            case "NEGOTIATION_YES_FOCUS_NO":
                return negotiationYesFocusNoForAnnouncement(json);
            case "NEGOTIATION_NO":
                return negotiationNoForAnnouncement(json);
            case "PRE_APP_YES_FOCUS_AREA_NO":
                return preAppYesFocusAreaNoAnnouncement(json);
            case "BY_APPLICANT_FOCUS_AREA_NO":
                return byApplicantFocusAreaNo(json);
            case "BY_APPLICANT":
                return byApplicant(json);
            case "BY_APPLICANT_FOCUS_AREA":
                return byApplicantFocusArea(json);
            case "GOALS_YES":
                return goalsYesForAnnouncement(json);
            case "PRE_APP_GOALS_YES":
                return preAppYesGoalsYesForAnnouncement(json);
            case "PRE_APP_YES_PROGRAM_INCOME_NO":
                return preAppYesProgramIncomeNoForAnnouncement(json);
            case "TODAY_APP_DUE_DATE":
                return todayAppDueDateAnnouncement(json);
            case "APPLICATION_PAST_DUE_DATE":
                return pastAppDueDateAnnouncement(json);
            case "TODAY_PREAPP_DUE_DATE":
                return todayPreAppDueDateAnnouncement(json);
            case "PRE_APPLICATION_YES_AND_NO_MATCH":
                json = updatePreApplicationAsYesForAnnouncement(json);
                return updateMachRequiredToNoAnnouncement(json);
            case "SUB_MATCH_YES_RISK_YES_EXPENSE_YES_ADVANCE_NO":
                return subMatchYesRequiredMatch10RiskYesExpenseYesAdvacnceYesAnnouncement(json);
            case "BY_APPLICANT_NEGOTIATION_NO":
                return byApplicantNegotiationNo(json);
            case "BY_APPLICANT_FOCUS_NO_NEGOTIATION_NO":
                return byApplicantFocusNoNegotiationNo(json);
            case "BY_APPLICANT_FOCUS_AREA_NO_NEGOTIATION_NO":
                return byApplicantFocusAreaNoNegotiationsNo(json);
            case "BY_APPLICANT_FOCUS_AREA_NO_NEGOTIATION_YES":
                return byApplicantFocusAreaNoNegotiationsYes(json);
            case "BY_APPLICANT_FOCUS_AREA_NEGOTIATION_NO":
                return byApplicantFocusAreaNegotiationsNo(json);
            case "BY_APPLICANT_FOCUS_AREA_NEGOTIATION_YES":
                return byApplicantFocusAreaNegotiationsYes(json);
            case "BY_APPLICANT_FOCUS_AREA_RISK_ASSESSMENT_NO":
                return byApplicantFocusAreaRiskAssessmentNo(json);
            case "BY_APPLICANT_RISK_ASSESSMENT_NO":
                return byApplicantRiskAssessmentNo(json);
            case "BY_APPLICANT_FOCUS_AREA_NO_RISKASSESSMENT_NO":
                return byApplicantFocusAreaNoRiskAssessmentNo(json);
            case "NO_RISK_ASSESSMENT_FOCUS_AREA_NO":
                return updateRiskAssesmentAsNoForAnnouncementFocusAreaNo(json);
            case "INVITED_APPLICANT_IND_ORG":
                return invitedIndUserOrganization(json);
            case "INVITED_APPLICANT_IND_ORG_SPI_ORG":
                return invitedIndUserSPIUerOrganization(json);
            case "INVITED_APPLICANT_IND_ORG_FOCUS_AREA_NO":
                return invitedIndUserOrganizationFocusAreaNo(json);
            case "INVITED_APPLICANT_IND_ORG_BY_APPLICANT":
                return invitedIndUserOrganizationbyApplicant(json);
            case "INVITED_APPLICANT_IND_ORG_BY_APPLICANT_FOCUS_AREA_NO":
                return invitedIndUserOrganizationbyApplicantFocusAreaNo(json);
            case "INVITED_APPLICANT_IND_ORG_BY_APPLICANT_FOCUS_AREA":
                return invitedIndUserOrganizationbyApplicantFocusArea(json);
            case "INVITED_APPLICANT_IND_ORGPRE_PRE_APPLICATION_NEGOTIATION":
                return invitedIndUserOrganizationPreApplicationAndNegotiationAsYes(json);
            case "SECOND_FOCUS_AREA_APPLICANT_IND_ORG_PRE_APPLICATION":
                return invitedIndUserOrganizationSecondFocusAreaPreApplicationYes(json);
            case "SECOND_FOCUS_AREA":
                return updateAnnouncementWithSecondFocusArea(json);
            case "SECOND_FOCUS_AREA_RISK_ASS_NO":
                return updateAnnouncementWithSecondFocusAreaRiskNo(json);
            case "SECOND_FOCUS_AREA_BY_APPL_RISK_ASS_NO":
                return updateAnnouncementWithSecondFocusAreaByappRiskNo(json);
            case "SECOND_FOCUS_AREA_BY_APPL_NEGO_NO_RISK_ASS_NO":
                return updateAnnouncementWithSecondFocusAreaByappRiskNoNegoNo(json);
            case "THREE_FOCUS_AREA_BY_APPL_RISK_ASS_NO":
                return updateAnnouncementWithThreeFocusAreaByappRiskNo(json);
            case "SECOND_FOCUS_AREA_BY_APPLICANT_FOCUS_AREA_RISK_ASS_NO":
                return updateAnnouncementWithSecondFocusAreaByappFocusAreaRiskNo(json);
            case "SECOND_FOCUS_AREA_BY_APP_FOCUS_AREA_RISK_NO_IND_ORG":
                return updateAnnouncementWithSecondFocusAreaByappFocusAreaRiskNoWithIndOrg(json);
            case "THREE_FOCUS_BY_APP_FOCUS_AREA_RISK_NO_PROGRAM_INCOME_NO_SUB_MATCH_NO":
                return updateAnnouncementWithSecondFocusAreaByappFocusAreaRiskNoNOIncomeSubMatchNo(json);
            case "SECOND_FOCUS_AREA_DETAILS_BUDGET_YES_RISK_NO":
                return updateAnnouncementWithSecondFocusAreaDetailBudgetYes(json);
            case "THREE_FOCUS_BY_APP_DETAILS_BUDGET_YES_RISK_NO":
                return updateAnnouncementWithThreeFocusAreaByappDetailsYesRiskNo(json);
            default:
                return json;
        }
    }

    private JsonObject updateAnnouncementWithSecondFocusAreaByappFocusAreaRiskNoWithIndOrg(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel", "By Applicant and Focus Area");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        JsonObject invApp = new JsonObject();
        JsonArray invAppA = new JsonArray();
        invApp.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        invApp.addProperty("AllocatedAmount", 500);
        invAppA.add(invApp);
        json.add("InvitedApplicant", invAppA);
        return json;
    }

    private JsonObject invitedIndUserSPIUerOrganization(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "SAN DIEGO ELECTRICAL TRAINING TRUST"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        pre.add(jsonObject);
        json.add("InvitedApplicant", pre);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel","N/A");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject updateAnnouncementWithThreeFocusAreaByappDetailsYesRiskNo(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        JsonObject serviceAreaC = new JsonObject();
        serviceAreaC.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Test Focus Area"));
        serviceArea.add(serviceAreaC);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel", "By Applicant");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        jsonObject1.addProperty("DetailedBudgetingRequired", "Yes");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject updateAnnouncementWithSecondFocusAreaByappRiskNoNegoNo(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel", "By Applicant");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        jsonObject1.addProperty("IsNegotiationsAllowed", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject updateAnnouncementWithSecondFocusAreaDetailBudgetYes(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        jsonObject1.addProperty("DetailedBudgetingRequired", "Yes");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject byApplicantFocusNoNegotiationNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray nego = new JsonArray();
        jsonObject.addProperty("Allocationlevel", "By Applicant");
        jsonObject.addProperty("FocusAreaRequired", "No");
        jsonObject.addProperty("IsNegotiationsAllowed", "No");
        nego.add(jsonObject);
        json.add("Announcement", nego);
        return json;

    }

    private JsonObject updateAnnouncementWithSecondFocusAreaByappFocusAreaRiskNoNOIncomeSubMatchNo(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        JsonObject serviceAreaC = new JsonObject();
        serviceAreaC.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Test Focus Area"));
        serviceArea.add(serviceAreaC);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel", "By Applicant and Focus Area");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        jsonObject1.addProperty("IsProgramIncomeAnticipated", "No");
        jsonObject1.addProperty("IsMatchRequired", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject updateAnnouncementWithThreeFocusAreaByappRiskNo(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        JsonObject serviceAreaC = new JsonObject();
        serviceAreaC.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Test Focus Area"));
        serviceArea.add(serviceAreaC);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel", "By Applicant");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject negotiationYesFocusNoForAnnouncement(JsonObject json) {
        JsonObject negotiation = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        negotiation.addProperty("IsNegotiationsAllowed", "Yes");
        negotiation.addProperty("FocusAreaRequired", "no");
        pre.add(negotiation);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject updatePreApplicationAsYesForAnnouncementWithIndOrg(JsonObject json) {
        JsonObject pre_application = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        pre_application.addProperty("PreApplicationNeeded", "Yes");
        pre.add(pre_application);
        pre_application.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        pre.add(pre_application);
        json.add("InvitedApplicant", pre);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject updateAnnouncementWithSecondFocusAreaRiskNo(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject updateAnnouncementWithSecondFocusArea(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        json.add("AnnouncementServiceArea", serviceArea);
        return json;
    }

    private JsonObject invitedIndUserOrganizationSecondFocusAreaPreApplicationYes(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("InvitedApplicant").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        pre.add(jsonObject);
        json.add("InvitedApplicant", pre);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("PreApplicationNeeded", "Yes");
        jsonObject1.addProperty("FocusAreaRequired", "Yes");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        json.add("AnnouncementServiceArea", serviceArea);
        return json;
    }

    private JsonObject updateAnnouncementWithSecondFocusAreaByappRiskNo(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel","By Applicant");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject updateAnnouncementWithSecondFocusAreaByappFocusAreaRiskNo(JsonObject json) {
        JsonArray serviceArea = new JsonArray();
        JsonObject serviceAreaB = new JsonObject();
        serviceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        serviceArea.add(serviceAreaB);
        json.add("AnnouncementServiceArea", serviceArea);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel", "By Applicant and Focus Area");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        JsonObject invApp = new JsonObject();
        JsonArray invAppA = new JsonArray();
        invApp.addProperty("Organization", ProjectWebServices.getIdOf("Account", "SAN DIEGO ELECTRICAL TRAINING TRUST"));
        invApp.addProperty("AllocatedAmount", 500);
        invAppA.add(invApp);
        json.add("InvitedApplicant", invAppA);
        return json;
    }

    private JsonObject invitedIndUserOrganization(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        pre.add(jsonObject);
        json.add("InvitedApplicant", pre);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel","N/A");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject invitedIndUserOrganizationFocusAreaNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("InvitedApplicant").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        pre.add(jsonObject);
        json.add("InvitedApplicant", pre);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("FocusAreaRequired", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject invitedIndUserOrganizationbyApplicant(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("InvitedApplicant").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        pre.add(jsonObject);
        json.add("InvitedApplicant", pre);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel","By Applicant");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject invitedIndUserOrganizationbyApplicantFocusAreaNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("InvitedApplicant").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        pre.add(jsonObject);
        json.add("InvitedApplicant", pre);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel", "By Applicant");
        jsonObject1.addProperty("FocusAreaRequired", "No");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject invitedIndUserOrganizationbyApplicantFocusArea(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("InvitedApplicant").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        pre.add(jsonObject);
        json.add("InvitedApplicant", pre);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("Allocationlevel", "By Applicant and Focus Area");
        jsonObject1.addProperty("RiskAssessment_Required", "No");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject invitedIndUserOrganizationPreApplicationAndNegotiationAsYes(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("InvitedApplicant").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Organization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        jsonObject.addProperty("AllocatedAmount", 1000);
        pre.add(jsonObject);
        json.add("InvitedApplicant", pre);
        JsonObject jsonObject1 = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre1 = new JsonArray();
        jsonObject1.addProperty("PreApplicationNeeded", "Yes");
        jsonObject1.addProperty("IsNegotiationsAllowed", "Yes");
        pre1.add(jsonObject1);
        json.add("Announcement", pre1);
        return json;
    }

    private JsonObject updateRiskAssesmentAsNoForAnnouncementFocusAreaNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("FocusAreaRequired", "No");
        jsonObject.addProperty("RiskAssessment_Required", "No");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject byApplicantFocusAreaNoRiskAssessmentNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel", "By Applicant");
        jsonObject.addProperty("FocusAreaRequired", "No");
        jsonObject.addProperty("RiskAssessment_Required", "No");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject byApplicantRiskAssessmentNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel","By Applicant");
        jsonObject.addProperty("IsNegotiationsAllowed","Yes");
        jsonObject.addProperty("RiskAssessment_Required", "No");
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject byApplicantFocusAreaRiskAssessmentNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel","By Applicant and Focus Area");
        jsonObject.addProperty("IsNegotiationsAllowed","Yes");
        jsonObject.addProperty("RiskAssessment_Required", "No");
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject byApplicantFocusAreaNegotiationsYes(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel","By Applicant and Focus Area");
        jsonObject.addProperty("IsNegotiationsAllowed","Yes");
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private void updateAnnouncementOwner(JsonObject json, String user) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray annOwner = new JsonArray();
        jsonObject.addProperty("OwnerId",ProjectWebServices.getIdOf("User",user));
        annOwner.add(jsonObject);
        json.add("Announcement",annOwner);
    }

    private JsonObject byApplicantFocusAreaNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel", "By Applicant");
        jsonObject.addProperty("FocusAreaRequired", "No");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject byApplicant(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel", "By Applicant");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject byApplicantFocusAreaNegotiationsNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel","By Applicant and Focus Area");
        jsonObject.addProperty("IsNegotiationsAllowed","No");
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject byApplicantFocusArea(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel", "By Applicant and Focus Area");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject byApplicantFocusAreaNegotiationYes(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("Allocationlevel","By Applicant and Focus Area");
        jsonObject.addProperty("IsNegotiationsAllowed","Yes");
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject byApplicantNegotiationNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray nego = new JsonArray();
        jsonObject.addProperty("Allocationlevel","By Applicant");
        jsonObject.addProperty("IsNegotiationsAllowed","No");
        nego.add(jsonObject);
        json.add("Announcement",nego);
        return json;
    }

    private JsonObject byApplicantFocusAreaNoNegotiationsNo(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray nego = new JsonArray();
        jsonObject.addProperty("Allocationlevel","By Applicant");
        jsonObject.addProperty("FocusAreaRequired","No");
        jsonObject.addProperty("IsNegotiationsAllowed","No");
        nego.add(jsonObject);
        json.add("Announcement",nego);
        return json;
    }

    private JsonObject byApplicantFocusAreaNoNegotiationsYes(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray nego = new JsonArray();
        jsonObject.addProperty("Allocationlevel","By Applicant");
        jsonObject.addProperty("FocusAreaRequired","No");
        jsonObject.addProperty("IsNegotiationsAllowed","Yes");
        nego.add(jsonObject);
        json.add("Announcement",nego);
        return json;
    }

    private JsonObject updatePreApplicationAndNegotiationAsYesForAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationNeeded", "Yes");
        jsonObject.addProperty("IsNegotiationsAllowed", "Yes");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject updatePreApplicationAndNegotiationAsYesAndFocusAreaNoForAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationNeeded","Yes");
        jsonObject.addProperty("IsNegotiationsAllowed","Yes");
        jsonObject.addProperty("FocusAreaRequired","No");
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject updatePreApplicationAsYesNegotiationYesForAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationNeeded", "Yes");
        jsonObject.addProperty("IsNegotiationsAllowed", "Yes");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;

    }

    private JsonObject updateMachRequiredToNoAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("IsMatchRequired", "No");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject todayPreAppDueDateAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationNeeded", "Yes");
        jsonObject.addProperty("PreApplicationDueDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        jsonObject.addProperty("ApplicationDueDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject pastAppDueDateAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationDueDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(-1, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        jsonObject.addProperty("ApplicationDueDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(-1, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject todayAppDueDateAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationDueDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        jsonObject.addProperty("ApplicationDueDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject preAppYesProgramIncomeNoForAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationNeeded", "Yes");
        jsonObject.addProperty("IsProgramIncomeAnticipated", "No");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject preAppYesGoalsYesForAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationNeeded", "Yes");
        jsonObject.addProperty("IsGoalsRequired", "Yes");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject preAppYesFocusAreaNoAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationNeeded", "Yes");
        jsonObject.addProperty("FocusAreaRequired", "No");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject subMatchYesRequiredMatch10RiskYesExpenseYesAdvacnceYesAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("IsMatchRequired", "Yes");
        jsonObject.addProperty("GranteeMatch", 10);
        jsonObject.addProperty("RiskAssessment_Required", "Yes");
        jsonObject.addProperty("AreExpensesBuildIUpLevel", "Yes");
        jsonObject.addProperty("IsAdvancePermitted", "No");
        pre.add(jsonObject);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject goalsYesForAnnouncement(JsonObject json) {
        JsonObject goals = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        goals.addProperty("IsGoalsRequired", "Yes");
        pre.add(goals);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject negotiationYesForAnnouncement(JsonObject json) {
        JsonObject negotiation = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        negotiation.addProperty("IsNegotiationsAllowed", "Yes");
        pre.add(negotiation);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject negotiationNoForAnnouncement(JsonObject json) {
        JsonObject negotiation = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        negotiation.addProperty("IsNegotiationsAllowed", "No");
        pre.add(negotiation);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject updateFocusAreaForAnnouncement(JsonObject json, String no) {
        JsonObject pre_application = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        pre_application.addProperty("FocusAreaRequired", no);
        pre.add(pre_application);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject updatePreApplicationAsYesForAnnouncement(JsonObject json) {
        JsonObject pre_application = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        pre_application.addProperty("PreApplicationNeeded", "Yes");
        pre.add(pre_application);
        json.add("Announcement", pre);
        return json;
    }

    private JsonObject updateRiskAssesmentAsNoForAnnouncement(JsonObject json) {
        JsonObject risk_assessment = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray risk = new JsonArray();
        risk_assessment.addProperty("RiskAssessment_Required", "No");
        risk.add(risk_assessment);
        json.add("Announcement", risk);
        return json;
    }

    private JsonObject updateBudgetPeridDateForAnnouncement(JsonObject json) {

        JsonObject bperiod = json.getAsJsonArray("BudgetPeriod").get(0).getAsJsonObject();
        JsonArray bperiodA = new JsonArray();

        bperiod.addProperty("BudgetStartDate",
                I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(11, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        bperiodA.add(bperiod);
        json.add("BudgetPeriod", bperiodA);
        return json;
    }

    /**
     * @param annType Formula, Competitive Directed
     * @param annName any name
     * @return JsonObject
     * This method return the default request payload for publishing the announcement
     */
    public JsonObject getDefaultPayloadPublishAnn(String annType, String annName) {

        String program = "Automation Permanent Internal Program";
        JsonObject parent = new JsonObject();

        JsonObject ann = new JsonObject();
        JsonArray annA = new JsonArray();

        ann.addProperty("name", annName);
        ann.addProperty("AnnouncementType", annType);
        ann.addProperty("Program", ProjectWebServices.getIdOf("Program__c", program));
        ann.addProperty("BudgetType", "Construction");
        ann.addProperty("MaxApplicationsAllowed", 500);
        ann.addProperty("IsMatchRequired", "Yes");
        ann.addProperty("GranteeMatch", 10);
        ann.addProperty("IsProgramIncomeAnticipated", "Yes");
        ann.addProperty("LaverageAllowed", "Yes");
        ann.addProperty("PreApplicationNeeded", "No");
        ann.addProperty("PreApplicationDueDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(10, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        ann.addProperty("ApplicationDueDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(10, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        ann.addProperty("FocusAreaRequired", "Yes");
        ann.addProperty("IsGoalsRequired", "Yes");
        ann.addProperty("Allocationlevel", "N/A");
        ann.addProperty("KPIsRequired", "Yes");
        ann.addProperty("WBSRequired", "No");
        ann.addProperty("RiskAssessment_Required", "Yes");
        ann.addProperty("AreExpensesBuildIUpLevel", "No");
        ann.addProperty("IsAdvancePermitted", "No");
        ann.addProperty("IsNegotiationsAllowed", "Yes");
        ann.addProperty("EligibleApplicantTypes", "04;05");
        ann.addProperty("DetailedBudgetingRequired", "No");
        ann.addProperty("AwardFloor", 1000);
        ann.addProperty("AwardCeiling", 10000);
        ann.addProperty("EstimatedFundingAmount", 10000);
        ann.addProperty("OwnerId", ProjectWebServices.getIdOf("User", "Automation PM"));
        ann.addProperty("RecordTypeId", ProjectWebServices.getRecordTypeId("Announcement__c", "Grantor"));

        annA.add(ann);
        parent.add("Announcement", annA);

        JsonObject serviceArea = new JsonObject();
        JsonArray serviceAreaA = new JsonArray();
        serviceArea.add("ServiceArea", JsonNull.INSTANCE);
        //   serviceArea.addProperty("ServiceArea",ProjectWebServices.getIdOf("ServiceArea__c","Automation Permanent Focus Area"));
        serviceAreaA.add(serviceArea);
        parent.add("AnnouncementServiceArea", serviceAreaA);

        JsonObject awardFundingAccount = new JsonObject();
        JsonArray awardFundingAccountArray = new JsonArray();
        awardFundingAccount.addProperty("FundingAccount", ProjectWebServices.getIdOf("FundingAccount__c", I.amPerforming().propertiesFileOperationsTo()
                .getValue("fundingAccount")));
        awardFundingAccount.addProperty("PreEncumbranceAmount", "1000");
        awardFundingAccountArray.add(awardFundingAccount);
        parent.add("AwardFundingAccount", awardFundingAccountArray);

        JsonObject kpiGoalsObjectives = new JsonObject();
        JsonArray kpiGoalsObjectivesArrays = new JsonArray();
        kpiGoalsObjectives.add("StrategicPlan", JsonNull.INSTANCE);
        kpiGoalsObjectivesArrays.add(kpiGoalsObjectives);
        parent.add("KPIGoalsObjectives", kpiGoalsObjectivesArrays);


        JsonObject keyOutcome = new JsonObject();
        JsonArray keyOutcomeArray = new JsonArray();
        keyOutcome.add("MasterKPI", JsonNull.INSTANCE);
        keyOutcomeArray.add(keyOutcome);
        parent.add("KeyOutcome", keyOutcomeArray);


        JsonObject budgetPeriod = new JsonObject();
        JsonArray budgetPeriodArray = new JsonArray();

        budgetPeriod.addProperty("BudgetStartDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(50, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        budgetPeriod.addProperty("BudgetEndDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(150, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        budgetPeriodArray.add(budgetPeriod);
        parent.add("BudgetPeriod", budgetPeriodArray);

        JsonObject invApp = new JsonObject();
        JsonArray invAppA = new JsonArray();
        invApp.addProperty("Organization", ProjectWebServices.getIdOf("Account", "SAN DIEGO ELECTRICAL TRAINING TRUST"));
        invApp.addProperty("AllocatedAmount", 1000);
        invAppA.add(invApp);
        parent.add("InvitedApplicant", invAppA);

        return parent;
    }

    public JsonObject PayloadCreateAwardFromFDM(String announcementName, String... Type) {
        String user = "";
        JsonObject json;

        json = defaultPayloadCreateAwardFromFDM(announcementName);

        if (Type.length > 0) {
            if (Type[0].toLowerCase().contains("user") && (Type[0].contains("Automation"))) {
                user = Type[0].split("user")[0].trim();
                updateAwardOwner(json, user);
            }
        }
                return json;
        }

    /**
     * @param grantName
     * @param filter
     * @return This method include switch cases. If we wants to change the some parameter from the default payload returned by method
     * //     * @see #defaultPayloadCreateStandaloneAward(String, String) then we can simply create our own method having parameter(this parameter would be json object return
     * by method defaultPayloadCreateStandaloneAward(String)) and then we can create out own swtich case and call that method under this switch case. And pass
     * this switch cases from feature step....
     */
    public JsonObject payloadForCreateStandaloneAward(String grantName, String filter, String... Type) {
        String user = "";
        JsonObject json;
        boolean Typeflag = Type.length > 0;
        if (Typeflag) {
            json = defaultPayloadCreateStandaloneAward(grantName, Type[0]);
        } else {
            json = defaultPayloadCreateStandaloneAward(grantName);
        }

        if (filter.toLowerCase().contains("user")) {
            if (filter.contains("-Automation")) {
                user = filter.split("-")[1].split("user")[0].trim();
                updateAwardOwner(json, user);
                filter = filter.split("-")[0];
            } else {
                user = filter.replace("user", "").trim();
                filter = "USER";
            }
        } else {
            filter = filter.toUpperCase();
        }

        switch (filter) {
            case "NO_RISK_ASSESSMENT":
                return payloadForCreateStandAloneWithNORiskAssement(json);
            case "YES_RISK_ASSESSMENT":
                return payloadForCreateStandAloneWithYesRiskAssement(json);
            case "NO_ADVANCE_PERMISSION":
                return payloadForPaymentRequestToCreateStandaloneAward(json);
            case "IS_BUILDUP_FUNCTIONALITY_YES":
                return createAwardWtithBuildUpFunctionalityYes(json);
            case "NO_PROGRAM_INCOME_ANTICIPATE":
                return createAwardWtithNoProgramIncomeAnticipate(json);
            case "AMENDMENT_REQUEST":
                return createAwarForAmendmentRequest(json);
            case "AMENDMENT_REQUEST_BUILDUP_MATCH_YES":
                return createAwardForAmendmentRequestWithBuildUpAndMatchAsYes(json);
            case "AMENDMENT_REQUEST_RISK_ASSESMENT_YES":
                return createAwarForAmendmentRequestWithoutRiskAssessment(json);
            case "PROGRESS_REPORT_NOT_APPLICABLE":
                return notapplicableProgressReportAward(json);
            case "PROGRESS_REPORT_MONTHLY":
                return monthyProgressReportAward(json);
            case "PROGRESS_REPORT_QUARTERLY":
                return quarterlyProgressReportAward(json);
            case "PROGRESS_REPORT_SEMI_ANNUALLY":
                return semiAnnuallyProgressReportAward(json);
            case "NO_OBJECTIVE":
                return noObjectives(json);
            case "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO":
                return advancePermissibleYesnofocusarea(json);
            case "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO_BUILDUP_YES_PROJECT_END_DATE":
                return advancePermissibleYesnofocusareaBuildUpYes(json);
            case "ADVANCE_YES_FOCUS_NO_PROGRAM_ANTICIPATED_NO":
                return advancePermissibleYesnofocusareaProgramAnticipatedNo(json);
            case "AMENDMENT_REQUEST_ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO":
                return createAwarForAmendmentRequestAdvanceYesFocusNo(json);
            case "ADVANCE_PERMIS_YES_FOCUS_AREA_NO_SUB_ORG_IND":
                return advancePermissibleYesnofocusareaSubrecipientInd(json);
            case "ADVANCE_PERMIS_YES_FOCUS_AREA_NO_BUILDUP_YES":
                return advancePermissibleYesnofocusareaDetailsBuildUpYes(json);
            case "SUBRECIPIENT_ORG_IND_USER":
                return createAwarForIndUser(json);
            case "SUBRECIPIENT_ORG_SPI_USER":
                return createAwarForSPIUser(json);
            case "SECOND_FOCUS_AREA":
                if (Typeflag)
                return createAwarForSecondFocusArea(json, Type[0]);
                else
                    return createAwarForSecondFocusArea(json);
            case "SECOND_FOCUS_AREA_BUDGET_CATEGORY":
                if (Typeflag)
                    return createAwarForSecondFocusAreaandBudgetCategory(json, Type[0]);
                else
                    return createAwarForSecondFocusAreaandBudgetCategory(json);
            case "THREE_FOCUS_AREA_NO_BUDGET_CATEGORY_THIRD_FOCUS":
                if (Typeflag)
                    return createAwarForThreeFocusAreaandBudgetCategory(json, Type[0]);
                else
                    return createAwarForThreeFocusAreaandBudgetCategory(json);
            case "THREE_FOCUS_AREA_NO_BUDGET_CATEGORY_THIRD_FOCUS_BuildUpYes":
                if (Typeflag)
                    return createAwarForThreeFocusAreaandBudgetCategoryBuildUpYes(json, Type[0]);
                else
                    return createAwarForThreeFocusAreaandBudgetCategoryBuildUpYes(json);
            case "THREE_FOCUS_AREA_NO_BUD_CAT_THIRD_FOCUS_BUILD_UP_IND_ORG":
                if (Typeflag)
                    return createAwarForThreeFocusAreaandBudgetCategoryBuildUpYesIndOrg(json, Type[0]);
                else
                    return createAwarForThreeFocusAreaandBudgetCategoryBuildUpYesIndOrg(json);
            case "SECOND_BUD_CAT_SECOND_FOCUS_BUILD_UP_IND_ORG":
                if (Typeflag)
                    return createAwarForSecondFocusAreaandBudgetCategoryBuildUpYesIndOrg(json, Type[0]);
                else
                    return createAwarForSecondFocusAreaandBudgetCategoryBuildUpYesIndOrg(json);
            case "THREE_FOCUS_AREA_BUDGET_CATEGORY":
                if (Typeflag)
                    return createAwarForThreeFocusAreaWithBudgetCategory(json, Type[0]);
                else
                    return createAwarForThreeFocusAreaWithBudgetCategory(json);
            case "SECOND_FOCUS_AREA_BUD_CAT_BUILDUP_YES":
                if (Typeflag)
                    return createAwarForSecondFocusAreaandBudgetCategoryBuildUpYes(json, Type[0]);
                else
                    return createAwarForSecondFocusAreaandBudgetCategoryBuildUpYes(json);
            case "SECOND_FOCUS_TOTAL_COMMIT_TWO_THOUSAND":
                if (Typeflag)
                    return createAwarForSecondFocusAreaTotalCommitment(json, Type[0]);
                else
                    return createAwarForSecondFocusAreaTotalCommitment(json);
            case "SECOND_FOCUS_BUD_CAT_TOTAL_COMM":
                if (Typeflag)
                    return createAwarForSecondFocusAreaBudCatTotalCommitment(json, Type[0]);
                else
                    return createAwarForSecondFocusAreaBudCatTotalCommitment(json);
            case "SECOND_FOCUS_AREA_BUD_CAT_SUB_ORG_IND":
                if (Typeflag)
                    return createAwarForSecondFocusAreaandBudgetCategorySubrecipientIndProfile(json, Type[0]);
                else
                    return createAwarForSecondFocusAreaandBudgetCategorySubrecipientIndProfile(json);
            case "USER":
                return createStandaloneAwardUsingUser(json, user);
            default:
                return json;
        }
    }

    private JsonObject advancePermissibleYesnofocusareaDetailsBuildUpYes(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("FocusAreaRequired", "No");
        grant.addProperty("IsAdvancePermitted", "Yes");
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        newA.add(grant);
        json.add("Grant", newA);
        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 1000);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Standard Focus Area");
        buildUpItemsA.add(buildUpItems);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject createAwarForSecondFocusAreaandBudgetCategoryBuildUpYesIndOrg(JsonObject json, String... Type) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("InternalOrganization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        newA.add(grant);
        json.add("Grant", newA);

        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        json.add("AwardServiceArea", awardServiceAreaArray);

        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 500);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItemsA.add(buildUpItems);
        JsonObject buildUpItems2 = new JsonObject();
        buildUpItems2.addProperty("BudgetCategory", "Construction");
        buildUpItems2.addProperty("Title", "Construction");
        buildUpItems2.addProperty("Narrative", "Test Build-up");
        buildUpItems2.addProperty("AwardedBudget", 500);
        buildUpItems2.addProperty("CashMatch", 100);
        buildUpItems2.addProperty("NonCashMatch", 100);
        buildUpItems2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems2.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItemsA.add(buildUpItems2);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject advancePermissibleYesnofocusareaBuildUpYes(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("FocusAreaRequired", "No");
        grant.addProperty("IsAdvancePermitted", "Yes");
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("ProjectPeriodEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(4000, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        newA.add(grant);
        json.add("Grant", newA);
        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 1000);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Standard Focus Area");
        buildUpItemsA.add(buildUpItems);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject createAwarForThreeFocusAreaandBudgetCategoryBuildUpYes(JsonObject json, String... Type) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        newA.add(grant);
        json.add("Grant", newA);

        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaC = new JsonObject();
        awardServiceAreaC.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Test Focus Area"));
        awardServiceAreaC.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaC.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        awardServiceAreaArray.add(awardServiceAreaC);
        json.add("AwardServiceArea", awardServiceAreaArray);

        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 500);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItemsA.add(buildUpItems);
        JsonObject buildUpItems2 = new JsonObject();
        buildUpItems2.addProperty("BudgetCategory", "Construction");
        buildUpItems2.addProperty("Title", "Construction");
        buildUpItems2.addProperty("Narrative", "Test Build-up");
        buildUpItems2.addProperty("AwardedBudget", 500);
        buildUpItems2.addProperty("CashMatch", 100);
        buildUpItems2.addProperty("NonCashMatch", 100);
        buildUpItems2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems2.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItemsA.add(buildUpItems2);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject createAwarForThreeFocusAreaandBudgetCategoryBuildUpYesIndOrg(JsonObject json, String... Type) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("InternalOrganization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        newA.add(grant);
        json.add("Grant", newA);

        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaC = new JsonObject();
        awardServiceAreaC.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Test Focus Area"));
        awardServiceAreaC.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaC.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        awardServiceAreaArray.add(awardServiceAreaC);
        json.add("AwardServiceArea", awardServiceAreaArray);

        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 500);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItemsA.add(buildUpItems);
        JsonObject buildUpItems2 = new JsonObject();
        buildUpItems2.addProperty("BudgetCategory", "Construction");
        buildUpItems2.addProperty("Title", "Construction");
        buildUpItems2.addProperty("Narrative", "Test Build-up");
        buildUpItems2.addProperty("AwardedBudget", 500);
        buildUpItems2.addProperty("CashMatch", 100);
        buildUpItems2.addProperty("NonCashMatch", 100);
        buildUpItems2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems2.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItemsA.add(buildUpItems2);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject createAwarForThreeFocusAreaWithBudgetCategory(JsonObject json, String... Type) {
        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaC = new JsonObject();
        awardServiceAreaC.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Test Focus Area"));
        awardServiceAreaC.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaC.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                    awardServiceAreaC.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        awardServiceAreaArray.add(awardServiceAreaC);
        json.add("AwardServiceArea", awardServiceAreaArray);

        JsonObject awardFundingAccount = new JsonObject();
        JsonArray awardFundingAccountArray = new JsonArray();
        awardFundingAccount.addProperty("FundingAccount", ProjectWebServices.getIdOf("FundingAccount__c", I.amPerforming().propertiesFileOperationsTo()
                .getValue("fundingAccount")));
        awardFundingAccount.addProperty("PreEncumbranceAmount", "1500");
        awardFundingAccountArray.add(awardFundingAccount);
        json.add("AwardFundingAccount", awardFundingAccountArray);

        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 500);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        JsonObject buildUpItems2 = new JsonObject();
        buildUpItems2.addProperty("BudgetCategory", "Construction");
        buildUpItems2.addProperty("Title", "Construction");
        buildUpItems2.addProperty("Narrative", "Test Build-up");
        buildUpItems2.addProperty("AwardedBudget", 500);
        buildUpItems2.addProperty("CashMatch", 100);
        buildUpItems2.addProperty("NonCashMatch", 100);
        buildUpItems2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems2.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItemsA.add(buildUpItems2);
        json.add("BuildUpItems", buildUpItemsA);
        JsonObject buildUpItems3 = new JsonObject();
        buildUpItems3.addProperty("BudgetCategory", "Construction");
        buildUpItems3.addProperty("Title", "Construction");
        buildUpItems3.addProperty("Narrative", "Test Build-up");
        buildUpItems3.addProperty("AwardedBudget", 500);
        buildUpItems3.addProperty("CashMatch", 100);
        buildUpItems3.addProperty("NonCashMatch", 100);
        buildUpItems3.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems3.addProperty("ServiceAreaName", "Test Focus Area");
        buildUpItemsA.add(buildUpItems3);
        json.add("BuildUpItems", buildUpItemsA);
        buildUpItemsA.add(buildUpItems);

        return json;
    }

    private JsonObject createAwarForThreeFocusAreaandBudgetCategory(JsonObject json, String... Type) {
        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaC = new JsonObject();
        awardServiceAreaC.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Test Focus Area"));
        awardServiceAreaC.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaC.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        awardServiceAreaArray.add(awardServiceAreaC);
        json.add("AwardServiceArea", awardServiceAreaArray);

        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 500);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItemsA.add(buildUpItems);
        JsonObject buildUpItems2 = new JsonObject();
        buildUpItems2.addProperty("BudgetCategory", "Construction");
        buildUpItems2.addProperty("Title", "Construction");
        buildUpItems2.addProperty("Narrative", "Test Build-up");
        buildUpItems2.addProperty("AwardedBudget", 500);
        buildUpItems2.addProperty("CashMatch", 100);
        buildUpItems2.addProperty("NonCashMatch", 100);
        buildUpItems2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems2.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItemsA.add(buildUpItems2);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject createAwarForSecondFocusAreaTotalCommitment(JsonObject json, String... Type) {
        JsonObject award = json.getAsJsonArray("Award").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        award.addProperty("TotalCommitment", "2000");
        newA.add(award);
        json.add("Award", newA);

        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        json.add("AwardServiceArea", awardServiceAreaArray);
        return json;
    }

    private JsonObject createAwarForSecondFocusAreaandBudgetCategoryBuildUpYes(JsonObject json, String... Type) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        newA.add(grant);
        json.add("Grant", newA);

        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        json.add("AwardServiceArea", awardServiceAreaArray);

        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 500);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItemsA.add(buildUpItems);
        JsonObject buildUpItems2 = new JsonObject();
        buildUpItems2.addProperty("BudgetCategory", "Construction");
        buildUpItems2.addProperty("Title", "Construction");
        buildUpItems2.addProperty("Narrative", "Test Build-up");
        buildUpItems2.addProperty("AwardedBudget", 500);
        buildUpItems2.addProperty("CashMatch", 100);
        buildUpItems2.addProperty("NonCashMatch", 100);
        buildUpItems2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems2.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItemsA.add(buildUpItems2);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject createAwarForSecondFocusAreaBudCatTotalCommitment(JsonObject json, String... Type) {
        JsonObject award = json.getAsJsonArray("Award").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        award.addProperty("TotalCommitment", "2000");
        newA.add(award);
        json.add("Award", newA);

        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        json.add("AwardServiceArea", awardServiceAreaArray);

        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 500);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItemsA.add(buildUpItems);
        JsonObject buildUpItems2 = new JsonObject();
        buildUpItems2.addProperty("BudgetCategory", "Construction");
        buildUpItems2.addProperty("Title", "Construction");
        buildUpItems2.addProperty("Narrative", "Test Build-up");
        buildUpItems2.addProperty("AwardedBudget", 500);
        buildUpItems2.addProperty("CashMatch", 100);
        buildUpItems2.addProperty("NonCashMatch", 100);
        buildUpItems2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems2.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItemsA.add(buildUpItems2);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject createAwarForSecondFocusArea(JsonObject json, String... Type) {
        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        json.add("AwardServiceArea", awardServiceAreaArray);
        return json;
    }

    private JsonObject advancePermissibleYesnofocusareaSubrecipientInd(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("FocusAreaRequired", "No");
        grant.addProperty("IsAdvancePermitted", "Yes");
        if (EnvironmentFactory.getEnvironmentName().contains("TEST8") || EnvironmentFactory.getEnvironmentName().contains("AUTO")) {
            grant.addProperty("InternalOrganization", ProjectWebServices.getIdOf("Account", "Automation IND"));
        }
        newA.add(grant);
        json.add("Grant", newA);
        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 1000);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Standard Focus Area");
        buildUpItemsA.add(buildUpItems);
        json.add("BuildUpItems", buildUpItemsA);
        return json;
    }

    private JsonObject createAwarForSecondFocusAreaandBudgetCategorySubrecipientIndProfile(JsonObject json, String... Type) {
        if (EnvironmentFactory.getEnvironmentName().contains("TEST8") || EnvironmentFactory.getEnvironmentName().contains("AUTO")) {
            JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
            JsonArray newA = new JsonArray();
            grant.addProperty("InternalOrganization", ProjectWebServices.getIdOf("Account", "Automation IND"));
            newA.add(grant);
            json.add("Grant", newA);
        }
        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        json.add("AwardServiceArea", awardServiceAreaArray);

        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 500);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItemsA.add(buildUpItems);
        JsonObject buildUpItems2 = new JsonObject();
        buildUpItems2.addProperty("BudgetCategory", "Construction");
        buildUpItems2.addProperty("Title", "Construction");
        buildUpItems2.addProperty("Narrative", "Test Build-up");
        buildUpItems2.addProperty("AwardedBudget", 500);
        buildUpItems2.addProperty("CashMatch", 100);
        buildUpItems2.addProperty("NonCashMatch", 100);
        buildUpItems2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems2.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItemsA.add(buildUpItems2);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject createAwarForSecondFocusAreaandBudgetCategory(JsonObject json, String... Type) {
        JsonArray awardServiceAreaArray = new JsonArray();
        JsonObject awardServiceAreaA = new JsonObject();
        awardServiceAreaA.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceAreaA.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaA.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        JsonObject awardServiceAreaB = new JsonObject();
        awardServiceAreaB.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area2"));
        awardServiceAreaB.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaB.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (Type.length > 0) {
            if (Type[0].contains("Formula")) {
                if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                    awardServiceAreaA.addProperty("NewObligationPay", "500");
                    awardServiceAreaB.addProperty("NewObligationPay", "500");
                }
            }
        }
        awardServiceAreaArray.add(awardServiceAreaA);
        awardServiceAreaArray.add(awardServiceAreaB);
        json.add("AwardServiceArea", awardServiceAreaArray);

        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 500);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItemsA.add(buildUpItems);
        JsonObject buildUpItems2 = new JsonObject();
        buildUpItems2.addProperty("BudgetCategory", "Construction");
        buildUpItems2.addProperty("Title", "Construction");
        buildUpItems2.addProperty("Narrative", "Test Build-up");
        buildUpItems2.addProperty("AwardedBudget", 500);
        buildUpItems2.addProperty("CashMatch", 100);
        buildUpItems2.addProperty("NonCashMatch", 100);
        buildUpItems2.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems2.addProperty("ServiceAreaName", "Automation Permanent Focus Area2");
        buildUpItemsA.add(buildUpItems2);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject createAwarForIndUser(JsonObject json) {

        if (EnvironmentFactory.getEnvironmentName().contains("TEST8") || EnvironmentFactory.getEnvironmentName().contains("AUTO")) {
            JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
            JsonArray newA = new JsonArray();
            grant.addProperty("InternalOrganization", ProjectWebServices.getIdOf("Account", "Automation IND"));
            newA.add(grant);
            json.add("Grant", newA);
        }
        return json;
    }

    private JsonObject createAwarForSPIUser(JsonObject json) {

        if (EnvironmentFactory.getEnvironmentName().contains("TEST8") || EnvironmentFactory.getEnvironmentName().contains("AUTO")) {
            JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
            JsonArray newA = new JsonArray();
            grant.addProperty("InternalOrganization", ProjectWebServices.getIdOf("Account", "Product Sub Recipient Test Organization"));
            newA.add(grant);
            json.add("Grant", newA);
        }
        return json;
    }

    private JsonObject createAwarForAmendmentRequestAdvanceYesFocusNo(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required", "No");
        grant.addProperty("IsMatchRequired", "No");
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("WBSRequired", "No");
        grant.addProperty("FocusAreaRequired", "No");
        grant.addProperty("IsAdvancePermitted", "Yes");
        newA.add(grant);
        json.add("Grant", newA);
        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 1000);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Standard Focus Area");
        buildUpItemsA.add(buildUpItems);
        json.add("BuildUpItems", buildUpItemsA);
        return json;
    }

    private void updateAwardOwner(JsonObject json, String user) {
        JsonObject jsonObject = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray grantOwner = new JsonArray();
        jsonObject.addProperty("OwnerId", ProjectWebServices.getIdOf("User", user));
        grantOwner.add(jsonObject);
        json.add("Grant", grantOwner);
    }

    private JsonObject advancePermissibleYesnofocusareaProgramAnticipatedNo(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("FocusAreaRequired", "No");
        grant.addProperty("IsAdvancePermitted", "Yes");
        grant.addProperty("IsProgramIncomeAnticipated", "No");
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }

    private JsonObject advancePermissibleYesnofocusarea(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("FocusAreaRequired", "No");
        grant.addProperty("IsAdvancePermitted", "Yes");
        newA.add(grant);
        json.add("Grant", newA);
        JsonArray buildUpItemsA = new JsonArray();
        JsonObject buildUpItems = new JsonObject();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 1000);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Standard Focus Area");
        buildUpItemsA.add(buildUpItems);
        json.add("BuildUpItems", buildUpItemsA);

        return json;
    }

    private JsonObject noObjectives(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("IsGoalsRequired", "No");
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("WBSRequired", "No");
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }

    private JsonObject createStandaloneAwardUsingUser(JsonObject json, String user) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("OwnerId", ProjectWebServices.getIdOf("User", user));
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }


    private JsonObject semiAnnuallyProgressReportAward(JsonObject json) {
        JsonObject paymentRequestSchedule = json.getAsJsonArray("PaymentRequestSchedule").get(1).getAsJsonObject();
        JsonArray array = json.getAsJsonArray("PaymentRequestSchedule");
        paymentRequestSchedule.addProperty("Frequency", "Semi-Annually");
        json.add("PaymentRequestSchedule", array);
        return json;
    }

    private JsonObject quarterlyProgressReportAward(JsonObject json) {
        JsonObject paymentRequestSchedule = json.getAsJsonArray("PaymentRequestSchedule").get(1).getAsJsonObject();
        JsonArray array = json.getAsJsonArray("PaymentRequestSchedule");
        paymentRequestSchedule.addProperty("Frequency", "Quarterly");
        json.add("PaymentRequestSchedule", array);
        return json;
    }

    private JsonObject monthyProgressReportAward(JsonObject json) {
        JsonObject paymentRequestSchedule = json.getAsJsonArray("PaymentRequestSchedule").get(1).getAsJsonObject();
        JsonArray array = json.getAsJsonArray("PaymentRequestSchedule");
        paymentRequestSchedule.addProperty("Frequency", "Monthly");
        json.add("PaymentRequestSchedule", array);
        return json;
    }

    private JsonObject notapplicableProgressReportAward(JsonObject json) {
        JsonObject paymentRequestSchedule = json.getAsJsonArray("PaymentRequestSchedule").get(1).getAsJsonObject();
        JsonArray array = json.getAsJsonArray("PaymentRequestSchedule");
        paymentRequestSchedule.addProperty("Frequency", "Not-Applicable");
        json.add("PaymentRequestSchedule", array);
        return json;
    }

    private JsonObject createAwarForAmendmentRequest(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required", "No");
        grant.addProperty("IsMatchRequired", "No");
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("WBSRequired", "No");
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }

    private JsonObject createAwarForAmendmentRequestWithoutRiskAssessment(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("RiskAssessment_Required", "Yes");
        grant.addProperty("IsMatchRequired", "No");
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("WBSRequired", "No");
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }

    private JsonObject createAwardForAmendmentRequestWithBuildUpAndMatchAsYes(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required", "No");
        grant.addProperty("IsMatchRequired", "Yes");
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("WBSRequired", "No");
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }

    private JsonObject createAwardWtithNoProgramIncomeAnticipate(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required", "No");
        grant.addProperty("IsAdvancePermitted", "No");
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("WBSRequired", "No");
        grant.addProperty("IsProgramIncomeAnticipated", "No");
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }

    private JsonObject createAwardWtithBuildUpFunctionalityYes(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required", "No");
        grant.addProperty("IsProgramIncomeAnticipated", "No");
        grant.addProperty("IsBuildUpFunctionality", "Yes");
        grant.addProperty("WBSRequired", "No");
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }

    private JsonObject payloadForPaymentRequestToCreateStandaloneAward(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required", "No");
        grant.addProperty("IsAdvancePermitted", "No");
        grant.addProperty("IsBuildUpFunctionality", "No");
        grant.addProperty("WBSRequired", "No");
        newA.add(grant);
        json.add("Grant", newA);
        return json;
    }

    private JsonObject payloadForCreateStandAloneWithNORiskAssement(JsonObject defaultPayload) {
        JsonObject grant = defaultPayload.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required", "No");
        newA.add(grant);
        defaultPayload.add("Grant", newA);
        return defaultPayload;
    }

    private JsonObject payloadForCreateStandAloneWithYesRiskAssement(JsonObject defaultPayload) {
        JsonObject grant = defaultPayload.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required", "Yes");
        newA.add(grant);
        defaultPayload.add("Grant", newA);
        return defaultPayload;
    }


    /**
     * @param grantName
     * @return this method will return json object of detault request payload for creating the standalone award...
     * @see GrantorWebServices#getIdOf(String, String)
     * @see GrantorWebServices#getRecordTypeId(String, String)
     */
    public JsonObject defaultPayloadCreateStandaloneAward(String grantName, String... Type) {
        JsonObject parent = new JsonObject();

        JsonObject grant = new JsonObject();
        JsonArray grantA = new JsonArray();

        grant.addProperty("ProjectTitle", grantName);
        grant.addProperty("GrantAbbreviation", "1234");
        grant.addProperty("GrantNumber", "31231232");
        grant.addProperty("ProjectPeriodStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grant.addProperty("ProjectPeriodEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grant.addProperty("BudgetCategoryPackage", "Construction");
        grant.addProperty("GrantDescription", "API Testing For Award Activation From Direct Grant");
        grant.addProperty("ExternalOrganization", ProjectWebServices.getIdOf("Account", "Test Automation Organization"));
        grant.addProperty("InternalOrganization", ProjectWebServices.getIdOf("Account", "SAN DIEGO ELECTRICAL TRAINING TRUST"));
        grant.addProperty("Program", ProjectWebServices.getIdOf("Program__c", "Automation Permanent Internal Program"));
        grant.addProperty("DoesGrantAllowIndirect", "Yes");
        grant.addProperty("IsMatchRequired", "Yes");
        grant.addProperty("MaintenanceOfEffort", "Yes");
        grant.addProperty("LaverageAllowed", "Yes");
        grant.addProperty("IsProgramIncomeAnticipated", "Yes");
        grant.addProperty("IsAdvancePermitted", "No");
        grant.addProperty("FocusAreaRequired", "Yes");
        grant.addProperty("IsGoalsRequired", "Yes");
        grant.addProperty("KPIsRequired", "Yes");
        grant.addProperty("RiskAssessment_Required", "No");
        grant.addProperty("WBSRequired", "No");
        grant.addProperty("IsBuildUpFunctionality", "No");
        grant.addProperty("AreExpensesBuildIUpLevel", "Yes");
        grant.addProperty("GranteeMatch", 10);
        grant.addProperty("BudgetCloseoutrequestRequired", "Yes");
        grant.addProperty("CostSharing", "Cash Match");
        if (Type[0].contains("Formula")) {
            if (Type[0].equals("Formula_By_Applicant")) {
                grant.addProperty("GrantType", "Formula");
                grant.addProperty("Allocationlevel", "By Applicant");
            } else if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                grant.addProperty("GrantType", "Formula");
                grant.addProperty("AllocationLevel", "By Applicant and Focus Area");
            } else if (Type[0].equals("Formula_By_Applicant_Focus_Area_No")) {
                grant.addProperty("GrantType", "Formula");
                grant.addProperty("AllocationLevel", "By Applicant");
                grant.addProperty("FocusAreaRequired", "No");
            }
        } else if (Type[0].contains("Directed")) {
            grant.addProperty("GrantType", "Directed");
            grant.addProperty("AllocationLevel", "N/A");
        } else {
            grant.addProperty("GrantType", "Competitive");
            grant.addProperty("AllocationLevel", "N/A");
        }
        grant.addProperty("RecordTypeId", ProjectWebServices.getRecordTypeId("Grant__c", "Grantor"));
        grant.addProperty("OwnerId", ProjectWebServices.getIdOf("User", "Automation PM"));
        grantA.add(grant);
        parent.add("Grant", grantA);

        JsonObject award = new JsonObject();
        JsonArray awardArray = new JsonArray();
        award.addProperty("GrantAwardDescription", "Award Created From Automation API");
        award.addProperty("BudgetPeriodEndDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        award.addProperty("PM", ProjectWebServices.getIdOf("User", "Automation PM"));
        award.addProperty("FO", ProjectWebServices.getIdOf("User", "Automation FO"));
        award.addProperty("EXE", ProjectWebServices.getIdOf("User", "Automation EXE"));
        awardArray.add(award);
        award.addProperty("NewObligation", "1000");
        award.addProperty("TotalCommitment", "1000");
        parent.add("Award", awardArray);

        JsonObject awardFundingAccount = new JsonObject();
        JsonArray awardFundingAccountArray = new JsonArray();
        awardFundingAccount.addProperty("FundingAccount", ProjectWebServices.getIdOf("FundingAccount__c", I.amPerforming().propertiesFileOperationsTo()
                .getValue("fundingAccount")));
        awardFundingAccount.addProperty("PreEncumbranceAmount", "1000");
        awardFundingAccountArray.add(awardFundingAccount);
        parent.add("AwardFundingAccount", awardFundingAccountArray);

        JsonObject buildUpItems = new JsonObject();
        JsonArray buildUpItemsA = new JsonArray();
        buildUpItems.addProperty("BudgetCategory", "Construction");
        buildUpItems.addProperty("Title", "Construction");
        buildUpItems.addProperty("Narrative", "Test Build-up");
        buildUpItems.addProperty("AwardedBudget", 1000);
        buildUpItems.addProperty("CashMatch", 100);
        buildUpItems.addProperty("NonCashMatch", 100);
        buildUpItems.add("OtherLeverageOptional", JsonNull.INSTANCE);
        buildUpItems.addProperty("ServiceAreaName", "Automation Permanent Focus Area");
        buildUpItemsA.add(buildUpItems);
        parent.add("BuildUpItems", buildUpItemsA);

        JsonObject paymentRequestSchedule = new JsonObject();
        JsonArray schdeuleArray = new JsonArray();
        paymentRequestSchedule.addProperty("SubmissionTitle", "Grant API Test");
        paymentRequestSchedule.addProperty("CalReportingStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        paymentRequestSchedule.addProperty("CalReportingEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        paymentRequestSchedule.addProperty("Frequency", "Annually");
        paymentRequestSchedule.addProperty("ScheduleBase", "Calendar");
        paymentRequestSchedule.addProperty("SubmissionType", "Payment Request");
        schdeuleArray.add(paymentRequestSchedule);

        JsonObject progressReportSchedule = new JsonObject();
        progressReportSchedule.addProperty("SubmissionTitle", grantName);
        progressReportSchedule.addProperty("CalReportingStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReportSchedule.addProperty("CalReportingEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReportSchedule.addProperty("Frequency", "Annually");
        progressReportSchedule.addProperty("ScheduleBase", "Calendar");
        progressReportSchedule.addProperty("SubmissionType", "Progress Report");
        schdeuleArray.add(progressReportSchedule);

        parent.add("PaymentRequestSchedule", schdeuleArray);

        JsonObject awardServiceArea = new JsonObject();
        JsonArray awardServiceAreaArray = new JsonArray();
        awardServiceArea.addProperty("ServiceArea", ProjectWebServices.getIdOf("ServiceArea__c", "Automation Permanent Focus Area"));
        awardServiceArea.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceArea.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaArray.add(awardServiceArea);
        if (Type[0].contains("Formula")) {
            if (Type[0].equals("Formula_By_Applicant_Focus_Area")) {
                awardServiceArea.addProperty("NewObligationPay", "1000");
            }
        }
        parent.add("AwardServiceArea", awardServiceAreaArray);

        JsonObject kpiGoalsObjectives = new JsonObject();
        JsonArray kpiGoalsObjectivesArrays = new JsonArray();
        kpiGoalsObjectives.addProperty("StrategicPlan", ProjectWebServices.getIdOf("StrategicPlan__c", "Automation Permanent Strategic Plan"));
        kpiGoalsObjectivesArrays.add(kpiGoalsObjectives);
        parent.add("KPIGoalsObjectives", kpiGoalsObjectivesArrays);

        JsonObject keyOutcome = new JsonObject();
        JsonArray keyOutcomeArray = new JsonArray();
        keyOutcome.addProperty("MasterKPI", ProjectWebServices.getIdOf("MasterKPI__c", "Automation Permanent KPI")); // KPI id
        keyOutcome.addProperty("Target", "10");
        keyOutcomeArray.add(keyOutcome);
        parent.add("KeyOutcome", keyOutcomeArray);

        // Add key contacts
        JsonObject keyContacts = new JsonObject();
        JsonArray keyContactsArray = new JsonArray();
        keyContacts.addProperty("ProjectRole", "Project Director/Manager");
        keyContacts.addProperty("Contact", ProjectWebServices.getIdOf("Contact", "Automation SPI3")); // Automation SPI id
        keyContacts.addProperty("IsKeyContact", true);
        keyContactsArray.add(keyContacts);
        parent.add("KeyContacts", keyContactsArray);

        return parent;
    }

    public JsonObject defaultPayloadReviewApplication() {
        Map<String, String> map = ProjectWebServices.getMultipleIds(getIdsOfUsers(Arrays.asList("Automation EXE", "Automation FO", "Automation PM")));
        JsonObject parent = new JsonObject();

        JsonArray reviewStepsArray = new JsonArray();
        JsonObject complianceReview = new JsonObject();
        complianceReview.addProperty("Reviewer", map.get("Automation EXE"));
        complianceReview.addProperty("FormName", "Compliance Review");
        complianceReview.addProperty("DueInDays", 7);

        JsonObject programReview = new JsonObject();
        programReview.addProperty("Reviewer", map.get("Automation PM"));
        programReview.addProperty("FormName", "Program Review");
        programReview.addProperty("DueInDays", 7);

        JsonObject fiscalReview = new JsonObject();
        fiscalReview.addProperty("Reviewer", map.get("Automation FO"));
        fiscalReview.addProperty("FormName", "Fiscal Review");
        fiscalReview.addProperty("DueInDays", 7);

        JsonObject managementReview = new JsonObject();
        managementReview.addProperty("Reviewer", map.get("Automation FO"));
        managementReview.addProperty("FormName", "Management Review");
        managementReview.addProperty("DueInDays", 7);

        JsonObject preScreen = new JsonObject();
        preScreen.addProperty("Reviewer", map.get("Automation FO"));
        preScreen.addProperty("FormName", "Pre-Screen");
        preScreen.addProperty("DueInDays", 7);

        reviewStepsArray.add(complianceReview);
        reviewStepsArray.add(programReview);
        reviewStepsArray.add(fiscalReview);
        reviewStepsArray.add(managementReview);
        reviewStepsArray.add(preScreen);

        parent.add("ReviewSteps", reviewStepsArray);

        JsonObject FDM = new JsonObject();
        JsonArray FDMArray = new JsonArray();
        FDM.addProperty("SubawardAbbreviation", "AWD");
        FDM.addProperty("RecommendedForAward", "Yes");
        FDM.addProperty("RecommendedAmount", 1000);
        FDMArray.add(FDM);

        parent.add("FDM", FDMArray);

        return parent;
    }
}
