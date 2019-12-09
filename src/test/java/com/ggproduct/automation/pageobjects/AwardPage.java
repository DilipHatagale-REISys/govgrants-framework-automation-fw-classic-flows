package com.ggproduct.automation.pageobjects;

import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.Register.EyeThink;
import org.openqa.selenium.By;

public class AwardPage extends ProjectManager {

    /**
     * To verify text area is editable
     * @param fieldApiName
     */
    public Boolean isFieldEditable(String fieldApiName) {
        By field = By.xpath("//div[@id='field" + fieldApiName + "' or @id='" + fieldApiName + "']//textarea");
        try {
            EyeThink.core().elementReference().of(field);
            return true;
        } catch (Exception e){
            return false;
        }
    }
}
