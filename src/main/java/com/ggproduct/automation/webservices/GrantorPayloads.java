package com.ggproduct.automation.webservices;

import com.google.gson.JsonArray;
import com.google.gson.JsonNull;
import com.google.gson.JsonObject;
import com.testingblaze.register.I;

import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;
import java.util.Map;


public class GrantorPayloads {

    public JsonObject applicationReview(String applicationName, String announcementName, String filter){
        JsonObject defaultJson = defaultPayloadApplicationReview(applicationName, announcementName);
        filter = filter.toUpperCase();

        switch (filter){
            case "APPLICATION":
                break;
            case "BUDGETCATEGORY":
                break;
            case "KYECONTACTS":
                break;
            case "KEYOUTCOME":
                break;
            default:
                return defaultJson;
        }
        return defaultJson;
    }

    public JsonObject defaultPayloadApplicationReview(String applicationName, String announcementName){

        String ownerName = "Automation SPI3";
        String contactName = "Automation SPI3";
        String kpiName = "Automation Permanent KPI for Regression";

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
        application.addProperty("Announcement", ProjectWebServices.getIdOf("Announcement__c",announcementName));
        application.add("PreApplication", JsonNull.INSTANCE);
        application.addProperty("RecordTypeId", ProjectWebServices.getRecordTypeId("Application__c","Grantor"));
        application.addProperty("OwnerId", ProjectWebServices.getIdOf("User",ownerName));
        applicationArray.add(application);
        parent.add("Application",applicationArray);

        JsonObject budgetCategory = new JsonObject();
        JsonArray budgetCategoryArray = new JsonArray();
        budgetCategory.addProperty("BudgetCategory","Construction");
        budgetCategory.addProperty("BudgetRequest",1000);
        budgetCategory.addProperty("CashMatch",100);
        budgetCategory.add("NonCashMatch", JsonNull.INSTANCE);
        budgetCategory.add("OtherLeverageOptional", JsonNull.INSTANCE);
        budgetCategoryArray.add(budgetCategory);
        parent.add("BudgetCategory",budgetCategoryArray);

        JsonObject keyContacts = new JsonObject();
        JsonArray keyContactsArray = new JsonArray();
        keyContacts.addProperty("ProjectRole","Project Director/Manager");
        keyContacts.addProperty("Contact",ProjectWebServices.getIdOf("Contact",contactName)); // Automation SPI id
        keyContacts.addProperty("IsKeyContact",true);
        keyContactsArray.add(keyContacts);
        parent.add("KeyContact",keyContactsArray);

        JsonObject keyOutcome = new JsonObject();
        JsonArray keyOutcomeArray = new JsonArray();
        keyOutcome.addProperty("MasterKPI",ProjectWebServices.getIdOf("MasterKPI__c",kpiName)); // KPI id
        keyOutcome.addProperty("Target","10");
        keyOutcomeArray.add(keyOutcome);
        parent.add("KeyOutcome",keyOutcomeArray);

        return parent;
    }

    private JsonObject getIdsOfUsers(List<String> users){
        JsonObject idsApi = new JsonObject();
        JsonArray usersArray = new JsonArray();
        for(String user : users){
            usersArray.add(user);
        }
        idsApi.add("User",usersArray);
        return idsApi;
    }

    public JsonObject defaultRequestPayroleForApprovedDFM(){
        Map<String, String> map = ProjectWebServices.getMultipleIds(getIdsOfUsers(Arrays.asList("Automation EXE","Automation FO","Automation PM")));
        JsonObject parent = new JsonObject();

        JsonArray reviewStepsArray = new JsonArray();
        JsonObject complianceReview = new JsonObject();
        complianceReview.addProperty("Reviewer",map.get("Automation EXE"));
        complianceReview.addProperty("FormName","Compliance Review");
        complianceReview.addProperty("DueInDays",7);

        JsonObject programReview = new JsonObject();
        programReview.addProperty("Reviewer",map.get("Automation PM"));
        programReview.addProperty("FormName","Program Review");
        programReview.addProperty("DueInDays",7);

        JsonObject fiscalReview = new JsonObject();
        fiscalReview.addProperty("Reviewer",map.get("Automation FO"));
        fiscalReview.addProperty("FormName","Fiscal Review");
        fiscalReview.addProperty("DueInDays",7);

        JsonObject managementReview = new JsonObject();
        managementReview.addProperty("Reviewer",map.get("Automation FO"));
        managementReview.addProperty("FormName","Management Review");
        managementReview.addProperty("DueInDays",7);

        JsonObject preScreen = new JsonObject();
        preScreen.addProperty("Reviewer",map.get("Automation FO"));
        preScreen.addProperty("FormName","Pre-Screen");
        preScreen.addProperty("DueInDays",7);

        reviewStepsArray.add(complianceReview);
        reviewStepsArray.add(programReview);
        reviewStepsArray.add(fiscalReview);
        reviewStepsArray.add(managementReview);
        reviewStepsArray.add(preScreen);

        parent.add("ReviewSteps",reviewStepsArray);

        JsonObject FDM = new JsonObject();
        JsonArray FDMArray = new JsonArray();
        FDM.addProperty("SubawardAbbreviation","AWD");
        FDM.addProperty("RecommendedForAward","Yes");
        FDM.addProperty("RecommendedAmount",1000);
        FDMArray.add(FDM);

        parent.add("FDM",FDMArray);

        return parent;
    }

    public JsonObject getIdsForCreateAwardFromFDM(String annName){

        JsonObject ids = new JsonObject();

        JsonArray fdmA = new JsonArray();
        fdmA.add(annName);
        ids.add("ReviewStep__c",fdmA);

        JsonArray user = new JsonArray();
        user.add("Automation PM");
        ids.add("User",user);

        JsonArray service_area = new JsonArray();
        service_area.add("Automation Permanent Focus Area");
        ids.add("ServiceArea__c",service_area);

        JsonArray strategic_plan = new JsonArray();
        strategic_plan.add("Automation Permanent Strategic Plan");
        ids.add("StrategicPlan__c",strategic_plan);

        JsonArray kpi = new JsonArray();
        kpi.add("Automation Permanent KPI for Regression");
        ids.add("MasterKPI__c",kpi);

        JsonArray contact = new JsonArray();
        contact.add("Automation SPI3");
        ids.add("Contact",contact);

        return ids;
    }

    public JsonObject defaultPayloadCreateAwardFromFDM(String announcementName){
        JsonObject parent = new JsonObject();
        Map<String, String> map = ProjectWebServices.getMultipleIds(getIdsForCreateAwardFromFDM(announcementName));

        JsonObject grant = new JsonObject();
        JsonArray grantArray = new JsonArray();
        grant.addProperty("FDM",map.get(announcementName));
        grant.addProperty("RecordTypeId",ProjectWebServices.getRecordTypeId("Grant__c","Grantor"));
        grant.addProperty("OwnerId",map.get("Automation PM"));
        grantArray.add(grant);
        parent.add("Grant",grantArray);

        JsonObject award = new JsonObject();
        JsonArray awardArray = new JsonArray();
        award.addProperty("GrantAwardDescription","Award Created From Automation API");
        award.addProperty("BudgetPeriodEndDate", I.amPerforming()
        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(150, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        award.addProperty("PM",ProjectWebServices.getIdOf("User","Automation PM"));
        award.addProperty("FO",ProjectWebServices.getIdOf("User","Automation FO"));
        award.addProperty("EXE",ProjectWebServices.getIdOf("User","Automation EXE"));
        awardArray.add(award);
        parent.add("Award",awardArray);

        JsonObject awardFundingAccount = new JsonObject();
        JsonArray awardFundingAccountArray = new JsonArray();
        awardFundingAccount.addProperty("PreEncumbranceAmount","1000");
        awardFundingAccountArray.add(awardFundingAccount);
        parent.add("AwardFundingAccount",awardFundingAccountArray);

        JsonObject awardBudgetCategory = new JsonObject();
        JsonArray awardBudgetCategoryArray = new JsonArray();
        awardBudgetCategory.addProperty("BudgetCategory","Construction");
        awardBudgetCategory.addProperty("AwardedBudget","1000");
        awardBudgetCategory.addProperty("CashMatch","100");
        awardBudgetCategory.add("OtherLeverage", JsonNull.INSTANCE);
        awardBudgetCategoryArray.add(awardBudgetCategory);
        parent.add("AwardBudgetCategory",awardBudgetCategoryArray);

        JsonObject awardServiceArea = new JsonObject();
        JsonArray awardServiceAreaArray = new JsonArray();
        awardServiceArea.addProperty("ServiceArea",map.get("Automation Permanent Focus Area"));
        awardServiceArea.add("GATStartDate",JsonNull.INSTANCE);
        awardServiceArea.add("GATEndDate",JsonNull.INSTANCE);
        awardServiceAreaArray.add(awardServiceArea);
        parent.add("AwardServiceArea",awardServiceAreaArray);

        JsonObject kpiGoalsObjectives = new JsonObject();
        JsonArray kpiGoalsObjectivesArrays = new JsonArray();
        kpiGoalsObjectives.addProperty("StrategicPlan",map.get("Automation Permanent Strategic Plan"));
        kpiGoalsObjectivesArrays.add(kpiGoalsObjectives);
        parent.add("KPIGoalsObjectives",kpiGoalsObjectivesArrays);

        JsonObject keyOutcome = new JsonObject();
        JsonArray keyOutcomeArray = new JsonArray();
        keyOutcome.addProperty("MasterKPI",map.get("Automation Permanent KPI for Regression"));
        keyOutcome.addProperty("Target","10");
        keyOutcomeArray.add(keyOutcome);
        parent.add("KeyOutcome",keyOutcomeArray);

        JsonObject keyContacts = new JsonObject();
        JsonArray keyContactsArray = new JsonArray();
        keyContacts.addProperty("ProjectRole","Project Director/Manager");
        keyContacts.addProperty("Contact",map.get("Automation SPI3"));
        keyContacts.addProperty("IsKeyContact",true);
        keyContactsArray.add(keyContacts);
        parent.add("KeyContacts",keyContactsArray);

        return parent;
    }

    /**
     * @return
     */
    public JsonObject defaultPayloadActivateAwardFromFDM(){
        JsonObject parent = new JsonObject();
        JsonArray termConditionSchedule = new JsonArray();

        JsonObject paymentRequest = new JsonObject();
        paymentRequest.addProperty("SubmissionTitle","Payment Request Schedule");
        paymentRequest.addProperty("CalReportingStartDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        paymentRequest.addProperty("CalReportingEndDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(150, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        paymentRequest.addProperty("Frequency","Bi-Monthly");
        paymentRequest.addProperty("ScheduleBase","Reporting Period");
        paymentRequest.addProperty("SubmissionType","Payment Request");

        termConditionSchedule.add(paymentRequest);

        JsonObject progressReport = new JsonObject();
        progressReport.addProperty("SubmissionTitle","Progress Report Schedule");
        progressReport.addProperty("CalReportingStartDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReport.addProperty("CalReportingEndDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(150, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReport.addProperty("Frequency","Bi-Monthly");
        progressReport.addProperty("ScheduleBase","Reporting Period");
        progressReport.addProperty("SubmissionType","Progress Report");
        termConditionSchedule.add(progressReport);

        parent.add("TermConditionSchedule",termConditionSchedule);

        return parent;
    }


    /**
     * @param annType
     * @param annName
     * @param filter
     * @return
     * This method include switch cases. If we wants to change the some parameter from the default payload returned by method
     * @see #getDefaultPayloadPublishAnn(String,String) then we can simply create our own method having parameter(this parameter would be json object return
     * by method getDefaultPayloadPublishAnn(String,String)) and then we can create out own swtich case and call that method under this switch case. And pass
     * this switch cases from feature step....
     * e.g take a look at BUDGETPERIODDATES case below...
     */
    public JsonObject publishAnnPayload(String annType, String annName, String filter){
        JsonObject json = getDefaultPayloadPublishAnn(annType, annName);
        filter = filter.toUpperCase();

        switch (filter){
            case "BUDGETPERIODDATES":
                return updateBudgetPeridDateForAnnouncement(json);
            case "NO_RISK_ASSESSMENT":
                return updateRiskAssesmentAsNoForAnnouncement(json);
            case "PRE_APPLICATION_YES":
                return updatePreApplicationAsYesForAnnouncement(json);
            case "FOCUS_AREA_NO":
                return updateFocusAreaForAnnouncement(json,"No");
            case "NEGOTIATION":
                return negotiationYesForAnnouncement(json);
            case "PRE_APP_YES_FOCUS_AREA_NO":
                return preAppYesFocusAreaNoAnnouncement(json);
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
            case "SUB_MATCH_YES_RISK_YES_EXPENSE_YES_ADVANCE_YES":
                return subMatchYesRequiredMatch10RiskYesExpenseYesAdvacnceYesAnnouncement(json);

            default:
                return json;
        }
    }

    private JsonObject updateMachRequiredToNoAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("IsMatchRequired","No");
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject todayPreAppDueDateAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationNeeded","Yes");
        jsonObject.addProperty("PreApplicationDueDate",I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        jsonObject.addProperty("ApplicationDueDate",I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject pastAppDueDateAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationDueDate",I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(-1, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        jsonObject.addProperty("ApplicationDueDate",I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(-1, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject todayAppDueDateAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationDueDate",I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        jsonObject.addProperty("ApplicationDueDate",I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject preAppYesProgramIncomeNoForAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationNeeded","Yes");
        jsonObject.addProperty("IsProgramIncomeAnticipated","No");
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject preAppYesGoalsYesForAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationNeeded","Yes");
        jsonObject.addProperty("IsGoalsRequired","Yes");
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject preAppYesFocusAreaNoAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("PreApplicationNeeded","Yes");
        jsonObject.addProperty("FocusAreaRequired","No");
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }
    private JsonObject subMatchYesRequiredMatch10RiskYesExpenseYesAdvacnceYesAnnouncement(JsonObject json) {
        JsonObject jsonObject = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        jsonObject.addProperty("IsMatchRequired","Yes");
        jsonObject.addProperty("GranteeMatch",10);
        jsonObject.addProperty("RiskAssessment_Required","Yes");
        jsonObject.addProperty("AreExpensesBuildIUpLevel","Yes");
        jsonObject.addProperty("IsAdvancePermitted","Yes");
        pre.add(jsonObject);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject goalsYesForAnnouncement(JsonObject json) {
        JsonObject goals = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        goals.addProperty("IsGoalsRequired","Yes");
        pre.add(goals);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject negotiationYesForAnnouncement(JsonObject json) {
        JsonObject negotiation = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        negotiation.addProperty("IsNegotiationsAllowed","Yes");
        pre.add(negotiation);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject updateFocusAreaForAnnouncement(JsonObject json, String no) {
        JsonObject pre_application = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        pre_application.addProperty("FocusAreaRequired",no);
        pre.add(pre_application);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject updatePreApplicationAsYesForAnnouncement(JsonObject json) {
        JsonObject pre_application = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray pre = new JsonArray();
        pre_application.addProperty("PreApplicationNeeded","Yes");
        pre.add(pre_application);
        json.add("Announcement",pre);
        return json;
    }

    private JsonObject updateRiskAssesmentAsNoForAnnouncement(JsonObject json) {
        JsonObject risk_assessment = json.getAsJsonArray("Announcement").get(0).getAsJsonObject();
        JsonArray risk = new JsonArray();
        risk_assessment.addProperty("RiskAssessment_Required","No");
        risk.add(risk_assessment);
        json.add("Announcement",risk);
        return json;
    }

    private JsonObject updateBudgetPeridDateForAnnouncement(JsonObject json) {

        JsonObject bperiod = json.getAsJsonArray("BudgetPeriod").get(0).getAsJsonObject();
        JsonArray bperiodA = new JsonArray();

        bperiod.addProperty("BudgetStartDate",
                I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(11, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        bperiodA.add(bperiod);
        json.add("BudgetPeriod",bperiodA);
        return json;
    }

    /**
     * @param annType Formula, Competitive Directed
     * @param annName any name
     * @return JsonObject
     * This method return the default request payload for publishing the announcement
     */
    public JsonObject getDefaultPayloadPublishAnn(String annType, String annName){

        String program = "Automation Permanent Internal Program";
        JsonObject parent = new JsonObject();

        JsonObject ann = new JsonObject();
        JsonArray annA = new JsonArray();

        ann.addProperty("name",annName);
        ann.addProperty("AnnouncementType",annType);
        ann.addProperty("Program",ProjectWebServices.getIdOf("Program__c",program));
        ann.addProperty("BudgetType","Non-Construction");
        ann.addProperty("MaxApplicationsAllowed",500);
        ann.addProperty("IsMatchRequired","Yes");
        ann.addProperty("GranteeMatch",10);
        ann.addProperty("IsProgramIncomeAnticipated","Yes");
        ann.addProperty("LaverageAllowed","Yes");
        ann.addProperty("PreApplicationNeeded","No");
        ann.addProperty("PreApplicationDueDate",I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(10, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        ann.addProperty("ApplicationDueDate",I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(10, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        ann.addProperty("FocusAreaRequired","Yes");
        ann.addProperty("IsGoalsRequired","Yes");
        ann.addProperty("KPIsRequired","Yes");
        ann.addProperty("WBSRequired","No");
        ann.addProperty("RiskAssessment_Required","Yes");
        ann.addProperty("AreExpensesBuildIUpLevel","No");
        ann.addProperty("IsAdvancePermitted","No");
        ann.addProperty("IsNegotiationsAllowed","Yes");
        ann.addProperty("EligibleApplicantTypes","04;05");
        ann.addProperty("AwardFloor",1000);
        ann.addProperty("AwardCeiling",10000);
        ann.addProperty("EstimatedFundingAmount",10000);
        ann.addProperty("OwnerId",ProjectWebServices.getIdOf("User","Automation PM"));
        ann.addProperty("RecordTypeId",ProjectWebServices.getRecordTypeId("Announcement__c","Grantor"));

        annA.add(ann);
        parent.add("Announcement",annA);

        JsonObject serviceArea = new JsonObject();
        JsonArray serviceAreaA = new JsonArray();
        serviceArea.add("ServiceArea", JsonNull.INSTANCE);
        serviceAreaA.add(serviceArea);
        parent.add("AnnouncementServiceArea",serviceAreaA);

        JsonObject awardFundingAccount = new JsonObject();
        JsonArray awardFundingAccountArray = new JsonArray();
        awardFundingAccount.addProperty("FundingAccount",ProjectWebServices.getIdOf("FundingAccount__c",I.amPerforming().propertiesFileOperationsTo()
        .getValue("fundingAccount")));
        awardFundingAccount.addProperty("PreEncumbranceAmount","1000");
        awardFundingAccountArray.add(awardFundingAccount);
        parent.add("AwardFundingAccount",awardFundingAccountArray);

        JsonObject kpiGoalsObjectives = new JsonObject();
        JsonArray kpiGoalsObjectivesArrays = new JsonArray();
        kpiGoalsObjectives.add("StrategicPlan",JsonNull.INSTANCE);
        kpiGoalsObjectivesArrays.add(kpiGoalsObjectives);
        parent.add("KPIGoalsObjectives",kpiGoalsObjectivesArrays);

        JsonObject keyOutcome = new JsonObject();
        JsonArray keyOutcomeArray = new JsonArray();
        keyOutcome.add("MasterKPI",JsonNull.INSTANCE);
        keyOutcomeArray.add(keyOutcome);
        parent.add("KeyOutcome",keyOutcomeArray);

        JsonObject budgetPeriod = new JsonObject();
        JsonArray budgetPeriodArray = new JsonArray();

        budgetPeriod.addProperty("BudgetStartDate",I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(50, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        budgetPeriod.addProperty("BudgetEndDate",I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(150, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        budgetPeriodArray.add(budgetPeriod);
        parent.add("BudgetPeriod",budgetPeriodArray);

        JsonObject invApp = new JsonObject();
        JsonArray invAppA = new JsonArray();
        invApp.addProperty("Organization",ProjectWebServices.getIdOf("Account","SAN DIEGO ELECTRICAL TRAINING TRUST"));
        invApp.addProperty("AllocatedAmount",2000);
        invAppA.add(invApp);
        parent.add("InvitedApplicant",invAppA);

        return parent;
    }

    /**
     * @param grantName
     * @param filter
     * @return
     * This method include switch cases. If we wants to change the some parameter from the default payload returned by method
     * @see #defaultPayloadCreateStandaloneAward(String) then we can simply create our own method having parameter(this parameter would be json object return
     * by method defaultPayloadCreateStandaloneAward(String)) and then we can create out own swtich case and call that method under this switch case. And pass
     * this switch cases from feature step....
     */
    public JsonObject payloadForCreateStandaloneAward(String grantName, String filter){
        String user = "";
        if(!filter.toLowerCase().contains("user")){
            filter = filter.toUpperCase();
        } else {
            user = filter.replace("user","").trim();
            filter = "USER";
        }
        JsonObject json = defaultPayloadCreateStandaloneAward(grantName);

        switch (filter){
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
            case "USER":
                return createStandaloneAwardUsingUser(json, user);
            default:
                return json;
        }
    }

    private JsonObject noObjectives(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("IsGoalsRequired","No");
        grant.addProperty("IsBuildUpFunctionality","Yes");
        grant.addProperty("WBSRequired","No");
        newA.add(grant);
        json.add("Grant",newA);
        return json;
    }

    private JsonObject createStandaloneAwardUsingUser(JsonObject json, String user) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();
        grant.addProperty("OwnerId",ProjectWebServices.getIdOf("User",user));
        newA.add(grant);
        json.add("Grant",newA);
        return json;
    }


    private JsonObject semiAnnuallyProgressReportAward(JsonObject json) {
        JsonObject paymentRequestSchedule = json.getAsJsonArray("PaymentRequestSchedule").get(1).getAsJsonObject();
        JsonArray array = json.getAsJsonArray("PaymentRequestSchedule");
        paymentRequestSchedule.addProperty("Frequency", "Semi-Annually");
        json.add("PaymentRequestSchedule",array);
        return json;
    }

    private JsonObject quarterlyProgressReportAward(JsonObject json) {
        JsonObject paymentRequestSchedule = json.getAsJsonArray("PaymentRequestSchedule").get(1).getAsJsonObject();
        JsonArray array = json.getAsJsonArray("PaymentRequestSchedule");
        paymentRequestSchedule.addProperty("Frequency", "Quarterly");
        json.add("PaymentRequestSchedule",array);
        return json;
    }

    private JsonObject monthyProgressReportAward(JsonObject json) {
        JsonObject paymentRequestSchedule = json.getAsJsonArray("PaymentRequestSchedule").get(1).getAsJsonObject();
        JsonArray array = json.getAsJsonArray("PaymentRequestSchedule");
        paymentRequestSchedule.addProperty("Frequency", "Monthly");
        json.add("PaymentRequestSchedule",array);
        return json;
    }

    private JsonObject notapplicableProgressReportAward(JsonObject json) {
        JsonObject paymentRequestSchedule = json.getAsJsonArray("PaymentRequestSchedule").get(1).getAsJsonObject();
        JsonArray array = json.getAsJsonArray("PaymentRequestSchedule");
        paymentRequestSchedule.addProperty("Frequency", "Not-Applicable");
        json.add("PaymentRequestSchedule",array);
        return json;
    }

    private JsonObject createAwarForAmendmentRequest(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required","Yes");
        grant.addProperty("IsMatchRequired","No");
        grant.addProperty("IsBuildUpFunctionality","Yes");
        grant.addProperty("WBSRequired","No");
        newA.add(grant);
        json.add("Grant",newA);
        return json;
    }

    private JsonObject createAwardForAmendmentRequestWithBuildUpAndMatchAsYes(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required","Yes");
        grant.addProperty("IsMatchRequired","Yes");
        grant.addProperty("IsBuildUpFunctionality","Yes");
        grant.addProperty("WBSRequired","No");
        newA.add(grant);
        json.add("Grant",newA);
        return json;
    }

    private JsonObject createAwardWtithNoProgramIncomeAnticipate(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required","No");
        grant.addProperty("IsAdvancePermitted","Yes");
        grant.addProperty("IsBuildUpFunctionality","Yes");
        grant.addProperty("WBSRequired","No");
        grant.addProperty("IsProgramIncomeAnticipated","No");
        newA.add(grant);
        json.add("Grant",newA);
        return json;
    }

    private JsonObject createAwardWtithBuildUpFunctionalityYes(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required","Yes");
        grant.addProperty("IsProgramIncomeAnticipated","No");
        grant.addProperty("IsBuildUpFunctionality","No");
        grant.addProperty("WBSRequired","No");
        newA.add(grant);
        json.add("Grant",newA);
        return json;
    }

    private JsonObject payloadForPaymentRequestToCreateStandaloneAward(JsonObject json) {
        JsonObject grant = json.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required","No");
        grant.addProperty("IsAdvancePermitted","No");
        grant.addProperty("IsBuildUpFunctionality","No");
        grant.addProperty("WBSRequired","No");
        newA.add(grant);
        json.add("Grant",newA);
        return json;
    }

    private JsonObject payloadForCreateStandAloneWithNORiskAssement(JsonObject defaultPayload) {
       JsonObject grant = defaultPayload.getAsJsonArray("Grant").get(0).getAsJsonObject();
       JsonArray newA = new JsonArray();

       grant.addProperty("RiskAssessment_Required","No");
       newA.add(grant);
       defaultPayload.add("Grant",newA);
       return defaultPayload;
    }

    private JsonObject payloadForCreateStandAloneWithYesRiskAssement(JsonObject defaultPayload) {
        JsonObject grant = defaultPayload.getAsJsonArray("Grant").get(0).getAsJsonObject();
        JsonArray newA = new JsonArray();

        grant.addProperty("RiskAssessment_Required","Yes");
        newA.add(grant);
        defaultPayload.add("Grant",newA);
        return defaultPayload;
    }


    /**
     * @param grantName
     * @return this method will return json object of detault request payload for creating the standalone award...
     * @see GrantorWebServices#getIdOf(String, String)
     * @see GrantorWebServices#getRecordTypeId(String, String)
     */
    public JsonObject defaultPayloadCreateStandaloneAward(String grantName){
        JsonObject parent = new JsonObject();

        JsonObject grant = new JsonObject();
        JsonArray grantA = new JsonArray();

        grant.addProperty("ProjectTitle",grantName);
        grant.addProperty("GrantAbbreviation","1234");
        grant.addProperty("GrantNumber","31231232");
        grant.addProperty("ProjectPeriodStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grant.addProperty("ProjectPeriodEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        grant.addProperty("BudgetCategoryPackage","Construction");
        grant.addProperty("GrantType","Formula Grant");
        grant.addProperty("GrantDescription","API Testing For Award Activation From Direct Grant");
        grant.addProperty("ExternalOrganization",ProjectWebServices.getIdOf("Account","Test Automation Organization"));
        grant.addProperty("InternalOrganization",ProjectWebServices.getIdOf("Account","SAN DIEGO ELECTRICAL TRAINING TRUST"));
        grant.addProperty("Program",ProjectWebServices.getIdOf("Program__c","Automation Permanent Internal Program"));
        grant.addProperty("DoesGrantAllowIndirect","Yes");
        grant.addProperty("IsMatchRequired","Yes");
        grant.addProperty("MaintenanceOfEffort","Yes");
        grant.addProperty("LaverageAllowed","Yes");
        grant.addProperty("IsProgramIncomeAnticipated","Yes");
        grant.addProperty("IsAdvancePermitted","Yes");
        grant.addProperty("FocusAreaRequired","Yes");
        grant.addProperty("IsGoalsRequired","Yes");
        grant.addProperty("KPIsRequired","Yes");
        grant.addProperty("RiskAssessment_Required","No");
        grant.addProperty("WBSRequired","No");
        grant.addProperty("IsBuildUpFunctionality","No");
        grant.addProperty("AreExpensesBuildIUpLevel","Yes");
        grant.addProperty("GranteeMatch",10);
        grant.addProperty("BudgetCloseoutrequestRequired","Yes");
        grant.addProperty("CostSharing","Cash Match");
        grant.addProperty("RecordTypeId",ProjectWebServices.getRecordTypeId("Grant__c","Grantor"));
        grant.addProperty("OwnerId",ProjectWebServices.getIdOf("User","Automation PM"));
        grantA.add(grant);
        parent.add("Grant",grantA);

        JsonObject award = new JsonObject();
        JsonArray awardArray = new JsonArray();
        award.addProperty("GrantAwardDescription","Award Created From Automation API");
        award.addProperty("BudgetPeriodEndDate", I.amPerforming()
                .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        award.addProperty("PM",ProjectWebServices.getIdOf("User","Automation PM"));
        award.addProperty("FO",ProjectWebServices.getIdOf("User","Automation FO"));
        award.addProperty("EXE",ProjectWebServices.getIdOf("User","Automation EXE"));
        awardArray.add(award);
        parent.add("Award",awardArray);

        JsonObject awardFundingAccount = new JsonObject();
        JsonArray awardFundingAccountArray = new JsonArray();
        awardFundingAccount.addProperty("FundingAccount",ProjectWebServices.getIdOf("FundingAccount__c",I.amPerforming().propertiesFileOperationsTo()
                .getValue("fundingAccount")));
        awardFundingAccount.addProperty("PreEncumbranceAmount","1000");
        awardFundingAccountArray.add(awardFundingAccount);
        parent.add("AwardFundingAccount",awardFundingAccountArray);

        JsonObject buildUpItems = new JsonObject();
        JsonArray buildUpItemsA = new JsonArray();
        buildUpItems.addProperty("BudgetCategory","Construction");
        buildUpItems.addProperty("Title","Construction");
        buildUpItems.addProperty("Narrative","Test Build-up");
        buildUpItems.addProperty("AwardedBudget",1000);
        buildUpItems.addProperty("CashMatch",100);
        buildUpItems.addProperty("NonCashMatch",100);
        buildUpItems.add("OtherLeverageOptional",JsonNull.INSTANCE);
        buildUpItemsA.add(buildUpItems);
        parent.add("BuildUpItems",buildUpItemsA);

        JsonObject paymentRequestSchedule = new JsonObject();
        JsonArray schdeuleArray = new JsonArray();
        paymentRequestSchedule.addProperty("SubmissionTitle","Grant API Test");
        paymentRequestSchedule.addProperty("CalReportingStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        paymentRequestSchedule.addProperty("CalReportingEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        paymentRequestSchedule.addProperty("Frequency","Annually");
        paymentRequestSchedule.addProperty("ScheduleBase","Calendar");
        paymentRequestSchedule.addProperty("SubmissionType","Payment Request");
        schdeuleArray.add(paymentRequestSchedule);

        JsonObject progressReportSchedule = new JsonObject();
        progressReportSchedule.addProperty("SubmissionTitle",grantName);
        progressReportSchedule.addProperty("CalReportingStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReportSchedule.addProperty("CalReportingEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReportSchedule.addProperty("Frequency","Annually");
        progressReportSchedule.addProperty("ScheduleBase","Calendar");
        progressReportSchedule.addProperty("SubmissionType","Progress Report");
        schdeuleArray.add(progressReportSchedule);

        parent.add("PaymentRequestSchedule",schdeuleArray);

        JsonObject awardServiceArea = new JsonObject();
        JsonArray awardServiceAreaArray = new JsonArray();
        awardServiceArea.addProperty("ServiceArea",ProjectWebServices.getIdOf("ServiceArea__c","Automation Permanent Focus Area"));
        awardServiceArea.addProperty("GATStartDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceArea.addProperty("GATEndDate",
                I.amPerforming()
                        .dateOperationsToGet().currentDateWithOffsetInDesiredFormat(3650, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceAreaArray.add(awardServiceArea);
        parent.add("AwardServiceArea",awardServiceAreaArray);

        JsonObject kpiGoalsObjectives = new JsonObject();
        JsonArray kpiGoalsObjectivesArrays = new JsonArray();
        kpiGoalsObjectives.addProperty("StrategicPlan",ProjectWebServices.getIdOf("StrategicPlan__c","Automation Permanent Strategic Plan"));
        kpiGoalsObjectivesArrays.add(kpiGoalsObjectives);
        parent.add("KPIGoalsObjectives",kpiGoalsObjectivesArrays);

        JsonObject keyOutcome = new JsonObject();
        JsonArray keyOutcomeArray = new JsonArray();
        keyOutcome.addProperty("MasterKPI",ProjectWebServices.getIdOf("MasterKPI__c","Automation Permanent KPI for Regression")); // KPI id
        keyOutcome.addProperty("Target","10");
        keyOutcomeArray.add(keyOutcome);
        parent.add("KeyOutcome",keyOutcomeArray);

        // Add key contacts
        JsonObject keyContacts = new JsonObject();
        JsonArray keyContactsArray = new JsonArray();
        keyContacts.addProperty("ProjectRole","Project Director/Manager");
        keyContacts.addProperty("Contact",ProjectWebServices.getIdOf("Contact","Automation SPI3")); // Automation SPI id
        keyContacts.addProperty("IsKeyContact",true);
        keyContactsArray.add(keyContacts);
        parent.add("KeyContacts",keyContactsArray);

        return parent;
    }

    public JsonObject defaultPayloadReviewApplication() {
        Map<String, String> map = ProjectWebServices.getMultipleIds(getIdsOfUsers(Arrays.asList("Automation EXE","Automation FO","Automation PM")));
        JsonObject parent = new JsonObject();

        JsonArray reviewStepsArray = new JsonArray();
        JsonObject complianceReview = new JsonObject();
        complianceReview.addProperty("Reviewer",map.get("Automation EXE"));
        complianceReview.addProperty("FormName","Compliance Review");
        complianceReview.addProperty("DueInDays",7);

        JsonObject programReview = new JsonObject();
        programReview.addProperty("Reviewer",map.get("Automation PM"));
        programReview.addProperty("FormName","Program Review");
        programReview.addProperty("DueInDays",7);

        JsonObject fiscalReview = new JsonObject();
        fiscalReview.addProperty("Reviewer",map.get("Automation FO"));
        fiscalReview.addProperty("FormName","Fiscal Review");
        fiscalReview.addProperty("DueInDays",7);

        JsonObject managementReview = new JsonObject();
        managementReview.addProperty("Reviewer",map.get("Automation FO"));
        managementReview.addProperty("FormName","Management Review");
        managementReview.addProperty("DueInDays",7);

        JsonObject preScreen = new JsonObject();
        preScreen.addProperty("Reviewer",map.get("Automation FO"));
        preScreen.addProperty("FormName","Pre-Screen");
        preScreen.addProperty("DueInDays",7);

        reviewStepsArray.add(complianceReview);
        reviewStepsArray.add(programReview);
        reviewStepsArray.add(fiscalReview);
        reviewStepsArray.add(managementReview);
        reviewStepsArray.add(preScreen);

        parent.add("ReviewSteps",reviewStepsArray);

        JsonObject FDM = new JsonObject();
        JsonArray FDMArray = new JsonArray();
        FDM.addProperty("SubawardAbbreviation","AWD");
        FDM.addProperty("RecommendedForAward","Yes");
        FDM.addProperty("RecommendedAmount",1000);
        FDMArray.add(FDM);

        parent.add("FDM",FDMArray);

        return parent;
    }
}
