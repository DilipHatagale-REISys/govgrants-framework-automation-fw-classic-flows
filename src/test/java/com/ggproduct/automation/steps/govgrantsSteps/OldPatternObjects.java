package com.ggproduct.automation.steps.govgrantsSteps;

import com.helperPackage.actionsfactory.api.ByUsing;
import org.junit.Assert;
import org.openqa.selenium.By;
import com.helperPackage.register.I;
import org.openqa.selenium.WebElement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class OldPatternObjects {

    /**
     * verify Panel header
     *
     * @param PanelName
     * @return
     * @author saranjit.modak
     */
    public boolean VerifyHeader(String PanelName) {
        boolean result = false;
        By PanelHeader = ByUsing.xpath("//div/strong[contains(text(),'" + PanelName + "')]|//h3[contains(@class,'panel-title') and contains(text(),'" + PanelName + "')]|//span[text()='" + PanelName + "']|//h2[text()='" + PanelName + "']");
        try {
            if (I.amPerforming().checkToSee().isDisplayed(PanelHeader)) {
                result = true;
            }
        } catch (Exception e) {
            return false;
        }
        return result;
    }

    /**
     * perform click to side bar content under header
     *
     * @param sideBarSubHeader
     * @param sideBarContent
     * @author saranjit.modak
     */
    public void clickSideBarContent(String sideBarSubHeader, String sideBarContent) {
        I.amPerforming().click().on(ByUsing.xpath("//div[contains(@id,'sidebarCell')]//div//div//b[text()='" + sideBarSubHeader + "']//ancestor::div[@class='panel-heading']//following-sibling::div//a[text()='" + sideBarContent + "']"));
    }


    /**
     * verify error message in Panel(Page Block)
     *
     * @param Message
     * @param PanelName
     * @author saranjit.modak
     */
    public boolean verifyErrorMessageinPanelBlock(String Message, String PanelName) {
        boolean result = false;
        By PanelHeader = ByUsing.xpath("//h2[contains(text(),'" + PanelName + "')]/ancestor::div//span[contains(text(),'" + Message + "')]|//*[contains(text(),'" + Message + "')]");
        try {
            if (I.amPerforming().checkToSee().isDisplayed(PanelHeader)) {
                result = true;
            }
        } catch (Exception e) {
            return false;
        }
        return result;
    }

    /**
     * Perform click|enter text|select|date against label
     *
     * @param parameter
     * @param enterValue
     * @param labelName
     * @author saranjit.modak
     * @modifier meenakshi.jha added xpath (03/05/2021)
     *                         added xpath for the checkbox
     */
    public void enterValueIntoLabel(String parameter, String enterValue, String labelName) {
        if (parameter.equalsIgnoreCase("text")) {
            By getField = ByUsing.xpath("//span[text()='" + labelName + "']/ancestor::div/following-sibling::div//input|//span[text()='" + labelName + "']//ancestor::li//input|//label[contains(text(),'" + labelName + "')]/../following-sibling::td/input|//span[contains(text(),'" + labelName + "')]/../../../following-sibling::td//input[@type='text']|//label[contains(text(),'" + labelName + "')]/..//div[contains(@class,'cke_contents')]| //span[text()='" + labelName + "']/ancestor::dt/following-sibling::dd//span//textarea");
            I.amPerforming().textInput().toClear(getField);
            I.amPerforming().textInput().in(getField, enterValue);
        } else if (parameter.equalsIgnoreCase("select")) {
            By getField = ByUsing.xpath("//span[text()='" + labelName + "']/ancestor::div/following-sibling::div/select|//span[text()='" + labelName + "']/ancestor::li//select|//*[contains(text(),'"+labelName+"')]/ancestor::div[@id='picklistType']//select");
            I.amPerforming().dropDownSelection().from(getField).selectByVisibleText(enterValue);
        } else if (parameter.equalsIgnoreCase("date")) {
            By getField = ByUsing.xpath("//span[text()='" + labelName + "']/ancestor::span/following-sibling::div//input");
            WebElement fieldWrapper = I.amPerforming().getElementReference().of(getField);
            if (parameter.equalsIgnoreCase("date only")) {
                this.handleDateInput(fieldWrapper, enterValue, false);
            } else {
                this.handleDateInput(fieldWrapper, enterValue, true);
            }
        } else if (parameter.equalsIgnoreCase("check")) {
            By getField = ByUsing.xpath("//span[contains(text(),'" + labelName + "')]/ancestor::div/following-sibling::div//input|//span[contains(@class,'tableCellText') and contains(@title,'" + labelName + "')]//ancestor::tr[contains(@class,'bordered')]//input[@type='checkbox']|//span[contains(text(),'" + labelName + "')]/../../following-sibling::div//input[@type='checkbox']|//label[contains(text(),'"+labelName+"')]/../input|//label[contains(text(),'"+labelName+"')]/..//div//input");
            I.amPerforming().click().on(getField);
        }
    }

    //this handle date field
    private void handleDateInput(WebElement fieldWrapper, String fieldValue, boolean isDateTime) {
        WebElement inputBox = fieldWrapper;
        DateTimeFormatter formatter = this.getDateInputFormat(inputBox, isDateTime);
        String inputValue = this.parseDateFieldValue(fieldValue, formatter);
        I.amPerforming().textInput().toClear(inputBox);
        I.amPerforming().textInput().withJavaScript(inputBox, inputValue);
    }

    private DateTimeFormatter getDateInputFormat(WebElement input, boolean isDateTime) {
        String inputFormat = "";
        try {
            if (input.getAttribute("placeholder") != null && !input.getAttribute("placeholder").equalsIgnoreCase("")) {
                inputFormat = input.getAttribute("placeholder");
            }
        } catch (Exception var8) {
        }
        StringBuilder sb = new StringBuilder();
        Matcher matcher = Pattern.compile("[mMdDYyu]{1,2}/[mMdDYyu]{1,2}/[mMdDYyu]{1,4}").matcher(inputFormat);
        int last;
        for (last = 0; matcher.find(); last = matcher.end()) {
            sb.append(inputFormat, last, matcher.start());
            String converted = matcher.group().replaceAll("D", "d").replaceAll("m", "M").replaceAll("[yY]", "u");
            sb.append(converted);
        }
        inputFormat = sb.append(inputFormat, last, inputFormat.length()).toString();
        if (inputFormat.equalsIgnoreCase("")) {
            inputFormat = "M/d/uuuu";
            if (isDateTime) {
                inputFormat = inputFormat + " hh:mm a";
            }
        } else if (isDateTime && !inputFormat.endsWith(" hh:mm a")) {
            String[] var10000 = inputFormat.split(" ");
            inputFormat = var10000[0] + " hh:mm a";
        }
        return DateTimeFormatter.ofPattern(inputFormat);
    }

    private String parseDateFieldValue(String dateFieldValue, DateTimeFormatter formatter) {
        try {
            return I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(Integer.parseInt(dateFieldValue), formatter);
        } catch (Exception var7) {
            try {
                return I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(Integer.parseInt(dateFieldValue), formatter);
            } catch (Exception var6) {
                try {
                    return LocalDate.parse(dateFieldValue, formatter).format(formatter);
                } catch (Exception var5) {
                    try {
                        return LocalDateTime.now().format(formatter);
                    } catch (Exception var4) {
                        return LocalDate.now().format(formatter);
                    }
                }
            }
        }
    }

    /**
     * handles to assert if a column value is present inside the decision table
     *
     * @param usage
     * @param value
     * @param colName
     * @param against
     * @author saranjit.modak
     */
    public void assertValueinDecisionTable(String usage, String value, String colName, String against) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isTextPresentInsideDecisionTable(value, colName, against));
        } else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(isTextPresentInsideDecisionTable(value, colName, against));
        } else if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isTextPresentInsideDecisionTable(value, colName, against)).isTrue();
            Assert.assertTrue(isTextPresentInsideDecisionTable(value, colName, against));
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isTextPresentInsideDecisionTable(value, colName, against)).isFalse();
        }
    }

    /**
     * verify text is displayed inside table
     *
     * @return
     * @author saranjit.modak
     * Modified saranjit.modak xpath added
     */
    private boolean isTextPresentInsideDecisionTable(String value, String colName, String against) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(I.amPerforming().getElementReference().of(ByUsing.xpath("//div//span[contains(text(),'" + against + "')]/ancestor::div//div[contains(text(),'" + colName + "')]/ancestor::div//tr//span[contains(text(),'" + value + "')]|//a[contains(text(),'" + value + "')]/ancestor::tbody//div[contains(text(),'" + colName + "')]/ancestor::tbody//span[contains(text(),'" + against + "')]|//span[contains(text(),'" + colName + "')]//ancestor::thead//following-sibling::tbody//td//span[text()='" + against + "']/../following-sibling::td//span[text()='" + value + "']|//div//span[contains(text(),'" + against + "')]/ancestor::div//div[contains(text(),'" + colName + "')]/ancestor::div//tr//*[contains(text(),'" + value + "')]|//span[contains(text(),'"+value+"')]/ancestor::table/thead//span[contains(text(),'"+colName+"')]/ancestor::table//*[contains(text(),'"+against+"')]")))) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * verify searchbox is present against the specific area and table id
     * @param area
     * @param id
     * @return
     * @author saranjit.modak
     */
    public Boolean isQuickSearchBoxIsPresentAtFlexTable(String area, String id) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(ByUsing.xpath("//span[contains(text(),'"+area+"')]/ancestor::div[@id='"+id+"']//div[@class='panel-heading']//div[@class='quick-search hidden-xs']"))) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * verify status is present against a specific column
     * @param usage
     * @param status
     * @param columnName
     * @return
     * @author meenakshi.jha
     */
    public void assertStatusForColumn(String usage, String status, String columnName) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isStatusDisplayedForColumn(status,columnName));
        } else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(isStatusDisplayedForColumn(status,columnName));
        }
    }

    private boolean isStatusDisplayedForColumn(String status, String columnName) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(ByUsing.xpath("//span[@title='"+columnName+"']//ancestor::thead//following-sibling::tbody//tr//td//*[@class='fa fa-clock-o' or @class='fa fa-thumbs-up' and @title='"+status+"']"))) {
                flag = true;
            }
        } catch (Exception e) {
            //unhandled exception
        }
        return flag;
    }
}