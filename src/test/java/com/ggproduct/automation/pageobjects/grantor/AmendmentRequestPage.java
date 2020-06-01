package com.ggproduct.automation.pageobjects.grantor;

import com.ggproduct.automation.projectmanager.GrantorProjectManager;
import com.testingblaze.register.I;
import org.openqa.selenium.By;

import java.time.format.DateTimeFormatter;

public class AmendmentRequestPage extends GrantorProjectManager {

    /**
     * Used to calculate revised encumbrance balance
     * @return - Revised Encumbrance balance
     * @Author - Mahadev.hanme
     */
    public Double calculateRevisedEncumbrance(String awardName) {
        String awardBudget = getFieldValueFromAPI(awardName, "GrantAwardName__c", "Award__c", "AmountAvailable__c");
        String requestedChangeInBudget = getFieldValueFromAPI(awardName, "GrantAwardName__c", "AmendmentRequest__c", "RequestedChangeInBudget__c");
        double awardBudgetInDouble = Double.parseDouble(awardBudget);
        double requestedChangeInBudgetDouble = Double.parseDouble(requestedChangeInBudget);
        if (Double.parseDouble(requestedChangeInBudget) >= 0.0) {
            return awardBudgetInDouble + requestedChangeInBudgetDouble;
        } else
            return awardBudgetInDouble - requestedChangeInBudgetDouble;
    }

    /**
     * handles to enter revised encumbrance balance on amendment request
     * @Author - Mahadev.hanme
      */
    public void enterRevisedEncumbrance(String awardName) {
        I.amPerforming().textInput().toClear(By.xpath("//field[@field-name='ActualEncumbrance__c']/input"));
        I.amPerforming().textInput().in(By.xpath("//field[@field-name='ActualEncumbrance__c']/input"),calculateRevisedEncumbrance(awardName).toString());
    }

    public void updatedBudgetPeriodEndDate(String offset, String awardName) {
        String rawDate = getFieldValueFromAPI(awardName, "GrantAwardName__c", "Award__c", "BudgetPeriodEndDate__c");
        String[] rawDateSplitted = rawDate.split(" ")[0].split("-");
        String fieldValue = rawDateSplitted[1] + "/" + rawDateSplitted[2] + "/" + rawDateSplitted[0];
        I.amPerforming().propertiesFileOperationsTo().saveValue("updatedBudgetPeriodDate", I.amPerforming().actionToGet().dateWithOffsetFromGivenDate(fieldValue,Integer.parseInt(offset),DateTimeFormatter.ofPattern("M/d/uuuu")));
    }
}
