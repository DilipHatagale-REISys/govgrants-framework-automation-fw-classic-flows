package com.helperPackage.govgrants;


import com.helperPackage.handlers.govgrants;
import com.helperPackage.actionsfactory.api.ByUsing;
import com.helperPackage.controller.TestingBlazeGlobal;
import com.helperPackage.register.EnvironmentFactory;
import com.helperPackage.register.I;
import com.helperPackage.report.LogLevel;
import org.apache.commons.lang3.StringUtils;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.ElementClickInterceptedException;
import org.openqa.selenium.WebElement;

import java.util.ArrayList;
import java.util.List;

public final class PageDetails {
    private final By textInsideHelpText = By.xpath(
            "//div[@class='tooltipster-base tooltipster-noir tooltipster-fade tooltipster-fade-show'] | //span[contains(@class,'fa fa-info helpIcon')]/following-sibling::span[contains(@class,'ng-binding')] | //span[contains(@class,'fa fa-info helpIcon')]/following-sibling::span[contains(@class,'hidden508')] | //i[contains(@class,'fa fa-thumbs-up')]/parent::a | //i[contains(@class,'fa fa-clock-o')]/parent::a | //div[contains(@class,'tooltipster-content')]/span | //i[contains(@class,'fa fa-ban')]/parent::a");
    public String idOfRecord = null;

    /**
     * click any button on right header inside detail page. Submit, submit for
     * approval
     *
     * @param buttonName
     * @return
     * @author john.phillips
     * @modifier nauman.shahid (added button tag to xpath)
     * @modifier ashwini.mahore (added xpath in or to get collab menu)
     * @modifier saranjit.modak (added xpath in or to click/assert the page navigation button)
     */
    public By getAnyTopRightButton(String buttonName) {
        return By.xpath("//*[contains(@class,'overview-header') or contains(@class,'panel-footer')]//*[(local-name()='a' or local-name()='button' or local-name()='input') and not(contains(@class,'hidden')) and ("
                + I.amPerforming().sanityOfXpathTo().equals("@title", buttonName) + " or "
                + I.amPerforming().sanityOfXpathTo().equals("text()", buttonName) + " or "
                + I.amPerforming().sanityOfXpathTo().equals("@value", buttonName) + ")] |" +
                "//*[contains(@class,'overview-header') or contains(@class,'panel-footer')]//*[(local-name()='a' or local-name()='button' or local-name()='input') and not(contains(@class,'hidden'))]//span[(text()='" + buttonName + "') and not(contains(@class,'hidden'))] |" +
                "//*[contains(@class,'panel-heading')]//*[local-name()='a' and contains(@class,'menuLinks') and @title='" + buttonName + "']|//*[@value='" + buttonName + "' and @class='customBtn']");
    }

    /**
     * click any button on botton on right header inside detail page. Submit, submit for
     * approval
     *
     * @param buttonName
     * @return
     * @author nauman.shahid
     */
    public By getAnyBottomRightButton(String buttonName) {
        return By.xpath("//*[contains(@class,'panel-footer')]//*[(local-name()='button' or local-name()='input') and not(contains(@class,'hidden')) and ("
                + I.amPerforming().sanityOfXpathTo().equals("@title", buttonName) + " or "
                + I.amPerforming().sanityOfXpathTo().equals("text()", buttonName) + " or "
                + I.amPerforming().sanityOfXpathTo().equals("@value", buttonName) + ")]");
    }

    /**
     * click any button on right header inside detail page. Submit, submit for
     * approval
     *
     * @param buttonName
     * @return
     * @author john.phillips
     * modifier saranjit.modak - 09.09.2022 added explicit wait used try catch to handle ElementClickInterceptedException exception
     */
    public void clickAnyTopRightButton(String buttonName) {
        By topRightButton = getAnyTopRightButton(buttonName);
        try {
            I.amPerforming().click().on(topRightButton);
            govgrants.perform().modal().acceptPopUp();
        } catch (ElementClickInterceptedException e) {
            I.amPerforming().updatingOfReportWith().write(LogLevel.BUSINESS_LAYER_ERROR, "Exception {ElementClickInterceptedException} is thrown - used Explicit Wait and Java Script to click the element");
            I.amPerforming().waitFor().ElementToBeClickable(topRightButton);
            I.amPerforming().click().withJavaScript(topRightButton);
            govgrants.perform().modal().acceptPopUp();
        }
    }

    /**
     * click any button on right header inside detail page. Submit, submit for
     * approval
     *
     * @param buttonName
     * @return
     * @author john.phillips
     */
    public void clickAnyBottomRightButton(String buttonName) {
        By topRightButton = getAnyBottomRightButton(buttonName);
        I.amPerforming().click().on(topRightButton);
        govgrants.perform().modal().acceptPopUp();
    }

    /**
     * click any button on right header inside detail page. Submit, submit for
     * approval
     *
     * @param buttonName
     * @return
     * @author john.phillips
     */
    public void clickAnyTopRightButtonWithoutProcessing(String buttonName) {
        By topRightButton = getAnyTopRightButton(buttonName);
        I.amPerforming().click().on(topRightButton, false);
        govgrants.perform().modal().acceptPopUp();
    }

    /**
     * Implementation required for govgrants framework automation where no switching
     * required
     *
     * @param buttonName
     */
    public void clickAnyTopRightButtonWithoutSwitching(String buttonName) {
        I.amPerforming().click().on(getAnyTopRightButton(buttonName));
    }

    /**
     * click on sub tab inside table icons. click view and then on new page click on
     * the tab like overview etc.
     *
     * @param tabName
     * @author jitendra.pisal
     * @modifier yugandhara.chibade Added new xpath at line 122 and updated method logic for click on more tab element
     */
    public void clickSubTabsInsideTableView(String tabName) {
        By desiredTab = By.xpath("//div[@id='myTabs']//span[" + I.amPerforming().sanityOfXpathTo().equals("text()", tabName) + "]/ancestor::li[1]/a");
        By isdesiredTabActive = By.xpath("//div[@id='myTabs']//span[" + I.amPerforming().sanityOfXpathTo().equals("text()", tabName) + "]/ancestor::li[1][contains(@class,'active')]");
        By moreTabs = By.xpath("//div[@id='myTabs']//span[text()='More Tabs']/ancestor::li[1]");
        By moreTabElement = By.xpath("//div[@id='myTabs']//span[text()='" + tabName + "']/ancestor::li[not(@style)]");

        if (EnvironmentFactory.getDevice().equalsIgnoreCase("firefox")) {
            I.amPerforming().waitFor().makeThreadSleep(4000);
        }
        // wait until any one of the subtab to be active to get rid of the issue of
        // click effect is not taking place even after clicking on it.
        try {
            I.amPerforming().getElementReference().of(By.xpath("//ul[@id='topTabsID']//li[contains(@class,'active')]"));
        } catch (Exception ee) {
            // Who cares!
        }

        try {
            if (I.amPerforming().checkToSee().IsElementPresentQuick(moreTabElement)) {
                I.amPerforming().click().on(moreTabs);
                I.amPerforming().click().on(desiredTab);
                I.amPerforming().click().on(moreTabs);
            } else {
                I.amPerforming().click().on(desiredTab);
            }
        } catch (Exception ex) {
            try {
                I.amPerforming().updatingOfReportWith().write(LogLevel.BUSINESS_LAYER_ERROR, "     An exception is thrown - Retrying with javaScript");
                I.amPerforming().waitFor().makeThreadSleep(3000);
                I.amPerforming().click().withJavaScript(desiredTab, false);
            } catch (Exception e) {
                if (!EnvironmentFactory.getDevice().equalsIgnoreCase("firefox"))
                    throw e;
            }
        }

        try {
            if (!I.amPerforming().checkToSee().isEnabled(isdesiredTabActive, false)) {
                I.amPerforming().updatingOfReportWith().write(LogLevel.BUSINESS_LAYER_ERROR, "     The click was not successful - Retrying with javaScript");
                I.amPerforming().click().withJavaScript(desiredTab, false);
            }
        } catch (Exception e) {
            I.amPerforming().click().withJavaScript(desiredTab, false);
        }
    }

    /**
     * click on icon in rich text area editor menu at page layout
     *
     * @param iconName
     * @author ashwini.mahore
     */
    public void clickAtIconInRichTextAreaEditorMenuOptions(String iconName) {
        I.amPerforming().click().withJavaScript(getIconInRichTextAreaField(iconName));
    }

    /**
     * create hyperlink to the given text/URL using CK Editor tool under description field
     *
     * @param displayTextOrURL
     * @param value
     * @author ashwini.mahore
     */
    public void createHyperlinkUsingCKEditorAtDescriptionField(String displayTextOrURL, String value) {
        By displayTextInputBox = By.xpath("//label[text()='Display Text']/..//input");
        By URLInputBox = By.xpath("//label[text()='URL']/..//input");
        By okButton = By.xpath("//a[@title='OK']");

        if (displayTextOrURL.equalsIgnoreCase("text")) {
            I.amPerforming().textInput().in(displayTextInputBox, value);
            I.amPerforming().textInput().in(URLInputBox, "www.google.com");
        } else if (displayTextOrURL.equalsIgnoreCase("URL")) {
            I.amPerforming().textInput().in(URLInputBox, value);
        }

        I.amPerforming().click().on(okButton);
    }

    /**
     * click on footer links present at the bottom of page
     *
     * @param footerLinks
     * @author ashwini.mahore
     */
    public void clickOnAnyFooterLinks(String footerLinks) {
        I.amPerforming().click().on(getFooterLinks(footerLinks));
    }

    /**
     * click on view more/view less link at instruction inside page instruction box
     *
     * @param linkName
     * @author ashwini.mahore
     */
    public void clickOnLinkAtPageInstruction(String linkName) {
        TestingBlazeGlobal.setVariable("highlightElements", "off");
        I.amPerforming().click().on(By.xpath("//*[text()='" + linkName + "']"));
    }

    /**
     * get icon in rich text area editor menu at page layout/modal
     *
     * @param iconName
     * @author ashwini.mahore
     * @modifier ashwini.mahore (updated and created generic xpath for modal and page layout)
     */
    public WebElement getIconInRichTextAreaField(String iconName) {
        By getIcon = ByUsing.xpath("//div[contains(@class,'cke_inner')]//a[contains(@title,'" + iconName + "')]");
        return I.amPerforming().getElementReference().of(getIcon);
    }

    /**
     * get footer links at page layout
     */
    public WebElement getFooterLinks(String footerLinks) {
        By getFooterLink = By.xpath("//span[contains(@class,'footer-links')]//a[contains(text(),'" + footerLinks + "')] | //a[contains(@class,'footerlogin-text')][text()='" + footerLinks + "']");
        return I.amPerforming().getElementReference().of(getFooterLink);
    }

    /**
     * get any specifc status from progress bar
     *
     * @param statusName
     * @return * @modified meenakshi.jha updated xpath at 240 line(10/15/2020)
     */
    public WebElement getSpecificStatusFromProgressBar(String statusName) {
        By progressBarStatusLocator = By.xpath("//div[@class='container-fluid']//*[@id='progressBarId']//ol//li" + "//span["
                + I.amPerforming().sanityOfXpathTo().contains("text()", statusName) + "]" + "/ancestor::li[1]|//div[@class='container-fluid']//*[@id='progressBarId']//ol//li[contains(text(),'" + statusName + "')]");
        return I.amPerforming().getElementReference().of(progressBarStatusLocator);
    }


    /**
     * Returns the color of the status in the progress bar.
     * Currently can find red, blue, and green statuses.
     * Anything else will just return "an unknown color"
     *
     * @param statusName
     * @return
     */
    public String getColorOfProgressBarStatus(String statusName) {
        WebElement statusElement = getSpecificStatusFromProgressBar(statusName);

        String trueColor = "an unknown color";
        if (I.amPerforming().actionToGet().cssProperty(statusElement, "color", false).contains("rgba(11, 11, 160, 1)")
                || I.amPerforming().actionToGet().cssProperty(statusElement, "color", false).contains("rgba(11, 11, 160)")
                || I.amPerforming().actionToGet().cssProperty(statusElement, "style", false).contains("rgb(11, 11, 160)")) {
            trueColor = "blue";
        } else if (I.amPerforming().actionToGet().cssProperty(statusElement, "color", false).contains("rgba(59, 161, 11, 1")
                || I.amPerforming().actionToGet().cssProperty(statusElement, "color", false).contains("rgb(59, 161, 11")
                || I.amPerforming().actionToGet().cssProperty(statusElement, "style", false).contains("rgb(59, 161, 11)")) {
            trueColor = "green";
        } else if (I.amPerforming().actionToGet().cssProperty(statusElement, "color", false).contains("rgba(230, 0, 0, 1)")
                || I.amPerforming().actionToGet().cssProperty(statusElement, "color", false).contains("rgb(230, 0, 0)")
                || I.amPerforming().actionToGet().cssProperty(statusElement, "style", false).contains("rgb(230, 0, 0)")) {
            trueColor = "red";
        } else if (I.amPerforming().actionToGet().cssProperty(statusElement, "color", false).contains("rgba(160, 160, 160, 1")
                || I.amPerforming().actionToGet().cssProperty(statusElement, "color", false).contains("rgb(160, 160, 160")
                || I.amPerforming().actionToGet().cssProperty(statusElement, "style", false).contains("rgb(160, 160, 160)")) {
            trueColor = "grey";
        }

        return trueColor;
    }

    /**
     * perform mouse hover operation  on all expected elements as per switch case
     * <p>
     * This function will perform mouse hover on expected elements on UI like (Enhanced grid table Page block help text icon,
     * Flex table table Page block help text icon,Enhanced grid Table column help text icon, flex table column help text icon)
     * </p>
     * <p>
     * Note:- Need to modify path in unique way
     *
     * @param pageBlockTitle
     * @param helpTextReferenceName
     * @author Monu.Kumar
     */
    public void performMouseHoverOnExpectedElements(String pageBlockTitle, String helpTextReferenceName) {
        switch (pageBlockTitle.toUpperCase()) {
            case "PAGE BLOCK":
                WebElement pageBlockHelpTextIcon = I.amPerforming().getElementReference().of(By.xpath("//a[@data-target='" + helpTextReferenceName + "']/following-sibling::span//span[contains(@class,'fa-info')]"));
                if (pageBlockHelpTextIcon != null) {
                    I.amPerforming().scroll().toMoveToElement(pageBlockHelpTextIcon);
                }
                break;
            case "TABLE COLUMN":
                WebElement columnHelpTextIcon = I.amPerforming().getElementReference().of(By.xpath("//th//span[@title='" + helpTextReferenceName + "' or text()='" + helpTextReferenceName + "']/ancestor::a/following-sibling::span//span[contains(@class,'fa-info')]|//th//span[@title='" + helpTextReferenceName + "' or text()='" + helpTextReferenceName + "']/..//span[contains(@class,'fa-info')]||" +
                        "//th//span[@title='" + helpTextReferenceName + "' or text()='" + helpTextReferenceName + "']/../following-sibling::helpicon//span[contains(@class,'fa-info')]"));
                if (columnHelpTextIcon.isDisplayed()) {
                    I.amPerforming().scroll().toMoveToElement(columnHelpTextIcon);
                }
                break;
        }
    }

    /**
     * return true if help text is displayed
     *
     * @param helpText
     * @return
     * @modified komal.mukhekar - updated xpath to get help text of fields present on modal window
     * @modified komal.mukhekar - updated method to get help text of field with the help of attributes
     * @modified komal.mukhekar - updated condition to check optional parameter's size
     * @modified vaibhav.chandratre - updated method for xpath and also updated condition to check help text according to attribute
     */
    public boolean isHelpTextDisplayed(String helpText, String... fieldLabel) {
        boolean flag = false;
        if (fieldLabel.length != 0) {
            By element = By.xpath("(//span[contains(text(),'" + fieldLabel[0] + "')]/..//span[contains(@class,'fa-info')]/parent::a) | (//span[contains(text(),'" + fieldLabel[0] + "')]/../following-sibling::a)| (//*[contains(text(),'" + fieldLabel[0] + "')]/../following-sibling::a)");
            try {
                if (I.amPerforming().actionToGet().attribute(element, "title").equalsIgnoreCase(helpText) || (I.amPerforming().actionToGet().attribute(element, "onfocus").contains(helpText)))
                    flag = true;
            } catch (Exception e) {
                element = By.xpath("//span[contains(text(),'" + fieldLabel[0] + "')]/..//span[contains(@class,'fa-info')]/following-sibling::span");
                if (I.amPerforming().actionToGet().text(element).contains(helpText))
                    flag = true;
            }
        } else if (I.amPerforming().actionToGet().text(textInsideHelpText).contains(helpText) || I.amPerforming().actionToGet().text(textInsideHelpText).equalsIgnoreCase(helpText) || I.amPerforming().actionToGet().attribute(textInsideHelpText, "title").equalsIgnoreCase(helpText))
            flag = true;
        I.amPerforming().updatingOfReportWith().write(LogLevel.BUSINESS_LAYER_INFO, String.format("actual Text--->", I.amPerforming().actionToGet().text(textInsideHelpText)));
        return flag;

    }

    /**
     * get any item from drop down of parallel lines
     *
     * @param itemName
     * @return
     * @modified keerti.munde - Adding to supporting drop down on page detail
     * @modified ashwini.mahore - modified path to get dropdown from menu at collab
     */
    public WebElement getMenuItemFromParallelLinesDropDown(String itemName) {
        return I.amPerforming().getElementReference().of(By.xpath("//*[@title='Menu']/following-sibling::ul//li//*["
                + I.amPerforming().sanityOfXpathTo().equals("text()", itemName) + "] | //span//select//option[contains(text(),'" + itemName + "')]"));
    }

    /**
     * Clicks a link to another record in a lookup field
     *
     * @param lookupRelationshipAPIName: the API name of the field whose link to click
     * @author daniel.hilla
     */
    public void clickLookupLink(String lookupRelationshipAPIName) {
        By path = By.xpath(
                "//dl//dd//a[" + I.amPerforming().sanityOfXpathTo().contains("@id", lookupRelationshipAPIName) + "]| //dl//dd//a[" + I.amPerforming().sanityOfXpathTo().contains("text()", lookupRelationshipAPIName) + "]");
        I.amPerforming().click().on(path);

    }

    /**
     * click search icon of owner organization at page block detail edit page
     */
    public void clickLookupModalQuickSearch(String searchBtnName) {
        I.amPerforming().getElementReference().of(By.xpath("//img[@title='" + searchBtnName + "']"));
        I.amPerforming().textInput().toClear(I.amPerforming().getElementReference().of(By.xpath("//img[@title='" + searchBtnName + "']/../../input[@type='text']")));
        I.amPerforming().click().withJavaScript(By.xpath("//img[@title='" + searchBtnName + "']"));
    }

    /**
     * Handles the storing of EGMS ID or Field Value from the record and could be used else where in and method for the following steps
     *
     * @param fieldLabel
     * @return
     * @author hema.ananthan
     * @modified mahadev.hanme
     * @modified john.phillips updated xpath and simplified logic
     * @modified richa.sharma updated field name for gwinnett county egms id to govgrants id
     */
    public String getFieldValue(String fieldLabel, boolean matchLabelExactly) {
        By fieldLabelLocator = By.xpath(String.format(""
                                // This option should work in all situations, if using the latest version of GovGrants
                                + "//dt//span[contains(@class, 'customLabelstyle') and %s]",
                        matchLabelExactly
                                ? I.amPerforming().sanityOfXpathTo().equals(".", fieldLabel)
                                : I.amPerforming().sanityOfXpathTo().contains(".", fieldLabel)
                )
        );

        String fieldValue;
        WebElement fieldData = I.amPerforming().getElementReference().of(fieldLabelLocator)
                .findElement(By.xpath("./ancestor::dl[1]/dd | ./ancestor::dl[1]/following-sibling::dd"));
        if (fieldData.findElements(By.xpath(".//input[@type='checkbox']")).size() != 0) {
            fieldValue = I.amPerforming().checkToSee().isSelected(I.amPerforming().getElementReference().ofNested(fieldData, By.xpath(".//input[@type='checkbox']")))
                    ? "Checked" : "Unchecked";
        } else {
            fieldValue = StringUtils.normalizeSpace(I.amPerforming().actionToGet().text(fieldData));
        }

        if (fieldLabel.equalsIgnoreCase("EGMS ID")) {
            idOfRecord = fieldValue;
        } else if (fieldLabel.equalsIgnoreCase("GovGrants ID")) {
            idOfRecord = fieldValue;
        }
        return fieldValue;
    }

    public String getFieldValue(String fieldLabel) {
        return getFieldValue(fieldLabel, false);
    }

    /**
     * clicks the validate button for forms, and waits for the alert to show up,
     * either good or bad
     *
     * @author john.phillips
     */
    public void clickFormValidationButtonAndWaitForResult() {
        By buttonSelector = By.xpath("//div[@id='FormComponent']//button[text()='Validate']");
        I.amPerforming().click().on(buttonSelector);

    }

    /**
     * This function is used to get the web element
     *
     * @param fieldLabel
     * @return WebElement
     * @modifier saranjit.modak
     */
    public WebElement getElementFromPageBlock(String fieldLabel) {
        String element = null;

        if (fieldLabel.contains("'"))
            element = "//span[text()=\"" + fieldLabel + "\"]";
        else
            element = "//span[" + I.amPerforming().sanityOfXpathTo().equals("text()", fieldLabel) + "]|//div[@class='selectTitle']//label[contains(text(),'" + fieldLabel + "')] | //table[@id='" + fieldLabel + "']";

        try {
            I.amPerforming().getElementReference().of(ByUsing.xpath(element));
        } catch (Exception e) {
            /* Ignore Exception */
        }
        return I.amPerforming().getElementReference().of(ByUsing.xpath(element));
    }

    /**
     * click on button present under send email or library files modal window
     *
     * @param buttonName - on which needs to click
     * @Author - ashwini.mahore
     */
    public void clickOnSendEmailModalButton(String buttonName) {
        I.amPerforming().click().withJavaScript(By.xpath("//button[text()='" + buttonName + "' or @title='" + buttonName + "'][not(contains(@class,'btn btn-default'))]"));
        I.amPerforming().waitFor().ElementToDisappear(By.xpath("//img[@class='nav-logo']"));
    }

    /**
     * perform click on dropdown to navigate between forms at top right corner of form layout
     *
     * @param options
     * @author ashwini.mahore
     * @modifier saranjit.modak added xpath
     */
    public void selectValueFromDropdownAtFormLayout(String options) {
        I.amPerforming().click().on(By.xpath("//select[contains(@aria-label,'Select Form')]//option[text()='" + options + "'] | //select[contains(@aria-label,'DropDown Menu')]//option[contains(text(),'" + options + "')]"));
    }

    /**
     * To verify field is not present inside page block detail
     *
     * @param fieldLabel - field label which needs to verify
     * @return
     * @Author - mahadev.hanme
     */
    public boolean isElementPresentInsidePageBlock(String fieldLabel) {
        try {
            return getElementFromPageBlock(fieldLabel).isDisplayed();
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * To verify values inside drop down
     *
     * @param fieldApiName
     * @param values
     * @return
     * @modifier keerti.munde
     */
    public boolean areValuesPresentInsideDropdownSelector(String fieldApiName, String values) {
        String[] dropdownValues = values.split(",");
        List<WebElement> elements = I.amPerforming().dropDownSelection().from(By.xpath("//div[@id='field" + fieldApiName + "' or @id='" + fieldApiName + "']//select | //field[@field-name='" + fieldApiName + "']//select")).getOptions();
        boolean flag = false;
        for (int i = 0; i < elements.size() - 1; i++) {
            if (elements.get(i).getText().contains(dropdownValues[i]))
                flag = true;
            else
                flag = false;
        }
        return flag;
    }

    /**
     * collapses page block on details page
     *
     * @param pageBlockTitle
     * @param isExpand
     * @author Monu.Kumar
     */
    public void pageBlockExpandOrCollapse(String pageBlockTitle, boolean isExpand) {
        By pageBlockExpandCollapseIconSelector = By.xpath("//a[contains(text(),'" + pageBlockTitle + "')]//span[contains(@class,'fa-caret-up')and not (contains(@class,'fa-caret-down'))] | //*[text()='" + pageBlockTitle + "']/..//span[contains(@class,'fa-caret-up') and not (contains(@class,'fa-caret-down'))]");
        if (!isExpand) {
            pageBlockExpandCollapseIconSelector = By.xpath("//a[contains(text(),'" + pageBlockTitle + "')]//span[contains(@class,'fa-caret-down')] | //*[text()='" + pageBlockTitle + "']/..//span[contains(@class,'fa-caret-down')]");
        }
        I.amPerforming().click().on(pageBlockExpandCollapseIconSelector);
        if (I.amPerforming().checkToSee().IsElementPresentQuick(pageBlockExpandCollapseIconSelector)) {
            I.amPerforming().click().on(pageBlockExpandCollapseIconSelector);
        }
    }

    /**
     * @param usage    - softly or not
     * @param cellName - MultiCell value
     * @param options  -List of selected option
     * @author aashish pardeshi
     */
    public void verifyMultipleSelectedOption(String usage, String cellName, List<String> options) {
        List<String> selectedOptions = new ArrayList<>();
        List<WebElement> ll = I.amPerforming().dropDownSelection().from(By.xpath("//td[@class='" + cellName + "']//following::td/select")).getOptions();
        for (WebElement e : ll) {
            selectedOptions.add(e.getText().trim());
        }
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(options.containsAll(selectedOptions)).isTrue();
        } else {
            Assert.assertTrue(options.containsAll(selectedOptions));
        }
    }

    /**
     * get any item from sticky bottom  menu at page details
     *
     * @param options
     * @return
     */
    public By getItemFromBottomMenu(String options) {
        By bottomMenuItem = By.xpath("//div[@class='bottomMenu-body']//div/a[text()='" + options + "']");
        return bottomMenuItem;
    }

    /**
     * enter value at comment/ post textarea inside my feed section at colab
     *
     * @param value
     * @param isPost -to handle two different text-box as post and comment
     * Note - If you want to select user from @mention autosuggestion then, provide exact name of user inside value like: @Automation PM
     * @author ashwini.mahore
     * @modifier ashwini.mahore -xpath modified as per change in dom structure
     * @modifier ashwini.mahore - added code to select value from @mention autosuggestion dropdown
     * @modifier meenakshi.jha - updated code to select value from @mention autosuggestion dropdown
     */
    public void enterValueInMyFeedSectionAndShareThePost(String value, Boolean isPost) {
        if (isPost == true) {
            By feedSection = ByUsing.xpath("//div/textarea[@class='mention-for-post']");
            I.amPerforming().click().on(feedSection);
            I.amPerforming().textInput().in(feedSection, value);
            I.amPerforming().waitFor().makeThreadSleep(3000);
            if (value.contains("@")) {
                String[] value1 = value.split("@");
                I.amPerforming().click().on(ByUsing.xpath("//div[@class='mentions-autocomplete-list']//li[@data-display='" + value1[1] + "']"));
            }
            I.amPerforming().click().on(ByUsing.xpath("//div/input[@id='PostToFeedButton']"));
        } else {
            By commentSection = ByUsing.xpath("//div[contains(@class,'createCollabComment') and contains(@class,'active')]//textarea[@class='mention-for-comment']");
            I.amPerforming().waitFor().makeThreadSleep(3000);
            I.amPerforming().click().on(commentSection);
            I.amPerforming().textInput().in(commentSection, value);
            if (value.contains("@")) {
                String value1 = value.replaceAll("@","");
                I.amPerforming().click().on(ByUsing.xpath("//div[@class='mentions-autocomplete-list']//li[@data-display='" + value1 + "']"));
            }
            I.amPerforming().click().on(ByUsing.xpath("//div[contains(@class,'createCollabComment') and contains(@class,'active')]//input[@value='Comment']"));
        }
    }

    /**
     * perform click on actions at comments under my feed section like : like, Delete,Share etc
     *
     * @param comment
     * @param actionName
     * @author ashwini.mahore
     * @modifier ashwini.mahore (updated xpath to click on action at comment, post and group name)
     */
    public void clickOnActionsAtCommentSection(String actionName, Boolean chooseAction, String comment) {
        if (chooseAction == true) {
            I.amPerforming().click().on(By.xpath("//div[text()='" + comment + "']/ancestor::div[contains(@class,'singleComment')]//a[text()='" + actionName + "'] | " +
                    "//*[text()='" + comment + "']/ancestor::div[contains(@class,'media-body')]//a[text()='" + actionName + "']"));
        } else {
            I.amPerforming().click().on(By.xpath("//div[text()='" + comment + "']//a[text()='More Options']"));
            I.amPerforming().click().on(By.xpath("//div[text()='" + comment + "']//a[text()='" + actionName + "']"));
        }
    }

    /**
     * perform click on link present in the table/page details
     *
     * @param checkTable
     * @param linkName
     * @author meenakshi.jha
     */
    public void clickOnLink(boolean checkTable, String usage, String linkName) {
        if (usage.equalsIgnoreCase("hyperlink")) {
            if (!checkTable) {
                I.amPerforming().click().on(By.xpath("//a[contains(text(),'" + linkName + "')] | //span[contains(text(),'" + linkName + "')] | //a[contains(@href,'" + linkName + "')]"));
            } else {
                I.amPerforming().click().on(By.xpath("//td//a[contains(text(),'" + linkName + "')]"));
            }
        } else if (usage.equalsIgnoreCase("subaward dashboard")) {
            I.amPerforming().click().on(ByUsing.xpath("//div[@id='" + linkName + "']//a//img[@src='/resource/GovGrantsImages/PieChartIcon.jpg']"));
        }

    }

    /**
     * Handles to select checkbox for the fieldName at page/form layout
     *
     * @param fieldName,  name of the field
     * @param checkboxes, checkbox label
     * @author ashish.pardesi
     * @modifier ashwini.mahore
     * @modifier richa.sharma added condition for arrow picklist since one click is not selecting the value
     */
    public void selectBelowCheckboxOptionsForField(String fieldName, List<String> checkboxes) {
        for (int i = 0; i < checkboxes.size(); i++) {
            I.amPerforming().click().on(By.xpath("//div [@id='" + fieldName + "']//label[contains(text(),'" + checkboxes.get(i) + "')]//preceding-sibling::input | " +
                    "//span[text()='" + fieldName + "']/ancestor::dl//label[contains(text(),'" + checkboxes.get(i) + "')] |" +
                    "//div [@id='" + fieldName + "']//option[contains(text(),'" + checkboxes.get(i) + "')]"));
            if (I.amPerforming().checkToSee().IsElementPresentQuick(By.xpath("//div[@id='" + fieldName + "']//img[contains(@src,'/img/arrow2_picklist_right.gif')]"))) {
                I.amPerforming().click().on(By.xpath("//div[@id='" + fieldName + "']//img[contains(@src,'/img/arrow2_picklist_right.gif')]"));
            }
        }
    }

    /**
     * assert true if mentioned help text displayed
     *
     * @param helptext
     * @author ashwini.mahore
     * @modifier ashwini.mahore - modified with soft assertion
     */
    public void assertHelpTextAtPageBlock(String usage, String helptext) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isHelpTextDisplayed(helptext)).isTrue();
        } else if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isHelpTextDisplayed(helptext));
        }
    }

    /**
     * Assert true if provided help text is displayed for given field
     *
     * @param usage
     * @param helpText
     * @param fieldLabel
     * @author komal.mukhekar
     */
    public void assertHelpTextAtField(String usage, String helpText, String fieldLabel) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isHelpTextDisplayed(helpText, fieldLabel)).isTrue();
        } else if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isHelpTextDisplayed(helpText, fieldLabel));
        }
    }

    /**
     * hover on help text inside page block detail
     *
     * @param pageBlockDetailTitle
     * @author ashwini.mahore
     * @modifier meenakshi.jha added xpath
     * @modifier saranjit.modak added xpath
     */
    public void getHelpTextAtPageBlockDetail(String pageBlockDetailTitle) {
        I.amPerforming().scroll().toMoveToElement(By.xpath("//span[contains(text(),'" + pageBlockDetailTitle + "')]/..//span[contains(@class,'fa-info')] | //a[contains(text(),'" + pageBlockDetailTitle + "')]/../following-sibling::span[contains(@class,'fa-info')] | //span[contains(text(),'" + pageBlockDetailTitle + "')]/../following-sibling::span//span[contains(@class,'fa-info')]|//span[text()='" + pageBlockDetailTitle + "']/ancestor::dt//span[@class='fa fa-info helpIcon'] | //span[contains(text(),'" + pageBlockDetailTitle + "')]/../following-sibling::span/following-sibling::div/following-sibling::helpicon//span//span[contains(@class,'fa-info')]"));
    }

    /**
     * hover on help text inside modal
     *
     * @param modalFieldTitle
     * @author komal.mukhekar
     */
    public void getHelpTextAtModalWindow(String modalFieldTitle) {
        I.amPerforming().scroll().toMoveToElement(By.xpath("//div[contains(@id,'modal')]//span[contains(text(),'" + modalFieldTitle + "')]/..//span[@class='fa fa-info helpIcon']/following-sibling::span"));
    }

    /**
     * to click on side bar menus at collab component
     *
     * @param subMenu
     * @param mainMenu
     * @author ashwini.mahore
     */
    public void clickSideBarContentInsideCollab(String subMenu, String mainMenu) {
        I.amPerforming().click().on(getCollabSideBarContentLocator(subMenu, mainMenu));
    }

    /**
     * access side bar sub header detail at collab component
     *
     * @param subMenu
     * @param mainMenu
     * @return
     * @author ashwini.mahore
     */
    public By getCollabSideBarContentLocator(String subMenu, String mainMenu) {
        return ByUsing.xpath("//a[" + I.amPerforming().sanityOfXpathTo().equals("text()", mainMenu) + "]/parent::li[contains(@class,'headermenu')]//li/a[" + I.amPerforming().sanityOfXpathTo().equals("text()", subMenu) + "]");
    }

    /**
     * click on help icon at page block
     *
     * @param blockTitle
     * @author ashwini.mahore
     */
    public void getHelpTextAtPageBlock(String blockTitle) {
        I.amPerforming().scroll().toMoveToElement(ByUsing.xpath("//h3//a[contains(text(),'" + blockTitle + "')]/..//span[contains(@class,'fa-info')]"));
    }

    /**
     * click on session time out dialog box buttons/ calendar buttons
     *
     * @param buttonName
     * @author ashwini.mahore
     */
    public void clickOnButtonsAtCalendar(String buttonName) {
        I.amPerforming().getElementReference().of(ByUsing.xpath("//button[" + I.amPerforming().sanityOfXpathTo().equals("text()", buttonName) + "] |" +
                "//a[text()='" + buttonName + "']")).click();
    }

    /**
     * complete steps to upload attachment on send email modal window
     *
     * @param attachmentName
     * @author meenakshi.jha
     */
    public void uploadAttachmentInSendEmailModal(String attachmentName) {
        By attachmentChooseFilePath = By.xpath("//div//input[@id='fileselect']");
        String defaultFilePath = System.getProperty("user.dir") + "/src/main/resources/";
        I.amPerforming().textInput().in(attachmentChooseFilePath, defaultFilePath + attachmentName);
    }

    /**
     * click on look up link on Calender
     *
     * @param lookupLink
     * @author meenakshi.jha
     */
    public void performClickOnLookupLink(String lookupLink) {
        I.amPerforming().click().on(ByUsing.xpath("//div[@id='calendar']//div[contains(@class,'fc-month-view')]//div[@class='fc-day-grid']//tbody//tr//span[contains(text(),'" + lookupLink + "')]"));

    }

    /**
     * click on look up link on Calender
     *
     * @param radioButton, fieldApiName
     * @updatedby richa sharma
     */
    public void assertRadioButtonPresents(String usage, String radioButton, String fieldApiName) {
        if (usage.equalsIgnoreCase("see")) {
            I.amPerforming().assertionsTo().assertThat(isRadioButtonPresentsForField(radioButton, fieldApiName)).isTrue();
        } else if (usage.equalsIgnoreCase("do not see")) {
            I.amPerforming().assertionsTo().assertThat(isRadioButtonPresentsForField(radioButton, fieldApiName)).isFalse();
        }
    }

    private boolean isRadioButtonPresentsForField(String radioButton, String fieldApiName) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[@id='" + fieldApiName + "']//tbody//td//label[" + I.amPerforming().sanityOfXpathTo().equals("text()", radioButton) + "]")))
                flag = true;
        } catch (org.openqa.selenium.NoSuchElementException e) {
        }
        return flag;
    }
}