package com.ggproduct.automation.steps.grantee;

import com.ggproduct.automation.pageobjects.grantee.InternalOrganizationPage;
import com.helperPackage.register.I;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class InternalOrganizatioSteps {
    InternalOrganizationPage internalOrganizationPage;

    public InternalOrganizatioSteps(InternalOrganizationPage internalOrganizationPage) {
        this.internalOrganizationPage = internalOrganizationPage;
    }

    @When("^I hovering mouse on help text icon inside \"([^\"]*)\" for table$")
    public void getHelpTextIconsAtQuickSearch(String tableId) {
        internalOrganizationPage.getHelpTextAtChildTable(tableId);
    }

    @When("^I hover mouse on \"([^\"]*)\" lookup link \"([^\"]*)\"$")
    public void hoverOnLookUpLinkAtPageBlockDetail(String labelName, String lookUpLink) {
        internalOrganizationPage.getLookUpLinkToHover(labelName, lookUpLink);
    }

    @When("^I hovering mouse on page block help text icon inside table \"([^\"]*)\" with tooltip id \"([^\"]*)\"$")
    public void getHelpTextAtPageBlock(String tableId, String toolTipId) {
        internalOrganizationPage.getHelpTextAtPageBlockOrInsideTable(tableId, toolTipId);
    }

    @When("^I close alertbox$")
    public void closeAlertBox() {
        internalOrganizationPage.closeAlertBoxFromPage();
    }

    @When("^I enter opportunity value \"([^\"]*)\" into field \"([^\"]*)\"$")
    public void inputValue(String fieldValue, String fieldApiName) {
        internalOrganizationPage.enterValueForOpportunityNumber(fieldValue, fieldApiName);
    }

    @And("^I click on page navigation arrow \"([^\"]*)\" for table id \"([^\"]*)\"$")
    public void clickOnPaginationArrow(String flexTableId, String NextPrevious) {
        internalOrganizationPage.performClickOnPaginationArrow(flexTableId, NextPrevious);
    }

    @And("^I select value inside table \"([^\"]*)\" is \"([^\"]*)\"$")
    public void selectValueInsideShowEntriesDropdown(String flexTableId, String numberofEntries) {
        internalOrganizationPage.clickAndSelectValueInsideShowEntriesDropdown(flexTableId, numberofEntries);
    }

    @And("^I save the total record value as \"([^\"]*)\" from \"([^\"]*)\" of table \"([^\"]*)\"$")
    public void iGetTheTotalRecordValueFromTable(String fieldKey, String text, String tableId) {
        internalOrganizationPage.getValueFromTotalRecord(fieldKey, text, tableId);
    }

 

    @And("^I save sum of \"([^\"]*)\" field inside \"([^\"]*)\"$")
    public void assertOverAllTotalCellValueAtNumberOfAwardsColumn(String fieldApiName, String tableId) {
        internalOrganizationPage.isExpectedSumOfAwardBudgetAtTableDisplayed(fieldApiName, tableId);
    }

    @And("^I save values of column \"([^\"]*)\" of table is \"([^\"]*)\"$")
    public void saveValuesOfColumnOfTableIs(String fieldApiName, String tableId) {
        internalOrganizationPage.saveValuesOfExpectedColumn(fieldApiName, tableId);
    }

    @And("^I save the value for column name \"([^\"]*)\" as \"([^\"]*)\" from flex table \"([^\"]*)\"$")
    public void saveValueFromRowForExpectedColumnName(String fieldApiName, String key, String flexTableId) {
        internalOrganizationPage.saveAmountFromTableCells(fieldApiName, key, flexTableId);
    }

    @And("I save the contact name as {string}")
    public void iSaveTheContactNameAs(String contactName) {
        String newContactName = I.amPerforming().propertiesFileOperationsTo().getValue(contactName) + " Contact";
        I.amPerforming().propertiesFileOperationsTo().saveValue("firstName", I.amPerforming().propertiesFileOperationsTo().getValue(contactName));
        I.amPerforming().propertiesFileOperationsTo().saveValue(contactName, newContactName);
    }

    @Then("^I see \"([^\"]*)\" records inside flex table id \"([^\"]*)\"$")
    public void assertFlexTableNoOfRecords(String rowCount, String tableId) {
        internalOrganizationPage.assertFlexTabelNumberOfRecordsPresent(Integer.parseInt(rowCount), tableId);
    }

    @Then("^I see take snap shot getting saved with \"([^\"]*)\"$")
    public void assertTakeSnapshotGettingSaved(String text) {
        internalOrganizationPage.assertTakeSnapshotFunctionalityWorkingCorrectly(text);
    }

    @Then("^I see table is refreshing$")
    public void assertInternalOrganizationTableRefresh() {
        internalOrganizationPage.asserTableRefreshOnRefreshOptionClick();
    }

    @Then("^I (see|do not see|softly see|softly do not see) table \"([^\"]*)\" shows \"([^\"]*)\"$")
    public void asserNoOfPagesInsideTableDisplayed(String usage, String tableId, String text) {
        internalOrganizationPage.assertNumberOfPagesInsideTable(usage, tableId, text);
    }

    @Then("^I see default record count of table \"([^\"]*)\" is as expected$")
    public void assertDefaultCountOfRecord(String tableId) {
        internalOrganizationPage.assertDefaultSelectedRecordAtTable(tableId);
    }

    @Then("^I see total records count in flex table \"([^\"]*)\"$")
    public void assertTotalRecordsCountInFlexTable(String tableId) {
        internalOrganizationPage.AssertTotalRecordsCountInFlexTable(tableId);
    }

    @Then("^I (see|do not see|softly see|softly do not see) content of expected Flex table column \"([^\"]*)\" is in \"([^\"]*)\" order of table id \"([^\"]*)\"$")
    public void assertContentOfFlexTableColumnInExpectedOrder(String usuage, String titleName, String order, String tableId) {
        internalOrganizationPage.assertSortingOrderOfFlexTableColumnContent(usuage, titleName, order, tableId);
    }

    @Then("^I see \"([^\"]*)\" shown as inside \"([^\"]*)\"$")
    public void assertPageBlockTitle(String titleName, String tableId) {
        internalOrganizationPage.assertPageBlockTitleDisplayed(titleName, tableId);
    }

    @Then("^I see column \"([^\"]*)\" contains values only \"([^\"]*)\"$")
    public void assertExpectedColumnValuesOnly(String fieldApiName, String text) {
        internalOrganizationPage.assertColumnValuesOfTable(fieldApiName, text);
    }

    @Then("^I see field \"([^\"]*)\" contains previous date$")
    public void iSeeFieldContainsPreviousDate(String savedValue) {
        internalOrganizationPage.assertPreviousDate(savedValue);
    }

    @Then("^I see field \"([^\"]*)\" contains current date$")
    public void iSeeFieldContainsCurrentDate(String savedValue) {
        internalOrganizationPage.assertCurrentDate(savedValue);
    }

    @Then("^I (see|softly see) fields \"([^\"]*)\" is not visible$")
    public void assertVisibilityOfFields(String usage, String text) {
        internalOrganizationPage.assertVisibilityOfPageDetailsFields(usage, text);
    }

    @Then("^I (see|do not see|softly see|softly do not see) \"([^\"]*)\" in table header on lookup Modal$")
    public void assertLookupFlexTableHeaderName(String usage, String headerColumnName) {
        internalOrganizationPage.assertTableHeaderColumnNameForLookupModal(usage, headerColumnName);
    }

    @Then("^I (softly see|see) lookup modal bottom fields \"([^\"]*)\" displayed$")
    public void iSeeShowEntriesDropdownAtLookupModal(String usage, String expectedFields) {
        internalOrganizationPage.assertLookupModalBottomElementDisplayed(expectedFields, usage.contains("softly"));
    }

    @Then("I see value {string} inside lookup field {string}")
    public void iSeeValueInsideLookupField(String selectedValue, String fieldName) {
        internalOrganizationPage.assertSelectedOrganizationDisplayed(selectedValue, fieldName);
    }

    @Then("I see quick search is disabled at table id {string}")
    public void iSeeQuickSearchIsDisabledAtTableId(String tableId) {
        internalOrganizationPage.assertQuickSearchDisabledOnActionClick(tableId);
    }

    @Then("^I (see|do not see|softly see|softly do not see) \"([^\"]*)\" as title for \"([^\"]*)\" inside flex table action$")
    public void getHelpTextAtEditIconsInsideFlexTable(String usage, String iconName, String columnName) {
        internalOrganizationPage.assertRowLevelActionVisibilityOfFlexTable(usage, iconName, columnName);
    }

    @Then("^I (softly see|softly cannot see) \"([^\"]*)\" modal button$")
    public void assertModalButton(String usage, String btn) {
        internalOrganizationPage.assertButtonOnModal(usage, btn);
    }

    @Then("^I see \"([^\"]*)\" is selected at program flex table$")
    public void assertFlexTableIsDisplayed(String tableTitle) {
        internalOrganizationPage.assertFlexTableIsDisplayedWithTitle(tableTitle);
    }

    @Then("^I (softly see|softly do not see) row level action icon \"([^\"]*)\" against \"([^\"]*)\" in Attachment and Notes Table$")
    public void assertAttachmentAndNotesButton(String usage, String iconName, String columnValue) {
        internalOrganizationPage.assertActionIconInsideAttachmentAndNotesTable(usage, iconName, columnValue);
    }

    @Then("^I (softly see|see) \"([^\"]*)\" value inside tableid \"([^\"]*)\" as \"([^\"]*)\"$")
    public void iSoftlySeeTotalRecordValueInsideTableidAs(String usage, String text, String tableId, String fieldKey) {
        internalOrganizationPage.assertValuesOfTotalRecordField(text, tableId, fieldKey, usage.contains("softly"));
    }

    @Then("^I see Task Creation Date with \"([^\"]*)\" and Task Completion Date with \"([^\"]*)\" inside flex table \"([^\"]*)\"$")
    public void assertColumnValueAgainstSavedValue(String taskCreationDays, String taskCompletionDays, String tableId) {
        internalOrganizationPage.assertColumnValueAgainstSavedValue(taskCreationDays, taskCompletionDays, tableId);
    }

    @Then("^I softly see \"([^\"]*)\" symbol in flex table with id \"([^\"]*)\"$")
    public void iSoftlySeeSymbolInFlexTableWithId(String symbol, String tableId) {
        internalOrganizationPage.assertSymbolIsDisplayed(symbol, tableId);
    }

    @Then("^I see Reporting Period End Date with Schedule Base \"([^\"]*)\" inside flex table with id \"([^\"]*)\"$")
    public void iSeeReportingPeriodEndDateWithScheduleBaseInsideFlexTableWithId(String scheduleBase, String tableId) {
        internalOrganizationPage.assertEndDateAgainstScheduleBase(scheduleBase, tableId);
    }

    @Then("^I see field \"([^\"]*)\" with prepopulated value as \"([^\"]*)\"$")
    public void iSeeFieldWithPrepopulatedValueAs(String fieldName, String value) {
        internalOrganizationPage.assertPrePopulatedValueInEditMode(fieldName, value);
    }

    @When("^I enter values \"([^\"]*)\" into textarea description field for Edit Attachment$")
    public void textAreaFieldAtEditAttachment(String enteredValue) {
        internalOrganizationPage.enterValueForTextareaDescriptionFieldUnderEditAttachment(enteredValue);
    }

    @Then("^I see saved values of column \"([^\"]*)\" of table is same as \"([^\"]*)\"$")
    public void assertSavedValuesOfColumns(String fieldApiName, String tableId) {
        internalOrganizationPage.assertColumnsValuesAsExpected(fieldApiName, tableId);
    }

    @Then("^I (softly see|see) \"([^\"]*)\" inside rows of Expenditure details table id \"([^\"]*)\"$")
    public void assertSavedValueInsideExpenditureDetailsTableId(String usage, String text, String tableId) {
        internalOrganizationPage.assertTextContainingRowAtParentFlexTabel(text, tableId, usage.contains("softly"));
    }

    @Then("^I (softly see|see) amount \"([^\"]*)\" is same for expected category inside column \"([^\"]*)\" of table \"([^\"]*)\"$")
    public void iSoftlySeeAmountIsSameForExpectedCategoryInsideColumn(String usage, String key, String fieldApiName, String tableId) {
        internalOrganizationPage.assertAmountInsideExpenditureTable(key, fieldApiName, tableId, usage.contains("softly"));
    }

    @Then("^I see calculated amount at \"([^\"]*)\" inside table \"([^\"]*)\" for column \"([^\"]*)\" and \"([^\"]*)\"$")
    public void assertExpectedCalculatedAmountForExpectedColumn(String fieldApiNAme3, String tableId, String fieldApiName1, String fieldApiName2) {
        internalOrganizationPage.assertExpectedCalculatedAmountInsideExpenditureTable(fieldApiNAme3, tableId, fieldApiName1, fieldApiName2);
    }

    @Then("^I see total sum for \"([^\"]*)\" column at table \"([^\"]*)\"$")
    public void assertSummedValueForExpectedColumnForDropdown(String columnName, String tableId) {
        internalOrganizationPage.assertTotalSumValueForExpectedColumn(columnName, tableId);
    }

    @Then("^I softly see column \"([^\"]*)\" according to date \"([^\"]*)\" inside flex table with id \"([^\"]*)\"$")
    public void iSoftlySeeColumnAsWithValueInsideFlexTableWithId(String columnName, String savedDate, String tableId) {
        internalOrganizationPage.assertDateAccortingToNumberOfDaysPassed(columnName, savedDate, tableId);
    }
}