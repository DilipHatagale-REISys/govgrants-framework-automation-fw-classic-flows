package com.ggproduct.automation.pageobjects;

import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.Register.EyeThink;
import org.openqa.selenium.By;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class AmendmentRequestPage extends ProjectManager {

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
        EyeThink.core().enterText().onWeb().clear(By.xpath("//field[@field-name='ActualEncumbrance__c']/input"));
        EyeThink.core().enterText().onWeb().enter(By.xpath("//field[@field-name='ActualEncumbrance__c']/input"),calculateRevisedEncumbrance(awardName).toString());
    }

    public void updatedBudgetPeriodEndDate() {
        String rawDate = getFieldValueFromAPI("Automation Award for Amendment Request", "GrantAwardName__c", "Award__c", "BudgetPeriodEndDate__c");
        String[] rawDateSplitted = rawDate.split(" ")[0].split("-");
        String fieldValue = rawDateSplitted[1] + "/" + rawDateSplitted[2] + "/" + rawDateSplitted[0];
        EyeThink.core().Properties().saveValue("updatedBudgetPeriodDate", EyeThink.core().get().dateWithOffsetFromGivenDate(fieldValue,1,DateTimeFormatter.ofPattern("M/d/uuuu")));
    }
}
