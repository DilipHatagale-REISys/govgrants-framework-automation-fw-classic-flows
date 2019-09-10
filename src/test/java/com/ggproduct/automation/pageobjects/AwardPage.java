package com.ggproduct.automation.pageobjects;

import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.Register.EyeThink;
import org.openqa.selenium.By;

public class AwardPage extends ProjectManager {

    /**
     * handles to enter comments in confirmation papup and click on specified button
     * @param comments - comments to be enter
     * @param buttonName
     */
    public void enterCommentsOnConfirmation(String comments, String buttonName) {
        EyeThink.core().enterText().onWeb().enter(By.xpath("//form[@class='bootbox-form']//textarea"),comments);
        EyeThink.saas().modal().acceptRejectPopUp(buttonName);
    }
}