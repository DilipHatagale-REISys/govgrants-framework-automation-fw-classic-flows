package com.ggproduct.automation.steps.govgrantsSteps;

import com.helperPackage.handlers.govgrants;
import com.helperPackage.actionsfactory.api.ByUsing;
import com.helperPackage.actionsfactory.elementfunctions.Waits;
import com.helperPackage.controller.TestingBlazeGlobal;
import com.helperPackage.exception.TestingBlazeCustomException;
import com.helperPackage.objects.Elements;
import com.helperPackage.register.EnvironmentFactory;
import com.helperPackage.register.I;
import com.helperPackage.report.LogLevel;
import org.apache.commons.lang3.StringUtils;
import org.assertj.core.api.ProxyableListAssert;
import org.junit.Assert;
import org.openqa.selenium.*;

import java.text.NumberFormat;
import java.text.ParseException;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.function.Predicate;
import java.util.stream.Collectors;

public final class GovGrantsAssertionObjects {
    public String name;

    /**
     * Assert the status for a record through progress bar
     *
     * @param status
     * @param desiredColor
     * @update by jitendra pisal - Basically status is not updating immediately in some of the project
     * and hence when we get the css value for specified element, we are getting wrong color without waiting for it
     */
    public void assertStatusProgressBar(String status, String desiredColor, boolean isSoftly) {
        String trueColor = "";
        int waitTime = 0;
        try {
            while (waitTime < 15) {
                TestingBlazeGlobal.setVariable("highlightElements", "off");
                trueColor = govgrants.perform().pageDetails().getColorOfProgressBarStatus(status);
                if (desiredColor.equalsIgnoreCase(trueColor)) {
                    break;
                }
                I.amPerforming().waitFor().makeThreadSleep(1000);
                waitTime++;
                System.out.println("Waiting for : " + waitTime);
            }
        } catch (Exception ex) {

        }
        String errorMessage = "Progress bar status with text '" + status + "' is not " + desiredColor + ".\n" +
                "It was found to be " + trueColor + ".";

        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(trueColor.equalsIgnoreCase(desiredColor)
                    || ("gray".equalsIgnoreCase(status) && "grey".equalsIgnoreCase(trueColor))).isTrue();
        } else {
            Assert.assertTrue(errorMessage,
                    trueColor.equalsIgnoreCase(desiredColor)
                            || ("gray".equalsIgnoreCase(status) && "grey".equalsIgnoreCase(trueColor)));// Handle either spelling of grey/gray
        }
    }

    /**
     * Assert the status for a record through overview header
     *
     * @param record
     * @param status
     */
    protected void assertHighlightPanelStatus(String record, String status, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(isStatusPresentInHighlightPanel(record, status)).isTrue();
        } else {
            Assert.assertTrue(isStatusPresentInHighlightPanel(record, status));
        }
    }

    /**
     * @param record
     * @param status
     * @return Whether or not the desired status is present in the page details
     */
    private boolean isStatusPresentInHighlightPanel(String record, String status) {
        return I.amPerforming().checkToSee().isDisplayed(
                By.xpath("//span[text()='" + record + "']"
                        + "/../../../../../../../..//div//dt"
                        + "/span[text()='Status']/../..//dd"
                        + "//span[text()='" + status + "'] | //span[text()='" + record + "']/../..//dd//span//a[text()='" + status + "']"), true);
    }

    /**
     * Boolean if two row values are present in a flex table
     *
     * @param values list of values to find in the flex table row
     * @return true if all values found in the same row, false otherwise
     */
    public Boolean isValuesPresentInFlexTable(String... values) {
        try {
            return govgrants.perform().flexTable().getTableFollowingColumn(values).isDisplayed();
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * Assert two values are or are not present in a flex table
     *
     * @param appName
     * @param awardAmount
     * @param shouldBePresent
     */
    public void assertValuesAreInFlexTable(String appName, String awardAmount, Boolean shouldBePresent, boolean isSoftly) {
        if (shouldBePresent != isValuesPresentInFlexTable(appName, awardAmount)) {
            I.amPerforming().waitFor().makeThreadSleep(2000);
        }

        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(isValuesPresentInFlexTable(appName, awardAmount)).isEqualTo(shouldBePresent);
        } else {
            Assert.assertEquals(shouldBePresent, isValuesPresentInFlexTable(appName, awardAmount));
        }
    }

    /**
     * Assert column values are or are not present in a flex table under a
     * particular column title against a unique value
     *
     * @param columnValue
     * @param columnTitle
     * @param uniqueColumnValue
     * @param flexTableDivId
     * @param checkifpresent
     * @author hema.ananthan
     */
    public void assertValuesAreInFlexTableAgainstUniqueValue(String columnValue, String columnTitle,
                                                             String uniqueColumnValue, String flexTableDivId, Boolean checkifpresent, boolean isSoftly) {

        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(govgrants.perform().flexTable().assertCoulmnValueInColumnTitleAgainstUniqueValue(
                    columnValue, columnTitle, uniqueColumnValue, flexTableDivId)).isEqualTo(checkifpresent);
        } else {
            Assert.assertEquals(checkifpresent,
                    govgrants.perform().flexTable().assertCoulmnValueInColumnTitleAgainstUniqueValue(
                            columnValue, columnTitle, uniqueColumnValue, flexTableDivId));
        }
    }

    /**
     * Assert column values are or are not present in a flex table under a
     * particular column title against a unique value
     *
     * @param columnValue
     * @param columnTitle
     * @param flexTableDivId
     * @param checkifpresent
     * @author john.phillips
     */
    public void assertValuesAreInFlexTableWithColumnTitle(String columnValue, String columnTitle, String flexTableDivId,
                                                          Boolean checkifpresent, boolean isSoftly) {
        String columnValueUpdated = columnValue;
        if (columnValue.equalsIgnoreCase("Record Id")) {
            columnValueUpdated = govgrants.perform().pageDetails().idOfRecord;
        }

        if (checkifpresent != govgrants.perform().flexTable().assertCoulmnValueAgainstColumnTitle(columnValueUpdated, columnTitle,
                flexTableDivId)) {
            I.amPerforming().waitFor().makeThreadSleep(1000);
        }

        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(govgrants.perform().flexTable().assertCoulmnValueAgainstColumnTitle(columnValueUpdated, columnTitle,
                    flexTableDivId)).isEqualTo(checkifpresent);
        } else {
            Assert.assertEquals(checkifpresent, govgrants.perform().flexTable().assertCoulmnValueAgainstColumnTitle(columnValueUpdated, columnTitle,
                    flexTableDivId));
        }
    }

    /**
     * Assert a text string is visible on the page
     *
     * @param desiredText
     * @modifier Monu Kumar
     * @modifier Vrishali Raskar(added xpath)
     * @modifier komal.mukhekar- Handled InvalidSelectorException exception
     * @modifier komal.mukhekar- Added xpath and updated "processing" parameter from false to true
     */
    public void assertTextVisibleOnPage(boolean isContaining, String desiredText, boolean assertcan, boolean isSoftly) {
        By desiredTextSelector = By.xpath("//*[normalize-space(text())='" + desiredText + "']");
        if (isContaining) {
            try {
                desiredTextSelector = By.xpath("//div[@class='tab-inner-content']//span[contains(normalize-space(text()),'" + desiredText + "')] | //*[contains(normalize-space(text()),'" + desiredText + "')] | //*//text()[contains(.,'" + desiredText + "')] | //*[contains(text(),'" + desiredText + "')]");
                I.amPerforming().getElementReference().of(desiredTextSelector);
            } catch (InvalidSelectorException e) {
                /* Above provided xpath (I.e. //text()[contains(.,'" + desiredText + "')] ) is giving InvalidSelectorException, so handling it over here */
                desiredTextSelector = By.xpath("//div[contains(@class,'panel-body')]//span[contains(.,'" + desiredText + "')] | //div[@class='tab-inner-content']//span[contains(normalize-space(text()),'" + desiredText + "')] | //*[contains(normalize-space(text()),'" + desiredText + "')] | //*[contains(text(),'" + desiredText + "')]");
                I.amPerforming().getElementReference().of(desiredTextSelector);
            } catch (Exception e) {
                /* Ignore Exception */
            }
        }

        if (assertcan) {
            if (isSoftly) {
                I.amPerforming().assertionsTo().assertThat(I.amPerforming().checkToSee().isDisplayed(desiredTextSelector, false) || I.amPerforming().checkToSee().isEnabled(desiredTextSelector, false)).isFalse();
            } else {
                Assert.assertFalse(I.amPerforming().checkToSee().isDisplayed(desiredTextSelector, false) || I.amPerforming().checkToSee().isEnabled(desiredTextSelector, false));
            }
        } else {
            if (isSoftly) {
                I.amPerforming().assertionsTo().assertThat(I.amPerforming().checkToSee().isDisplayed(desiredTextSelector, false) || I.amPerforming().checkToSee().isEnabled(desiredTextSelector, false)).isTrue();
            } else {
                Assert.assertTrue(I.amPerforming().checkToSee().isDisplayed(desiredTextSelector, false) || I.amPerforming().checkToSee().isEnabled(desiredTextSelector, false));
            }
        }
    }

    /**
     * Assert a option present or not in parallel dropdown
     *
     * @param option
     * @param usage
     * @created by -- aashish.pardeshi
     */
    public void assertOptionPresentInList(String usage, String option) {
        boolean checkoption = false;
        if (I.amPerforming().checkToSee().IsElementPresentQuick(By.xpath("//ul[@aria-labelledby='dropdownMenu1']//li//a//span[text()='" + option + "']"))) {
            checkoption = true;
        }
        if (usage.contains("not")) {
            I.amPerforming().assertionsTo().assertThat(checkoption).isFalse();
        } else {
            I.amPerforming().assertionsTo().assertThat(checkoption).isTrue();
        }
    }


    /**
     * assert true if total records count is displayed
     *
     * @param tableId
     * @param tableName
     */
    public void assertTableTotalRecordsCountDisplayed(boolean usage, String tableId, String tableName) {
        Assert.assertTrue(isTableTotalRecordsCountIsDisplayed(usage, tableId, tableName));
    }

    /**
     * assert true if total records count is equal to number of rows/records in complete pages of table.
     *
     * @param tableId
     * @param NextPrevious
     */
    public void assertTableTotalRecordsCountWRTToRecords(String tableId, String NextPrevious) {
        Assert.assertTrue(isTableTotalRecordsCountIsDisplayedWithRespectToRecords(tableId, NextPrevious));
    }

    /**
     * assert if specified item is displayed inside list view dropdown at table
     *
     * @param dropDownValue
     * @param dataTargetValue
     */
    public void assertSpecificItemsInsideListViewDropdown(String usage, String dropDownValue, String dataTargetValue) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isValuePresentInsideDropDown(dataTargetValue, dropDownValue)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isValuePresentInsideDropDown(dataTargetValue, dropDownValue)).isFalse();
        }
    }

    /**
     * assert if options is displayed/not displayed inside sticky bottom dropdown
     *
     * @param dropDownValue
     * @param usuage
     * @author Monu Kumar
     */
    public void assertOptionsInsideBottomMenuDropdown(String usuage, String dropDownValue) {
        if (usuage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isSpecificOptionDisplayed(dropDownValue));
        } else if (usuage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(isSpecificOptionDisplayed(dropDownValue));
        } else if (usuage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isSpecificOptionDisplayed(dropDownValue)).isTrue();
        } else if (usuage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isSpecificOptionDisplayed(dropDownValue)).isFalse();
        }
    }

    /**
     * assert if specific value is displayed inside Type dropdown list at attachment modal
     *
     * @param dropDownValue
     * @author Monu.Kumar
     */
    public void assertValueInsideDropdown(String dropDownValue) {
        Assert.assertTrue(isValuePresentInsidePickList(dropDownValue));
    }

    /**
     * It will assert true if expected text is displayed on owner organization lookup field modal
     * box(for eg:- Lookup search modal )
     *
     * @param headerText
     */
    public void assertOwnerOrganizationMOdalTitle(String headerText) {
        Assert.assertTrue(I.amPerforming().getElementReference().of(By.xpath("//p[@id='customLookupModalTitle']"))
                .getAttribute("innerText").equalsIgnoreCase(headerText));
    }

    /**
     * assert if expected value is displayed/not displayed inside table
     * <p>
     * It will check the passed value from feature file like status (Draft,created,submitted for approval, rejected,etc
     * ) inside table.
     * For example:- If you select List view as Draft from flex table, All draft status will be appear inside table.So it
     * check for list of Draft status throughout the table.
     * </p>
     *
     * @param tableValue
     * @param tableId
     * @author Monu.Kumar
     */
    public void assertMultipleValuesInsideTableDisplayed(String usuage, String tableValue, String tableId) {
        if (usuage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isExpectedValueInsideTableDisplayed(tableValue, tableId));
        } else if (usuage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(isExpectedValueInsideTableDisplayed(tableValue, tableId));
        } else if (usuage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isExpectedValueInsideTableDisplayed(tableValue, tableId)).isTrue();
        } else if (usuage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isExpectedValueInsideTableDisplayed(tableValue, tableId)).isFalse();
        }
    }

    /**
     * It will assert true if expected link name is displayed at the page footer
     *
     * @param footerLinkName
     * @author ashwini.mahore
     */
    public void assertFooterLinkIsPresent(String usage, String footerLinkName) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isExpectedLinkIsDisplayedInPageFooter(footerLinkName));
        } else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(isExpectedLinkIsDisplayedInPageFooter(footerLinkName));
        } else if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isExpectedLinkIsDisplayedInPageFooter(footerLinkName)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isExpectedLinkIsDisplayedInPageFooter(footerLinkName)).isFalse();
        }
    }

    /**
     * Waits for the value of a field to match a given value.
     *
     * @param exactMatchName     Whether to match the field label using an exact match or contains.
     * @param fieldName          The field to check on the page.
     * @param exactMatchValue    Whether to match the field value using an exact match or contains.
     * @param expectedFieldValue The value of the field we are waiting for.
     * @param refreshPage        Whether or not to refresh the page while waiting.
     */
    public void waitForFieldValue(boolean exactMatchName, String fieldName, boolean exactMatchValue, String expectedFieldValue, boolean refreshPage) {
        String foundFieldValue = null;

        double totalTime = 0;
        boolean wasFound = false;
        for (long startTime = System.currentTimeMillis();
             totalTime < EnvironmentFactory.getMaxWaitTime() && !wasFound;
             totalTime = ((System.currentTimeMillis() - startTime) / 1000.0)) {
            try {
                foundFieldValue = govgrants.perform().pageDetails().getFieldValue(fieldName, exactMatchName);
            } catch (Exception e) {
                /* Ignore Exception */
            }

            if (exactMatchValue) {
                wasFound = foundFieldValue != null && foundFieldValue.equalsIgnoreCase(expectedFieldValue);
            } else {
                wasFound = foundFieldValue != null && foundFieldValue.toLowerCase().contains(expectedFieldValue.toLowerCase());
            }

            if (!wasFound) {
                if (refreshPage) {
                    I.amPerforming().browserOperationsTo().refreshPage();
                } else {
                    I.amPerforming().waitFor().makeThreadSleep(1000);
                }
            }
        }

        if (wasFound) {
            I.amPerforming().updatingOfReportWith().write(LogLevel.BUSINESS_LAYER_INFO,
                    String.format("Value of field %s '%s' %s '%s' after %s seconds.",
                            exactMatchName ? "labeled" : "containing", fieldName, exactMatchValue ? "was" : "contained", expectedFieldValue, totalTime));
        } else {
            I.amPerforming().updatingOfReportWith().write(LogLevel.BUSINESS_LAYER_ERROR,
                    String.format("Value of field %s '%s' %s '%s' after %s seconds. The found value was '%s'.",
                            exactMatchName ? "labeled" : "containing", fieldName, exactMatchValue ? "was not" : "did not contain", expectedFieldValue, totalTime, foundFieldValue));
        }
    }

    /**
     * Takes a field label from a View page layout and a checks if its associated
     * field value matches the given parameter
     *
     * @param fieldLabel
     * @param fieldValue
     * @modifier Monu Kumar
     * @modifier 2 : Tejal Gadewar
     * @modifier 3 : Saranjit Modak 02/02/2022 - Reduced Refresh Count if element not found
     * Note: added parameter @param matchesExactly for validating the value of a exact field label
     */

    /* ***************Important to Notice / Remember ****************************************
    a. The first option (the original) is meant for View pages, and the second is for Edit pages
       the original:- //span[@class='customLabelstyle' and contains(text(),'" + fieldLabel
     + "')]/ancestor::dl[1]//dd//*[text()='" + fieldValue + "']
    b. The second option is needed due to a bug in Framework
    c. A “TODO”, with a date a month or two in the future to check if the issue has been resolved.
           Then, once framework fixes the issue we can remove the second xpath option.
    ******************************************************************************************* */
    public void assertFieldValue(String fieldLabel, boolean matchesExactly, String fieldValue, boolean isSoftly) {
        String foundValue = null;
        for (int i = 0; i < 2 && !fieldValue.equalsIgnoreCase(foundValue); i++) {
            try {
                foundValue = govgrants.perform().pageDetails().getFieldValue(fieldLabel, matchesExactly);
            } catch (Exception e) {
                foundValue = null;
            }

            if (!fieldValue.equalsIgnoreCase(foundValue)) {
                I.amPerforming().browserOperationsTo().refreshPage();
            }
        }

        I.amPerforming().assertionsTo().assertThat(foundValue)
                .as("Checking value of field with label '%s'", fieldLabel)
                .isEqualToIgnoringCase(fieldValue);

        if (!isSoftly && !I.amPerforming().assertionsTo().wasSuccess()) {
            I.amPerforming().assertionsTo().assertAll();
        }
    }

    public void verifyFieldAvailableOnModal(String field, String text) {
        try {
            By fieldText = By.xpath("//div[@id='modaltemp']//div//span[contains(text(),'" + field + "')]//following::dd//span[contains(text(),'" + text + "')]");
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().checkToSee().isDisplayed(fieldText)).isTrue();
        } catch (Exception e) {

        }
    }

    /**
     * Asserts the value of a field on the page.
     * Waits for the field to be present, but not for the right value to be present.
     *
     * @param exactMatch         Whether to match the field label exactly, or using contains.
     * @param fieldLabel         The field label to match.
     * @param expectedFieldValue The field value that is expected.
     */
    public void assertFieldValue(boolean exactMatch, String fieldLabel, String expectedFieldValue) {
        String foundFieldValue = null;
        try {
            foundFieldValue = govgrants.perform().pageDetails().getFieldValue(fieldLabel, exactMatch);
        } catch (Exception e) {
            /* Ignore Exception */
        }

        I.amPerforming().assertionsTo().assertThat(foundFieldValue).
                as(String.format("Checking value of field %s '%s'", exactMatch ? "labeled" : "containing", fieldLabel))
                .isEqualToIgnoringCase(expectedFieldValue);
    }

    /**
     * Checks if a specific message is visible in the page details
     *
     * @param unsanitizedDesiredMessages
     * @param contains
     * @modifier aashish.pardeshi
     */
    public void assertPageMessageValue(boolean contains, List<String> unsanitizedDesiredMessages, String isSoftly) {
        By pageMessagesSelector = By.xpath("//div[@id='errorDiv']//li//descendant-or-self::*[text()]" // Page messages
                + " | //div[contains(@class, 'alert') and @ng-repeat]" // First variant of flex table messages
                + " | //div[contains(@class,'alertMessages')]//div[contains(@class,'alertMessage')]//span[@class='ng-binding']" // Second variant of flex table messages
                + " | //div[contains(@class,'alert-danger')]" // get the alert danger message...
                + " | //div//span[contains(@class,'dynamic-msg-box-margin')]"
        );

        List<String> desiredMessages = unsanitizedDesiredMessages
                .stream().map(str -> str.replaceAll("\uFFFD\\?", "\"")
                        .replaceAll("\u201C", "\"").replaceAll("\u201D", "\"")
                        .replaceAll("\u2018", "'").replaceAll("\u2019", "'")).collect(Collectors.toList());

        if (isSoftly.contains("not")) {
            try {
                // Must use WaitForElementToBePresent as this element never becomes visible, and thus it will always wait the full waitTime
                govgrants.perform().mainPage().waitForNavigationLogoToDisappear();
                I.amPerforming().waitFor().ElementToBePresent(By.xpath("//script[contains(@src, 'PageMessages')]"), 5);
                I.amPerforming().waitFor().ElementToBePresent(pageMessagesSelector, 2);
            } catch (Exception e) {
                /* Ignore Exception */
            }
            List<String> presentMessages = I.amPerforming().getElementReference().forListOfElements().of(pageMessagesSelector, contains)
                    .stream().map(el -> el.getText().replaceAll("[\u201c\u201d]", "\"").replaceAll("[\u2018\u2019]", "'"))
                    .collect(Collectors.toList());
            boolean present = true;
            for (int i = 0; i < desiredMessages.size(); i++) {
                present = presentMessages.contains(desiredMessages.get(i));
                if (present)
                    break;
            }
            I.amPerforming().assertionsTo().assertThat(present).isFalse();
        } else {
            try {
                // Must use WaitForElementToBePresent as this element never becomes visible, and thus it will always wait the full waitTime
                govgrants.perform().mainPage().waitForNavigationLogoToDisappear();
                I.amPerforming().waitFor().ElementToBePresent(By.xpath("//script[contains(@src, 'PageMessages')]"), 5);
                I.amPerforming().waitFor().ElementToBePresent(pageMessagesSelector, 2);
            } catch (Exception e) {
                /* Ignore Exception */
            }

            Set<String> presentMessages = I.amPerforming().getElementReference().forListOfElements().of(pageMessagesSelector, contains)
                    .stream().map(el -> el.getText().replaceAll("[\u201c\u201d]", "\"").replaceAll("[\u2018\u2019]", "'"))
                    .collect(Collectors.toSet());

            Set<String> missingMessages = desiredMessages.stream()
                    .filter(desired -> presentMessages.stream()
                            .noneMatch(present -> contains ? present.contains(desired) : present.equalsIgnoreCase(desired)))
                    .collect(Collectors.toSet());

            StringBuilder errorMessage = new StringBuilder();
            errorMessage.append("\nRequired page messages were not found.\n")
                    .append("Page messages present in the page details:\n");
            for (String pageMessage : presentMessages) {
                errorMessage.append("--- '").append(pageMessage).append("' ---\n");
            }
            errorMessage.append("Missing page messages:\n");
            for (String missingMessage : missingMessages) {
                errorMessage.append("--- '").append(missingMessage).append("' ---\n");
            }

            I.amPerforming().assertionsTo().assertThat(missingMessages.size())
                    .as(errorMessage.toString())
                    .isEqualTo(0);

            if (isSoftly.equals("see")) {
                I.amPerforming().assertionsTo().assertAll();
            }
        }
    }

    /**
     * Asserts that a button on the top right of a page is or is not present
     *
     * @param buttonName
     * @param assertCan
     * @author hema.ananthan
     */
    public void assertTopRightButtonInPage(String buttonName, boolean assertCan, boolean isSoftly) {
        govgrants.perform().mainPage().waitForNavigationLogoToDisappear();
        try {
            I.amPerforming().waitFor().ElementListToBePresent(govgrants.perform().pageDetails().getAnyTopRightButton(buttonName));
        } catch (Exception e) {
        }
        List<Elements> elements = I.amPerforming().getElementReference().forListOfElements().of(govgrants.perform().pageDetails().getAnyTopRightButton(buttonName), false);
        if (assertCan) {
            if (isSoftly) {
                I.amPerforming().assertionsTo().assertThat(0).isNotEqualTo(elements.size());
            } else {
                Assert.assertNotEquals(elements.size(), 0);
            }
        } else {
            if (isSoftly) {
                I.amPerforming().assertionsTo().assertThat(0).isEqualTo(elements.size());
            } else {
                Assert.assertEquals(elements.size(), 0);
            }
        }
    }

    /**
     * Asserts that a button on the bottom of a page is or is not present
     *
     * @param buttonName
     * @param assertCan
     * @author Monu.Kumar
     */
    public void assertBottomRightButtonInPage(String buttonName, boolean assertCan, boolean isSoftly) {
        govgrants.perform().mainPage().waitForNavigationLogoToDisappear();
        try {
            I.amPerforming().waitFor().ElementListToBePresent(govgrants.perform().pageDetails().getAnyBottomRightButton(buttonName));
        } catch (Exception e) {
        }
        List<Elements> elements = I.amPerforming().getElementReference().forListOfElements().of(govgrants.perform().pageDetails().getAnyBottomRightButton(buttonName), false);
        if (assertCan) {
            if (isSoftly) {
                I.amPerforming().assertionsTo().assertThat(0).isNotEqualTo(elements.size());
            } else {
                Assert.assertNotEquals(elements.size(), 0);
            }
        } else {
            if (isSoftly) {
                I.amPerforming().assertionsTo().assertThat(0).isEqualTo(elements.size());
            } else {
                Assert.assertEquals(elements.size(), 0);
            }
        }
    }

    /**
     * Asserts that a text displayed on tool tip after hovering
     *
     * @param text
     * @modifier ashwini.mahore
     */
    public void assertTextDisplayedOnMiniPageLayout(String usage, String text) {
        By textInsideMiniPageLayout = By.xpath("//div[@class='tooltipster-base tooltipster-shadow tooltipster-fade tooltipster-fade-show']//div[@class='tooltipster-content']");
        I.amPerforming().waitFor().makeThreadSleep(2000);
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo()
                    .assertThat(
                            I.amPerforming().actionToGet().text(textInsideMiniPageLayout, false).contains(text)
                                    || I.amPerforming().actionToGet().text(textInsideMiniPageLayout, false).equalsIgnoreCase(text)
                    ).isTrue();
        } else {
            Assert.assertTrue(
                    I.amPerforming().actionToGet().text(textInsideMiniPageLayout, false).contains(text)
                            || I.amPerforming().actionToGet().text(textInsideMiniPageLayout, false).equalsIgnoreCase(text)
            );
        }
    }

    /**
     * @param text
     * @param responseType
     * @param fieldName
     * @author aashish.pardeshi
     * @modifier meenakshi.jha added if condition for text and dropdown response types
     */
    public void verifyTextOfTextArea(String text, String responseType, String fieldName) {
        boolean flag = false;
        try {
            By fieldWrapperLocator;
            if (responseType.equalsIgnoreCase("text")) {
                fieldWrapperLocator = ByUsing.xpath("//div[@id='field" + fieldName + "' or @id='" + fieldName + "']//input[not(contains(@type,'hidden'))] | //div[@id='field" + fieldName + "' or @id='" + fieldName + "']//textarea | //div[@id='field" + fieldName + "' or @id='" + fieldName + "']//select");
                String givenText = I.amPerforming().actionToGet().attribute(fieldWrapperLocator, "value");
                if (givenText.equals(text)) {
                    flag = true;
                }
            } else if (responseType.equalsIgnoreCase("dropdown")) {
                fieldWrapperLocator = ByUsing.xpath("//div[@id='field" + fieldName + "' or @id='" + fieldName + "']//select");
                String selectedOption = I.amPerforming().dropDownSelection().from(fieldWrapperLocator).getFirstSelectedOption().getText();
                if (selectedOption.equals(text)) {
                    flag = true;
                }
            }
        } catch (Exception e) {
        }
        I.amPerforming().assertionsTo().assertThat(flag).isTrue();
    }

    /**
     * @param usage    softly
     * @param keyValue total value saved in hashmap
     * @param colName  column name
     * @param tableId  flex table id
     * @author jitendra.pisal
     */
    public void validateTotalFromGivenColumnInFlexTable(String usage, String keyValue, String colName, String tableId) {
        try {
            WebElement row = I.amPerforming().getElementReference().of(By.xpath("//div[@id='" + tableId + "']//table//tbody//tr"));
            Map<String, Integer> columnMapping = govgrants.perform().flexTable().constructColumnMapping(row, Collections.singleton(colName));
            By specificColumnValue = By.xpath("//div[@id='" + tableId + "']//table//tbody//tr[last()]//td[contains(@class,'headerCell')][" + columnMapping.get(colName) + "]");
            Number valueFromLocator = NumberFormat.getCurrencyInstance(Locale.US).parse(
                    I.amPerforming().actionToGet().text(specificColumnValue)
            );
            if (usage.contains("softly")) {
                I.amPerforming().assertionsTo().assertThat(valueFromLocator.longValue()).isEqualTo(
                        NumberFormat.getIntegerInstance().parse(keyValue).longValue()
                );
            } else {
                Assert.assertEquals(valueFromLocator.longValue(), NumberFormat.getIntegerInstance().parse(keyValue)
                );
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    /**
     * Asserts that a button on the top right of a flex table is or is not present
     *
     * @param tableId
     * @param buttonName
     * @param assertCan
     */
    public void assertCanOrCannotSeeTopRightButtonInFlexTableById(String tableId, String buttonName,
                                                                  boolean assertCan, boolean isSoftly) {
        List<Elements> elements = I.amPerforming().getElementReference().forListOfElements().of(govgrants.perform().flexTable().getTopRightButtonLocatorByTableId(tableId, buttonName), false);
        if (assertCan) {
            if (isSoftly) {
                I.amPerforming().assertionsTo().assertThat(0).isNotEqualTo(elements.size());
            } else {
                Assert.assertNotEquals(elements.size(), 0);
            }
        } else {
            if (isSoftly) {
                I.amPerforming().assertionsTo().assertThat(0).isEqualTo(elements.size());
            } else {
                Assert.assertEquals(elements.size(), 0);
            }
        }
    }

    /**
     * Asserts that row level button inside table is or is not present
     *
     * @param tableId
     * @param buttonName
     * @param uniqueColumnValue
     * @param shouldBeVisible
     * @author hema.ananthan
     */
    public void assertCanOrCannotSeeRowLevelButtonInFlexTableById(String tableId, String uniqueColumnValue,
                                                                  String buttonName, boolean shouldBeVisible, boolean isSoftly) {
        String columnValueUpdated = uniqueColumnValue;
        if (uniqueColumnValue.equalsIgnoreCase("Record Id")) {
            columnValueUpdated = govgrants.perform().pageDetails().idOfRecord;
        }
        I.amPerforming().getElementReference().of(govgrants.perform().flexTable().getFlexTableColumn(columnValueUpdated));
        List<Elements> elements = I.amPerforming().getElementReference().forListOfElements().of(govgrants.perform().flexTable().getTableActionIcon(tableId, buttonName, columnValueUpdated), false);
        if (shouldBeVisible) {
            for (Elements element : elements) {
                if (element.isDisplayed()) {
                    return;
                }
            }
            if (isSoftly) {
                I.amPerforming().assertionsTo().assertThat("Button is present").isEqualTo("Button was not present, or not displayed");
            } else {
                Assert.fail("Button was not present, or not displayed");
            }
        } else {
            for (Elements element : elements) {
                if (element.isDisplayed()) {
                    if (isSoftly) {
                        I.amPerforming().assertionsTo().assertThat("Button is not present").isEqualTo("Button was present and displayed");
                    } else {
                        Assert.fail("Button was present and displayed");
                    }
                }
            }
        }

    }

    /**
     * get sub tab inside detail each main detail page like overview etc.
     *
     * @param desiredSubTab
     */
    public void getSubTabsInsideMainDetailPage(String desiredSubTab, boolean assertCan, boolean isSoftly) {
        By allSubTabsLocator = By.xpath("//div[@id='myTabs']/ul//li/a[@name]");

        List<String> allSubTabNames;
        try {
            allSubTabNames = I.amPerforming().getElementReference().forListOfElements().of(allSubTabsLocator)
                    .stream().map(el -> el.getAttributes("name")).map(StringUtils::normalizeSpace).collect(Collectors.toList());
        } catch (StaleElementReferenceException e) {
            allSubTabNames = I.amPerforming().getElementReference().forListOfElements().of(allSubTabsLocator)
                    .stream().map(el -> el.getAttributes("name")).map(StringUtils::normalizeSpace).collect(Collectors.toList());
        }

        if (assertCan) {
            I.amPerforming().assertionsTo().assertThat(allSubTabNames).contains(desiredSubTab);
        } else {
            I.amPerforming().assertionsTo().assertThat(allSubTabNames).doesNotContain(desiredSubTab);
        }

        if (!isSoftly) {
            I.amPerforming().assertionsTo().assertAll();
        }
    }


    /**
     * Checks if a given List of Strings matches the phase panels currently visible on the page.
     * <p>
     * Can also check the order of the phase panels, and if there are any unexpected panels.
     * <p>
     * Checks using a soft assertion, so no exception will be thrown on failure.
     *
     * @param exactMatch          Whether the assertion should fail if there are phase panels present that are not expected
     * @param checkOrder          Whether the assertion should fail if the phase panels are not in the expected order
     * @param expectedPhasePanels The list of phase panels that are expected to be on the page
     */
    public void checkForPhasePanels(boolean exactMatch, boolean checkOrder, List<String> expectedPhasePanels) {
        // This locator should match all phase panels titles in the page details exactly once
        By allPhasePanelTitlesLocator = By.xpath("//h3[contains(@class, 'panel-title')]"  // Standard Page Block Title
                + " | //a[contains(@data-target, 'Attachments')]" // Collab Title
                + " | //div[contains(@class, 'header-title') and text()]" // Regular Flex Table Title
                + " | //div[contains(@class, 'panel-heading')]//div[contains(@class, 'panel-title')]" // Second Flex Table Title
                + " | //div[contains(@class, 'header-title')]//span[contains(@class, 'flexHeaderName')]" // Enhanced Flex Table Title
                + " | //a[text()='Attachments' or text()='Notes' or text()='Snapshot History' or text()='Approval History']"); // Standard Framework Page Block Titles

        try {
            // Wait for the page details to be present
            I.amPerforming().waitFor().ElementToBePresent(By.xpath("//div[contains(@class, 'page-content-wrapper')]"));

            // Wait 2 seconds for the page detail buttons to be present
            // (2 seconds max, in case there are no buttons on the page)
            I.amPerforming().waitFor().ElementToBePresent(allPhasePanelTitlesLocator, 2);
        } catch (Exception e) {
            /* Ignore exception */
        }

        // Get the list of phase panels that area actually visible
        List<String> actualPhasePanels = I.amPerforming().getElementReference().forListOfElements().of(allPhasePanelTitlesLocator, false)
                // Remove hidden phase panels
                .stream().filter(Elements::isDisplayed)
                // Transform into List<String>
                .map(el -> StringUtils.normalizeSpace(el.getText()))
                // Remove empty strings
                .filter(Predicate.not(String::isBlank))
                // Remove duplicates and collect results
                .distinct().collect(Collectors.toList());

        compareLists(expectedPhasePanels, actualPhasePanels,
                "Verifying phase panels",
                exactMatch, checkOrder
        );
    }

    /**
     * Checks if a given List of Strings matches the page detail buttons currently on the page.
     * <p>
     * Can also check the order of the buttons, and if there are any unexpected buttons.
     * <p>
     * Checks using a soft assertion, so no exception will be thrown on failure.
     *
     * @param exactMatch      Whether the assertion should fail if there are buttons present that are not expected
     * @param checkOrder      Whether the assertion should fail if the buttons are not in the expected order
     * @param expectedButtons The list of buttons that are expected to be on the page
     */
    public void checkForPageDetailButtons(boolean exactMatch, boolean checkOrder, List<String> expectedButtons) {
        // This locator should match each button in the page detail header and footer exactly once
        By allPageDetailButtons = By.xpath(I.amPerforming().sanityOfXpathTo().concat(
                "//div[contains(@class, 'overview-header')] | //div[contains(@class, 'panel-footer')]",
                "//button | //input | //a[@type='button']")
        );

        try {
            // Wait for the page detail header and footer to be present
            I.amPerforming().waitFor().ElementToBePresent(By.xpath("//div[contains(@class, 'overview-header') or contains(@class, 'registration-page-heading')]"));
            I.amPerforming().waitFor().ElementToBePresent(By.xpath("//div[contains(@class, 'panel-footer')]"));

            // Wait 2 seconds for the page detail buttons to be present
            // (2 seconds max, in case there are no buttons on the page)
            I.amPerforming().waitFor().ElementToBePresent(allPageDetailButtons, 2);
        } catch (Exception e) {
            /* Ignore exception */
        }

        // Get the list of buttons actually in the page details
        List<String> actualButtons = I.amPerforming().getElementReference().forListOfElements().of(allPageDetailButtons, false)
                // Remove hidden and disabled buttons
                .stream().filter(el -> el.isDisplayed() && el.isEnabled())
                // Transform into List<String>
                .map(el -> ("".equalsIgnoreCase(el.getText().trim())) ? el.getAttributes("value") : el.getText())
                // Remove duplicates and collect results
                .distinct().collect(Collectors.toList());

        compareLists(expectedButtons, actualButtons,
                "Verifying page detail buttons",
                exactMatch, checkOrder
        );
    }

    /**
     * Checks if a given List of Strings matches the modal buttons currently on the page.
     * <p>
     * Can also check the order of the buttons, and if there are any unexpected buttons.
     * <p>
     * Checks using a soft assertion, so no exception will be thrown on failure.
     *
     * @param exactMatch      Whether the assertion should fail if there are buttons present that are not expected
     * @param checkOrder      Whether the assertion should fail if the buttons are not in the expected order
     * @param expectedButtons The list of buttons that are expected to be in the modal
     */
    public void checkForModalButtons(boolean exactMatch, boolean checkOrder, List<String> expectedButtons) {
        By allModalButtons = By.xpath(I.amPerforming().sanityOfXpathTo().concat("//div[contains(@class, 'panel-footer') or contains(@class,'modal-footer ng-scope' )]",
                "//button | //input | //a[@type='button']"));

        try {
            // Wait for the modal footer to be present
            I.amPerforming().waitFor().ElementToBePresent(By.xpath("//div[contains(@class, 'panel-footer')]"));

            // Wait 2 seconds for the modal buttons to be present
            // (2 seconds max, in case there are no buttons in the modal)
            I.amPerforming().waitFor().ElementToBePresent(allModalButtons, 2);
        } catch (Exception e) {
            /* Ignore exception */
        }

        // Get the list of buttons actually in the page details
        List<String> actualButtons = I.amPerforming().getElementReference().forListOfElements().of(allModalButtons, false)
                // Remove hidden and disabled buttons
                .stream().filter(el -> el.isDisplayed() && el.isEnabled())
                // Transform into List<String>
                .map(el -> ("".equalsIgnoreCase(el.getText().trim())) ? el.getAttributes("value") : el.getText())
                // Remove duplicates and collect results
                .distinct().collect(Collectors.toList());

        compareLists(expectedButtons, actualButtons,
                "Verifying modal buttons",
                exactMatch, checkOrder
        );
    }

    /**
     * Checks if a given List of Strings matches the options available in a given dropdown field.
     * <p>
     * Can also check the order of the options, and if there are any unexpected options.
     * <p>
     * Checks using a soft assertion, so no exception will be thrown on failure.
     *
     * @param exactMatch      Whether the assertion should fail if there are values present that are not expected
     * @param checkOrder      Whether the assertion should fail if the values are not in the expected order
     * @param fieldApiName    The apiName of the dropdown field
     * @param expectedOptions The list of values that are expected to be in the dropdown field
     * @modifier ashwini.mahore
     * @modifier 2 meenakshi.jha added xpath for the field-name attribute (11/10/2020)
     */
    public void checkForDropdownOptions(boolean exactMatch, boolean checkOrder, String fieldApiName, List<String> expectedOptions) {
        List<String> actualOptions = I.amPerforming().dropDownSelection()
                .from(By.xpath("//div[" + I.amPerforming().sanityOfXpathTo().equals("@id", "field" + fieldApiName) + "]//select | //span[text()='" + fieldApiName + "']/../following-sibling::dd//select | //field[@field-name='" + fieldApiName + "']//select | //div[@id='" + fieldApiName + "']//select"))
                .getOptions().stream().map(WebElement::getText).collect(Collectors.toList());

        compareLists(expectedOptions, actualOptions,
                "Verifying options of dropdown field with api name '" + fieldApiName + "'",
                exactMatch, checkOrder
        );
    }

    /**
     * Checks if a given List of Sntrings matches the top right buttons currently in a given flex table.
     * * Checks for top right buttos in a table by id or the title shown in the phase panel.
     * <p>
     * Can also check the order of the buttons, and if there are any unexpected buttons.
     * <p>
     * Checks using a soft assertion, so no exception will be thrown on failure.
     *
     * @param exactMatch      Whether the assertion should fail if there are buttons present that are not expected
     * @param checkOrder      Whether the assertion should fail if the buttons are not in the expected order
     * @param byId            Whether the flex table should be found using the flex table id, or the name in the phase panel
     * @param identifier      The String that should be used to identify the correct table
     * @param expectedButtons The list of buttons that are expected to be in flex table's phase panel
     */
    public void checkForFlexTableTopRightButtons(boolean exactMatch, boolean checkOrder, boolean byId, String identifier, List<String> expectedButtons) {
        String tableLocator;
        if (byId) {
            tableLocator = "//div[@id='" + identifier + "']//div[contains(@class, 'panel')]";
        } else {
            tableLocator = "//div[contains(@class, 'panel-heading')]//*[" + I.amPerforming().sanityOfXpathTo().equals("text()", identifier) + "]//ancestor::div[contains(@class, 'panel-heading')][1]";
        }

        By allTopRightButtonsLocator = By.xpath(tableLocator + "//button");

        try {
            // Wait for the table phase panel to be present
            I.amPerforming().waitFor().ElementToBePresent(By.xpath(tableLocator));

            // Wait 2 seconds for the table top right buttons to be present
            // (2 seconds max, in case there are no top right buttons in the table)
            I.amPerforming().waitFor().ElementToBePresent(allTopRightButtonsLocator, 2);
        } catch (Exception e) {
            /* Ignore exception */
        }

        // Get the list of buttons actually in the table phase panel
        List<String> actualButtons = I.amPerforming().getElementReference().forListOfElements().of(allTopRightButtonsLocator, false)
                // Remove hidden and disabled buttons
                .stream().filter(el -> el.isDisplayed() && el.isEnabled())
                // Transform into List<String>
                .map(Elements::getText).filter(Predicate.not(String::isBlank))
                // Remove duplicates and collect results
                .distinct().collect(Collectors.toList());

        compareLists(expectedButtons, actualButtons,
                String.format("Verifying top right buttons of flex table %s '%s'", byId ? "with id" : "named", identifier),
                exactMatch, checkOrder
        );
    }

    /**
     * Checks if a given List of List of Strings matches the headers currently in a given flex table.
     * Checks for headers in a table by id or the title shown in the phase panel.
     *
     * @param exactMatch      Whether the assertion should fail if there are headers present that are not expected
     * @param checkOrder      Whether the assertion should fail if the headers are not in the expected order
     * @param byId            Whether the flex table should be found using the flex table id, or the name in the phase panel
     * @param identifier      The String that should be used to identify the correct table
     * @param expectedHeaders The list of headers that are expected to be in the flex table
     */
    public void validateTableHeaders(boolean exactMatch, boolean checkOrder, boolean byId, String identifier, List<String> expectedHeaders) {

        List<List<String>> actualTable = getTable(byId, identifier);

        if (I.amPerforming().assertionsTo().wasSuccess()) {
            compareLists(expectedHeaders, actualTable.get(0),
                    String.format("Verifying headers of table %s '%s':", byId ? "with id" : "named", identifier),
                    exactMatch, checkOrder
            );
        }
    }

    /**
     * Checks if a given List of Strings matches the rows currently in a given flex table.
     * Checks for rows in a table by id or the title shown in the phase panel.
     *
     * @param exactMatch   Whether the assertion should fail if there are rows present that are not expected
     * @param checkOrder   Whether the assertion should fail if the rows are not in the expected order
     * @param byId         Whether the flex table should be found using the flex table id, or the name in the phase panel
     * @param identifier   The String that should be used to identify the correct table
     * @param expectedRows The List of rows that are expected to be in the flex table
     */
    public void validateTableRows(boolean exactMatch, boolean checkOrder, boolean byId, String identifier, List<List<String>> expectedRows) {

        List<List<String>> actualTable = getTable(byId, identifier);

        if (I.amPerforming().assertionsTo().wasSuccess()) {
            List<List<String>> actualRows = actualTable.subList(1, actualTable.size());

            StringBuilder errorMessage = new StringBuilder("");


            // Verify that all expected rows are present
            List<List<String>> missingRows = expectedRows.stream()
                    .filter(expectedRow -> actualRows.stream().noneMatch(actualRow -> actualRow.containsAll(expectedRow)))
                    .collect(Collectors.toList());

            if (missingRows.size() != 0) {
                errorMessage.append("The following rows were missing:\n")
                        .append(convertListOfListToTabularFormat(missingRows));
            }

            // Verify that no unexpected rows are present
            if (exactMatch) {
                List<List<String>> extraRows = actualRows.stream()
                        .filter(actualRow -> expectedRows.stream().noneMatch(actualRow::containsAll))
                        .collect(Collectors.toList());

                if (extraRows.size() != 0) {
                    errorMessage.append("The following rows were unexpected:\n")
                            .append(convertListOfListToTabularFormat(extraRows));
                }
            }

            // Verify that the rows are correctly ordered
            if (checkOrder && missingRows.size() == 0) {
                List<List<String>> actualRowsWithoutExtras = actualRows.stream()
                        .filter(actualRow -> expectedRows.stream().anyMatch(actualRow::containsAll))
                        .collect(Collectors.toList());


                for (int i = 0; i < expectedRows.size(); i++) {
                    if (!actualRowsWithoutExtras.get(i).containsAll(expectedRows.get(i))) {
                        errorMessage.append("The rows were not in the same order.");
                        break;
                    }
                }
            }

            if (!"".equalsIgnoreCase(errorMessage.toString())) {
                I.amPerforming().assertionsTo().assertThat(1)
                        .as("The actual rows of table %s '%s' did not match the expected rows:%nExpected Rows:%n%sActual Rows:%n%s%s",
                                byId ? "by id" : "named", identifier,
                                convertListOfListToTabularFormat(expectedRows),
                                convertListOfListToTabularFormat(actualRows),
                                errorMessage.toString())
                        .isEqualTo(0);
            }
        }
    }

    /**
     * Checks if a given table matches a table currently on the web page.
     * Finds the table by id or the title shown in the phase panel.
     * <br>
     * Uses {@link #validateTableHeaders} and {@link #validateTableRows} to check the headers and rows of the table.
     * Then it additionally verifies that all the row values are found under the expected headers.
     *
     * @param exactMatchHeaders Whether the assertion should fail if there are headers present that are not expected
     * @param checkOrderHeaders Whether the assertion should fail if the headers are not in the expected order
     * @param exactMatchRows    Whether the assertion should fail if there are rows present that are not expected
     * @param checkOrderRows    Whether the assertion should fail if the rows are not in the expected order
     * @param byId              Whether the flex table should be found using the flex table id, or the name in the phase panel
     * @param identifier        The String that should be used to identify the correct table
     * @param expectedTable     The table that is expected to be found on the page
     */
    public void validateTableHeadersAndRows(Boolean exactMatchHeaders, Boolean checkOrderHeaders,
                                            Boolean exactMatchRows, Boolean checkOrderRows,
                                            Boolean byId, String identifier, List<List<String>> expectedTable) {

        validateTableHeaders(exactMatchHeaders, checkOrderHeaders, byId, identifier, expectedTable.get(0));

        if (I.amPerforming().assertionsTo().wasSuccess()) {
            validateTableRows(exactMatchRows, checkOrderRows, byId, identifier, expectedTable.subList(1, expectedTable.size()));
        }

        // Check that the row values are in the right columns
        if (I.amPerforming().assertionsTo().wasSuccess()) {
            List<List<String>> actualTable = getTable(byId, identifier);

            List<List<String>> incorrectExpectedRows = new ArrayList<>();
            List<List<String>> incorrectActualRows = new ArrayList<>();

            for (List<String> expectedRow : expectedTable.subList(1, expectedTable.size())) {
                for (List<String> actualRow : actualTable.subList(1, expectedTable.size())) {
                    if (actualRow.containsAll(expectedRow)) {
                        for (int i = 0; i < expectedRow.size(); i++) {
                            if (!actualRow.get(actualTable.get(0).indexOf(expectedTable.get(0).get(i))).equalsIgnoreCase(expectedRow.get(i))) {
                                incorrectExpectedRows.add(expectedRow);
                                incorrectActualRows.add(actualRow);
                                break;
                            }
                        }
                    }
                }
            }

            if (incorrectExpectedRows.size() != 0) {
                incorrectExpectedRows.add(0, expectedTable.get(0));
                incorrectActualRows.add(0, actualTable.get(0));

                I.amPerforming().assertionsTo().assertThat(0)
                        .as("The columns of table %s '%s' are misaligned:%nExpected Alignment:%n%sActual Alignment:%n%s",
                                byId ? "with id" : "named", identifier,
                                convertListOfListToTabularFormat(incorrectExpectedRows),
                                convertListOfListToTabularFormat(incorrectActualRows))
                        .isEqualTo(1);
            }
        }
    }

    /**
     * Finds a requested table on the webpage, and returns a List<List<String>> of all the values found in it.
     * <p>
     * If a table cell contains icons that have text when you hover over them, then these values
     * will be included in the returned table, separated by " & ".
     * (i.e. "View & Edit & Delete")
     * <p>
     * Should work just fine in regular flex tables and collapsed Enhanced Grids.
     * To get a nested table in an Enhanced Grid, use an id that only selects the interior table,
     * or use the name of the table, if possible.
     * <p>
     * It may have some wonky results if used with an Enhanced Grid that has an expanded row
     * (e.g. the rows of the sub table will be included as well)
     * It has not been extensively tested in N2G type tables.
     * <p>
     * If the requested table is not found on the webpage, then a soft assertion is logged,
     * and an empty list is returned.
     *
     * @param byId       Whether the flex table should be found using the flex table id, or the name in the phase panel
     * @param identifier The String that should be used to identify the correct table
     * @return A List of Strings that
     */
    public List<List<String>> getTable(boolean byId, String identifier) {
        By tableLocator;
        if (byId) {
            tableLocator = By.xpath(String.format("//div[@id='%s']//table", identifier));
        } else {
            tableLocator = By.xpath(String.format("//div[contains(@class, 'panel-heading')]//text()[%s]/ancestor::div[.//table][1]//table", I.amPerforming().sanityOfXpathTo().equals(".", identifier)));
        }

        List<List<String>> toReturn = new ArrayList<>();

        try {
            // Get the table from the page
            WebElement theTable = I.amPerforming().getElementReference().of(tableLocator);

            // For padding out shortened rows
            int longestRow = 0;

            // Loop through each row in the table
            // Option for rows (tbody) is specialized to ignore the "Total Records" row
            for (WebElement row : theTable.findElements(By.xpath(".//thead//tr | .//tbody//tr[not(contains(@ng-if, 'totalRecords') or contains(@ng-if, '!noRecords'))]"))
                    // Filter out rows that are not displayed
                    .stream().filter(WebElement::isDisplayed).collect(Collectors.toList())) {

                List<String> rowValues = new ArrayList<>();

                // Loop through each cell in the row
                for (WebElement cell : row.findElements(By.xpath(".//td | .//th"))
                        // Filter out cells that are not displayed
                        .stream().filter(WebElement::isDisplayed).collect(Collectors.toList())) {

                    By iconLocator = By.xpath(".//a[@title and .//*[contains(@class, 'fa-')]] | .//span[@title and contains(@class, 'fa-')]");

                    // Check if there are icons in the cell
                    if ("".equalsIgnoreCase(cell.getText()) && cell.findElements(iconLocator).size() != 0) {
                        // Add titles of all icons in the cell to list
                        rowValues.add(cell.findElements(iconLocator)
                                // Filter out icons that are not displayed or enabled
                                .stream().filter(el -> el.isDisplayed() && el.isEnabled())
                                // Join the titles of the icons by " & "
                                .map(el -> el.getAttribute("title")).collect(Collectors.joining(" & ")));
                    } else {
                        // Add text of the cell to list
                        rowValues.add(cell.getText());
                    }
                }

                // Save the length of the longest row for later
                if (rowValues.size() > longestRow) {
                    longestRow = rowValues.size();
                }

                toReturn.add(rowValues);
            }

            // Pad out any rows shorter than the longest row with empty strings
            for (List<String> row : toReturn) {
                for (int i = row.size(); i < longestRow; i++) {
                    row.add("");
                }
            }
        } catch (StaleElementReferenceException e) {
            return getTable(byId, identifier);
        } catch (Exception e) {
            I.amPerforming().assertionsTo().assertThat(1)
                    .as("Table %s '%s' was not found on the page", byId ? "with id" : "named", identifier)
                    .isEqualTo(0);
        }

        return toReturn;
    }

    /**
     * <p>Converts a List of List of String into a single String, which is formatted to look like a DataTable.</p>
     * <p>For example, the List below:
     * <br>
     * [["Column A", "Column B"], ["Row 1 &nbsp &nbsp &nbsp", "Row 2 &nbsp &nbsp &nbsp"]]</p>
     * <br>
     * <p>Would be turned into the following table:
     * <br>
     * | Column A                | Column B                |<br>
     * | Row 1 &nbsp &nbsp &nbsp | Row 2 &nbsp &nbsp &nbsp |</p>
     *
     * @param tableToConvert The List of List of String that is to be condensed into a single String
     * @return The table in tabular format, arranged so all columns are correctly padded.
     */
    private String convertListOfListToTabularFormat(List<List<String>> tableToConvert) {
        // Maps each column number to the longest String in that column
        // This will allow the columns to be padded the correct amount
        Map<Integer, Integer> maxCellLengths = new HashMap<>();
        for (List<String> strings : tableToConvert) {
            for (int j = 0; j < strings.size(); j++) {
                maxCellLengths.putIfAbsent(j, 0);

                if (strings.get(j).length() > maxCellLengths.get(j)) {
                    maxCellLengths.put(j, strings.get(j).length());
                }
            }
        }

        // This builds the table to return
        // Uses the map from earlier to ensure that all columns are padded out
        // to the length of the longest entry in the column
        StringBuilder toReturn = new StringBuilder();
        for (List<String> strings : tableToConvert) {
            toReturn.append("|");
            for (int j = 0; j < strings.size(); j++) {
                toReturn.append(String.format(" %s%s |", strings.get(j),
                        " ".repeat(maxCellLengths.get(j) - strings.get(j).length())));
            }
            toReturn.append("\n");
        }
        return toReturn.toString();
    }

    /**
     * @param isModal
     * @param tableId
     * @param tableName
     * @return true if total Records count  is displayed as same as total rows displayed on UI
     * <p>his function will handle comparison part both the table coming on page detail or on modal.<p/>T
     * @author Monu Kumar
     */
    public Boolean isTableTotalRecordsCountIsDisplayed(boolean isModal, String tableId, String tableName) {
        boolean flag = false;
        List count = new ArrayList();
        if (isModal) {
            count = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='" + tableId + "']//div/table/tbody/tr"));
            String uiContent = I.amPerforming().actionToGet().text(By.xpath("//div[@id='" + tableId + "']//span[contains(text(),'Total Records')]"));
            try {
                if (Integer.parseInt(uiContent.replaceAll("[\\D]", "")) == count.size()) {
                    flag = true;
                }
            } catch (Exception e) {
            }
            return flag;
        } else {
            if (tableName.equalsIgnoreCase("flextable")) {
                count = govgrants.perform().flexTable().getCompleteTableRow(tableId);
            } else if (tableName.equalsIgnoreCase("flexGrid")) {
                count = govgrants.perform().flexTable().getCompleteFlexGridRow(tableId);
            }
            String uiContent = I.amPerforming().actionToGet().text(By.xpath("//div[@id='" + tableId + "']//div[contains(@class,'panel-body')]//following-sibling::span[contains(text(),'Total Records')]| //div[@id='" + tableId + "'][contains(@class,'panel-body')]//following-sibling::span[contains(text(),'Total Records')]"));
            try {
                if (Integer.parseInt(uiContent.replaceAll("[\\D]", "")) == count.size()) {
                    flag = true;
                }
            } catch (Exception e) {
            }
            return flag;
        }
    }

    /**
     * @param tableId
     * @param NextPrevious <p>This function will check total records is equals to total numbers of records/rows in complete pages of table by clicking on next button inside table<p/>
     * @author Monu Kumar
     */
    public Boolean isTableTotalRecordsCountIsDisplayedWithRespectToRecords(String tableId, String NextPrevious) {
        String uiContent = I.amPerforming().actionToGet().text(By.xpath("//div[@id='" + tableId + "']//ancestor::div[@id and contains(@class,'ng-scope') and @ng-controller]//span[contains(text(),'Total Records')]"));
        int totalRecords = Integer.parseInt(uiContent.replaceAll("[\\D]", ""));
        WebElement nextPageButton = I.amPerforming().getElementReference().of(By.xpath("//div[@id='" + tableId + "']//ancestor::div[@id and contains(@class,'ng-scope') and @ng-controller]//a[@title='" + NextPrevious + "']"));
        int countedRows = 0;
        List paginationRowSize = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='" + tableId + "']//ancestor::div[@id and contains(@class,'ng-scope') and @ng-controller]//div/table/tbody/tr"));

        countedRows += paginationRowSize.size();
        while (nextPageButton.getAttribute("ng-disabled").equalsIgnoreCase("false")) {
            govgrants.perform().flexTable().flexTablePagination(tableId, NextPrevious);
            paginationRowSize = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='" + tableId + "']//ancestor::div[@id and contains(@class,'ng-scope') and @ng-controller]//div/table/tbody/tr"));
            countedRows += paginationRowSize.size();
        }
        return countedRows == totalRecords;
    }

    /**
     * return trur/false if specified item is displayed/not displayed
     *
     * @param dropDownValue
     * @param dropDownValue
     * @author Monu.Kumar
     */
    public boolean isValuePresentInsideDropDown(String dataTargetValue, String dropDownValue) {
        boolean flag = false;
        List<Elements> listViewOptions = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//*[@data-target='" + dataTargetValue + "']/following-sibling::*[@id='dropdownListView']//a"));
        for (Elements we : listViewOptions) {
            if (we.getAttributes("title").equalsIgnoreCase(dropDownValue)) {
                flag = true;
                break;
            }
        }
        return flag;
    }

    /**
     * return true if specific option is displayed
     *
     * @param dropDownValue
     * @return
     */
    public boolean isSpecificOptionDisplayed(String dropDownValue) {
        boolean flag = false;
        try {
            WebElement element = I.amPerforming().getElementReference().of(govgrants.perform().pageDetails().getItemFromBottomMenu(dropDownValue));
            if (element.isDisplayed()) {
                flag = true;
            }
        } catch (NoSuchElementException e) {
            return false;
        } catch (TimeoutException t) {
            return false;
        }
        return flag;
    }

    /**
     * return true if picklist dropDownValue is displayed
     *
     * @param dropDownValue
     * @return modifier saranjit.modak added xpath
     */
    public boolean isValuePresentInsidePickList(String dropDownValue) {
        String[] exp = null;
        if (dropDownValue.contains(":")) {
            exp = dropDownValue.split(":");
        }
        List<String> opt01 = Arrays.asList(exp);
        By selectD = By.xpath("//select[@title='Classification']|//span[text()='Classification']/../following-sibling::div//option | //select[@title='Classification']/option");
        List<WebElement> wee = I.amPerforming().dropDownSelection().from(selectD).getOptions();
        List<String> opt = new ArrayList<>();
        for (int i = 0; i < wee.size(); i++) {
            opt.add(wee.get(i).getText());
        }
        if (opt01.containsAll(opt)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * return true/false if expected value is Displayed/not Displayed present inside table
     *
     * @param tableValue
     * @param tableId
     * @return
     */
    private Boolean isExpectedValueInsideTableDisplayed(String tableValue, String tableId) {
        boolean flag = false;
        List<Elements> elements;
        By tableCellValue = By.xpath("//div[@id='" + tableId + "']//td//span[" + I.amPerforming().sanityOfXpathTo().equals("@title", tableValue) + "or " + I.amPerforming().sanityOfXpathTo().equals("text()", tableValue) + "]");
        elements = I.amPerforming().getElementReference().forListOfElements().of(tableCellValue, false);
        try {
            for (Elements element : elements) {
                if (element.isDisplayed()) {
                    flag = true;
                }
            }
        } catch (Exception e) {
        }
        return flag;
    }


    /**
     * Use this step to validate the multiple keywords from downloaded pdf
     *
     * @param shouldBeDisplayed - assertion field
     * @param fileName          - name of the pdf file without extension
     * @param rowData           - data in list of map
     *                          e.g |  Detail  |  Page Number  |
     *                          |     abc  |    1          |
     *                          Here abc is the text that we have to validate on page number 1
     * @Author Jitendra.Pisal
     */
    public void validateMultipleContentInPdf(
            String shouldBeDisplayed, String fileName, List<Map<String, String>> rowData
    ) {
        int size = rowData.size();
        for (int i = 1; i < size; i++) {
            String pageNumber = rowData.get(i).get("Page Number");
            String text = rowData.get(i).get("Detail");
            if (shouldBeDisplayed.contains("softly")) {
                I.amPerforming().assertionsTo().assertThat("softly see".equalsIgnoreCase(shouldBeDisplayed)).isEqualTo(govgrants.perform().mainPage().assertTextInPDF(text, Integer.parseInt(pageNumber), fileName));
            } else {
                Assert.assertEquals("see".equalsIgnoreCase(shouldBeDisplayed), govgrants.perform().mainPage().assertTextInPDF(text, Integer.parseInt(pageNumber), fileName));
            }
        }
    }

    /**
     * Waits for a term to be present in a flex table.
     * Will either perform a quick search or refresh the page until the term is present.
     *
     * @param searchTerm      The term to look for in the flex table
     * @param byId            Whether to find the table by Id or Name
     * @param identifier      The id or name of the table to search for
     * @param withQuickSearch Whether to perform quick search or page refresh while waiting for the search term
     */
    public void waitForRowInTable(String searchTerm, boolean byId, String identifier, boolean withQuickSearch) throws TestingBlazeCustomException {
        List<List<String>> theTable = getTable(byId, identifier);

        if (withQuickSearch) {
            if (byId) {
                govgrants.perform().quickSearch().performTableSpecificQuickSearch(identifier, searchTerm);
            } else {
                govgrants.perform().quickSearch().performQuickSearch(searchTerm);
            }
        }

        double totalTime = 0;
        for (long startTime = System.currentTimeMillis();
             totalTime < Waits.STANDARD_WAIT_TIME * 10 && theTable.stream().noneMatch(el -> el.contains(searchTerm));
             totalTime = (System.currentTimeMillis() - startTime) / 1000.0) {

            if (withQuickSearch) {
                if (byId) {
                    govgrants.perform().quickSearch().performTableSpecificQuickSearch(identifier, searchTerm);
                } else {
                    govgrants.perform().quickSearch().performQuickSearch(searchTerm);
                }
            } else {
                I.amPerforming().browserOperationsTo().refreshPage();
            }

            theTable = getTable(byId, identifier);

            I.amPerforming().waitFor().makeThreadSleep(1000);
        }

        boolean wasFound = theTable.stream().anyMatch(el -> el.contains(searchTerm));
        I.amPerforming().updatingOfReportWith().write(wasFound ? LogLevel.BUSINESS_LAYER_INFO : LogLevel.BUSINESS_LAYER_ERROR,
                String.format("Search term '%s' %s found in table %s '%s' after %s seconds",
                        searchTerm, wasFound ? "was" : "was not", byId ? "with id" : "named", identifier, totalTime));
    }

    private void compareLists(List<String> expectedList, List<String> actualList, String message, boolean exactMatch, boolean orderedMatch) {
        ProxyableListAssert<String> assertion = I.amPerforming().assertionsTo().assertThat(actualList)
                .as(message);

        if (exactMatch && orderedMatch) {
            assertion.containsExactlyElementsOf(expectedList);
        } else if (exactMatch) {
            assertion.containsExactlyInAnyOrderElementsOf(expectedList);
        } else if (orderedMatch) {
            assertion.containsSubsequence(expectedList);
        } else {
            assertion.containsAll(expectedList);
        }
    }

    /**
     * return true if expected expected link name is displayed at page footer
     *
     * @param footerLinkName
     * @return
     */
    private boolean isExpectedLinkIsDisplayedInPageFooter(String footerLinkName) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(govgrants.perform().pageDetails().getFooterLinks(footerLinkName))) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * assert true if specific field inside page block detail as per name is not
     * displayed
     *
     * @param changedFieldName
     * @author keerti.munde
     */
    public void assertSpecificFieldInsidePageBlockDetailNotDisplayed(String usage, String changedFieldName) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isSpecificFieldAtPageBlockDetailDisplayed(changedFieldName)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isSpecificFieldAtPageBlockDetailDisplayed(changedFieldName)).isFalse();
        }
    }

    /**
     * return true if Specified field at page block detail is not displayed
     *
     * @param changedFieldName
     * @return
     * @author keerti.munde
     */
    private boolean isSpecificFieldAtPageBlockDetailDisplayed(String changedFieldName) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(getPageBlockDetailsElement(changedFieldName))) {
                flag = true;
            }
        } catch (org.openqa.selenium.NoSuchElementException e) {

        }
        return flag;
    }

    /**
     * get item from page block details
     *
     * @param changedFieldName
     * @return
     * @author keerti.munde
     * @modifier keerti.munde
     */
    private WebElement getPageBlockDetailsElement(String changedFieldName) {
        return I.amPerforming().getElementReference().of(By.xpath("//span[contains(text(),'" + changedFieldName + "')] | //div//dl//span[contains(text(),'" + changedFieldName + "')] | //div[@id='" + changedFieldName + "'] | //span//b[text()='" + changedFieldName + "'] | //div//label[contains(text(),'" + changedFieldName + "')]"));
    }

    /**
     * @param windowTitle
     * @return return true if modal window is closed
     * @author ashwini.mahore
     */
    public void assertModalWindowIsClosed(String windowTitle) {
        Assert.assertTrue(isModalWindowClosed(windowTitle));
    }

    /**
     * @param text
     * @param tableId
     * @return true if label of grouped row in enhanced grid is displayed
     * @author monu.kumar
     */
    public void assertTextContainingRowAtParentFlexTabel(String usage, String text, String tableId) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isExpectedTextIsDisplayedAtParentFlexTabledRow(text, tableId));
        } else if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isExpectedTextIsDisplayedAtParentFlexTabledRow(text, tableId)).isTrue();
        }
    }

    /**
     * @param emailDetails
     * @return true if send email modal html page details displayed
     * @author tejal.gadewar
     */
    public void assertTextOnHtmlPage(String usage, String emailDetails) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(validateMailHtmlPage(emailDetails)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(validateMailHtmlPage(emailDetails)).isFalse();
        }
    }

    /**
     * Assert true if any part of the content matches with current url
     *
     * @param content
     * @author ashwini.mahore
     */
    public void assertCurrentURL(String content) {
        Assert.assertTrue(isCurrentURL(content));
    }

    /**
     * assert if specific value is displayed inside select dropdown list
     *
     * @param dropDownValue
     * @author tejal.gadewar
     */
    public void assertValueInsideSelectDropdownAtPageDetail(String usage, String dropDownValue, String fieldApiName) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isValuePresentInsideSelectDropdownPickList(dropDownValue, fieldApiName)).isTrue();
        } else if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isValuePresentInsideSelectDropdownPickList(dropDownValue, fieldApiName));
        }else if (usage.equalsIgnoreCase("softly cannot see")) {
            I.amPerforming().assertionsTo().assertThat(isValuePresentInsideSelectDropdownPickList(dropDownValue, fieldApiName)).isFalse();
        }
    }

    /**
     * @param windowTitle
     * @return return true if  modal window is closed
     * @author ashwini.mahore
     */
    private boolean isModalWindowClosed(String windowTitle) {
        boolean flag = false;
        TestingBlazeGlobal.setVariable("highlightElements", "off");
        WebElement getModalWindowLoadingIcon = I.amPerforming().getElementReference().of(By.xpath("//p[text()='" + windowTitle + "']/../..//div[@class='modalLoadIcon']"));
        try {
            if (getModalWindowLoadingIcon.getAttribute("style").equalsIgnoreCase("display: block;")) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }


    /**
     * @param text
     * @param tableId
     * @return true if label of grouped row in enhanced grid is displayed
     * @author monu.kumar
     */
    private Boolean isExpectedTextIsDisplayedAtParentFlexTabledRow(String text, String tableId) {
        boolean flag = false;
        try {
            ArrayList<String> obtainedList = new ArrayList<>();
            List<Elements> rows_table = govgrants.perform().flexTable().getCompleteTableRow(tableId);
            for (Elements we : rows_table) {
                obtainedList.add(we.getText());
            }
            for (int row = 0; row < obtainedList.size(); row++) {
                if (obtainedList.get(row).contains(text)) {
                    flag = true;
                    break;
                } else {
                    flag = false;
                }
            }

        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * @param emailDetails
     * @return true if send email modal html page details displayed
     * @author tejal.gadewar
     */
    public boolean validateMailHtmlPage(String emailDetails) {
        String[] emailField = emailDetails.split("\\|");
        boolean flag = false;
        for (String str : emailField) {
            flag = I.amPerforming().checkToSee().isDisplayed(By.xpath("//form//div[contains(text(), '" + str + "')] | //form[@id='upload']//div//span[contains(text(), '" + str + "')]"));
        }
        return flag;
    }

    /**
     * match the current url content with provided content
     *
     * @param content
     * @return true if any part is matched
     * @author ashwini.mahore
     */
    private boolean isCurrentURL(String content) {
        boolean flag = false;
        if (I.amPerforming().browserOperationsTo().getCurrentUrl().contains(content)) {
            flag = true;
        }
        return flag;
    }

    /**
     * To validate the dropdown values for multiple fields
     *
     * @param values---values in list of map
     *                        |FieldApiName|Value1|Value2|Value3|
     * @author Meenakshi Jha
     */
    public void assertTheFollowingOptionsInDropdownField(List<Map<String, String>> values) {
        boolean flag = false;
        for (Map<String, String> map : values) {
            By fieldLocator = By.xpath("//div[@id='" + map.get("Field") + "']");
            WebElement fieldWrapper = I.amPerforming().getElementReference().of(fieldLocator);
            flag = false;
            if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//select")).size() > 0) {
                List<WebElement> dropdownOptions = I.amPerforming().dropDownSelection().from(I.amPerforming().getElementReference().ofNested(fieldWrapper, By.xpath(".//select"))).getOptions();

                List<String> fieldlist = new ArrayList<String>();
                for (int i = 0; i < dropdownOptions.size(); i++) {
                    fieldlist.add(dropdownOptions.get(i).getText().trim());
                }

                List<String> fieldlist2 = new ArrayList<String>();
                for (int i = 1; i < map.size(); i++) {
                    fieldlist2.add(map.get("Value" + i));
                }

                if (fieldlist2.containsAll(fieldlist)) {
                    flag = true;
                }
            }
            I.amPerforming().assertionsTo().assertThat(flag).isTrue();
        }

    }

    /**
     * return true if picklist dropDownValue is displayed inside table/grid
     *
     * @param dropDownValue
     * @param fieldApiName
     * @author tejal.gadewar
     * @modifier saranjit.modak added xpath
     * @modifier tejal.gadewar added xpath for field name since fieldapi is not present
     */
    private boolean isValuePresentInsideSelectDropdownPickList(String dropDownValue, String fieldApiName) {
        String[] exp = null;
        if (dropDownValue.contains(":")) {
            exp = dropDownValue.split(":");
        }
        List<String> opt01 = Arrays.asList(exp);
        By selectD = By.xpath("//div[@id='" + fieldApiName + "']//select|//*[@field-name='" + fieldApiName + "']//select|//div[@id='" + fieldApiName + "']//select//option|//span[@id='" + fieldApiName + "']//select|//span[contains(text(),'"+fieldApiName+"')]/..//following-sibling::dd//select");
        List<WebElement> wee = I.amPerforming().dropDownSelection().from(selectD).getOptions();
        List<String> opt = new ArrayList<>();
        for (int i = 0; i < wee.size(); i++) {
            if (!wee.get(i).getText().isEmpty()) {
                opt.add(wee.get(i).getText());
            }
        }
        return opt.containsAll(opt01);
    }

    /**
     * This function is used to check mail content
     *
     * @param expectedMailText
     * @author keerti.munde
     * @modifier saranjit.modak added condition
     * @modifier aashish.pardeshi -- added condition for maildrop portal 28/04/2021
     * @modifier tejal.gadewar-- added condition to check expected partial text present in email body 28/05/2021
     * @modifier saranjit.modak -- added xpath 13/07/2021 , 28/09/2021
     */
    public void assertMailTexMatches(String usage, String mailportal, boolean isContains, String expectedMailText) {
        if (mailportal.equals("mail")) {
            By actualmMailText = ByUsing.xpath("//div[@id='mailmillieu']//div//center|//div[@id='mailmillieu']//div//tbody | //div[@id='mail']//td[@height]| //body/main[1]");
            if (usage.equalsIgnoreCase("see")) {
                I.amPerforming().assertionsTo().assertThat(I.amPerforming().actionToGet().text(actualmMailText))
                        .isEqualToNormalizingWhitespace(expectedMailText);
            } else if (usage.equalsIgnoreCase("do not see")) {
                By donotSeeText = ByUsing.xpath("//table[@id='inbox']//td[@class='whc bordfin_gbd alt'] | //div[@id='mail']| //body/main[1]");
                I.amPerforming().assertionsTo().assertThat(I.amPerforming().actionToGet().text(donotSeeText))
                        .isNotEqualToNormalizingWhitespace(expectedMailText);
            }
        } else if (mailportal.equals("maildrop")) {

            //Click on first mail
            By actualmMailSubjectLine = By.xpath("//div[@class='messagelist-container']/div[1]/a");
            I.amPerforming().click().on(actualmMailSubjectLine);
            I.amPerforming().waitFor().makeThreadSleep(9000);

            //Switch to frame
            I.amPerforming().switchTo().frame(ByUsing.xpath("//iframe[@class='messagedata-iframe']"));

            //Read the text from body
            By actualmMailText = ByUsing.xpath("//td[@styleinsert='1']//tbody");
            String actualt = I.amPerforming().actionToGet().text(actualmMailText).replaceAll("[\\n\\t ]", "");
            if (usage.equalsIgnoreCase("see")) {
                expectedMailText = expectedMailText.replaceAll("[\\n\\t ]", "");
                if (isContains) {
                    I.amPerforming().assertionsTo().assertThat(actualt).contains(expectedMailText);
                } else {
                    I.amPerforming().assertionsTo().assertThat(actualt).isEqualToNormalizingWhitespace(expectedMailText);
                }
            } else if (usage.equalsIgnoreCase("do not see")) {
                By donotSeeText = ByUsing.xpath("//div[@class='messagelist-container']//div//a//following-sibling::div[@class='messagedata-container']");
                I.amPerforming().assertionsTo().assertThat(I.amPerforming().actionToGet().text(donotSeeText))
                        .isNotEqualToNormalizingWhitespace(expectedMailText);
            }

        }
    }

    /**
     * This function is used to check mail subject
     *
     * @param subjectText
     * @author keerti.munde
     * @modifier aashish.pardeshi -- added condition for maildrop portal 28/04/2021
     */
    public void assertMailSubjectTexMatches(String mailportal, String subjectText) {
        if (mailportal.equals("maildrop")) {
            By actualmMailSubjectLine = By.xpath("//div[@class='messagelist-container']/div[1]/a");
            try {
                for (int i = 0; i < 60; i++) {
                    I.amPerforming().click().on(By.xpath("//button/span[text()='Reload']"));
                    if (I.amPerforming().checkToSee().IsElementPresentQuick(actualmMailSubjectLine)) {
                        I.amPerforming().click().on(actualmMailSubjectLine);
                        I.amPerforming().waitFor().makeThreadSleep(5000);
                        I.amPerforming().assertionsTo().assertThat(I.amPerforming().actionToGet().text(By.xpath("//div[1]/a//div[@class='messagelist-subject']//span")))
                                .isEqualToIgnoringWhitespace(subjectText);
                        I.amPerforming().waitFor().makeThreadSleep(2000);
                        I.amPerforming().click().on(ByUsing.xpath("//button//span[contains(text(),'Close')]"));
                        break;
                    }
                    I.amPerforming().waitFor().makeThreadSleep(4000);
                    I.amPerforming().click().on(By.xpath("//button/span[text()='Reload']"));
                }
            } catch (Exception e) {
                //unhandled exception
            }
        } else {
            By actualmMailSubjectText = By.xpath("//div[@class='f16'] | //div[contains(@class,'f18')]");
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().actionToGet().text(actualmMailSubjectText))
                    .isEqualToIgnoringWhitespace(subjectText);
        }
    }

    /**
     * This function is used to check mail subject not match
     *
     * @param subjectText
     * @author keerti.munde
     */
    public void assertMailSubjectNotTexMatches(String subjectText) {
        By actualmMailSubjectText = By.xpath("//div[@class='f16']");
        I.amPerforming().assertionsTo().assertThat(I.amPerforming().actionToGet().text(actualmMailSubjectText))
                .isNotEqualToIgnoringWhitespace(subjectText);
    }

    /**
     * @param linkName
     * @author keerti.munde
     */
    public void assertIsHyperTextDisplayed(String usage, String linkName) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isHyperTextDisplayed(linkName)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isHyperTextDisplayed(linkName)).isFalse();
        }
    }

    /**
     * This function is used to check hyperlink on page block
     *
     * @param linkName
     * @return Assert true if hyperlink is displayed inside page block
     * @author keerti.munde
     * @modified ashwini.mahore
     * @modified saranjit.modak xpath added
     */
    private boolean isHyperTextDisplayed(String linkName) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//span[contains(text(),'" + linkName + "')]/ancestor::a |  //a[contains(text(),'"+linkName+"')]"))) {
                flag = true;
            }
        } catch (Exception e) {
            flag = false;
        }

        return flag;
    }

    /**
     * assert true if selected/checked Value In Radio Field is displayed at form layout
     *
     * @param value
     * @param fieldName
     * @author ashwini.mahore
     */
    public void assertSelectedValueInRadioField(String value, String fieldName) {
        Assert.assertTrue(isSelectedValueInRadioFieldDisplayed(value, fieldName));
    }

    /**
     * assert true if selected/checked Value In Radio Field is displayed at form layout
     *
     * @param value
     * @param fieldName
     * @author ashwini.mahore
     */
    private boolean isSelectedValueInRadioFieldDisplayed(String value, String fieldName) {
        boolean flag = false;
        if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//span[text()='" + fieldName + "']/ancestor::dt/following-sibling::dd//label[" + I.amPerforming().sanityOfXpathTo().equals("text()", value) + "]/preceding-sibling::input[@checked]"))) {
            flag = true;
        }
        return flag;
    }


    /**
     * To verify the label of fields in page block
     *
     * @param usage
     * @param pageBlockName
     * @param fieldLabel
     * @author aashish.pardeshi
     * @modifier meenakshi.jha added if condition and method to verify the field label on modal (11/05/2020)
     */
    public void assertFieldsInPageBlock(String usage, String pageBlockName, List<String> fieldLabel) {
        if (usage.equalsIgnoreCase("see")) {
            I.amPerforming().assertionsTo().assertThat(seeBelowFieldsInPageBlock(pageBlockName, fieldLabel)).isTrue();
        } else if (usage.equalsIgnoreCase("do not see")) {
            I.amPerforming().assertionsTo().assertThat(seeBelowFieldsInPageBlock(pageBlockName, fieldLabel)).isFalse();
        } else if (usage.equalsIgnoreCase("see on modal")) {
            I.amPerforming().assertionsTo().assertThat(seeBelowFieldsInPageBlockForModal(pageBlockName, fieldLabel)).isTrue();
        } else if (usage.equalsIgnoreCase("do not see on modal")) {
            I.amPerforming().assertionsTo().assertThat(seeBelowFieldsInPageBlockForModal(pageBlockName, fieldLabel)).isFalse();
        }
    }

    private Boolean seeBelowFieldsInPageBlock(String pageBlockName, List<String> fieldLabel) {
        boolean flag = false;
        try {
            List<Elements> elements = I.amPerforming().getElementReference().forListOfElements().of(ByUsing.xpath("//h3//a[contains(text(),'" + pageBlockName + "')]/ancestor::div[@class='panel-heading']/following-sibling::div//dt | //h3[contains(text(),'" + pageBlockName + "')]/ancestor::div[@class='panel-heading']/following-sibling::div//dt"));
            List<String> fieldlist = new ArrayList<String>();
            for (int i = 0; i < elements.size(); i++) {
                fieldlist.add(elements.get(i).getText().trim());
            }
            if (fieldlist.containsAll(fieldLabel)) {
                flag = true;
            }
        } catch (Exception e) {
            //unhandled exception
        }
        return flag;
    }

    private Boolean seeBelowFieldsInPageBlockForModal(String pageBlockName, List<String> fieldLabel) {
        boolean flag = false;
        try {
            List<Elements> elements = I.amPerforming().getElementReference().forListOfElements().of(ByUsing.xpath("//div[@id='modaltemp']//h3//a[contains(text(),'" + pageBlockName + "')]/ancestor::div[@class='panel-heading']/following-sibling::div//dt"));
            List<String> fieldlist = new ArrayList<String>();
            for (int i = 0; i < elements.size(); i++) {
                fieldlist.add(elements.get(i).getText().trim());
            }
            if (fieldlist.containsAll(fieldLabel)) {
                flag = true;
            }
        } catch (Exception e) {
            //unhandled exception
        }
        return flag;
    }

    /**
     * assert if correct title is displayed in overlay iframe window
     *
     * @param usage
     * @param titleName
     * @author meenakshi.jha
     */
    public void asserTextInOverLayIframe(String usage, String titleName) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isSpecificOverlayDisplayed(titleName));
        } else if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isSpecificOverlayDisplayed(titleName)).isTrue();
        }
    }

    private boolean isSpecificOverlayDisplayed(String titleName) {
        govgrants.perform().mainPage().waitForNavigationLogoToDisappear();
        boolean flag = false;
        if (I.amPerforming().checkToSee().isDisplayed(getOverLayTitle(titleName))) {
            flag = true;
        }
        return flag;
    }

    private WebElement getOverLayTitle(String titleName) {
        return I.amPerforming().getElementReference().of(ByUsing.xpath(
                "//iframe[contains(@ng-src,'apex') or contains(@src,'apex')]//ancestor::div[contains(@class,'modal-content')][1]//p[text()='"
                        + titleName
                        + "']|//iframe[contains(@ng-src,'apex') or contains(@src,'apex')]//ancestor::div[contains(@class,'modal-content')][1]//p[text()='"
                        + titleName
                        + "']| //iframe[contains(@ng-src,'apex') or contains(@src,'apex')]//ancestor::div[contains(@class,'modal-content')][1]//div[contains(text(),'"
                        + titleName + "')]"));
    }

    /**
     * validate if fields is in edit mode is displayed at page details
     *
     * @param fieldAPIName
     * @param isSoftly
     * @author saranjit.modak
     */
    public void assertFieldIsEditableOrNot(String fieldAPIName, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(isFieldEditable(fieldAPIName)).isFalse();
        } else {
            Assert.assertFalse(isFieldEditable(fieldAPIName));
        }
    }

    private Boolean isFieldEditable(String fieldAPIName) {
        boolean flag = true;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//field[@field-name='" + fieldAPIName + "']/input|//field[@field-name='" + fieldAPIName + "']/span")))
                flag = true;
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /**
     * assert true/false if fields displayed/not displayed in edit mode
     *
     * @param usage
     * @param fieldApiName
     * @author saranjit.modak
     * @modifier saranjit.modak added validation for date text boxes in page layout 28-10-2022
     */
    public void assertEditModeOfPageDetailsFields(String usage, String fieldsoption, String fieldApiName) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isFieldsIsInEditModeAtPAgeDetails(fieldApiName));
        } else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(isFieldsIsInEditModeAtPAgeDetails(fieldApiName));
        } else if (usage.equalsIgnoreCase("softly see")) {
            if (fieldsoption.equalsIgnoreCase("fields")) {
                I.amPerforming().assertionsTo().assertThat(isFieldsIsInEditModeAtPAgeDetails(fieldApiName)).isTrue();
            } else if (fieldsoption.equalsIgnoreCase("Date Box")) {
                I.amPerforming().assertionsTo().assertThat(isDateFieldsIsInEditModeAtPAgeDetails(fieldApiName)).isTrue();
            }
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            if (fieldsoption.equalsIgnoreCase("fields")) {
                I.amPerforming().assertionsTo().assertThat(isFieldsIsInEditModeAtPAgeDetails(fieldApiName)).isFalse();
            } else if (fieldsoption.equalsIgnoreCase("Date Box")) {
                I.amPerforming().assertionsTo().assertThat(isDateFieldsIsInEditModeAtPAgeDetails(fieldApiName)).isFalse();
            }
        }
    }

    private boolean isFieldsIsInEditModeAtPAgeDetails(String fieldApiName) {
        By fieldsAtPageDetails = ByUsing.xpath("//div[@id='" + fieldApiName + "']//div[contains(@class,'field-value')]//label//following-sibling::span[1] | //*[@field-name='" + fieldApiName + "']//span[contains(@class,'requiredField h-line-left')]|//*[@id='" + fieldApiName + "'] | //field[@field-name='" + fieldApiName + "']");
        boolean flag = false;
        try {
            if (I.amPerforming().actionToGet().attribute(fieldsAtPageDetails, "id").toLowerCase().contains("j_id0") || I.amPerforming().checkToSee().isDisplayed(fieldsAtPageDetails)) {
                flag = true;
            }
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    private boolean isDateFieldsIsInEditModeAtPAgeDetails(String fieldApiName) {
        By DatefieldsAtPageDetails = ByUsing.xpath("//*[@id='" + fieldApiName + "']//input[@placeholder='mm/dd/yyyy' and contains(@onchange,'DATE')]");
        boolean flag = false;
        try {
            if (I.amPerforming().actionToGet().attribute(DatefieldsAtPageDetails, "id").toLowerCase().contains("j_id0") && I.amPerforming().checkToSee().isDisplayed(DatefieldsAtPageDetails)) {
                flag = true;
            }
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /* assert true if expected value is displayed in respective field at dynamic form layout
     *
     * @param fieldName
     * @param fieldValue
     * @author ashwini.mahore
     */
    public void assertFieldValueInsideDynamicForm(String fieldName, String fieldValue) {
        Assert.assertTrue(isFieldValueDisplayedInsideDynamicForm(fieldName, fieldValue));
    }


    /**
     * assert if Edit action item is disabled inside attachment page block
     *
     * @param pageBlockName
     * @param actionName
     * @author ashwini.mahore
     */
    public void assertEditActionItemDisabledForAttachment(String usage, String actionName, String pageBlockName) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isEditActionItemDisabledForAttachment(actionName, pageBlockName));
        } else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(isEditActionItemDisabledForAttachment(actionName, pageBlockName));
        } else if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isEditActionItemDisabledForAttachment(actionName, pageBlockName)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isEditActionItemDisabledForAttachment(actionName, pageBlockName)).isFalse();
        }
    }

    /**
     * @param statusName
     * @return true if specific status category is displayed inside lookup modal
     * table
     * @author ashwini.mahore
     */
    public void assertTableStatusInsideLookupModal(String statusName) {
        Assert.assertTrue(isStatusDisplayedForLookupModal(statusName));
    }

    /**
     * assert true if expected value is displayed in respective field at dynamic form layout
     *
     * @param fieldName
     * @param fieldValue
     * @author ashwini.mahore
     */
    private boolean isFieldValueDisplayedInsideDynamicForm(String fieldName, String fieldValue) {
        boolean flag = false;
        By getFieldValue = By.xpath("//span[text()='" + fieldName + "']/../following-sibling::dd//span[text()='" + fieldValue + "']" +
                " | //span[text()='" + fieldName + "']/../following-sibling::dd//span//img[@alt='" + fieldValue + "']" +
                "| //*[contains(text(),'" + fieldValue + "')]/../following-sibling::*[contains(text(),'" + fieldName + "')]");
        if (I.amPerforming().checkToSee().isDisplayed(getFieldValue)) {
            return true;
        }
        return flag;
    }

    /**
     * Boolean status of Edit action item inside attachment page block row
     *
     * @param pageBlockName
     * @param actionName
     * @author ashwini.mahore
     * @modifier ashwini.mahore - parameterized the action and modified xpath accordingly
     */
    private boolean isEditActionItemDisabledForAttachment(String actionName, String pageBlockName) {
        boolean flag = false;
        try {
            if (getListAttachmentTableSpecificColumnActions(actionName, pageBlockName).size() > 0) {
                flag = true;
            }
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /**
     * @param pageBlockName
     * @return get list of element in attachment table action
     * @author ashwini.mahore
     * @modifier ashwini.mahore - parameterized the action and modified xpath accordingly
     */
    private List<Elements> getListAttachmentTableSpecificColumnActions(String actionName, String pageBlockName) {
        return I.amPerforming().getElementReference().forListOfElements().of(ByUsing.xpath("//div[@class='panel-heading']//a[@title='"
                + pageBlockName
                + "']/../../../following-sibling::div[contains(@class,'panel-body')]//table//a[@title='" + actionName + "']/span[contains(@class,'disable-action')]"));
    }

    /**
     * @param statusName
     * @return true if statusName is displayed
     * @author ashwini.mahore
     */
    private Boolean isStatusDisplayedForLookupModal(String statusName) {
        boolean flag = false;
        I.amPerforming().waitFor().makeThreadSleep(5000);
        try {
            if (I.amPerforming().checkToSee().isDisplayed(getTableColumnOfLookupModal(statusName))) {
                flag = true;
            }

        } catch (org.openqa.selenium.NoSuchElementException e) {
        }
        return flag;
    }


    /**
     * return locator for status column inside lookup modal
     *
     * @param columnValueName
     * @author ashwini.mahore
     */
    public By getTableColumnOfLookupModal(String columnValueName) {
        return By.xpath("//td//span/a[@title='" + columnValueName + "' or text()='" + columnValueName + "']| //td//span[@title='" + columnValueName + "' or text()='" + columnValueName + "']");
    }

    /**
     * assert specific items are displayed in top righ parallel lines bar
     *
     * @param menuOption
     * @param pannelTitleName
     * @author ashwini.mahore
     * @modifier ashwini.mahore - added soft assertion
     */
    public void assertTopRightParallelLinesBarSpecificOptionsEnabled(String usage, String menuOption, String pannelTitleName) {
        if (usage.equalsIgnoreCase("see")) {
            I.amPerforming().assertionsTo().assertThat(isTopRightParallelLinesBarSpecificOptionsEnabled(menuOption, pannelTitleName)).isTrue();
        } else if (usage.equalsIgnoreCase("do not see")) {
            I.amPerforming().assertionsTo().assertThat(isTopRightParallelLinesBarSpecificOptionsEnabled(menuOption, pannelTitleName)).isFalse();
        }
    }

    /**
     * validate if options are displayed in top right parallel line bar
     *
     * @param menuOption
     * @param pannelTitleName
     * @return: true if it is displayed
     * @author ashwini.mahore
     */
    private boolean isTopRightParallelLinesBarSpecificOptionsEnabled(String menuOption, String pannelTitleName) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(govgrants.perform().phasePanel().getItemFromParallelMenuBars(pannelTitleName, menuOption))) {
                flag = true;
            }
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /**
     * assert if menu icon is disabled from planning flex table
     *
     * @param panelTitleName
     * @author ashwini.mahore
     */
    public void assertDisableMenuIcon(String panelTitleName) {
        Assert.assertTrue(isMenuIconDisabled(panelTitleName));
    }

    /**
     * Boolean status of menu icon from program flex table
     *
     * @param panelTitleName
     * @author ashwini.mahore
     */
    private Boolean isMenuIconDisabled(String panelTitleName) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(govgrants.perform().phasePanel().getParallelBarsLocator(panelTitleName))) {
                flag = false;
            }
        } catch (org.openqa.selenium.NoSuchElementException e) {
            flag = true;
        }
        return flag;
    }


    /**
     * To verify the label of multiple checkboxes using fieldApi
     *
     * @param usage
     * @param fieldAPIName
     * @param checkboxLabels
     * @author meenakshi.jha
     * @modifier meenakshi.jha added xpath for checkbox
     */
    public void assertCheckBoxOptions(String usage, String fieldAPIName, List<String> checkboxLabels) {
        if (usage.equalsIgnoreCase("see")) {
            I.amPerforming().assertionsTo().assertThat(verifyCheckBoxOptions(fieldAPIName, checkboxLabels)).isTrue();
        } else if (usage.equalsIgnoreCase("do not see")) {
            I.amPerforming().assertionsTo().assertThat(verifyCheckBoxOptions(fieldAPIName, checkboxLabels)).isFalse();
        }
    }

    private Boolean verifyCheckBoxOptions(String fieldAPIName, List<String> checkboxLabels) {
        boolean flag = false;
        try {
            By checkboxOptions = By.xpath("//div[@id='" + fieldAPIName + "']//tr//label | //div[@id='" + fieldAPIName + "']//div");
            List<Elements> elements = I.amPerforming().getElementReference().forListOfElements().of(checkboxOptions);
            List<String> options = new ArrayList<String>();
            for (int i = 0; i < elements.size(); i++) {
                options.add(elements.get(i).getText());
            }
            I.amPerforming().updatingOfReportWith().write(LogLevel.PROJECT_LAYER_INFO, "Expected Questions--" + checkboxLabels);
            I.amPerforming().updatingOfReportWith().write(LogLevel.PROJECT_LAYER_INFO, "Actual Questions--" + options);
            if (options.containsAll(checkboxLabels)) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * assert true if upload button at modal window/page layout is disabled
     *
     * @param buttonName
     * @author ashwini.mahore
     * @modifier ashwini.mahore - added soft assertion
     */
    public void assertButtonIsDisabledAtModalOrLayout(String usage, String buttonName, Boolean isModal) {
        if (usage.equalsIgnoreCase("see")) {
            I.amPerforming().assertionsTo().assertThat(isButtonDisabledAtModalOrLayout(buttonName, isModal)).isTrue();
        } else {
            I.amPerforming().assertionsTo().assertThat(isButtonDisabledAtModalOrLayout(buttonName, isModal)).isFalse();
        }
    }

    /**
     * @param buttonName
     * @return true if upload button at modal window/page layout is disabled
     * @author ashwini.mahore
     */
    private boolean isButtonDisabledAtModalOrLayout(String buttonName, Boolean isModal) {
        boolean flag = false;
        try {
            if (isModal) {
                if (I.amPerforming().checkToSee().isDisplayed(ByUsing.xpath("//button[text()='" + buttonName + "' and @disabled='true']"))) {
                    flag = true;
                }
            } else if (I.amPerforming().checkToSee().isDisplayed(ByUsing.xpath("//button[@class='customDisableBtn' and contains(text(),'" + buttonName + "')]"))) {
                flag = true;
            }
        } catch (org.openqa.selenium.NoSuchElementException e) {
        }
        return flag;
    }

    /**
     * @param changedFieldName
     * @param pageBlockName
     * @param number
     * @author ashwini.mahore
     */
    public void assertSortingOfPageBlockDetailElementSubTab(String changedFieldName, int number, String pageBlockName) {
        Assert.assertTrue(isPageBlockDetailElementSequence(changedFieldName, number, pageBlockName));
    }

    /**
     * Boolean status of page block detail element sorting order
     *
     * @param changedFieldName
     * @param pageBlockName
     * @param number
     * @author ashwini.mahore
     */
    private Boolean isPageBlockDetailElementSequence(String changedFieldName, int number, String pageBlockName) {
        if (getListOfPageBlockDetailElement(pageBlockName).get(number).getText().contains(changedFieldName)) {
            return true;
        } else
            return false;
    }

    /**
     * get list of element inside page block detail like program name, program code
     * etc.
     *
     * @modifier ashwini.mahore - added xpath to locate element in edit mode
     */
    public List<Elements> getListOfPageBlockDetailElement(String pageBlockName) {
        return I.amPerforming().getElementReference().forListOfElements().of(ByUsing
                .xpath("//h3//a[contains(text(),'" + pageBlockName + "')]/ancestor::div[2]/following-sibling::div//dt " +
                        "| //h3//a[contains(text(),'" + pageBlockName + "')]/ancestor::div[3]/following-sibling::div//dt"));
    }

    /**
     * To verify the checkbox in Flex table with table id
     *
     * @param usage
     * @param columnText
     * @param flexTableId
     * @author meenakshi.jha
     */
    public void assertCheckboxesInFlexTableWithId(String usage, String columnText, String flexTableId) {
        if (usage.equalsIgnoreCase("see")) {
            I.amPerforming().assertionsTo().assertThat(isCheckboxDispalyedWithId(columnText, flexTableId)).isTrue();
        } else if (usage.equalsIgnoreCase("do not see")) {
            I.amPerforming().assertionsTo().assertThat(isCheckboxDispalyedWithId(columnText, flexTableId)).isFalse();
        }
    }

    private boolean isCheckboxDispalyedWithId(String columnText, String flexTableId) {
        boolean flag = false;
        try {
            I.amPerforming().checkToSee().isDisplayed(ByUsing.xpath("//div[@id='" + flexTableId + "']//a[text()='" + columnText + "']/ancestor::tr[1]//input[@type='checkbox']|//div[@id='" + flexTableId + "']//span[text()='" + columnText + "']/ancestor::tr[1]//input[@type='checkbox']"));
            flag = true;
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * assert true/false if fields attached with asterisk mark
     *
     * @author Tejal.gadewar
     */
    public void assertAsteriskMark(String usage, String fieldName) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isAsteriskMarkDisplayed(fieldName)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isAsteriskMarkDisplayed(fieldName)).isFalse();
        }
    }

    /**
     * validate if asterisk mark displayed on field name
     *
     * @return: true if it is displayed
     * @modifer: keerti.munde
     */
    public boolean isAsteriskMarkDisplayed(String fieldName) {
        By fieldsAtPageDetails = By.xpath("//*[text()='" + fieldName + "']//span[contains(@class,'requiredField')] | //div[@id='" + fieldName + "']//span[contains(@class,'requiredFieldSubmit fa fa-exclamation-triangle')] | //div[@id='" + fieldName + "']//span[contains(@class,'requiredField')]");
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(fieldsAtPageDetails)) {
                flag = true;
            }
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /**
     * assert true if field is present in section
     *
     * @param fieldName
     * @param sectionName
     * @author Tejal.gadewar
     */
    public void assertFieldInsideSection(String usage, String fieldName, String sectionName) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(assertFieldPresentInsideSection(fieldName, sectionName)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(assertFieldPresentInsideSection(fieldName, sectionName)).isFalse();
        }
    }

    /**
     * return true if field is present in section
     *
     * @param sectionName
     * @param fieldName
     */
    private boolean assertFieldPresentInsideSection(String fieldName, String sectionName) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//div//span[" + I.amPerforming().sanityOfXpathTo().contains("text()", sectionName) + "]/../../../following-sibling::div//span[" + I.amPerforming().sanityOfXpathTo().contains("text()", fieldName) + "]"))) {
                flag = true;
            }
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /**
     * assert if custom App is not displayed inside custom app dropdown list
     *
     * @param dropDownValue
     * @author monu.kumar
     */
    public void assertCustomAppValueInsideDropdownNotDisplayed(String dropDownValue, String usage) {
        if (usage.contains("not")) {
            Assert.assertFalse(isSpecificCustomAppDisplayed(dropDownValue));
        } else {
            Assert.assertTrue(isSpecificCustomAppDisplayed(dropDownValue));
        }

    }

    /**
     * return true if specific custom App displayed
     *
     * @param dropDownValue
     * @return
     * @author monu.kumar
     * @modifier ashwini.mahore
     */
    private boolean isSpecificCustomAppDisplayed(String dropDownValue) {
        boolean flag = false;
        try {
            if (govgrants.perform().mainPage().getAppDropDownItem(dropDownValue).getAttribute("innerText").trim()
                    .equalsIgnoreCase(dropDownValue)) {
                flag = true;
            }
        } catch (org.openqa.selenium.NoSuchElementException e) {

        }
        return flag;
    }

    /**
     * assert true if classification name is displayed under select classification field at upload file modal - Record level
     *
     * @param classification
     * @author ashwini.mahore
     * @modifier ashwini.mahore - added soft assertion
     */
    public void assertClassificationNameAtAddFileModal(String usuage, String classification) {
        if (usuage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isClassificationNameDisplayedAtFileUploadModal(classification));
        } else if (usuage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isClassificationNameDisplayedAtFileUploadModal(classification)).isTrue();
        } else if (usuage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isClassificationNameDisplayedAtFileUploadModal(classification)).isFalse();
        }
    }

    /**
     * return true if classification name is displayed under select classification field at upload file modal - Record level
     *
     * @param classification
     * @return
     * @author ashwini.mahore
     */
    private boolean isClassificationNameDisplayedAtFileUploadModal(String classification) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(govgrants.perform().libraryFiles().getClassificationAtUploadFileModalUnderLibrary(classification))) {
                flag = true;
            }
        } catch (org.openqa.selenium.NoSuchElementException e) {
        }
        return flag;
    }

    /**
     * To verify the alert text displayed
     *
     * @param message
     * @param isSoftly
     * @return
     * @author meenakshi.jha
     */

    public void assertAlertMessageOfConfirmationBoxPopUp(String message, boolean isSoftly) {
        String alertConfirmationBoxMessage = I.amPerforming().switchTo().getAlertText();
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(message).isEqualTo(alertConfirmationBoxMessage);

        } else {
            Assert.assertTrue(alertConfirmationBoxMessage, true);
        }
    }

    /**
     * assert true if Library/File/Folder is Displayed under files library - Home phase
     *
     * @param libraryFileFolderName
     * @author ashwini.mahore
     */
    public void assertLibraryFileFolderIsDisplayed(String usuage, String libraryFileFolderName) {
        if (usuage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isLibraryFileFolderIsDisplayed(libraryFileFolderName));
        } else if (usuage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(isLibraryFileFolderIsDisplayed(libraryFileFolderName));
        } else if (usuage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isLibraryFileFolderIsDisplayed(libraryFileFolderName)).isTrue();
        } else if (usuage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isLibraryFileFolderIsDisplayed(libraryFileFolderName)).isFalse();
        }
    }

    /**
     * return true if Library/File/Folder is Displayed under files library - Home phase
     *
     * @param libraryFileFolderName
     * @return
     */
    private boolean isLibraryFileFolderIsDisplayed(String libraryFileFolderName) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[@id='WorkspaceFilesHierarchy']//div[contains(@class,'slds-tree__item')]//*[text()='" + libraryFileFolderName + "']"))) {
                flag = true;
            }
        } catch (org.openqa.selenium.NoSuchElementException e) {
        }
        return flag;
    }

    /**
     * hover on look up link at page block details/flex grid /flex table/sidebar
     *
     * @param lookUpLink
     * @author monu.kumar
     * @modifier ashwini.mahore
     * @modifier ashwini.mahore - added xpath to get mini layout loads completely
     * @modifier ashwini.mahore removed xpath to load completely and added the wait time
     * @modifier meenakshi.jha added xpath to hover mini layout
     */
    public void getLookUpLinkToHover(String lookUpLink, String uiType) {
        if (uiType.contains("grid")) {
            I.amPerforming().waitFor().makeThreadSleep(1000);
            I.amPerforming().scroll().toMoveToElement(By.xpath("//td//a[@title='" + lookUpLink + "' and contains(@class,'tableRowLinks') and not(contains(@class,'ng-hide'))]"), false);

        } else if (uiType.contains("table")) {
            I.amPerforming().waitFor().makeThreadSleep(1000);
            I.amPerforming().scroll().toMoveToElement(By.xpath("//td//*[text()='" + lookUpLink + "' and @ng-mouseover]"), true);

        } else {
            I.amPerforming().waitFor().makeThreadSleep(1000);
            I.amPerforming().scroll().toMoveToElement(By.xpath("//dl//dd//a[contains(text(),'" + lookUpLink + "')] |" +
                    " //dd//input[@value='" + lookUpLink + "' and not(@type='hidden')] | //span[text()='" + lookUpLink + "'] | //td//*[@title='" + lookUpLink + "' and @class='tableRowLinks'] | //span[contains(text(),'" + lookUpLink + "')]"), false);
        }
    }

    /**
     * return true if content of owner organisation lookup modal is in ascending order
     */
    public void assertSortingOrderOfColumnContent(String usage, String titleName, String order, String tableId) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isContentOfColumnInExepctedOrder(titleName, order, tableId));
        } else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(isContentOfColumnInExepctedOrder(titleName, order, tableId));
        } else if (usage.equalsIgnoreCase("softly see")) {
            Assert.assertTrue(isContentOfColumnInExepctedOrder(titleName, order, tableId));
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            Assert.assertFalse(isContentOfColumnInExepctedOrder(titleName, order, tableId));
        }
    }

    /**
     * return true if content appears in Ascending/Descending order for look up modal
     *
     * @return
     */
    private boolean isContentOfColumnInExepctedOrder(String columnName, String order, String tableId) {
        boolean flag = false;
        WebElement sortArrow = I.amPerforming().getElementReference().of(By.xpath("//div[@id='" + tableId + "']//tr//th//span[contains(text(),'" + columnName + "')]/../following-sibling::span/i[contains(@class,'arrow')]|//div[@id='" + tableId + "']//tr//th//span[contains(text(),'" + columnName + "')]//following-sibling::span[contains(@class,'arrow')]"));
        if (sortArrow.getAttribute("class").contains("arrow-up")) {
            I.amPerforming().checkToSee().isTableSorted(govgrants.perform().flexTable().getTableSpecificColumnValues(columnName, tableId), order);
            flag = true;
        } else if (sortArrow.getAttribute("class").contains("arrow-down")) {
            I.amPerforming().checkToSee().isTableSorted(govgrants.perform().flexTable().getTableSpecificColumnValues(columnName, tableId), order);
            flag = true;
        }
        return flag;
    }

    /* return true if text displayed on mouse hover at column value inside enhanced table/enhanced flex grid
     *
     * @param text
     * @param tableId
     * @author ashwini.mahore
     */
    public void assertMouseHoverTextAtColumnValueInsideTableId(String text, String tableId) {
        Assert.assertTrue(isMouseHoverTextAtColumnValueDisplayedInsideTableId(text, tableId));
    }

    /**
     * return true if text displayed on mouse hover at column value inside enhanced table/enhanced flex grid
     *
     * @param text
     * @param tableId
     * @author ashwini.mahore
     */
    private boolean isMouseHoverTextAtColumnValueDisplayedInsideTableId(String text, String tableId) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(ByUsing.xpath("//div[@id='" + tableId + "']//*[@title='" + text + "']"))) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * Assert Menu button inside table
     *
     * @param tableIdName
     * @param buttonName
     * @author keerti.munde
     */

    public void assertIsMenuButtonPresentOnTable(String usage, String buttonName, String tableIdName) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(menuLocator(buttonName, tableIdName)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(menuLocator(buttonName, tableIdName)).isFalse();
        }
    }

    private boolean menuLocator(String buttonName, String tableIdName) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[@id='" + tableIdName + "']//span[(@class='dropdown')] | //div[@id='" + tableIdName + "']//span[@class='fa fa-bars'] | //div[@Id='" + tableIdName + "']//span[contains(text(),'" + buttonName + "')]"))) {
                flag = true;
            }
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /**
     * Assert advance filter inside table
     *
     * @param tableIdName
     * @param advanceFilterId
     * @author keerti.munde
     */


    public void assertIsAdvanceFilterPresentOnTable(String usage, String advanceFilterId, String tableIdName) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(filterLocator(advanceFilterId, tableIdName)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(filterLocator(advanceFilterId, tableIdName)).isFalse();
        }
    }

    private boolean filterLocator(String advanceFilterId, String tableIdName) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[@id='" + tableIdName + "']//button[@data-target='" + advanceFilterId + "']"))) {
                flag = true;
            }
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /**
     * Assert quick serach inside table
     *
     * @param tableIdName
     * @author keerti.munde
     */


    public void assertIsQuickSearchPresentOnTable(String usage, String tableIdName) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(quickSearchLocator(tableIdName)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(quickSearchLocator(tableIdName)).isFalse();
        }
    }

    private boolean quickSearchLocator(String tableIdName) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.cssSelector("div#" + tableIdName + " div>div>input"))) {
                flag = true;
            }
        } catch (Exception e) {
            if (I.amPerforming().checkToSee().isDisplayed(By.cssSelector("div>input#" + tableIdName + "")))
                flag = true;
        }
        return flag;
    }

    /**
     * @param subTabName
     * @param number
     * @author monu.kumar
     */
    public void assertSortingOfSubTab(String usage, String subTabName, int number) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isSubTabSequence(subTabName, number)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isSubTabSequence(subTabName, number)).isFalse();
        } else if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isSubTabSequence(subTabName, number));
        }
    }


    /**
     * Boolean status of Sub tab sorting order
     *
     * @param subTabName
     * @author monu.kumar
     */
    private boolean isSubTabSequence(String subTabName, int number) {
        if (getListSubTabsInsideMainDetailPage().get(number).getText().contains(subTabName)) {
            return true;
        } else
            return false;
    }

    /**
     * get list of sub tab inside main detail page like overview etc.
     */
    public List<Elements> getListSubTabsInsideMainDetailPage() {
        I.amPerforming().getElementReference().of(By.xpath("//div[@id='myTabs']/ul/li/a"));
        return I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='myTabs']/ul/li/a"));
    }

    /**
     * assert if specified item is displayed inside result of auto search
     *
     * @param itemName
     * @author aashish.pardeshi
     */
    public void assertSpecificItemsInsideAutoSearchResult(String usage, String itemName) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isSearchedValuePresentAutoSearchResult(itemName)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isSearchedValuePresentAutoSearchResult(itemName)).isFalse();
        }
    }

    /**
     * return trur/false if specified item is displayed/not displayed
     *
     * @param itemName
     * @return boolean
     */
    public boolean isSearchedValuePresentAutoSearchResult(String itemName) {
        boolean flag = false;
        List<Elements> listViewOptions = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[contains(@class,'select2-search')]/following-sibling::ul//li//span|//div[contains(@class,'select2-search')]/following-sibling::ul//li"));
        for (Elements we : listViewOptions) {
            if (we.getText().contains(itemName)) {
                flag = true;
                break;
            }
        }
        return flag;
    }

    /**
     * return true if correct chart title is displayed
     *
     * @param title
     * @author ashwini.mahore
     */
    public void assertChartTitleDisplayed(String usage, String title) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isChartTitleDisplayed(title));
        } else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(isChartTitleDisplayed(title));
        }
    }

    /**
     * return true if correct chart title is displayed
     *
     * @param title
     * @author ashwini.mahore
     */
    private boolean isChartTitleDisplayed(String title) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.cssSelector("div#charts [title='" + title + "']"))) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * @param usage
     * @param chartName
     * @return true If chart legends not displayed
     * @author ashwini.mahore
     */
    public void assertChartLegendNotDisplayed(String usage, String chartName) {
        if (usage.contains("not")) {
            Assert.assertFalse(isChartLegendNotDisplayed(chartName));
        } else {
            Assert.assertTrue(isChartLegendNotDisplayed(chartName));
        }
    }

    /**
     * @param chartName
     * @return true If chart legends not displayed
     * @author ashwini.mahore
     */
    private boolean isChartLegendNotDisplayed(String chartName) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.cssSelector("div#" + chartName + "Id .highcharts-legend"))) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * assert true if last modified date is showing current date on contact edit
     *
     * @author monu.kumar
     */
    private boolean assertLastModifiedDateAsTodaysDateWithTimeAndWithoutTime(String savedValue, boolean timeCheck) {
        boolean result = false;
        if (!timeCheck) {
            String cdate = I.amPerforming().dateOperationsToGet().currentDateInDesiredFormat((DateTimeFormatter.ofPattern("MM/dd/yyyy h:mm a")));
            String[] currentsplit = (cdate.split(":", 2));
            String[] arrCSplit = currentsplit[1].split("\\s");
            int date = Integer.parseInt(arrCSplit[0]) + 5;
            System.out.println("This is Date:-" + date);
            for (int i = 10; i > 0; i--) {
                date = date - 1;
                String ddate;
                if (date <= 9) {
                    String sdate = "0" + String.valueOf(date);
                    ddate = currentsplit[0] + ":" + sdate + " " + arrCSplit[1];
                } else {
                    ddate = currentsplit[0] + ":" + date + " " + arrCSplit[1];
                }

                System.out.println("This is the the ddate:-" + ddate + " Compare with" + savedValue);
                if (ddate.equals(savedValue)) {
                    result = true;
                    System.out.println("True Condition");
                    break;
                } else {
                    System.out.println("False Condition");
                    result = false;
                }
            }
        } else if (timeCheck) {
            String dateWithoutTime = I.amPerforming().dateOperationsToGet().currentDateInDesiredFormat(DateTimeFormatter.ofPattern("MM/dd/yyyy"));
            if (dateWithoutTime.equals(savedValue)) {
                result = true;
                System.out.println("Date without time coming with True Condition");
            }
        }
        return result;
    }

    /**
     * If correct text is displayed in xhart. like xaxis label and prefix
     *
     * @param title
     * @param chartName
     * @param axisName
     * @author monu.kumar
     */
    public void assertCorrectTextDisplayed(String usage, String title, String axisName, String chartName) {
        WebElement prefixSuffixElement = I.amPerforming().getElementReference().of(ByUsing.xpath("//div[@id='" + chartName + "Id']//*[contains(@class,'highcharts-container')]//*[local-name()='g'][contains(@class,'" + axisName + "')]//*[contains(text(),'" + title + "')]"));
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(I.amPerforming().actionToGet().text(prefixSuffixElement).contains(title));
        } else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(I.amPerforming().actionToGet().text(prefixSuffixElement).contains(title));
        } else if (usage.equalsIgnoreCase("Softly see")) {
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().actionToGet().text(prefixSuffixElement).contains(title)).isTrue();
        } else if (usage.equalsIgnoreCase("Softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().actionToGet().text(prefixSuffixElement).contains(title)).isFalse();
        }
    }

    /**
     * assert current date on leads detail page for application due date
     */
    public void assertCurrentDateWithTime(String usage, String savedValue, boolean timeCheck) {
        if (usage.contains("see")) {
            Assert.assertTrue(assertLastModifiedDateAsTodaysDateWithTimeAndWithoutTime(savedValue, timeCheck));
        } else if (usage.contains("softly see")) {
            I.amPerforming().assertionsTo().assertThat(assertLastModifiedDateAsTodaysDateWithTimeAndWithoutTime(savedValue, timeCheck)).isTrue();
        }
    }

    /**
     * Handles to verify the symbol inside the flextable using id,title.
     *
     * @param usage
     * @param tableId
     * @param againstValue
     * @param iconName
     * @param columnTitle
     * @author meenakshi.jha
     */
    public void assertSymbolForColumn(String usage, String tableId, String againstValue, String iconName, String columnTitle) {
        if (usage.equalsIgnoreCase("see")) {
            I.amPerforming().assertionsTo().assertThat(isSymbolForColumnDisplayed(tableId, againstValue, iconName, columnTitle)).isTrue();
        } else if (usage.equalsIgnoreCase("do not see")) {
            I.amPerforming().assertionsTo().assertThat(isSymbolForColumnDisplayed(tableId, againstValue, iconName, columnTitle)).isFalse();
        }
    }

    private boolean isSymbolForColumnDisplayed(String tableId, String againstValue, String iconName, String columnTitle) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(ByUsing.xpath("//div[@id='" + tableId + "']//span[text()='" + columnTitle + "']//ancestor::thead//following-sibling::tbody//tr//td//*[text()='" + againstValue + "']//ancestor::td//following-sibling::td//*[contains(@class,'" + iconName + "')]"))) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * to verify the recaptcha box is displayed
     *
     * @param shouldBeDisplayed
     * @author monu.kumar
     * @modifier komal.mukhekar- updated processing parameter from false to true
     */
    public void assertCaptchaDisplayedOnPage(boolean shouldBeDisplayed) {
        By captch = ByUsing.xpath("//iframe[contains(@src, 'www.google.com/recaptcha')]");
        I.amPerforming().assertionsTo().assertThat(I.amPerforming().checkToSee().isDisplayed(captch, true))
                .as(name + " is displayed on page")
                .isEqualTo(shouldBeDisplayed);
    }

    /**
     * perform click on sharing options under upload file modal window - home/record level
     *
     * @param sharingOptions
     * @author ashwini.mahore
     */
    public void selectSharingOptionsFromDropDownAtUploadFileModal(String sharingOptions) {
        I.amPerforming().click().on(govgrants.perform().libraryFiles().getSharingOptionsAtUploadFileModalUnderLibrary(sharingOptions));
    }

    /**
     * enter values in the fields at old form layout
     *
     * @param enterValue
     * @param labelName
     * @author meenakshi.jha
     */
    public void enterValueIntoFieldAtOldForms(String enterValue, String labelName) {
        By getField = ByUsing.xpath("//span[text()='" + labelName + "']/ancestor::div/following-sibling::div//input");
        I.amPerforming().textInput().toClear(getField);
        I.amPerforming().textInput().in(getField, enterValue);
    }

    /**
     * assert if expected multiple record inside table is displayed
     *
     * @param recordsName
     * @author monu.kumar
     */
    public void assertExpectedRecordsInsideTable(String flexTableHeader, String recordsName) {
        I.amPerforming().assertionsTo().assertThat(isExpectedRecordsDisplayedInsideTable(flexTableHeader, recordsName.split(","))).isTrue();
    }

    /**
     * return true if expected records displayed inside table
     *
     * @param recordsName
     * @return
     * @modifier monu.kumar
     */
    private boolean isExpectedRecordsDisplayedInsideTable(String flexTableHeader, String... recordsName) {
        Boolean isRecordsDisplayed = false;
        for (String expectedRecords : recordsName) {
            if (expectedRecords.equalsIgnoreCase("currentdate")) {
                expectedRecords = I.amPerforming().dateOperationsToGet().currentDateInDesiredFormat((DateTimeFormatter.ofPattern("MM/dd/yyyy h:mm a").withLocale(Locale.US)));
                I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[@id='myTabbedContent']//a[@title='" + flexTableHeader + "']/../../../following-sibling::div//tbody//td//span[text()='" + expectedRecords + "'] "));
                isRecordsDisplayed = true;
            } else {
                I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[@id='myTabbedContent']//a[@title='" + flexTableHeader + "']/../../../following-sibling::div//tbody//td//span[text()='" + expectedRecords + "'] "));
                isRecordsDisplayed = true;
            }
        }
        return isRecordsDisplayed;
    }

    /**
     * assert if page with page title opens in new tab or not
     *
     * @param Pagetitle
     * @author monu.kumar
     */
    public void assertPageTitleInNewTab(String usage, String Pagetitle) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(isNewTabOpens(Pagetitle)).isTrue();
        } else {
            Assert.assertTrue(isNewTabOpens(Pagetitle));
        }
    }

    /**
     * @param pageTitle
     * @return true if page with given page title opens in another tab
     * @author monu.kumar
     */
    private Boolean isNewTabOpens(String pageTitle) {
        ArrayList<String> tabHandles = new ArrayList<String>(I.amPerforming().switchTo().getWindowsHandlers());
        boolean myNewTabFound = false;
        for (int index = 0; index < tabHandles.size(); index++) {
            I.amPerforming().switchTo().windowHandler(index);
            I.amPerforming().waitFor().makeThreadSleep(2000);
            if (I.amPerforming().browserOperationsTo().getPageTitle().equalsIgnoreCase(pageTitle)) {
                myNewTabFound = true;
                break;
            }
        }
        return myNewTabFound;
    }

    /**
     * assert phase tab background color
     *
     * @param colorName, TabType
     * @author ashwini.mahore
     * @modifier tejal.gadewar,
     * @modifier  richa.sharma - added xpath and color for header and footer as well
     */
    public void asserPhaseTabBackgroundColor(String Usage, String TabType, String colorName) {
        if (Usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(isPhaseTabBackgroundColorChanged( TabType,colorName)).isTrue();
        } else {
            Assert.assertTrue(isPhaseTabBackgroundColorChanged(TabType, colorName));
        }
        I.amPerforming().assertionsTo().assertThat(isPhaseTabBackgroundColorChanged(TabType,colorName)).isTrue();
    }

    /**
     * @return true if phase tab background color is displayed as expected
     * @author ashwini.mahore
     * @modifier tejal.gadewar
     */
    private Boolean isPhaseTabBackgroundColorChanged(String TabType, String colorName) {
        boolean flag = false;
        WebElement getPhaseTab = null;
        if (TabType.equalsIgnoreCase("phase tab")) {
            getPhaseTab = I.amPerforming().getElementReference().of(By.xpath("//div[contains(@class,'navMenuHeader')]"));
        } else if (TabType.equalsIgnoreCase("Registration Footer")) {
            getPhaseTab = I.amPerforming().getElementReference().of(By.xpath("//div[contains(@class,'footerDiv-content')]"));
        } else if (TabType.equalsIgnoreCase("Registration Header")) {
        getPhaseTab = I.amPerforming().getElementReference().of(By.xpath("//div[contains(@class,'navTopHeader clearfix')]"));
    }
        
        switch (colorName.toUpperCase()) {
            case "VERY DARK BLUE":
                if (getPhaseTab.getCssValue("background-color").contains("rgba(0, 57, 107, 1)")
                        || getPhaseTab.getCssValue("color").contains("rgb(0, 57, 107)")) {
                    flag = true;
                }
                break;
            case "VERY DARK BLUE 1":
                if (getPhaseTab.getCssValue("background-color").contains("rgba(7, 53, 74, 1)")
                        || getPhaseTab.getCssValue("color").contains("rgb(7, 53, 74)")) {
                    flag = true;
                }
                break;
            case "BLACK":
                if (getPhaseTab.getCssValue("background-color").contains("rgba(17, 17, 17, 1)")
                        || getPhaseTab.getCssValue("color").contains("rgb(17, 17, 17)")) {
                    flag = true;
                }
                break;
            case "VERY DARK CYAN":
                if (getPhaseTab.getCssValue("background-color").contains("rgba(10, 49, 54, 1)")
                        || getPhaseTab.getCssValue("color").contains("rgb(10, 49, 54)")) {
                    flag = true;
                }
                break;
            case "GREEN":
                if (getPhaseTab.getCssValue("background-color").contains("rgba(162, 180, 39, 1)")
                        || getPhaseTab.getCssValue("color").contains("rgb(162, 180, 39)")) {
                    flag = true;
                }
                break;
            case "ORANGE":
                if (getPhaseTab.getCssValue("background-color").contains("rgba(244, 119, 33, 1)")
                        || getPhaseTab.getCssValue("color").contains("rgb(244, 119, 33)")) {
                    flag = true;
                }
                break;
            case "GREY":
                if (getPhaseTab.getCssValue("background").contains("rgb(244, 244, 244)")) {
                    flag = true;
                }
                break;
            case "DARK BLUE":
                if (getPhaseTab.getCssValue("background").contains("rgb(1, 95, 149)")
                        || getPhaseTab.getCssValue("color").contains("rgb(1, 95, 149)")) {
                    flag = true;
                }
                break;
            case "BLUE":
                if (getPhaseTab.getCssValue("background").contains("rgb(5, 89, 156)")
                        || getPhaseTab.getCssValue("color").contains("rgb(5, 89, 156)")){
                    flag = true;
                }
                break;
        }
        return flag;
    }

    /**
     * assert that character length of field
     *
     * @param usage
     * @param fieldValue
     * @param charCount
     * @author tejal.gadewar
     */
    public void assertLengthOfFieldValue(String usage, String fieldValue, String charCount) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(assertLengthOfFieldValue(fieldValue, charCount)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(assertLengthOfFieldValue(fieldValue, charCount)).isFalse();
        }
    }

    /**
     * rerturn true if character lenth of field mathches
     *
     * @param fieldValue
     * @param charCount
     * @return
     */
    private boolean assertLengthOfFieldValue(String fieldValue, String charCount) {
        Boolean flag = false;
        try {
            return fieldValue.length() == Integer.parseInt(charCount) ? true : false;
        } catch (Exception e) {
            /* Ignore Exception */
        }
        return flag;
    }

    /**
     * @param fieldAPIName
     * @return true if expected field/element id disabled on edit page details
     * @author ashwini.mahore
     */
    public void assertExpectedFieldAtEditPageDetails(String usage, String fieldAPIName) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isExpectedFieldIsDisplayedOnEditPageDetails(fieldAPIName));
        } else if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isExpectedFieldIsDisplayedOnEditPageDetails(fieldAPIName)).isTrue();
        }
    }

    /**
     * @param fieldApiName
     * @return true if expected field/element id disabled on edit page details
     * @author ashwini.mahore
     * @modifier ashwini.mahore - added xpath to validate lookup field
     */
    private boolean isExpectedFieldIsDisplayedOnEditPageDetails(String fieldApiName) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(ByUsing.xpath(
                    "//div[@id='" + fieldApiName + "']//select[@disabled] | //span[@id='" + fieldApiName + "']//input[@disabled] | //span[@id='" + fieldApiName + "']//select[@disabled] | //div[@id='field" + fieldApiName + "']//span[@class='lookupInput' and contains(@style,'pointer-events: none')]"))) {
                flag = true;
            }
        } catch (Exception e) {
            /* Ignore Exception */
        }
        return flag;
    }

    /**
     * @param record
     * @param colorName
     * @return true if record label displayed in an expected color at calendar
     * @author ashwini.mahore
     */
    public void isRecordDisplayedInExpectedColorAtCalendar(String record, String colorName) {
        Assert.assertTrue(isRecordDisplayedInAnExpectedColorAtCalendar(record, colorName));
    }

    /**
     * @param record
     * @param colorName
     * @return true if record label displayed in an expected color at calendar
     * @author ashwini.mahore
     * @modifier meenakshi.jha added switch cases for different colors
     */
    public Boolean isRecordDisplayedInAnExpectedColorAtCalendar(String record, String colorName) {
        boolean flag = false;
        TestingBlazeGlobal.setVariable("highlightElements", "off");
        WebElement getRecordAtCalendar = I.amPerforming().getElementReference().of(ByUsing.xpath("//span[text()='" + record + "']/ancestor::td[@class='fc-event-container']//a |//span[contains(text(),'" + record + "')]/ancestor::td[@class='fc-event-container']//a"));
        System.out.println(getRecordAtCalendar.getAttribute("style"));
        switch (colorName.toUpperCase()) {
            case "AQUA BLUE":
                if (getRecordAtCalendar.getAttribute("style").contains("rgb(176, 206, 225)")) {
                    flag = true;
                }
                break;
            case "TEAL GREEN":
                if (getRecordAtCalendar.getAttribute("style").contains("rgb(158, 234, 182)")) {
                    flag = true;
                }
                break;
            case "TURQUOISE":
                if (getRecordAtCalendar.getAttribute("style").contains("rgb(167, 244, 243)")) {
                    flag = true;
                }
                break;
            case "WHITE":
                if (getRecordAtCalendar.getAttribute("style").contains("rgb(255, 255, 255)")) {
                    flag = true;
                }
                break;
            case "RED":
                if (getRecordAtCalendar.getAttribute("style").contains("rgb(245, 11, 46)")) {
                    flag = true;
                }
                break;
            case "YELLOW":
                if (getRecordAtCalendar.getAttribute("style").contains("rgb(232, 219, 17)")) {
                    flag = true;
                }
                break;
            case "GREEN":
                if (getRecordAtCalendar.getAttribute("style").contains("rgb(17, 232, 50)")) {
                    flag = true;
                }
                break;
        }
        return flag;
    }


    /**
     * @param toggleOptions
     * @param flexTableId
     * @param usage
     * @return true if toggle option is present
     * @author
     * @modifier richa sharma added the step to saas
     */
    public void assertToggleOptionDisplayed(String toggleOptions, String flexTableId, String usage) {
        if (usage.equalsIgnoreCase("see")) {
            I.amPerforming().assertionsTo().assertThat(isGivenToggleOptionPresent(toggleOptions, flexTableId)).isTrue();
        } else if (usage.equalsIgnoreCase("do not see")) {
            I.amPerforming().assertionsTo().assertThat(isGivenToggleOptionPresent(toggleOptions, flexTableId)).isFalse();
        }
    }

    /**
     * @param toggleOptions
     * @param flexTableId
     * @param
     * @return true if toggle option is present
     * @author
     * @modifier richa sharma added the step to saas
     */
    private Boolean isGivenToggleOptionPresent(String toggleOptions, String flexTableId) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().IsElementPresentQuick(ByUsing.xpath("//div[@id='" + flexTableId + "']//*[@id='dropdownListView']//ul/li/a/span[contains(@class,'ng-binding') and text()='" + toggleOptions + "']")))
                ;
            flag = true;
        } catch (org.openqa.selenium.NoSuchElementException e) {
        }
        return flag;
    }

    /**
     * function used to validate the text inside modal
     * @param text
     * @return
     * @author saranjit.modak
     */
    public boolean AssertTextinModal(String text) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(I.amPerforming().getElementReference().of(ByUsing.xpath("//*[contains(text(),'" + text + "')]")))) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * Method to check if button is present on confirmation pop-up
     * @param usage
     * @param buttonName
     * @author Vaibhav.c
     */
    public void isButtonPreentOnConfirmationPopUp(String usage, String buttonName) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isButtonPresent(buttonName)).isTrue();
        } else if (usage.equalsIgnoreCase("do not see")) {
            I.amPerforming().assertionsTo().assertThat(isButtonPresent(buttonName)).isFalse();
        }
    }

    /**
     * Method to check if button is present on confirmation pop-up
     * @param buttonLabel
     * @author Vaibhav.c
     * @return true: if button is present
     */
    private boolean isButtonPresent(String buttonLabel) {
        try {
            if (I.amPerforming().checkToSee().isDisplayed(I.amPerforming().getElementReference().of(By.xpath("//div[contains(@class, 'modal-content')]//button[text()='" + buttonLabel + "']")))) {
                return true;
            }
        } catch (Exception e) {
            //Handle exception to continue execution
        }
        return false;
    }
}