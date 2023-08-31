package com.helperPackage.govgrants;


import com.helperPackage.handlers.govgrants;
import com.helperPackage.register.I;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

public final class PhasePanel {
    private final By secondTopRightFilter = By.xpath("//div[contains(@class,'panel-body')]//div/button");

    /******* "Key Methods with complete functionality - Public" *****************/

    /**
     * genric method to get advance filter from any table with table id
     *
     * @return
     * @author Monu.Kumar
     */
    public WebElement getAdvanceFilterItem(String tableId, String dataTargetValue) {
        By advanceFilter = By
                .xpath("//div[@id='" + tableId + "']//button[@data-target='" + dataTargetValue + "']");
        return I.amPerforming().getElementReference().of(advanceFilter);
    }

    /**
     * select/enter values for Advance filter fields.
     * <p>
     * rowvalues:- There are few fields like Select box, and text box inside Advance filter option. And we are
     * passing values to these fields from feature file table
     * for ex- rowvalues.get(0), it will take first table value from feature file.
     * </p>
     *
     * @param advanceFilterId
     * @param rowvalues
     * @author Monu Kumar
     * @modified Richa Sharma - added logic to validate status list continuously
     */
    public void handleDropdownInputForAdvanceFilter(String advanceFilterId, List rowvalues) {
        By filterAction = null;
        By dropDownSelector1 = By.xpath("//div[@id='" + advanceFilterId + "']//label[contains(text(),'Column')]/..//select");
        By dropDownSelector2 = By.xpath("//div[@id='" + advanceFilterId + "']//label[contains(text(),'Operator')]/..//select");
        By dropDownSelector3 = By.xpath("//div[@id='" + advanceFilterId + "']//label[contains(text(),'Value')]/..//select");
        By inputField = By.xpath("//div[@id='" + advanceFilterId + "']//input|//div[@id='" + advanceFilterId + "']//textarea | //div[@id='" + advanceFilterId + "']//input|//div[@id='" + advanceFilterId + "']//textarea");

        filterAction = By.xpath("//div[@id='" + advanceFilterId + "']//a[@title='Add Filter']/span");
        I.amPerforming().dropDownSelection().from(dropDownSelector1).selectByVisibleText(rowvalues.get(0).toString());
        I.amPerforming().dropDownSelection().from(dropDownSelector2).selectByVisibleText(rowvalues.get(1).toString());
        if (I.amPerforming().checkToSee().IsElementPresentQuick(inputField)) {
            I.amPerforming().textInput().in(inputField, rowvalues.get(2).toString());
        } else {
            I.amPerforming().dropDownSelection().from(dropDownSelector3).selectByVisibleText(rowvalues.get(2).toString());
        }
        I.amPerforming().click().on(filterAction);
    }

    /**
     * genric method to click on the double arrow dropdown using any item contained
     * in list
     */
    public void clickDoubleArrowtoggle(String anyItemContainedInDropDown) {
        By doubleArrow = getDoubleArrowLocator(anyItemContainedInDropDown);
        I.amPerforming().click().on(doubleArrow);
    }

    /**
     * genric method to get the double arrow dropdown
     *
     * @return
     */
    public WebElement getDoubleArrowtoggle(String anyItemContainedInDropDown) {
        By doubleArrow = getDoubleArrowLocator(anyItemContainedInDropDown);
        return I.amPerforming().getElementReference().of(doubleArrow);
    }

    /**
     * generic method to click on the double arrow dropdown using data target id in
     * list
     *
     * @param termContainedInDataTarget
     */
    public void clickDoubleArrowToggle(String termContainedInDataTarget) {
        By doubleArrowToggle = getDoubleArrowToggleLocator(termContainedInDataTarget);
        I.amPerforming().click().on(doubleArrowToggle);
    }

    /**
     * click on flex table icons. Inside click on any tab with flex table.Reach out
     * to any panel header
     *
     * @param panelTitleName
     * @return
     */
    public WebElement getPanelTitle(String panelTitleName) {
        By panelTitle = By
                .xpath("//div[contains(@class,'panel-title')]/a[text()='" + panelTitleName
                        + "'] | " + "//div[@class='panel-heading']//div[contains(@class,'panel-title')]"
                        + "//div[text()='" + panelTitleName + "']");
        return I.amPerforming().getElementReference().of(panelTitle);
    }

    /**
     * get panel title of flex table/ enhanced grid with panel title and table id
     *
     * @param panelTitleName
     * @param tableId
     * @return
     * @author Monu.Kumar
     */
    public WebElement getPanelTitleWithTableId(String tableId, String panelTitleName) {
        By panelTitleWithTableId = By.xpath("//div[@id='" + tableId
                + "']/ancestor::Div[1]//div[contains(@class,'panel-heading')]//span[text()='"
                + panelTitleName + "'] | //div[@id='" + tableId
                + "']/ancestor::Div[1]//div[contains(@class,'panel-heading')]//span/following-sibling::Div[text()='"
                + panelTitleName + "']|//div[@id='" + tableId
                + "']/ancestor::Div[1]//div[contains(@class,'panel-heading')]//a[@title='"
                + panelTitleName + "']");
        return I.amPerforming().getElementReference().of(panelTitleWithTableId);
    }

    /**
     * select item double arrow drop down
     *
     * @param anyItemContainedInDropDown
     * @return
     */
    public WebElement getDoubleArrowToggleItem(String anyItemContainedInDropDown) {
        By doubleArrow = getDoubleArrowLocator(anyItemContainedInDropDown);
        return I.amPerforming().getElementReference().of(doubleArrow);
    }

    /**
     * select arrow drop down item with term contained in data target atrribute
     *
     * @param termContainedInDataTarget
     * @param menuItemName
     */
    public void selectDoubleArrownDropDownItemWithDataTargetId(String termContainedInDataTarget, String menuItemName) {
        By doubleArrowDropDown = getSelectDoubleArrowDropDownItemWithDataTargetIdLocator(termContainedInDataTarget,
                menuItemName);
        I.amPerforming().click().on(doubleArrowDropDown);
    }

    /**
     * select item double arrow drop down
     *
     * @param menuItemNamee
     * @return
     */
    public void selectDoubleArrowDropDownItem(String menuItemNamee) {
        By doubleArrowDropDownItem = By.xpath("//div[@class='panel-heading']//div[contains(@class,'panel-title')]"
                + "//div[@id='dropdownListView']/ul/li/a[@title='" + menuItemNamee + "']|" +
                "//div[contains(@class,'panel-heading')]" +
                "//span[@id='dropdownListView']/ul/li/a[@title='" + menuItemNamee + "']");
        I.amPerforming().click().on(doubleArrowDropDownItem);
    }

    /**
     * get parallel bars like Menu with panel title name
     *
     * @param panelTitleName
     * @return
     * @author Nauman.Shahid
     * @modifier Monu.Kumar
     */
    public By getParallelBarsLocator(String panelTitleName) {
        return By.xpath("//div[text()='" + panelTitleName + "']/../../../.."
                + "/following-sibling::div/div[contains(@class,'header-bars')]//a[@title='Menu']//span[contains(@class,'fa fa-bars')] | "
                + "//div//a/following-sibling::span[text()='" + panelTitleName + "']/.."
                + "/following-sibling::div/span[contains(@class,'header-bars')]//a[@title='Menu']//span[contains(@class,'fa fa-bars')] | "
                + "//span[text()='" + panelTitleName
                + "']/..//div[@class='header-bars']//a[@title='Menu']//span[contains(@class,'fa fa-bars')]|//div//a[contains(text(),'"
                + panelTitleName
                + "')]/../following-sibling::div/span//a[@title='Menu']//span[contains(@class,'fa fa-bars')]");
    }

    /**
     * click and select a value using term contained in data target attribute
     *
     * @param termContainedInDataTarget
     * @param menuItemName
     */
    public void clickDoubleArrowDropDownAndSelectItem(String termContainedInDataTarget, String menuItemName) {
        clickDoubleArrowToggle(termContainedInDataTarget);
        selectDoubleArrownDropDownItemWithDataTargetId(termContainedInDataTarget, menuItemName);
    }

    /**
     * click on double drop down and select a value
     *
     * @param anyItemContainedInDropDownnn
     */
    public void clickDoubleArrowDropDownAndSelectItem(String anyItemContainedInDropDownnn) {
        clickDoubleArrowtoggle(anyItemContainedInDropDownnn);
        selectDoubleArrowDropDownItem(anyItemContainedInDropDownnn);
    }

    /**
     * click on right header bars
     */
    public void clickParallelMenuBars(String panelTitleName) {
        By parallelMenuBars = getParallelBarsLocator(panelTitleName);
        I.amPerforming().click().on(parallelMenuBars);
    }

    /**
     * click on right header bars with data Target value
     */
    public void clickParallelMenuBarsWithDataTargetValue(String dataTargetValue) {
        By parallelMenuBarswithDataTarget = By.xpath("//a[@data-target='" + dataTargetValue + "']/ancestor::div[contains(@class,'panel-heading')]//a[@title='Menu']");
        I.amPerforming().click().on(parallelMenuBarswithDataTarget);
    }

    /**
     * perform click and select options from bottom sticky menu
     *
     * @param id
     * @author Monu Kumar
     */
    public By getStickyBottomMenu(String id) {
        return By.xpath("//button[@id='" + id + "']");
    }

    /**
     * get menu button on right header bars
     *
     * @param panelTitleName
     * @return
     */
    public WebElement getParallelMenuBars(String panelTitleName) {
        By parallelMenuBars = getParallelBarsLocator(panelTitleName);
        return I.amPerforming().getElementReference().of(parallelMenuBars);
    }

    /**
     * Clicks on the top right button of a flex table based on the flex table id
     *
     * @param flexTableId
     * @param buttonName
     * @author john.phillips
     */
    public void clickTableTopRightButton(String flexTableId, String buttonName) {
        By topRightButton = getTopRightButtonLocatorByTableId(flexTableId, buttonName);
        I.amPerforming().click().on(topRightButton);
    }

    /**
     * get any button on right header. like new
     *
     * @param panelTitleName
     * @param buttonName
     * @return
     */
    public WebElement getTopRightButton(String panelTitleName, String buttonName) {
        By topRightButton = getTopRightButtonLocator(panelTitleName, buttonName);
        return I.amPerforming().getElementReference().of(topRightButton);
    }

    /**
     * get any button on right header. like new
     *
     * @param buttonName
     * @return
     */
    public void clickTopRightButton(String pannelTitleName, String buttonName) {
        By topRightButton = getTopRightButtonLocator(pannelTitleName, buttonName);
        I.amPerforming().click().on(topRightButton);
    }

    /**
     * click any button on right header. like new
     *
     * @param idOfPanelButton
     * @param buttonName
     * @return
     */
    public void clickAnyRightPannelButton(String idOfPanelButton, String buttonName) {
        By rightPanelButton = By.xpath("//div[contains(@class,'header-buttons') and contains(@id,'"
                + idOfPanelButton + "')]//*[text()='" + buttonName + "'] | //div[contains(@id,'" + idOfPanelButton + "')]//*[text()='"+ buttonName + "']");
        I.amPerforming().click().on(rightPanelButton);
    }

    /**
     * get any item from top right bar inside phases
     *
     * @param panelTitleName
     * @param menuItemName
     * @return
     */
    public WebElement getItemFromParallelMenuBars(String panelTitleName, String menuItemName) {
        By parallelMenuBarItem = By.xpath(
                "//div[contains(@class, 'panel-heading') and descendant::*["+I.amPerforming().sanityOfXpathTo().equals("text()",panelTitleName)+" or @title='"
                        + panelTitleName + "']]//*[contains(@class, 'dropdown-menu-right')]//li//*[@text()='"
                        + menuItemName + "' or text()='" + menuItemName + "' or @title='" + menuItemName +  "']");
        return I.amPerforming().getElementReference().of(parallelMenuBarItem);
    }

    /**
     * get any item from top right bar inside phases
     *
     * @param panelTitleName
     * @param menuItemName
     * @return
     * @modifier meenakshi.jha added xpath (02/05/2021)
     * @modifier richa.sharma added xpath (24/06/2022)
     * @modifier komal.mukhekar added xpath (02/09/2022)
     */
    public void selectItemFromParallelMenuBars(String panelTitleName, String menuItemName) {
        By parallelMenuItem = By.xpath("//*[" + I.amPerforming().sanityOfXpathTo().equals("text()", panelTitleName) + "]/../.."
                + "/following-sibling::div//span[contains(@class,'header-bars')]//*[text()='"
                + menuItemName + "'] | " + "//div//a/following-sibling::span[text()='"
                + panelTitleName + "']/.."
                + "/following-sibling::div/span[contains(@class,'header-bars')]//*[text()='"
                + menuItemName + "'] | " + "//span[text()='" + panelTitleName
                + "']/.." + "//div[@class='header-bars']//*[text()='" + menuItemName
                + "']|//div//a[@title='" + panelTitleName
                + "']/ancestor::div/following-sibling::div//li//span[contains(text(),'" + menuItemName
                + "')] | //*[text()='"+panelTitleName+"']/preceding-sibling::span//*[@title='Menu' or contains(@class,'fa-bars')]/following-sibling::ul//a[text()='"
                + menuItemName + "'] | //div//a[@title='"+panelTitleName+"']/ancestor::div/following-sibling::span//li//a[@title='"+ menuItemName+"']" +
                "| //a[contains(@title,'" + panelTitleName + "')]/ancestor::div/div[@align='right']//li/a[@title='Download as PDF']");
        I.amPerforming().click().on(parallelMenuItem);
        try {
                govgrants.perform().modal().acceptPopUpWithParameter("Yes");
        } catch (Exception e) {
        }
    }

    /**
     * get filter icon
     *
     * @return
     */
    public WebElement getSecondTopRightFilter() {
        return I.amPerforming().getElementReference().of(secondTopRightFilter);
    }

    /******* "Local Methods with Limited functionality - Private" **********/

    private By getDoubleArrowLocator(String anyItemContainedInDropDown) {
        return By.xpath("//div[contains(@class,'panel-title')]//div[@id='dropdownListView']/ul/li/a[@title='"
                + anyItemContainedInDropDown
                + "']/../../.. //span[contains(@class,'fa fa-angle-double-down')] | " +
                "//div[contains(@class,'panel-heading')]//span[@id='dropdownListView']/ul/li/a[@title='"
                + anyItemContainedInDropDown
                + "']/../../.. //span[contains(@class,'fa fa-angle-double-down')]");
    }

    private By getDoubleArrowToggleLocator(String termContainedInDataTarget) {
        return By.xpath("//div[contains(@class,'panel-title')]//div[@id='dropdownListView']"
                + "/preceding-sibling::a[contains(@data-target,'" + termContainedInDataTarget
                + "')]/../../.." + "//span[contains(@class,'fa fa-angle-double-down')]");
    }

    private By getSelectDoubleArrowDropDownItemWithDataTargetIdLocator(String termContainedInDataTarget,
                                                                       String menuItemName) {
        return By.xpath("//div[contains(@class,'panel-title')]" + "//a[contains(@data-target,'"
                + termContainedInDataTarget + "')]"
                + "/following-sibling::div[@id='dropdownListView']/ul/li/a[@title='" + menuItemName
                + "']");
    }

    private By getTopRightButtonLocator(String panelTitleName, String buttonName) {
        return By.xpath("//*[@title='" + panelTitleName + "' or text()='"
                + panelTitleName
                + "']/ancestor::div[contains(@class,'header-title') or 1]/following-sibling::div/div[contains(@class,'header-buttons')]//*[text()='"
                + buttonName + "']");
    }

    private By getTopRightButtonLocatorByTableId(String flexTableId, String buttonName) {
        return By.xpath("//*[@id='" + flexTableId + "']//div[contains(@class, 'panel-heading')]"
                + "//*[text()='" + buttonName + "' or @value='" + buttonName
                + "' or @type='" + buttonName + "']");
    }
}
