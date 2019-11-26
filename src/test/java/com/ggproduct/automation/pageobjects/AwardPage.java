package com.ggproduct.automation.pageobjects;

import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.Register.EyeThink;
import eyethink.automation.bots.objects.Elements;
import org.openqa.selenium.By;
import java.util.List;

public class AwardPage extends ProjectManager {

    /**
     * To verify values inside drop down
     * @param fieldApiName
     * @param values
     * @return
     */
    public boolean areValuesPresentInsideDropdownSelector(String fieldApiName, String values){
        String [] dropdownValues = values.split(",");
        List<Elements> elements = EyeThink.core().elementReference().listOfElements().of(By.xpath("//div[@id='field" + fieldApiName + "' or @id='" + fieldApiName + "']//select/option"));
        boolean flag = false;
        for (int i = 1; i < elements.size(); i++) {
            if (elements.get(i).getText().contains(dropdownValues[i-1]))
                flag = true;
            else
                flag =false;
        }
        return flag;
    }
}
