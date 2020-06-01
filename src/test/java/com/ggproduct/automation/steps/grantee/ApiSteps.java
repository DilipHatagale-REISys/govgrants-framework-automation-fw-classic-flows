package com.ggproduct.automation.steps.grantee;


import com.ggproduct.automation.projectmanager.GranteeProjectManager;
import com.ggproduct.automation.webservices.GranteeWebServices;
import io.cucumber.java.en.And;

import java.util.List;
import java.util.Map;

public class ApiSteps {
    private GranteeProjectManager granteeProjectManager;
    private GranteeWebServices granteeWebServices;

    public ApiSteps(GranteeProjectManager granteeProjectManager, GranteeWebServices granteeWebServices) {
        this.granteeProjectManager = granteeProjectManager;
        this.granteeWebServices=granteeWebServices;
    }

    @And("^I create grants record:$")
    public void createGrant(List<Map<String, String>> grantsParameters) {
        for (Map<String, String> parameters : grantsParameters) {
            granteeWebServices.createGrantsRecord(parameters.get("grantTitle"), parameters.get("grantNumber"), parameters.get("awardType"), parameters.get("fainNumber"), parameters.get("amendmentType"), parameters.get("ppStartDate"), parameters.get("ppEndDate"), parameters.get("bpStartDate"), parameters.get("bpEndDate"));
        }
    }

    @And("^I create project record:$")
    public void createProject(List<Map<String, String>> grantsParameters) {
        for (Map<String, String> parameters : grantsParameters) {
            granteeWebServices.createProjectsFocusArea(parameters.get("grantId"), parameters.get("fainNumber"));
        }
    }

    @And("^I enter project budget details:$")
    public void enterProjectsBudgetDetails(List<Map<String, String>> grantsParameters) {
        for (Map<String, String> parameters : grantsParameters) {
            granteeWebServices.createProjectsBudgetFocusAreaDetails(parameters.get("awardId"), parameters.get("fainNumber"), parameters.get("fundCode"));
        }
    }

    @And("^I execute batch file:$")
    public void batchExecutionAndRecordProcessing(List<Map<String, String>> grantsParameters) {
        for (Map<String, String> parameters : grantsParameters) {
            granteeWebServices.executeBatchFileApi(parameters.get("operationType"), parameters.get("batchName"), parameters.get("objectType"), parameters.get("recordName"), parameters.get("opportunitynumber"));
        }
    }

    @And("^I create expenditure:$")
    public void enterExpenditureCreationDetails(List<Map<String, String>> grantsParameters) {
        for (Map<String, String> parameters : grantsParameters) {
            granteeWebServices.creationExpenditureDetails(parameters.get("awardId"), parameters.get("fainNumber"), parameters.get("fundCode"), parameters.get("documentId"), parameters.get("transactionAmount"));
        }
    }

    @And("^I create drawdowns:$")
    public void enterDrawdownsCreationDetails(List<Map<String, String>> grantsParameters) {
        for (Map<String, String> parameters : grantsParameters) {
            granteeWebServices.creationDrawdownsDetails(parameters.get("awardId"), parameters.get("fainNumber"), parameters.get("code"), parameters.get("stateBudgetCategory"), parameters.get("amount"));
        }
    }
}
