package com.ggproduct.automation.pageobjects.grantor;

import com.ggproduct.automation.projectmanager.GrantorProjectManager;
import com.helperPackage.objects.Elements;
import com.helperPackage.register.I;
import org.openqa.selenium.By;

import java.util.List;

public class NegotiationPage extends GrantorProjectManager {

    /**
     * To verify multipicklist contains value
     *
     *
     * @param usage
     * @param fieldApiName               -      picklist field api name
     * @param valueFromList              -     value to be verify
     * @param listTitleFromMultiPickList - list title from both of the list
     * @return
     */
    public boolean isValuePresentInsidePicklist(String usage,String fieldApiName, String valueFromList, String listTitleFromMultiPickList) {
        List<Elements> elements = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='field" + fieldApiName + "' or @id='" + fieldApiName + "']//select[@title='" + listTitleFromMultiPickList + "']//option"));
        boolean flag = false;
        for (int i = 0; i < elements.size(); i++) {
            if (elements.get(i).getText().contains(valueFromList))
                flag = true;
        }
        return flag;
    }
}
