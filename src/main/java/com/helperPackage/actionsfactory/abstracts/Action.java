package com.helperPackage.actionsfactory.abstracts;

import org.openqa.selenium.WebElement;

public interface Action {
    void doIt(WebElement element,Boolean processing);
    void doIt(WebElement element, String input);

}
