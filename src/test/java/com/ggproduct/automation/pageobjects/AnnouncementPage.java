package com.ggproduct.automation.pageobjects;

import org.openqa.selenium.By;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;

import com.ggproduct.automation.projectmanager.ProjectManager;

public class AnnouncementPage extends ProjectManager {

    public AnnouncementPage(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
        super(controller, handler, govgrants);
    }

    /**
     * Handles the filling in of funding account fields
     * 
     * @param flextableName
     */
    public void fillInInlineFields(String flextableName) {
        reiDriver.findMyElement().getElement(By.xpath("//td//input")).sendKeys("100000");
        reiDriver.findMyElement().getElement(By.xpath("//div/a[contains(@title,'" + flextableName
                + "')]/../..//div[@class='pull-right flex-grid-btns']//button[@title='Save']")).click();
    }
}
