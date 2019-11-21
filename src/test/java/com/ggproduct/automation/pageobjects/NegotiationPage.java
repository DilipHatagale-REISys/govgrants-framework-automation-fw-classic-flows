package com.ggproduct.automation.pageobjects;

import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.Register.EyeThink;
import eyethink.automation.bots.objects.Elements;
import org.openqa.selenium.By;

import java.util.List;

public class NegotiationPage extends ProjectManager {

    /**
     * To verify multipicklist contains value
     *
     * @param fieldApiName               -      picklist field api name
     * @param valueFromList              -     value to be verify
     * @param listTitleFromMultiPickList - list title from both of the list
     * @return
     */
    public boolean isValuePresentInsidePicklist(String fieldApiName, String valueFromList, String listTitleFromMultiPickList) {
        List<Elements> elements = EyeThink.core().elementReference().listOfElements().of(By.xpath("//div[@id='field" + fieldApiName + "' or @id='" + fieldApiName + "']//select[@title='" + listTitleFromMultiPickList + "']/option"));
        boolean flag = false;
        for (int i = 0; i < elements.size(); i++) {
            if (elements.get(i).getText().contains(valueFromList))
                flag = true;
        }
        return flag;
    }
}
