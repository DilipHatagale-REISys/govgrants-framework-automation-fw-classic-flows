package com.ggproduct.automation.pageobjects;

import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.controller.CoreHandlers;
import org.openqa.selenium.By;

public class AmendmentRequestPage extends ProjectManager {

    public AmendmentRequestPage(CoreHandlers reiDriver, GovGrantsHandler govgrants) {
        super(reiDriver, govgrants);
    }

    /**
     * Used to calculate revised encumbrance balance
     * @return - Revised Encumbrance balance
     * @Author - Mahadev.hanme
     */
    public Double calculateRevisedEncumbrance() {
        String awardBudget = getFieldValueFromAPI("Automation Award for Amendment Request", "GrantAwardName__c", "Award__c", "AmountAvailable__c");
        String requestedChangeInBudget = getFieldValueFromAPI("Automation Award for Amendment Request", "GrantAwardName__c", "AmendmentRequest__c", "RequestedChangeInBudget__c");
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
    public void enterRevisedEncumbrance() {
        reiDriver.findMyElement().getElement(By.xpath("//field[@field-name='ActualEncumbrance__c']/input")).clear();
        reiDriver.findMyElement().getElement(By.xpath("//field[@field-name='ActualEncumbrance__c']/input")).sendKeys(calculateRevisedEncumbrance().toString());
    }
}
