package com.ggproduct.automation.steps.govgrantsSteps;

import com.helperPackage.handlers.govgrants;
import com.helperPackage.exception.TestingBlazeCustomException;
import com.helperPackage.register.I;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import jdk.jfr.Description;
import org.junit.Assert;
import org.openqa.selenium.By;

import java.nio.charset.MalformedInputException;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;
import java.util.stream.Collectors;

public final class GovGrantsAssertionSteps {
    private GovGrantsAssertionObjects ggAssertionObjects;

    public GovGrantsAssertionSteps(GovGrantsAssertionObjects ggAssertionObjects) {
        this.ggAssertionObjects = ggAssertionObjects;
    }

    @Description("To verify the status and color on the progress bar")
    @Then("^I (softly see|see) status in Progress-bar is \"([^\"]*)\" and is \"([^\"]*)\"$")
    public void assertStatusProgressBar(String usage, String status, String color) {
        ggAssertionObjects.assertStatusProgressBar(
                status,
                color,
                usage.contains("softly")
        );
    }

    @Description("In case there  is no progress bar use this to assert status")
    @Then("^I (softly see|see) that \"([^\"]*)\" is in \"([^\"]*)\" status$")
    public void assertHighlightPanelStatus(String usage, String record, String status) {
        ggAssertionObjects.assertHighlightPanelStatus(
                record,
                status,
                usage.contains("softly")
        );
    }

    @Then("^I (softly see|see|do not see|softly do not see) values \"([^\"]*)\" and \"([^\"]*)\" inside table$")
    public void fieldsInFlexTable(String seeornotsee, String value1, String value2) {
        ggAssertionObjects.assertValuesAreInFlexTable(
                value1,
                value2,
                "softly see".equalsIgnoreCase(seeornotsee) || "see".equalsIgnoreCase(seeornotsee),
                seeornotsee.contains("softly")
        );
    }

    @Then("^I (softly see|see|do not see|softly do not see) value \"([^\"]*)\" for title \"([^\"]*)\" inside table \"([^\"]*)\"$")
    public void columnValueInFlextable(String seeornotsee, String columnValue, String columnTitle, String flextableDivId) {
        ggAssertionObjects.assertValuesAreInFlexTableWithColumnTitle(
                columnValue,
                columnTitle,
                flextableDivId,
                "softly see".equalsIgnoreCase(seeornotsee) || "see".equalsIgnoreCase(seeornotsee),
                seeornotsee.contains("softly")
        );
    }

    @Then("^I (softly see|see|do not see|softly do not see) value \"([^\"]*)\" for title \"([^\"]*)\" against the value \"([^\"]*)\" inside table \"([^\"]*)\"$")
    public void columnValueAgainstUniqueValeInFlextable(String seeornotsee, String columnValue, String columnTitle, String uniqueColumnValue, String flextableDivId) {
        ggAssertionObjects.assertValuesAreInFlexTableAgainstUniqueValue(
                columnValue,
                columnTitle,
                uniqueColumnValue,
                flextableDivId,
                "softly see".equalsIgnoreCase(seeornotsee) || "see".equalsIgnoreCase(seeornotsee),
                seeornotsee.contains("softly")
        );
    }

    @Then("^I (softly see|see) the text (containing )?\"([^\"]*)\"$")
    public void textVisibleOnPage(String usage, String isContains, String desiredText) {
        ggAssertionObjects.assertTextVisibleOnPage(
                isContains != null,
                desiredText,"can see".equalsIgnoreCase(usage) || "softly can see".equalsIgnoreCase(usage),
                usage.contains("softly")
        );
    }

    @Then("^I (see|not see) option \"([^\"]*)\" present in parallel dropdown$")
    public void optionVisibleInParallelDropdown(String usage, String option) {
        ggAssertionObjects.assertOptionPresentInList(usage, option);
    }

    @Then("^I (softly see|see|cannot see|softly cannot see) the text (containing )?:$")
    public void textVisibleOnPage(String usage, String contains, List<String> list) {
        for (String messages : list) {
            ggAssertionObjects.assertTextVisibleOnPage(
                    contains != null,
                    messages,"can see".equalsIgnoreCase(usage) || "softly can see".equalsIgnoreCase(usage),
                    usage.contains("softly")
            );
        }
    }

    @When("^I wait for the field (labeled|containing) \"([^\"]*)\" to (be|contain) \"([^\"]*)\"( with page refresh)?$")
    public void waitForFieldValue(String labeledOrContaining, String fieldName, String beOrContain, String fieldValue, String refreshPage) {
        ggAssertionObjects.waitForFieldValue(
                "labeled".equalsIgnoreCase(labeledOrContaining),
                fieldName,
                "be".equalsIgnoreCase(beOrContain),
                fieldValue,
                refreshPage != null
        );
    }

    @Then("^I (softly see|see) field (matches exactly )?\"([^\"]*)\" as \"([^\"]*)\"$")
    public void assertFieldValue(String usage, String matchExact, String fieldName, String fieldValue) {
        ggAssertionObjects.assertFieldValue(
                fieldName,
                matchExact != null,
                fieldValue,
                usage.contains("softly")
        );
    }

    @Then("I see field {string} as {string} on modal")
    public void iSeeFieldAsOnModal(String field, String text) {
        ggAssertionObjects.verifyFieldAvailableOnModal(field, text);
    }

    @Then("^I see the field (labeled|containing) \"([^\"]*)\" as \"([^\"]*)\"$")
    public void assertFieldValueNew(String usage, String fieldName, String fieldValue) {
        ggAssertionObjects.assertFieldValue(
                "labeled".equalsIgnoreCase(usage),
                fieldName,
                fieldValue
        );
    }

    @Then("^I (softly see|see|cannot see) the following messages? in the page details (contains)?:$")
    public void assertPageMessageValue(String usage, String contains, List<String> messages) {
        ggAssertionObjects.assertPageMessageValue(
                contains != null,
                messages,
                usage
        );
    }

    @Description("Tests for the presence of top right button on a page")
    @When("^I (softly can see|softly cannot see|can see|cannot see) top right button \"([^\"]*)\" in page detail$")
    public void assertTopRightButtonInPage(String usage, String buttonName) {
        ggAssertionObjects.assertTopRightButtonInPage(
                buttonName,
                ("softly can see").equalsIgnoreCase(usage) || "can see".equalsIgnoreCase(usage),
                usage.contains("softly")
        );
    }

    @Description("Tests for the presence of bottom button on a page")
    @Then("^I (softly can see|softly cannot see|can see|cannot see) bottom button \"([^\"]*)\" in page detail$")
    public void assertBottomRightButtonInPage(String usage, String buttonName) {
        ggAssertionObjects.assertBottomRightButtonInPage(
                buttonName,
                ("softly can see").equalsIgnoreCase(usage) || "can see".equalsIgnoreCase(usage),
                usage.contains("softly")
        );
    }

    @Description("Tests for the presence of top right button on a table")
    @When("^I (softly can see|softly cannot see|can see|cannot see) top right button \"([^\"]*)\" in flex table with id \"([^\"]*)\"$")
    public void assertTopRightButtonInFlexTableById(String usage, String buttonName, String tableId) {
        ggAssertionObjects.assertCanOrCannotSeeTopRightButtonInFlexTableById(
                tableId,
                buttonName,
                ("softly can see").equalsIgnoreCase(usage) || "can see".equalsIgnoreCase(usage),
                usage.contains("softly")
        );
    }

    @Description("Tests for the presence of row level button on a table")
    @When("^I (softly can see|softly cannot see|can see|cannot see) row level action button \"([^\"]*)\" against \"([^\"]*)\" in flex table with id \"([^\"]*)\"$")
    public void assertRowLevelButtonInFlexTableById(String usage, String buttonName, String uniqueColumnValue, String tableId) {
        ggAssertionObjects.assertCanOrCannotSeeRowLevelButtonInFlexTableById(
                tableId,
                uniqueColumnValue,
                buttonName,
                ("softly can see").equalsIgnoreCase(usage) || "can see".equalsIgnoreCase(usage),
                usage.contains("softly")
        );
    }

    @Then("^I (softly can see|softly cannot see|can see|cannot see) \"([^\"]*)\" sub tab at view detail page$")
    public void assertSubTabInsidePageDetails(String usage, String subTabName) {
        ggAssertionObjects.getSubTabsInsideMainDetailPage(
                subTabName,
                ("softly can see").equalsIgnoreCase(usage) || "can see".equalsIgnoreCase(usage),
                usage.contains("softly")
        );
    }

    @Description("To verify field is not present inside page block")
    @Then("^I (softly see|see|cannot see|softly cannot see) field \"([^\"]*)\" inside page block$")
    public void iCannotSeeFieldInsidePageBlock(String shouldBeDisplayed, String fieldLabel) {
        if (shouldBeDisplayed.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat("softly see".equalsIgnoreCase(shouldBeDisplayed)).isEqualTo(govgrants.perform().pageDetails().isElementPresentInsidePageBlock(fieldLabel));
        } else {
            Assert.assertEquals("see".equalsIgnoreCase(shouldBeDisplayed), govgrants.perform().pageDetails().isElementPresentInsidePageBlock(fieldLabel));
        }
    }

    @Then("^I (softly see|see|cannot see|softly cannot see) \"([^\"]*)\" on page \"([^\"]*)\" of \"([^\"]*)\" pdf file$")
    public void assertTextDisplayed(String shouldBeDisplayed, String text, String pageNumber, String fileName) {
        if (shouldBeDisplayed.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat("softly see".equalsIgnoreCase(shouldBeDisplayed)).isEqualTo(govgrants.perform().mainPage().assertTextInPDF(text, Integer.parseInt(pageNumber), fileName));
        } else {
            Assert.assertEquals("see".equalsIgnoreCase(shouldBeDisplayed), govgrants.perform().mainPage().assertTextInPDF(text, Integer.parseInt(pageNumber), fileName));
        }
    }

    @Then("^I (softly see|see|cannot see|softly cannot see) \"([^\"]*)\" in downloaded xls or csv file \"([^\"]*)\"$")
    public void assertTextDisplayedInXLSAndCSV(String shouldBeDisplayed, String text, String fileName) throws MalformedInputException {
        if (shouldBeDisplayed.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat("softly see".equalsIgnoreCase(shouldBeDisplayed)).isEqualTo(govgrants.perform().mainPage().assertTextInsideXLSAndCSVFile(text, fileName));
        } else {
            Assert.assertEquals("see".equalsIgnoreCase(shouldBeDisplayed), govgrants.perform().mainPage().assertTextInsideXLSAndCSVFile(text, fileName));
        }
    }

    @Description("To verify values inside dropdown")
    @Then("^I (softly see|see) field dropdown \"([^\"]*)\" contains values \"([^\"]*)\"$")
    public void verifyValuesInsideDropdown(String usage, String fieldAPIName, String dropdownValues) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(govgrants.perform().pageDetails().areValuesPresentInsideDropdownSelector(fieldAPIName, dropdownValues)).isTrue();
        } else {
            Assert.assertTrue(govgrants.perform().pageDetails().areValuesPresentInsideDropdownSelector(fieldAPIName, dropdownValues));
        }
    }

    @Then("^I see( only)? the following( ordered)? phase panels :$")
    @Then("^I see( only)? the following( ordered)? page blocks :$")
    public void validateCorrectPhasePanels(String exactMatch, String orderedMatch, List<String> expectedPhasePanels) {
        ggAssertionObjects.checkForPhasePanels(
                exactMatch != null,
                orderedMatch != null,
                expectedPhasePanels.stream().filter(Predicate.not(String::isBlank)).collect(Collectors.toList())
        );
    }

    @Then("^I see( only)? the following( ordered)? page detail buttons :$")
    public void checkForPageDetailsButtons(String exactMatch, String checkButtonOrder, List<String> expectedButtons) {
        ggAssertionObjects.checkForPageDetailButtons(
                exactMatch != null,
                checkButtonOrder != null,
                expectedButtons.stream().filter(Predicate.not(String::isBlank)).collect(Collectors.toList())
        );
    }

    @Then("^I see( only)? the following( ordered)? modal buttons :$")
    public void checkForModalButtons(String exactMatch, String checkButtonOrder, List<String> expectedButtons) {
        ggAssertionObjects.checkForModalButtons(
                exactMatch != null,
                checkButtonOrder != null,
                expectedButtons.stream().filter(Predicate.not(String::isBlank)).collect(Collectors.toList())
        );
    }

    @Then("^I see( only)? the following( ordered)? options in dropdown field \"([^\"]+)\" :$")
    public void validateCorrectDropDownFieldOptions(String exactMatch, String orderedMatch, String fieldApiName, List<String> expectedFieldValues) {
        ggAssertionObjects.checkForDropdownOptions(
                exactMatch != null,
                orderedMatch != null,
                fieldApiName,
                expectedFieldValues.stream().filter(Predicate.not(String::isEmpty)).collect(Collectors.toList())
        );
    }

    @When("^I see( only)? the following( ordered)? top right buttons in table (with id|named) \"([^\"]*)\" :$")
    public void checkForFlexTableTopRightButtons(String exactMatch, String checkButtonOrder, String byIdOrName, String identifier, List<String> expectedButtons) {
        ggAssertionObjects.checkForFlexTableTopRightButtons(
                exactMatch != null,
                checkButtonOrder != null,
                "with id".equalsIgnoreCase(byIdOrName),
                identifier,
                expectedButtons.stream().filter(Predicate.not(String::isBlank)).collect(Collectors.toList())
        );
    }

    @When("^I wait for \"([^\"]*)\" to be present in table (named|with id) \"([^\"]*)\" with (quick search|page refresh)$")
    public void waitForRowInTable(String searchTerm, String nameOrId, String identifier, String quickSearchOrPageRefresh) throws TestingBlazeCustomException {
        ggAssertionObjects.waitForRowInTable(searchTerm, nameOrId.equalsIgnoreCase("with id"), identifier, "quick search".equalsIgnoreCase(quickSearchOrPageRefresh));
    }

    @Then("^I see( only)? the following( ordered)? (?:headers|columns) in table (with id|named) \"([^\"]+)\" :$")
    public void validateTableHeaders(String exactMatch, String checkHeaderOrder,
                                     String byNameOrId, String nameOrId, List<String> expectedHeaders) {
        ggAssertionObjects.validateTableHeaders(
                exactMatch != null,
                checkHeaderOrder != null,
                "with id".equalsIgnoreCase(byNameOrId),
                nameOrId,
                expectedHeaders
        );
    }

    @Then("^I see( only)? the following( ordered)? rows in table (with id|named) \"([^\"]+)\" :$")
    public void validateTableRows(String exactMatch, String checkRowOrder,
                                  String byNameOrId, String nameOrId, List<List<String>> expectedRows) {
        ggAssertionObjects.validateTableRows(
                exactMatch != null,
                checkRowOrder != null,
                "with id".equalsIgnoreCase(byNameOrId),
                nameOrId,
                expectedRows
        );
    }

    @Then("^I see( only)? the following( ordered)? rows under( only)? the following( ordered)? (?:headers|columns) in table (with id|named) \"([^\"]+)\" :$")
    public void validateTableHeadersAndRows(String exactMatchRows, String checkRowOrder,
                                            String exactMatchHeaders, String checkHeaderOrder,
                                            String byNameOrId, String nameOrId, List<List<String>> expectedTable) {
        ggAssertionObjects.validateTableHeadersAndRows(
                exactMatchHeaders != null,
                checkHeaderOrder != null,
                exactMatchRows != null,
                checkRowOrder != null,
                "with id".equalsIgnoreCase(byNameOrId),
                nameOrId,
                expectedTable
        );
    }

    @Then("^I see \"([^\"]*)\" (text|dropdown) enter in field \"([^\"]*)\"$")
    public void iSeeTextEnterInField(String text, String responseType, String fieldName) {
        ggAssertionObjects.verifyTextOfTextArea(text, responseType, fieldName);
    }

    @Description("Validate any text present on tool tip after hovering")
    @Then("^I (see|softly see) \"([^\"]*)\" shown inside mini page layout on hover$")
    public void assertMiniPageLayoutTextOnHover(String usage, String text) {
        ggAssertionObjects.assertTextDisplayedOnMiniPageLayout(usage, text);
    }

    @Then("^I (softly see|see) total as \"([^\"]*)\" against column name \"([^\"]*)\" from flex table \"([^\"]*)\"$")
    public void iSeeTotalAsAgainstColumnName(String usage, String keyValue, String colName, String tableId) {
        ggAssertionObjects.validateTotalFromGivenColumnInFlexTable(usage, keyValue, colName, tableId);
    }

    @Description("It will compare total records inside table with number of rows/records in table")
    @Then("^I (see|see on modal) total records count is same as total row of table id \"([^\"]*)\" and table name \"([^\"]*)\"$")
    public void assertTableTotalRecordCount(String usage, String tableId, String tableName) {
        ggAssertionObjects.assertTableTotalRecordsCountDisplayed(usage.contains("modal"), tableId, tableName);
    }

    @Then("^I (see|do not see|softly see|softly do not see) \"([^\"]*)\" inside bottom menu$")
    public void assertUserInsideSelectDropdown(String usuage, String dropDownValue) {
        ggAssertionObjects.assertOptionsInsideBottomMenuDropdown(usuage, dropDownValue);
    }

    @Description("Validate header/title of the modal(eg-lookup modal)")
    @Then("^I see modal box with body \"([^\"]*)\" is displayed$")
    public void assertOwnerOrganizationModalBoxWithMessage(String headerText) {
        ggAssertionObjects.assertOwnerOrganizationMOdalTitle(headerText);
    }

    @Description("Validate dropdown values inside Attachment modal")
    @Then("^I see \"([^\"]*)\" inside Type selectbox$")
    public void assertValueInsideTypeDropdown(String dropDownValue) {
        ggAssertionObjects.assertValueInsideDropdown(dropDownValue);
    }

    @Description("Validate multiple values inside table")
    @Then("^I (see|do not see|softly see|softly do not see) \"([^\"]*)\" value in flex table id \"([^\"]*)\"$")
    public void assertMultipleValueDisplayed(String usuage, String tableValue, String tableId) {
        ggAssertionObjects.assertMultipleValuesInsideTableDisplayed(usuage, tableValue, tableId);
    }

    @Description("Validate multiple data in pdf")
    @Then("^I (softly see|see) following details in \"([^\"]*)\" pdf file:$")
    public void iSeeFollowingDetailsInPdfFile(String shouldBeDisplayed, String fileName, List<Map<String, String>> rowData) {
        ggAssertionObjects.validateMultipleContentInPdf(shouldBeDisplayed, fileName, rowData);
    }

    @Then("^I see the (header) is \"([^\"]*)\" in the page details$")
    @Then("^I see the (sub-header) is \"([^\"]*)\" in the page details$")
    public void validateOverviewHeader(String isHeader, String headerText) {
        By headerLocator = By.xpath(String.format("//div[contains(@class, 'overview-header') or contains(@class, 'overviewHeader')]//span[contains(@class, '%s')]",
                ("header".equalsIgnoreCase(isHeader) ? "customLabelstyle" : "overview-title")));
        I.amPerforming().assertionsTo().assertThat(I.amPerforming().actionToGet().text(headerLocator))
                .as("Verifying overview header is as expected")
                .isEqualToNormalizingWhitespace(headerText);
    }

    @Description("It will compare total records inside table with number of rows/records in table")
    @Then("^I see total records count is same as total row of table id \"([^\"]*)\" on click \"([^\"]*)\"$")
    public void assertTableTotalRecordCount1(String tableId, String NextPrevious) {
        ggAssertionObjects.assertTableTotalRecordsCountWRTToRecords(tableId, NextPrevious);
    }

    @Description("validate list view options inside toggle button")
    @Then("^I (softly see|softly do not see) \"([^\"]*)\" inside list view option of table \"([^\"]*)\"$")
    public void assertItemInsideListView(String usage, String dropDownValue, String dataTargetValue) {
        ggAssertionObjects.assertSpecificItemsInsideListViewDropdown(usage, dropDownValue, dataTargetValue);
    }

    @Description("It will validate the footer links present at page layout")
    @Then("^I (see|do not see|softly see|softly do not see) \"([^\"]*)\" footer link is present$")
    public void assertFooterLinkIsPresent(String usage, String footerLinkName) {
        ggAssertionObjects.assertFooterLinkIsPresent(usage, footerLinkName);
    }

    @Description("It will validate field inside page block detail")
    @Then("^I (softly see|softly do not see) \"([^\"]*)\" inside page block detail$")
    public void assertSpecificFieldAtPageBlockDetailNotDisplayed(String usage, String FieldName) {
        ggAssertionObjects.assertSpecificFieldInsidePageBlockDetailNotDisplayed(usage, FieldName);
    }

    @Description("It will validate that modal window is closed or disappeared from page")
    @Then("I see {string} modal is closed")
    public void iSeeModalIsClosed(String windowTitle) {
        ggAssertionObjects.assertModalWindowIsClosed(windowTitle);
    }

    @Description("It will validate label of grouped row in enhanced grid")
    @Then("^I (see|softly see) \"([^\"]*)\" inside rows of enhanced grid id \"([^\"]*)\"$")
    public void assertNewRowsWithTextAtParentFlexTable(String usage, String text, String tableId) {
        ggAssertionObjects.assertTextContainingRowAtParentFlexTabel(usage, text, tableId);
    }

    @Description("It will validate send email modal Html Page")
    @Then("^I (softly see|softly do not see) \"([^\"]*)\" on html page$")
    public void iSoftlySeeOnHtmlPage(String usage, String emailDetails) {
        ggAssertionObjects.assertTextOnHtmlPage(usage, emailDetails);
    }

    @Description("It will validate current url")
    @Then("^I see \"([^\"]*)\" in current url$")
    public void assertPlanningDefaultLandingTab(String content) {
        ggAssertionObjects.assertCurrentURL(content);
    }

    @Description("It will validate the dropdown values for multiple fields")
    @Then("I see the following options in dropdown field:")
    public void iSeeTheFollowingOptionsInDropdownField(List<Map<String, String>> table) {
        ggAssertionObjects.assertTheFollowingOptionsInDropdownField(table);
    }

    @Description("It will validate the dropdown values for picklist fields inside table")
    @Then("^I (softly see|see|softly cannot see) \"([^\"]*)\" inside selectbox field \"([^\"]*)\"$")
    public void assertValueInsideSelectDropdownValues(String usage, String dropDownValue, String fieldApiName) {
        ggAssertionObjects.assertValueInsideSelectDropdownAtPageDetail(usage, dropDownValue, fieldApiName);
    }

    @Description("Validate mail content")
    @Then("^I (see|do not see) the (mail|maildrop) text (contains )?is as follows :$")
    public void verifyCorrectMailText(String usage, String mailportal, String isContins, String mailText) {
        ggAssertionObjects.assertMailTexMatches(usage, mailportal, isContins != null, mailText);
    }

    @Description("Validate mail subject")
    @Then("^I see the (mail|maildrop) subject is as follows :$")
    public void iSeeTheMailSubjectIsAsFollows(String mailportal, String subjectText) {
        ggAssertionObjects.assertMailSubjectTexMatches(mailportal, subjectText);
    }

    @Description("Validate hyperlink inside page block")
    @Then("^I (softly see|softly do not see) link \"([^\"]*)\" inside Page block$")
    public void iDoNotSeeLinkInsidePageBlock(String usage, String linkName) {
        ggAssertionObjects.assertIsHyperTextDisplayed(usage, linkName);
    }

    @Description("Validate selected/checked Value In Radio Field inside form layout")
    @Then("I see value as {string} is selected at {string} inside dynamic form")
    public void iSeeValueAsIsSelectedAtInsideDynamicForm(String value, String fieldName) {
        ggAssertionObjects.assertSelectedValueInRadioField(value, fieldName);
    }

    @Then("^I (see|do not see|see on modal|do not see on modal) below fields in \"([^\"]*)\" page block$")
    public void iSoftlySeeBelowFieldsInPageBlock(String usage, String pageBlockName, List<String> fieldLabel) {
        ggAssertionObjects.assertFieldsInPageBlock(usage, pageBlockName, fieldLabel);
    }

    @Then("^I (see|softly see) \"([^\"]*)\" opens in overLay window$")
    public void assertEditOpensInOverLayWindow(String usage, String titleName) {
        ggAssertionObjects.asserTextInOverLayIframe(usage, titleName);
    }

    @Then("^I (softly see|see) field \"([^\"]*)\" is not editable$")
    public void iSeeFieldIsNotEditable(String usage, String fieldAPIName) {
        ggAssertionObjects.assertFieldIsEditableOrNot(fieldAPIName, usage.contains("softly"));
    }

    @Then("^I (see|do not see|softly see|softly do not see) (fields|Date Box) \"([^\"]*)\" is in edit mode$")
    public void assertEditModeOfFields(String usage,String fields, String text) {
        ggAssertionObjects.assertEditModeOfPageDetailsFields(usage,fields, text);
    }

    @Then("^I see for \"([^\"]*)\" field value is \"([^\"]*)\" inside dynamic form$")
    public void fieldValueInsideDynamicForm(String fieldName, String fieldValue) {
        ggAssertionObjects.assertFieldValueInsideDynamicForm(fieldName, fieldValue);
    }

    @Then("^I (see|do not see|softly see|softly do not see) \"([^\"]*)\" icon is disabled inside \"([^\"]*)\" page block$")
    public void assertActionEditIconIsDisabledForAttachmentPageBlock(String usage, String actionName, String pageBlockName) {
        ggAssertionObjects.assertEditActionItemDisabledForAttachment(usage, actionName, pageBlockName);
    }

    @Then("^I see \"([^\"]*)\" status in lookup modal table$")
    public void assertSpecificStatusCategoryNotDisplayed(String statusCategory) {
        ggAssertionObjects.assertTableStatusInsideLookupModal(statusCategory);
    }

    @Then("^I (see|do not see) \"([^\"]*)\" options inside \"([^\"]*)\" enabled$")
    public void assertTopRightParallelLinesBarOptionsEnabled(String usage, String menuOption, String pannelTitleName) {
        ggAssertionObjects.assertTopRightParallelLinesBarSpecificOptionsEnabled(usage, menuOption, pannelTitleName);
    }

    @Then("^I see Menu icon is disabled from planning flex table \"([^\"]*)\"$")
    public void assertDisableMenuIcon(String panelTitleName) {
        ggAssertionObjects.assertDisableMenuIcon(panelTitleName);
    }

    @Then("^I (see|do not see) below checkbox options for field \"([^\"]*)\"$")
    public void iSeeBelowCheckboxOptionsForField(String usage, String fieldAPIName, List<String> checkboxLabels) {
        ggAssertionObjects.assertCheckBoxOptions(usage, fieldAPIName, checkboxLabels);
    }

    @Then("^I (do not see|see) \"([^\"]*)\" button is disabled at (modal under library|page layout)$")
    public void assertButtonIsDisabledAtLibraryFileFolder(String usage, String buttonName, String modalOrLayout) {
        ggAssertionObjects.assertButtonIsDisabledAtModalOrLayout(usage, buttonName, modalOrLayout.equalsIgnoreCase("modal under library"));
    }

    @Then("^I see \"([^\"]*)\" shown at number \"([^\"]*)\" inside \"([^\"]*)\" page block detail$")
    public void assertSequenceOfPageBlockElement(String changedFieldName, String number, String pageBlockName) {
        ggAssertionObjects.assertSortingOfPageBlockDetailElementSubTab(changedFieldName, Integer.parseInt(number), pageBlockName);
    }

    @Then("^I (see|do not see) checkbox for \"([^\"]*)\" in flex table with id \"([^\"]*)\"$")
    public void iSeeCheckboxesInFlexTableWithId(String usage, String columnText, String flexTableId) {
        ggAssertionObjects.assertCheckboxesInFlexTableWithId(usage, columnText, flexTableId);
    }

    @Then("^I (softly see|softly do not see) asterisk mark on \"([^\"]*)\"$")
    public void iSoftlySeeAsteriskMarkOn(String usage, String fieldName) {
        ggAssertionObjects.assertAsteriskMark(usage, fieldName);
    }

    @Then("^I (softly see|softly do not see) field \"([^\"]*)\" inside \"([^\"]*)\" section$")
    public void iSoftlySeeFieldInsideSection(String usage, String fieldName, String sectionName) {
        ggAssertionObjects.assertFieldInsideSection(usage, fieldName, sectionName);
    }

    @Then("^I see \"([^\"]*)\" inside CustomApp dropDown(| not displayed)$")
    public void assertCustomAppInsideDropdownNotDisplayed(String dropDownValue, String usage) {
        ggAssertionObjects.assertCustomAppValueInsideDropdownNotDisplayed(dropDownValue, usage);
    }

    @Then("^I (see|softly see|softly do not see) Classification as \"([^\"]*)\" at upload file modal$")
    public void assertClassificationAtUploadFileModal(String usage, String classification) {
        ggAssertionObjects.assertClassificationNameAtAddFileModal(usage, classification);
    }

    @Description("Validate text message coming on alert confirmation box")
    @Then("^I (softly see|see) alert confirmation box with body \"([^\"]*)\" is displayed$")
    public void assertAlertConfirmationBoxWithMessage(String usage, String message) {
        ggAssertionObjects.assertAlertMessageOfConfirmationBoxPopUp(message, usage.contains("softly"));
    }

    @Then("^I (see|do not see|softly see|softly do not see) library/folder/file \"([^\"]*)\" is displayed under files library$")
    public void asserLibraryFileFolderIsDisplayedOnUI(String usuage, String libraryFileFolderName) {
        ggAssertionObjects.assertLibraryFileFolderIsDisplayed(usuage, libraryFileFolderName);
    }

    @When("^I hover mouse on lookup link \"([^\"]*)\"(| at table| at grid)$")
    public void hoverOnLookUpLinkAtPageBlockDetail(String lookUpLink, String uiType) {
        ggAssertionObjects.getLookUpLinkToHover(lookUpLink, uiType);
    }

    @Then("^I (see|do not see|softly see|softly do not see) content of expected column \"([^\"]*)\" is in \"([^\"]*)\" order of table id \"([^\"]*)\"$")
    public void assertContentOfColumnInExpectedOrder(String usage, String titleName, String order, String tableId) {
        ggAssertionObjects.assertSortingOrderOfColumnContent(usage, titleName, order, tableId);
    }

    @Then("I see {string} shown at mouse hover inside {string} table")
    public void iSeeShownAtMouseHoverInsideTable(String hoverText, String tableId) {
        ggAssertionObjects.assertMouseHoverTextAtColumnValueInsideTableId(hoverText, tableId);
    }

    @Then("^I (softly see|softly do not see) parallel lines \"([^\"]*)\" button in flex table with id \"([^\"]*)\"$")
    public void iSoftlyCanSeeParallelLinesButtonInFlexTableWithId(String usage, String buttonName, String tableIdName) {
        ggAssertionObjects.assertIsMenuButtonPresentOnTable(usage, buttonName, tableIdName);
    }

    @Then("^I (softly see|softly do not see) advance filter \"([^\"]*)\" of table id \"([^\"]*)\"$")
    public void iSoftlyDoNotSeeAdvanceFilterOfTableId(String usage, String advanceFilterId, String tableIdName) {
        ggAssertionObjects.assertIsAdvanceFilterPresentOnTable(usage, advanceFilterId, tableIdName);
    }

    @Then("^I (softly see|softly do not see) quick search inside table id \"([^\"]*)\"$")
    public void iSoftlySeeQuickSearchInsideTableId(String usage, String tableIdName) {
        ggAssertionObjects.assertIsQuickSearchPresentOnTable(usage, tableIdName);
    }

    @Then("^I (see|softly see|softly do not see) \"([^\"]*)\" shown at number \"([^\"]*)\" inside subtabs$")
    public void assertSequenceOfAccordianContent(String usage, String subTabName, String number) {
        ggAssertionObjects.assertSortingOfSubTab(usage, subTabName, Integer.parseInt(number));
    }

    @Then("^I (softly see|softly do not see) \"([^\"]*)\" inside auto search result$")
    public void assertItemInsideAutoSearch(String usage, String itemName) {
        ggAssertionObjects.assertSpecificItemsInsideAutoSearchResult(usage, itemName);
    }

    @Then("^I (see|do not see) \"([^\"]*)\" displayed as chart title$")
    public void assertDisplayedChartTitle(String usage, String title) {
        ggAssertionObjects.assertChartTitleDisplayed(usage, title);
    }

    @Then("^I (see|do not see) chart legends are displayed for chart/enhanced Charts \"([^\"]*)\"$")
    public void assertChartLegendsNotDisplayed(String usage, String chartName) {
        ggAssertionObjects.assertChartLegendNotDisplayed(usage, chartName);
    }

    @Then("^I (see|Softly see| do not see|Softly do not see) \"([^\"]*)\" at axis \"([^\"]*)\" for chart \"([^\"]*)\"$")
    public void assertSpecificTextForChart(String usage, String label, String axisName, String chartName) {
        ggAssertionObjects.assertCorrectTextDisplayed(usage, label, axisName, chartName);
    }

    @Then("^I (see|softly see) field \"([^\"]*)\" contains todays date (withTime|withoutTime)$")
    public void iSeeFieldContainsTodayDate(String usage, String savedValue, String usage2) {
        ggAssertionObjects.assertCurrentDateWithTime(usage, savedValue, usage2.contains("without"));
    }

    @Then("^I (see|do not see) \"([^\"]*)\" symbol for column title \"([^\"]*)\" against \"([^\"]*)\" inside flextable with id \"([^\"]*)\"$")
    public void iSeeSymbolForColumn(String usage, String iconName, String columnTitle, String againstValue, String tableId) {
        ggAssertionObjects.assertSymbolForColumn(usage, tableId, againstValue, iconName, columnTitle);
    }

    @Then("^I see the ReCaptcha input box")
    public void verifyReCaptchIsVisible() {
        ggAssertionObjects.assertCaptchaDisplayedOnPage(true);
    }

    @Description("Select sharing option from dropdown under upload file modal window")
    @When("I select sharing option as {string} at upload file modal")
    public void iSelectSharingOptionAtUploadFileModal(String sharingOptions) {
        ggAssertionObjects.selectSharingOptionsFromDropDownAtUploadFileModal(sharingOptions);
    }

    @When("I enter value as {string} into {string} on old form")
    public void iEnterValueAsIntoOnOldForm(String enterValue, String labelName) {
        ggAssertionObjects.enterValueIntoFieldAtOldForms(enterValue, labelName);
    }

    @Then("^I see table with header \"([^\"]*)\" contains records \"([^\"]*)\"$")
    public void assertMultipleRecordsInsideTable(String flexTableHeader, String recordsName) {
        ggAssertionObjects.assertExpectedRecordsInsideTable(flexTableHeader, recordsName);
    }

    @Then("^I (softly see|see) \"([^\"]*)\" in new tab$")
    public void assertNewTabOpens(String usage, String pageTitle) {
        ggAssertionObjects.assertPageTitleInNewTab(usage, pageTitle);
    }

    @Then("^I (softly see|see) (phase tab|Registration Footer|Registration Header) has \"([^\"]*)\" background color$")
    public void assertPhaseTabBackgroundColor(String Usage, String TabType, String colorName) {
        ggAssertionObjects.asserPhaseTabBackgroundColor(Usage, TabType, colorName);
    }

    @Then("^I (softly see|softly do not see) field value \"([^\"]*)\" contains \"([^\"]*)\" characters$")
    public void assertLengthOfFieldValue(String usage, String fieldValue, String charCount) {
        ggAssertionObjects.assertLengthOfFieldValue(usage, fieldValue, charCount);
    }

    @Description("validate that field is disabled on page layout")
    @Then("^I (see|softly see) field \"([^\"]*)\" is disabled$")
    public void assertExpectedFieldIsDisabled(String usage, String fieldApiName) {
        ggAssertionObjects.assertExpectedFieldAtEditPageDetails(usage, fieldApiName);
    }

    @Description("validate background color of record at calendar")
    @Then("I see {string} record is displayed in {string} color inside calendar")
    public void iSeeRecordIsDisplayedInColorInsideCalendar(String record, String colorName) {
        ggAssertionObjects.isRecordDisplayedInExpectedColorAtCalendar(record, colorName);
    }

    @Then("^I (see|do not see) toggle option \"([^\"]*)\" inside flex table id \"([^\"]*)\"$")
    public void iCannotSeeToggleOptionInsideFlexTableId(String usage, String toggleOptions, String flexTableId) {
        ggAssertionObjects.assertToggleOptionDisplayed(toggleOptions, flexTableId, usage);
    }

    @Then("^I (see|do not see) the text \"([^\"]*)\" in modal$")
    public void validateTextInModal(String usage, String text) {
        if (usage.equalsIgnoreCase("see")) {
            I.amPerforming().assertionsTo().assertThat(ggAssertionObjects.AssertTextinModal(text)).isTrue();
        } else if (usage.equalsIgnoreCase("do not see")) {
            I.amPerforming().assertionsTo().assertThat(ggAssertionObjects.AssertTextinModal(text)).isFalse();
        }
    }

    @Then("I (softly see|do not see) button \"([^\"]*)\" on confirmation pop-up$")
    public void verifyButtonPresentOnConfirmationPopUp(String usage, String buttonName) {
        ggAssertionObjects.isButtonPreentOnConfirmationPopUp(usage, buttonName);
    }

    @Then("I (softly see|softly do not see) top right button \"([^\"]*)\" inside flex table \"([^\"]*)\"$")
    public void iSoftlyDoNotSeeTopRightButtonInsideFlexTable(String usage, String buttonName, String tableId) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(topRightButtonVisibleOrNot(buttonName,tableId)).isTrue();
        } else if (usage.equalsIgnoreCase("do not see")) {
            I.amPerforming().assertionsTo().assertThat(topRightButtonVisibleOrNot(buttonName,tableId)).isFalse();
        }
    }

    private boolean topRightButtonVisibleOrNot(String buttonName, String tableId) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(I.amPerforming().getElementReference().of(By.xpath("//div[@id='" + tableId + "']//span//button[@title='New' or text()='" + buttonName + "']")))) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }
}