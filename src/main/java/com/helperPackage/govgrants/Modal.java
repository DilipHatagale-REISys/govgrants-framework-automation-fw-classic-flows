package com.helperPackage.govgrants;

import com.helperPackage.handlers.govgrants;
import com.helperPackage.register.I;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

public final class Modal {

    /**
     * click on any button on modal content
     *
     * @param buttonName
     * @modifier saranjit.modak modified catch with javascript click 10/05/2023
     */
    public void clickModalContentSpecificButton(String buttonName) {
        By modalButton = getModalContentSpecificButton(buttonName);
        try {
            govgrants.perform().mainPage().waitForNavigationLogoToDisappear();
            I.amPerforming().click().on(modalButton, false);
            govgrants.perform().mainPage().waitForNavigationLogoToDisappear();
        } catch (Exception ee) {
            try {
                govgrants.perform().mainPage().waitForNavigationLogoToDisappear();
                I.amPerforming().click().on(modalButton, false);
                govgrants.perform().mainPage().waitForNavigationLogoToDisappear();
            } catch (Exception ec) {
                I.amPerforming().click().withJavaScript(modalButton);
                govgrants.perform().mainPage().waitForNavigationLogoToDisappear();
            }
        }
    }

    public By getModalContentSpecificButton(String buttonName) {
        return By.xpath("//div[@class='modal-footer']//button[text()='" + buttonName + "'] | "
                + "//input[@value='" + buttonName + "' or @type='" + buttonName + "' or text()='" + buttonName + "' or @id='" + buttonName + "'] | "
                + "//button[text()='" + buttonName + "'] | "
                + "//span[@value='" + buttonName + "' or @type='" + buttonName + "' or text()='" + buttonName + "'] |"
                + "//button[contains(text(),'" + buttonName + "') and @id='emailSend'] | "
                + "//button[@title='" + buttonName + "']");
    }

    /**
     * closes a modal by clicking the little 'x' button in the top right of the
     * modal, and switches to the parent frame.
     *
     * @author daniel.hilla
     */
    public void closeModalByClickingTopRightCloseButton() {
        By closeButton = By.xpath("//iframe[contains(@ng-src, '/') or contains(@src,'/')]//ancestor::div[contains(@class,'modal-content')][1]"
                + "//div[contains(@class, 'modal-header')]//button[contains(@class, 'close')]");
        I.amPerforming().click().on(closeButton);
    }

    /**
     * closes a modal by clicking the little 'x' button in the top right of the modal
     * Author - Nauman Shahid
     * Modifier - saranjit.modak Added Xpath - 17/05/2023
     */
    public void closeModalByClickingTopRightCloseButton(String titleName) {
        By closeButton = By.xpath("//iframe[contains(@ng-src, '/') or contains(@src,'/')]//ancestor::div[contains(@class,'modal-content')][1]//div[contains(@class, 'modal-header')]/p[text()='" + titleName + "']//parent::div//button[contains(@class, 'close')] | //*[@id='customLookupModalTitle' and contains(text(),'"+titleName+"')]/../..//button[contains(text(),'×')]");
        I.amPerforming().click().on(closeButton);
    }

    /**
     * Accept modal based pop up
     */
    public void acceptPopUp() {
        try {
            if (I.amPerforming().checkToSee().IsElementPresentQuick(By.xpath("//div[contains(@class, 'modal') and contains(@class, 'bootbox')]//div[contains(@class, 'modal-content')]"))) {
                WebElement popup = I.amPerforming().getElementReference().of(By.xpath("//div[contains(@class, 'modal') and contains(@class, 'bootbox')]//div[contains(@class, 'modal-content')]"));
                I.amPerforming().click().on(I.amPerforming().getElementReference().ofNested(popup, By.xpath("//div[contains(@class, 'modal-content')]//button[text()='Yes' or text()='Continue' or text()='Ok']")));
            }
        } catch (Exception e) {

        }

        //Comment box handler
        try {
            if (I.amPerforming().checkToSee().IsElementPresentQuick(By.xpath("//div[contains(@class, 'modal') and contains(@class, 'bootbox')]//div[contains(@class, 'modal-content')]"))) {
                I.amPerforming().textInput().in(By.xpath("//form[@class='bootbox-form']//textarea"), "Automated Test");
                I.amPerforming().click().on(By.xpath("//div[contains(@class, 'modal-content')]//button[text()='OK']"));
            }
        } catch (Exception e) {

        }
    }

    /**
     * Accept/reject modal based pop up with passed parameter
     */
    public void acceptPopUpWithParameter(String buttonName) {
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[contains(@class, 'modal') and contains(@class, 'bootbox')]//div[contains(@class, 'modal-content')]"), true)) {
                I.amPerforming().click().on(By.xpath("//div[contains(@class, 'modal-content')]//button[text()='" + buttonName + "']"));
            }
        } catch (Exception e) {
        }
    }

    /**
     * To handle enter comments and click button
     *
     * @param comments
     * @param buttonName
     */
    public void enterCommentsOnPopup(String comments, String buttonName) {
        try {
            I.amPerforming().waitFor().ElementToBePresent(By.xpath("//div[contains(@class, 'modal') and contains(@class, 'bootbox')]//div[contains(@class, 'modal-content')]"));
        } catch (Exception e) {
        }
        I.amPerforming().textInput().in(By.xpath("//form[@class='bootbox-form']//textarea"), comments);
        I.amPerforming().click().on(By.xpath("//div[contains(@class, 'modal-content')]//button[text()='" + buttonName + "']"));
    }

    /**
     * click search icon of owner organization lookup field at page block detail edit page.
     * It will handle two things:-1. if you want to click lookup search with clearing data inside search box.
     * 2. If you want to click lookup search with existing search data.
     *
     * @param lookupFieldName
     * @param wantsToClear
     * @author Monu Kumar
     */
    public void clickLookupModalQuickSearch(String lookupFieldName, boolean wantsToClear) {
        if (wantsToClear) {
            I.amPerforming().textInput().toClear(I.amPerforming().getElementReference().of(By.xpath("//img[@title='" + lookupFieldName + "']/../../input[@type='text']")));
        }
        I.amPerforming().click().on(By.xpath("//img[@title='" + lookupFieldName + "']"));
    }

    /**
     * To handle alert pop up
     *
     * @param buttonName
     * @author Meenakshi Jha
     */
    public void clickAlertContentSpecificButton(String buttonName) {
        try {
            if (buttonName.contains("OK")) {
                I.amPerforming().switchTo().acceptAlert();
            } else {
                I.amPerforming().switchTo().rejectAlert();
            }
        }catch (org.openqa.selenium.NoAlertPresentException noAlertPresentException) {
            I.amPerforming().waitFor().makeThreadSleep(2000);
            if (buttonName.contains("OK")) {
                I.amPerforming().switchTo().acceptAlert();
            } else {
                I.amPerforming().switchTo().rejectAlert();
            }
        }
    }
}