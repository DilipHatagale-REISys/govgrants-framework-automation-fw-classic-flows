package com.ggproduct.automation.pageobjects;

import org.openqa.selenium.By;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.projectmanager.ProjectManager;

public class HomePage extends ProjectManager {
    private final By scrollTo, internalOrgName, code, EIN, grantingAgencyCheck, isActiveAgency, internalOrgViewIcon,
            organizationLevelPath, agencyAbbreviationPath;

    public HomePage(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
        scrollTo = By.xpath("//tfoot");
        internalOrgName = By.xpath("//span[@id='Name']/div/input");
        code = By.xpath("//span[@id='Code__c']/input[@type='text']");
        EIN = By.xpath("//span[@id='EINText__c']/input[@type='text']");
        grantingAgencyCheck = By.xpath("//span[@id='IsGrantingAgency__c']/input[@type='checkbox']");
        isActiveAgency = By.xpath("//span[@id='IsActiveAgency__c']/input[@type='checkbox']");
        internalOrgViewIcon = By.xpath(
                "//span[@title='Internal Automation Organization Test']/../../../following-sibling::td/div//span/a/span/i[@class='fa fa-eye']");
        organizationLevelPath = By.xpath("//label[text()=' Organization Level ']/..//select");
        agencyAbbreviationPath = By.xpath("//span[@id='Abbreviation__c']//input[@type='text']");
    }

    /**
     * Clicks on flextable button
     * 
     * @param buttonName
     */
    public void clickOnFlexTableButton(String buttonName) {
        reiDriver.WaitFor().WaitForElementListToBePresent(scrollTo);
        reiDriver.JavaScript().scrollpageToSpecificElement(scrollTo);
        //govgrants.phasePannel().clickAnyRightButton(pannelTitleName, menuItemName);
    }

    /**
     * Clicks on flex table row level icon
     * 
     * @param iconName
     */
    public void clickOnflexTableIcon(String iconName) {
        reiDriver.WaitFor().WaitForElementListToBePresent(scrollTo);
        reiDriver.JavaScript().scrollpageToSpecificElement(scrollTo);
        reiDriver.findMyElement().getElement(internalOrgViewIcon).click();
    }

}
