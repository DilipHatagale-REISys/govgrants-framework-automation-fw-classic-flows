package com.ggproduct.automation.projectmanager;

import com.google.gson.JsonArray;
import com.google.gson.JsonNull;
import com.google.gson.JsonObject;
import com.testingblaze.register.I;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;
import java.util.Map;


public class ProjectApis extends ProjectWebServices{

    ProjectApis(){}

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

        String ownerName = "Automation SPI";
        String contactName = "Automation SPI";
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
        application.addProperty("Announcement", getIdOf("Announcement__c",announcementName));
        application.add("PreApplication", JsonNull.INSTANCE);
        application.addProperty("RecordTypeId", getRecordTypeId("Application__c","Grantor"));
        application.addProperty("OwnerId", getIdOf("User",ownerName));
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
        keyContacts.addProperty("Contact",getIdOf("Contact",contactName)); // Automation SPI id
        keyContacts.addProperty("IsKeyContact",true);
        keyContactsArray.add(keyContacts);
        parent.add("KeyContacts",keyContactsArray);

        JsonObject keyOutcome = new JsonObject();
        JsonArray keyOutcomeArray = new JsonArray();
        keyOutcome.addProperty("MasterKPI",getIdOf("MasterKPI__c",kpiName)); // KPI id
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
        Map<String, String> map = getMultipleIds(getIdsOfUsers(Arrays.asList("Automation EXE","Automation FO","Automation PM")));
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
        contact.add("Automation SPI");
        ids.add("Contact",contact);

        return ids;
    }

    public JsonObject defaultPayloadCreateAwardFromFDM(String announcementName){
        JsonObject parent = new JsonObject();
        Map<String, String> map = getMultipleIds(getIdsForCreateAwardFromFDM(announcementName));

        JsonObject grant = new JsonObject();
        JsonArray grantArray = new JsonArray();
        grant.addProperty("FDM",map.get(announcementName));
        grant.addProperty("RecordTypeId",getRecordTypeId("Grant__c","Grantor"));
        grant.addProperty("OwnerId",map.get("Automation PM"));
        grantArray.add(grant);
        parent.add("Grant",grantArray);

        JsonObject award = new JsonObject();
        JsonArray awardArray = new JsonArray();
        award.addProperty("GrantAwardDescription","Award Created From Automation API");
        award.addProperty("BudgetPeriodEndDate", I.amPerforming()
        .actionToGet().currentDateWithOffsetInDesiredFormat(365, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
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
        awardServiceArea.addProperty("GATStartDate",I.amPerforming()
                .actionToGet().currentDateWithOffsetInDesiredFormat(25, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        awardServiceArea.addProperty("GATEndDate",I.amPerforming()
                .actionToGet().currentDateWithOffsetInDesiredFormat(365, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
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
        keyContacts.addProperty("Contact",map.get("Automation SPI"));
        keyContacts.addProperty("IsKeyContact",true);
        keyContactsArray.add(keyContacts);
        parent.add("KeyContacts",keyContactsArray);

        return parent;
    }

    public JsonObject defaultPayloadActivateAwardFromFDM(){
        JsonObject parent = new JsonObject();
        JsonArray termConditionSchedule = new JsonArray();

        JsonObject paymentRequest = new JsonObject();
        paymentRequest.addProperty("SubmissionTitle","Payment Request Schedule");
        paymentRequest.addProperty("CalReportingStartDate", I.amPerforming()
                .actionToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        paymentRequest.addProperty("CalReportingEndDate", I.amPerforming()
                .actionToGet().currentDateWithOffsetInDesiredFormat(365, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        paymentRequest.addProperty("Frequency","Bi-Monthly");
        paymentRequest.addProperty("ScheduleBase","Reporting Period");
        paymentRequest.addProperty("SubmissionType","Payment Request");

        termConditionSchedule.add(paymentRequest);

        JsonObject progressReport = new JsonObject();
        progressReport.addProperty("SubmissionTitle","Progress Report Schedule");
        progressReport.addProperty("CalReportingStartDate", I.amPerforming()
                .actionToGet().currentDateWithOffsetInDesiredFormat(0, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReport.addProperty("CalReportingEndDate", I.amPerforming()
                .actionToGet().currentDateWithOffsetInDesiredFormat(365, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        progressReport.addProperty("Frequency","Bi-Monthly");
        progressReport.addProperty("ScheduleBase","Reporting Period");
        progressReport.addProperty("SubmissionType","Progress Report");
        termConditionSchedule.add(progressReport);

        parent.add("TermConditionSchedule",termConditionSchedule);

        return parent;
    }
}
