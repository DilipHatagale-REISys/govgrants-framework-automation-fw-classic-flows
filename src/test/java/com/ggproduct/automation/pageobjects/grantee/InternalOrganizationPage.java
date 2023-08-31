package com.ggproduct.automation.pageobjects.grantee;

import com.helperPackage.handlers.govgrants;
import com.ggproduct.automation.projectmanager.GranteeProjectManager;
import com.helperPackage.objects.Elements;
import com.helperPackage.register.I;
import com.helperPackage.report.LogLevel;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

public class InternalOrganizationPage extends GranteeProjectManager {
    /******* "Variables and Locators" *****************/
    private final By textInsideMiniPageLayout, enableTotalSumValueForTargetColumn;

    /**
     * Constructor to handle dependency injection and framework library
     */
    public InternalOrganizationPage() {
        textInsideMiniPageLayout = By.xpath("//div[@class='tooltipster-base tooltipster-shadow tooltipster-fade tooltipster-fade-show']//div[@class='tooltipster-content']");
        enableTotalSumValueForTargetColumn = By.xpath("//b[@class='totalFullDisplayFlex']//span");
    }

    /******* "Key Methods with complete functionality - public" *****************/

    /**
     * perform click on page navigation arrow
     *
     * @param flexTableId
     * @param NextPrevious
     */
    public void performClickOnPaginationArrow(String flexTableId, String NextPrevious) {
        govgrants.perform().flexTable().flexTablePagination(flexTableId, NextPrevious);
    }

    /**
     * perform click and select value inside show entries dropdown
     *
     * @param flexTableId
     * @param numberofEntries
     */
    public void clickAndSelectValueInsideShowEntriesDropdown(String flexTableId, String numberofEntries) {
        govgrants.perform().flexTable().flexTableShowEntriesDropDown(flexTableId, numberofEntries);
    }

    /**
     * perform click table header column with table id and title name
     *
     * @param tableId
     * @param titleName
     */
    public void performClickOnSpecificTableColumnHeader(String tableId, String titleName) {
        I.amPerforming().click().on(govgrants.perform().flexTable().getSpecificElementFromTableHeader(tableId, titleName));
    }

  

    /**
     * click on textarea and enter values for description field inside edit attachment modal
     *
     * @param enteredValue
     */
    public void enterValueForTextareaDescriptionFieldUnderEditAttachment(String enteredValue) {
        By editAttachmentSaveButton = By.xpath("//div[@id='modaltemp']//input[@type='submit' or @value='Save and Close Modal']");
        WebElement saveAndCloseButton = I.amPerforming().getElementReference().of(editAttachmentSaveButton);
        I.amPerforming().textInput().toClear(By.xpath("//div[@id='modaltemp']//textarea"));
        I.amPerforming().textInput().in(By.xpath("//div[@id='modaltemp']//textarea"), enteredValue);
        I.amPerforming().click().on(saveAndCloseButton);
    }

    /**
     * click on opportunity Number text area and enter random values
     *
     * @param fieldValue
     * @param fieldApiName
     */
    public void enterValueForOpportunityNumber(String fieldValue, String fieldApiName) {
        By opportunityTextField = By.xpath("//div[@id='field" + fieldApiName + "' or @id='" + fieldApiName + "']//input");
        String oppNumberRandom = fieldValue + I.amPerforming().addOnsTo().getStringRandomNumber();
        I.amPerforming().textInput().in(opportunityTextField, oppNumberRandom);
    }

    /**
     * It will get the value from bottom element Total Records and save it inside variable.
     *
     * @param fieldKey
     * @param tableId
     */
    public void getValueFromTotalRecord(String fieldKey, String text, String tableId) {
        String uiContent = I.amPerforming().actionToGet().text(govgrants.perform().flexTable().getFooterElementsFromTable(text, tableId));
        int fieldValue = Integer.parseInt(uiContent.replaceAll("[\\D]", ""));
        I.amPerforming().propertiesFileOperationsTo().saveValue(fieldKey, String.valueOf(fieldValue));
    }

    /**
     * assert if expected multiple record inside table is displayed
     *
     * @param recordsName
     */
    public void assertExpectedRecordsInsideTable(String usage, String flexTableHeader, String recordsName) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isExpectedRecordsDisplayedInsideTable(flexTableHeader, recordsName.split(",")));
        } else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(isExpectedRecordsDisplayedInsideTable(flexTableHeader, recordsName.split(",")));
        } else if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isExpectedRecordsDisplayedInsideTable(flexTableHeader, recordsName.split(","))).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isExpectedRecordsDisplayedInsideTable(flexTableHeader, recordsName.split(","))).isFalse();
        }
    }

    /**
     * assert true if take snapshot option performing expected behaviour
     */
    public void assertTakeSnapshotFunctionalityWorkingCorrectly(String text) {
        Assert.assertTrue(isContentGettingSavedBySanpShotOption(text));
    }

    /**
     * assert true if draft programs is displayed as flex table title
     */
    public void assertFlexTableIsDisplayedWithTitle(String tableTitle) {
        Assert.assertTrue(isExpectedFLexTableWithTitleIsDisplayed(tableTitle));
    }

    /**
     * it will save the summed value of expected column of budget period table
     */
    public void isExpectedSumOfAwardBudgetAtTableDisplayed(String fieldApiName, String tableId) {
        List<Elements> rows_table = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='" + tableId + "']//*[@field-name='" + fieldApiName + "']//span"));
        int sum = 0;
        for (int row = 0; row < rows_table.size(); row++) {
            if (rows_table.get(row).getText() != null) {
                sum += Integer.valueOf(rows_table.get(row).getText().replaceAll("[\\$|,|;|']", "").replaceFirst("\\.0", ""));
            }
        }
        String numberAsString = String.valueOf(sum);
        I.amPerforming().propertiesFileOperationsTo().saveValue("evaluatedSum", "$" + numberAsString + ".00");
    }

    /**
     * assert previous date on leads detail page for application due date
     */
    public void assertPreviousDate(String savedValue) {
        Assert.assertEquals(savedValue, I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(-1, DateTimeFormatter.ofPattern("MM/dd/yyyy")));
    }

    /**
     * assert current date on leads detail page for application due date
     */
    public void assertCurrentDate(String savedValue) {
        Assert.assertEquals(savedValue, I.amPerforming().dateOperationsToGet().currentDateInDesiredFormat(DateTimeFormatter.ofPattern("MM/dd/yyyy")));
    }

    /**
     * assert true/false if fields displayed/not displayed
     */
    public void assertVisibilityOfPageDetailsFields(String usage, String fieldApiName) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isFieldsVisibleAtPAgeDetails(fieldApiName));
        } else if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isFieldsVisibleAtPAgeDetails(fieldApiName)).isTrue();
        }
    }

    /**
     * return true if particular column contains only expected value
     */
    public void assertColumnValuesOfTable(String fieldApiName, String text) {
        Assert.assertTrue(isColumnContainsExpectedValuesOnly(fieldApiName, text));
    }

    /**
     * Assert if row level action item name/title i getting displayed on hovering mouse on action icon flex table
     *
     * @param usage
     * @param iconName
     * @param columnName
     */
    public void assertRowLevelActionVisibilityOfFlexTable(String usage, String iconName, String columnName) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(I.amPerforming().getElementReference().of(govgrants.perform().flexTable().getTableActionIconWithoutTableId(iconName, columnName))
                    .getAttribute("title").equalsIgnoreCase(iconName));
        } else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(I.amPerforming().getElementReference().of(govgrants.perform().flexTable().getTableActionIconWithoutTableId(iconName, columnName))
                    .getAttribute("title").equalsIgnoreCase(iconName));
        } else if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().getElementReference().of(govgrants.perform().flexTable().getTableActionIconWithoutTableId(iconName, columnName))
                    .getAttribute("title").equalsIgnoreCase(iconName)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().getElementReference().of(govgrants.perform().flexTable().getTableActionIconWithoutTableId(iconName, columnName))
                    .getAttribute("title").equalsIgnoreCase(iconName)).isFalse();
        }
    }

    /**
     * assert if specific value is displayed inside select dropdown list
     *
     * @param dropDownValue
     */
    /*public void assertValueInsideSelectDropdownAtPageDetail(String usage, String dropDownValue, String fieldApiName) {
        if (usage.equalsIgnoreCase("softlt see")) {
            I.amPerforming().assertionsTo().assertThat(isValuePresentInsideSelectDropdownPickList(dropDownValue, fieldApiName)).isTrue();
        } else if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isValuePresentInsideSelectDropdownPickList(dropDownValue, fieldApiName));
        }
    }*/

    /**
     * return true/false if modal button is getting displayed/not displayed
     */
    public void assertButtonOnModal(String usage, String btn) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isButtonDisplayedAtModal(btn)).isTrue();
        } else if (usage.equalsIgnoreCase("softly cannot see")) {
            I.amPerforming().assertionsTo().assertThat(isButtonDisplayedAtModal(btn)).isFalse();
        }
    }

    private boolean isButtonDisplayedAtModal(String btn) {
        By iframeOfActiveModal = By.xpath("//div[contains(@class,'modal') and contains(@style,'block')]//iframe");
        String iframeId = I.amPerforming().actionToGet().attribute(iframeOfActiveModal, "id");
        I.amPerforming().switchTo().frame(By.xpath("//iframe[@id='" + iframeId + "']"));

        boolean flag = false;
        try {
            By toLookInto = By.xpath("//div[not (contains(@id,'footerButtonsPanel'))]//input[@value='Save' or text()='Save']");
            I.amPerforming().checkToSee().isDisplayed(toLookInto);
            flag = true;
        } catch (Exception ee) {
        }
        return flag;
    }

    /**
     * assert true if row having expected text in Expenditure table
     */
    public void assertTextContainingRowAtParentFlexTabel(String text, String tableId, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(isExpectedTextIsDisplayedAtExpenditureTableRow(text, tableId)).isTrue();
        } else {
            Assert.assertTrue(isExpectedTextIsDisplayedAtExpenditureTableRow(text, tableId));
        }
    }

    /**
     * assert true if row having expected amount in Expenditure table
     */
    public void assertAmountInsideExpenditureTable(String key, String fieldApiName, String tableId, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(isExpectedAmountIsDisplayedAtExpenditureTableRow(key, fieldApiName, tableId)).isTrue();
        } else {
            Assert.assertTrue(isExpectedAmountIsDisplayedAtExpenditureTableRow(key, fieldApiName, tableId));
        }
    }

    /**
     * assert true if expected value of column is displayed
     */
    public void assertColumnsValuesAsExpected(String fieldApiName, String tableId) {
        Assert.assertTrue(isExpectedColumnsValuesForTwoTableIsDisplayed(fieldApiName, tableId));
    }

    /**
     * assert true if row having expected amount in Expenditure table
     */
    public void assertExpectedCalculatedAmountInsideExpenditureTable(String fieldApiNAme3, String tableId, String fieldApiName1, String fieldApiName2) {
        Assert.assertTrue(isExpectedAmountIsDisplayedAtExpenditureTable(fieldApiNAme3, tableId, fieldApiName1, fieldApiName2));
    }

    /**
     * it will save the content of expected column of budget period table
     */
    public void saveValuesOfExpectedColumn(String fieldApiName, String tableId) {
        ArrayList<String> obtainedList = new ArrayList<>();
        List<Elements> rows_table = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id= '" + tableId + "']//*[@field-name='" + fieldApiName + "']/span"));
        String str = "";
        for (Elements we : rows_table) {
            str = we.getText();
            obtainedList.add(str);
        }
        I.amPerforming().propertiesFileOperationsTo().saveValue("obtainedListValues", String.valueOf(obtainedList));
    }

    /**
     * it will save the content of expected column of budget period table
     */
    public void saveAmountFromTableCells(String fieldApiName, String key, String tableId) {
        String amountBudget = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id = '" + tableId + "']//field[@field-name='" + fieldApiName + "']/span")).get(0).getText();
        I.amPerforming().propertiesFileOperationsTo().saveValue(key, amountBudget);
    }

    /**
     * return true if return sum value for Amount column is as expected
     */
    public void assertTotalSumValueForExpectedColumn(String columnName, String tableId) {
        Assert.assertTrue(isExpectedSummedValueForExpectedColumnOfTableDisplayed(columnName, tableId));
    }

    /**
     * @return true if expected sum is displayed for particular column at table
     */
    public Boolean isExpectedSummedValueForExpectedColumnOfTableDisplayed(String columnName, String tableId) {
        WebElement expectedColumnSum = I.amPerforming().getElementReference().of(enableTotalSumValueForTargetColumn);
        String sumValueInString = String.format("%.2f", getSummedValueForExpectedColumn(columnName, tableId));
        boolean flag = false;
        if (I.amPerforming().actionToGet().text(expectedColumnSum).replaceAll("[,]", "").equalsIgnoreCase("$" + sumValueInString)) {
            flag = true;
        }
        return flag;
    }

    /**
     * hover on help text inside child table
     *
     * @param tableId
     */
    public void getHelpTextAtChildTable(String tableId) {
        I.amPerforming().scroll().toMoveToElement(By.xpath("//div[@id='" + tableId + "']//span[contains(@class,'fa-info')]"));
    }

    /**
     * hover on help text at page block inside child table
     *
     * @param tableId
     */
    public void getHelpTextAtPageBlockOrInsideTable(String tableId, String toolTipId) {
        I.amPerforming().scroll().toMoveToElement(By.xpath("//div[@id='" + tableId + "']//a[@id='" + toolTipId + "']//span[contains(@class,'fa-info')]"));
    }

    /**
     * get any item from bottom menu at page details
     *
     * @param options
     * @return
     */
    public WebElement getItemFromBottomMenu(String options) {
        By bottomMenuItem = By.xpath("//div[@class='bottomMenu-body']//div/a[text()='" + options + "']");
        return I.amPerforming().getElementReference().of(bottomMenuItem);
    }

    /**
     * hover on look up link at page block details
     *
     * @param lookUpLink
     */
    public void getLookUpLinkToHover(String labelName, String lookUpLink) {
        I.amPerforming().scroll().toMoveToElement(By.xpath("//dl//span[text()='" + labelName + "']/../following-sibling::dd//a[contains(text(),'" + lookUpLink + "') or @class='tooltipstered']"), false);
    }

    /**
     * get particular table column complete content
     *
     * @param fieldApiName
     * @return
     */
    public List<Elements> getTableColumnCompleteContent(String fieldApiName) {
        return I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//table/tbody//span[contains(@ng-if,'isTotal != true')]//*[@field-name='" + fieldApiName + "']/span"));
    }

    /**
     * assert if expected table is getting refreshed
     */
    public void asserTableRefreshOnRefreshOptionClick() {
        String stateOfRegresh = isTableRefreshOnRefreshOptionClick();
        Assert.assertTrue(stateOfRegresh.equalsIgnoreCase("Complete"));
    }

    /**
     * assert number of pages inside table is displayed
     *
     * @param tableId
     * @param text
     */
    public void assertNumberOfPagesInsideTable(String usage, String tableId, String text) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isNumberOfPagesInsideTableDisplayed(tableId, text));
        } else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(isNumberOfPagesInsideTableDisplayed(tableId, text));
        } else if (usage.equalsIgnoreCase("softly see")) {
            Assert.assertTrue(isNumberOfPagesInsideTableDisplayed(tableId, text));
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            Assert.assertFalse(isNumberOfPagesInsideTableDisplayed(tableId, text));
        }
    }

    /**
     * assert true if 20 records present inside program flex table
     */
    public void assertFlexTabelNumberOfRecordsPresent(int rowCount, String tableId) {
        Assert.assertTrue(isNoOfRecordsInsideFlexTablePresent(rowCount, tableId));
    }

    /**
     * assert true if table contains nuber of records as default
     */
    public void assertDefaultSelectedRecordAtTable(String tableId) {
        Assert.assertTrue(isTableContainingDefaultRecordAsExpected(tableId));
    }

    /**
     * assert true if total records is equal to number of records in table
     */
    public void AssertTotalRecordsCountInFlexTable(String tableId) {
        Assert.assertTrue(totalRecordsCount(tableId));
    }

    /**
     * return true if content of owner organisation lookup modal is in ascending order
     */
    public void assertSortingOrderOfFlexTableColumnContent(String usage, String titleName, String order, String tableId) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isContentOfFlexTableColumnInExepctedOrder(titleName, order, tableId));
        } else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(isContentOfFlexTableColumnInExepctedOrder(titleName, order, tableId));
        } else if (usage.equalsIgnoreCase("softly see")) {
            Assert.assertTrue(isContentOfFlexTableColumnInExepctedOrder(titleName, order, tableId));
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            Assert.assertFalse(isContentOfFlexTableColumnInExepctedOrder(titleName, order, tableId));
        }
    }

    /**
     * assert correct title of page block is displayed
     *
     * @param titleName
     * @param tableId
     */
    public void assertPageBlockTitleDisplayed(String titleName, String tableId) {
        Assert.assertTrue(isTitleDisplayedForPageBlock(titleName, tableId));
    }

    /**
     * assert true if header column name is present on lookup modal
     *
     * @param headerColumnName
     */
    public void assertTableHeaderColumnNameForLookupModal(String usage, String headerColumnName) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isTableColumnHeaderNameOnLookModal(headerColumnName));
        } else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(isTableColumnHeaderNameOnLookModal(headerColumnName));
        } else if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isTableColumnHeaderNameOnLookModal(headerColumnName)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isTableColumnHeaderNameOnLookModal(headerColumnName)).isFalse();
        }
    }

    /**
     * assert show entries dropdown at lookup modal
     */
    public void assertLookupModalBottomElementDisplayed(String expectedFields, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(isLookupModalBottomFieldsDisplayed(expectedFields)).isTrue();
        } else {
            Assert.assertTrue(isLookupModalBottomFieldsDisplayed(expectedFields));
        }
    }

    /**
     * assert selected value of lookup field is displayed
     *
     * @param selectedValue
     * @param fieldName
     */
    public void assertSelectedOrganizationDisplayed(String selectedValue, String fieldName) {
        Assert.assertTrue(isExpectedOrganizationIsDisplayed(selectedValue, fieldName));
    }

    /**
     * assert quick search is getting disabled on new button action click
     */
    public void assertQuickSearchDisabledOnActionClick(String tableId) {
        Assert.assertTrue(isQuickSearchBoxGettingDisabled(tableId));
    }

    /**
     * It will check row level action icon against column value inside attachment and notes table
     *
     * @param iconName
     * @paran columnValue
     */
    public void assertActionIconInsideAttachmentAndNotesTable(String usage, String iconName, String columnValue) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(assertAttachmentAndNotesActionIcon(iconName, columnValue)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(assertAttachmentAndNotesActionIcon(iconName, columnValue)).isFalse();
        }
    }

    /**
     * assert if saved value of Total Records is equal to expected Table Total Records value.
     *
     * @param tableId
     * @param fieldKey
     */
    public void assertValuesOfTotalRecordField(String text, String tableId, String fieldKey, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(assertTotalRecordValue(text, tableId, fieldKey)).isTrue();
        } else {
            Assert.assertTrue(assertTotalRecordValue(text, tableId, fieldKey));
        }
    }

    /**
     * It will check displayed Task Creation Date and Due Date are as per taskCreationDays and taskCompletionDays
     *
     * @param taskCreationDays
     * @param taskCompletionDays
     * @param tableId
     */
    public void assertColumnValueAgainstSavedValue(String taskCreationDays, String taskCompletionDays, String tableId) {
        Assert.assertTrue(isDateDisplayedAsPerDays(taskCreationDays, taskCompletionDays, tableId));
    }

    /**
     * It will check symbol is displayed
     *
     * @param symbol
     * @param tableId
     */
    public void assertSymbolIsDisplayed(String symbol, String tableId) {
        Assert.assertTrue(assertSymbolIsDisplayedInsideTable(symbol, tableId));
    }

    /**
     * It will check End date is displayed as per schedule base
     *
     * @param scheduleBase
     * @param tableId
     */
    public void assertEndDateAgainstScheduleBase(String scheduleBase, String tableId) {
        Assert.assertTrue(assertReportingPeriodEndDateIsDisplayedAsPerScheduleBase(scheduleBase, tableId));
    }

    /**
     * It will check prepopulated value is displayed
     *
     * @param fieldName
     * @param value
     */
    public void assertPrePopulatedValueInEditMode(String fieldName, String value) {
        Assert.assertTrue(assertPrePopultedValue(fieldName, value));
    }

    /**
     * It will check due date is displayed as per provided date
     *
     * @param columnName
     * @param savedDate
     * @param tableId
     */
    public void assertDateAccortingToNumberOfDaysPassed(String columnName, String savedDate, String tableId) {
        Assert.assertTrue(assertDateAccordingProvidedDate(columnName, savedDate, tableId));
    }

    /*********
     * "Local Methods with complete functionality - private"
     *****************/

    /**
     * return true if expected records displayed inside table
     *
     * @param recordsName
     * @return
     */
    private boolean isExpectedRecordsDisplayedInsideTable(String flexTableHeader, String... recordsName) {
        Boolean isRecordsDisplayed = false;

        try {
            for (String expectedRecords : recordsName) {
                I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[@id='myTabbedContent']//a[@title='" + flexTableHeader + "']/../../../following-sibling::div//tbody//td//span[text()='" + expectedRecords + "'] "));
                isRecordsDisplayed = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isRecordsDisplayed;
    }

    /**
     * Return true if snapshot saving content inside snapshot history page block
     */
    private boolean isContentGettingSavedBySanpShotOption(String text) {
        boolean result = true;
        if (text.equalsIgnoreCase("Todays Date")) {
            String cdate = I.amPerforming().dateOperationsToGet().currentDateInDesiredFormat((DateTimeFormatter.ofPattern("M/d/yyyy h:mm a").withLocale(Locale.US))).replaceAll("^0", "");
            System.out.println("The current date:-" + cdate);
            String[] currentsplit = (cdate.split(":", 2));
            String[] arrCSplit = currentsplit[1].split("\\s");
            int date = Integer.parseInt(arrCSplit[0]);
            date = date + 5;
            String filename = "";
            for (int i = 10; i > 0; i--) {
                date = date - 1;
                String ddate;
                if (date <= 9) {
                    String sdate = "0" + String.valueOf(date);
                    ddate = currentsplit[0] + ":" + sdate + " " + arrCSplit[1];
                } else {
                    ddate = currentsplit[0] + ":" + date + " " + arrCSplit[1];
                }

                filename = "SnapShot on " + ddate + ".pdf";
                if (I.amPerforming().getElementReference().of(By.xpath("//html")).getText().contains(filename)) {
                    result = true;
                    break;
                } else {
                    result = false;
                }
            }
        }
        return result;
    }

    /**
     * return true if table is getting refreshed on Refresh option click
     */
    private String isTableRefreshOnRefreshOptionClick() {
        return I.amPerforming().browserOperationsTo().getPageLoadStatus();
    }

    /**
     * @param tableId
     * @param text
     * @return true if expected Number of pages inside table is displayed
     */
    private boolean isNumberOfPagesInsideTableDisplayed(String tableId, String text) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//*[@id='" + tableId + "']//span[contains(text(),'" + text + "')]"))) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * @return true if expected count of records is present inside flex table
     */
    private boolean isNoOfRecordsInsideFlexTablePresent(int rowCount, String tableId) {
        boolean flag = false;
        try {
            int listSize = govgrants.perform().flexTable().getCompleteTableRow(tableId).size();
            if (listSize == rowCount) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * @return true if expected count of records is present inside table
     */
    private boolean isTableContainingDefaultRecordAsExpected(String tableId) {
        boolean flag = false;
        WebElement showEntriesValue = I.amPerforming().dropDownSelection().from(By.xpath("//div[@id='" + tableId + "']//tfoot//select")).getFirstSelectedOption();
        String gtest = showEntriesValue.getText();
        try {
            int listSize = govgrants.perform().flexTable().getCompleteTableRow(tableId).size();
            if (listSize == Integer.parseInt(gtest)) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * @return true if Total Records is equal to number of records present in table
     */
    private boolean totalRecordsCount(String tableId) {
        boolean flag = false;
        String value = I.amPerforming().actionToGet().text(By.xpath("//div[@id='" + tableId + "']//following-sibling::span[contains(text(),'Total Records')]")).replaceAll("[^0-9]", "");
        try {
            int listSize = govgrants.perform().flexTable().getCompleteTableRow(tableId).size();
            if (listSize == Integer.parseInt(value)) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * return true if content appears in Ascending/Descending order for look up modal
     *
     * @return
     */
    private boolean isContentOfFlexTableColumnInExepctedOrder(String columnName, String order, String tableId) {
        boolean flag = false;
        WebElement sortArrow = I.amPerforming().getElementReference().of(By.xpath("//div[@id='" + tableId + "']//tr//th//span[contains(text(),'" + columnName + "')]/..//span[contains(@class,'arrow')]"));
        if (sortArrow.getAttribute("class").contains("fa-arrow-up")) {
            I.amPerforming().checkToSee().isTableSorted(govgrants.perform().flexTable().getTableSpecificColumnValues(columnName, tableId), order);
            flag = true;
        } else if (sortArrow.getAttribute("class").contains("fa-arrow-down")) {
            I.amPerforming().checkToSee().isTableSorted(govgrants.perform().flexTable().getTableSpecificColumnValues(columnName, tableId), order);
            flag = true;
        }
        return flag;
    }

    /**
     * validate if tile is displayed at page block title with table id
     *
     * @param titleName
     * @param tableId
     * @return
     */
    private boolean isTitleDisplayedForPageBlock(String titleName, String tableId) {
        try {
            if (I.amPerforming().checkToSee().isDisplayed(govgrants.perform().phasePanel().getPanelTitleWithTableId(tableId, titleName))) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * validate if column contains only expected values in side table
     *
     * @param fieldApiName
     * @param text
     * @return
     */
    private boolean isColumnContainsExpectedValuesOnly(String fieldApiName, String text) {
        boolean flag = false;
        for (Elements el : getTableColumnCompleteContent(fieldApiName)) {
            String valuesFound = el.getText().trim();
            if (valuesFound.equals(text)) {
                flag = true;
            }
        }
        return flag;
    }

    /**
     * validate if fields is not visible at page details
     */
    private boolean isFieldsVisibleAtPAgeDetails(String fieldApiName) {
        By fieldsAtPage = By.xpath("//div[@id='" + fieldApiName + "']/ancestor::div[contains(@class,'textFieldWrapFlex')]/div[contains(@class,'textFieldWrap') and contains(@style,'none')]");
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(fieldsAtPage)) {
                flag = true;
            }
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /**
     * @return false if expected element is not displayed on look modal
     */
    private Boolean isTableColumnHeaderNameOnLookModal(String titleName) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(govgrants.perform().flexTable().getSpecificElementFromTableHeader(titleName))
                    || I.amPerforming().checkToSee().isEnabled(govgrants.perform().flexTable().getSpecificElementFromTableHeader(titleName))) {
                flag = true;
            }
        } catch (org.openqa.selenium.NoSuchElementException e) {
            flag = false;
        }
        return flag;
    }

    /**
     * validate if show entries drop down is displayed at look up modal
     *
     * @return
     */
    private boolean isLookupModalBottomFieldsDisplayed(String expectedFields) {
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[@id='lookuploading']//div//span[contains(text(),'" + expectedFields + "')]"))) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * @return true if expected organization is getting displayed
     */
    private boolean isExpectedOrganizationIsDisplayed(String selectedValue, String fieldName) {
        boolean flag = false;
        try {
            if (I.amPerforming().actionToGet().attribute(By.xpath("//div[@id='" + fieldName + "']//input[@type='text']"), "value").equalsIgnoreCase(selectedValue)) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * validate if quick search is disabled on New button Action click inside table
     *
     * @param tableId
     * @return
     */
    private boolean isQuickSearchBoxGettingDisabled(String tableId) {
        boolean flag = false;
        if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[@id='" + tableId + "']//input[@placeholder='Search...' and @id='quickserchtext']/ancestor::div[contains(@class,'disabledOpacity')]"))) {
            flag = true;
        }
        return flag;
    }

    /**
     * return true if picklist dropDownValue is displayed
     *
     * @param dropDownValue
     * @param fieldApiName
     * @return
     */
   /* private boolean isValuePresentInsideSelectDropdownPickList(String dropDownValue, String fieldApiName) {
        String[] exp = null;
        if (dropDownValue.contains(":")) {
            exp = dropDownValue.split(":");
        }
        List<String> opt01 = Arrays.asList(exp);
        By selectD = By.xpath("//div[@id='" + fieldApiName + "']//select|//*[@field-name='" + fieldApiName + "']//select|//div[@id='" + fieldApiName + "']//select//option");
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
    }*/

    /**
     * Return true if snapshot saving content inside snapshot history page block
     */
    private boolean isExpectedFLexTableWithTitleIsDisplayed(String tableTitle) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[contains(@class,'panel-title')][text()='" + tableTitle + "']")))
                ;
            {
                flag = true;
            }
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /**
     * click on close icon to close AlertBox on notes and attachment
     */
    public void closeAlertBoxFromPage() {
        I.amPerforming().click().on(By.xpath("//button[contains(@class,'bootbox-close-button')]"));
    }

    /**
     * return true/false if Attachment/Notes button is getting displayed/not displayed
     */
    private boolean assertAttachmentAndNotesActionIcon(String iconName, String columnValue) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//td//*[@title='" + columnValue + "' or text()='" + columnValue + "']/ancestor::tr[1]//td//a[@title='" + iconName + "' or text()='" + iconName + "']")))
                ;
            {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * return true/false if saved and expected value is same
     */
    private boolean assertTotalRecordValue(String text, String tableId, String fieldKey) {
        boolean flag = false;
        String uiContent = I.amPerforming().actionToGet().text(govgrants.perform().flexTable().getFooterElementsFromTable(text, tableId));
        int fieldValue1 = Integer.parseInt(uiContent.replaceAll("[\\D]", ""));
        if (String.valueOf(fieldValue1).equalsIgnoreCase(fieldKey)) {
            flag = true;
        }
        return flag;
    }

    /**
     * return true/false if Task Creation Date and Due Date are displayed/ not displayed as per taskCreationDays and taskCompletionDays
     *
     * @param taskCreationDays
     * @param taskCompletionDays
     * @param tableId
     */
    private boolean isDateDisplayedAsPerDays(String taskCreationDays, String taskCompletionDays, String tableId) {
        boolean flag = false;
        try {
            String firstEndDate = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id = '" + tableId + "']//td//i[contains(@class,'fa-close')]/../../../preceding-sibling::td//field[@field-name='EndDate__c']")).get(0).getText();
            String firstCreationDate = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id = '" + tableId + "']//td//i[contains(@class,'fa-close')]/../../../following-sibling::td//field[@field-name='TaskCreationDate__c']")).get(0).getText();
            String firstDueDate = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id = '" + tableId + "']//td//i[contains(@class,'fa-close')]/../../../following-sibling::td//field[@field-name='DueDate__c']")).get(0).getText();
            String finalCreationDate = I.amPerforming().dateOperationsToGet().givenDateWithOffsetFromGivenDate(firstEndDate, -Integer.parseInt(taskCreationDays), DateTimeFormatter.ofPattern("MM/dd/yyyy"));
            String finalDueDate = I.amPerforming().dateOperationsToGet().givenDateWithOffsetFromGivenDate(firstEndDate, Integer.parseInt(taskCompletionDays), DateTimeFormatter.ofPattern("MM/dd/yyyy"));
            if (firstCreationDate.equals(finalCreationDate) && firstDueDate.equals(finalDueDate)) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * return true/false if symbol is displayed/ not displayed
     *
     * @param symbol
     * @param tableId
     */
    private boolean assertSymbolIsDisplayedInsideTable(String symbol, String tableId) {
        boolean flag = false;
        try {
            if (("cross".equalsIgnoreCase(symbol) && I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[@id='" + tableId + "']//*[contains(@class,'fa-close')]")))
                    || ("check".equalsIgnoreCase(symbol) && I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[@id='" + tableId + "']//*[contains(@class,'fa-check')]")))) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * return true/false if Reporting Period End Date is displayed/ not displayed as per schedule base
     *
     * @param scheduleBase
     * @param tableId
     */
    private boolean assertReportingPeriodEndDateIsDisplayedAsPerScheduleBase(String scheduleBase, String tableId) {
        boolean flag = false;
        try {
            if ("Calendar".equalsIgnoreCase(scheduleBase)) {
                String startDate = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id = '" + tableId + "']//td//i[contains(@class,'fa-close')]/../../../preceding-sibling::td//field[@field-name='StartDate__c']")).get(0).getText();
                String endDate = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id = '" + tableId + "']//td//i[contains(@class,'fa-close')]/../../../preceding-sibling::td//field[@field-name='EndDate__c']")).get(0).getText();
                LocalDate calculatedEndDate = LocalDate.parse(startDate, DateTimeFormatter.ofPattern("MM/dd/yyyy"));
                calculatedEndDate = calculatedEndDate.withDayOfMonth(calculatedEndDate.getMonth().length(calculatedEndDate.isLeapYear()));
                String finalEndDate = calculatedEndDate.format(DateTimeFormatter.ofPattern("MM/dd/yyyy"));
                if (endDate.equals(finalEndDate)) {
                    flag = true;
                }
            } else if ("Reporting Period".equalsIgnoreCase(scheduleBase)) {
                String startDate = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id = '" + tableId + "']//td//i[contains(@class,'fa-close')]/../../../preceding-sibling::td//field[@field-name='StartDate__c']")).get(0).getText();
                String endDate = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id = '" + tableId + "']//td//i[contains(@class,'fa-close')]/../../../preceding-sibling::td//field[@field-name='EndDate__c']")).get(0).getText();
                LocalDate calculatedEndDate = LocalDate.parse(startDate, DateTimeFormatter.ofPattern("MM/dd/yyyy")).plusMonths(1).minusDays(1);
                String finalEndDate = calculatedEndDate.format(DateTimeFormatter.ofPattern("MM/dd/yyyy"));
                if (endDate.equals(finalEndDate)) {
                    flag = true;
                }
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * return true/false if prepopulated value is displayed/ not displayed
     *
     * @param fieldName
     * @param value
     */
    private boolean assertPrePopultedValue(String fieldName, String value) {
        boolean flag = false;
        String field = I.amPerforming().getElementReference().of(By.xpath("//div[@id='" + fieldName + "']//input[@type='text']")).getAttribute("value");
        if (field.equals(value)) {
            flag = true;
        }
        return flag;
    }

    /**
     * Return true if snapshot saving content inside snapshot history page block
     */
    private boolean isExpectedColumnsValuesForTwoTableIsDisplayed(String fieldApiName, String tableId) {
        boolean flag = false;
        ArrayList<String> obtainedListFromActuals = new ArrayList<>();
        List<Elements> rows_table = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id= '" + tableId + "']//*[@field-name='" + fieldApiName + "']/span"));
        String str = "";
        for (int i = 0; i < rows_table.size() - 1; i++) {
            str = rows_table.get(i).getText();
            obtainedListFromActuals.add(str);
        }
        try {
            if (String.valueOf(obtainedListFromActuals).equalsIgnoreCase(I.amPerforming().propertiesFileOperationsTo().getValue("obtainedListValues"))) {
                flag = true;
            }
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /**
     * @return true if expected text is displayed inside enhanced grid rows
     */
    private Boolean isExpectedTextIsDisplayedAtExpenditureTableRow(String text, String tableId) {
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
     * @return true if expected amount is displayed inside expenditure table rows
     */
    private Boolean isExpectedAmountIsDisplayedAtExpenditureTableRow(String key, String fieldApiName, String tableId) {
        String amountBudget = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id = '" + tableId + "']//field[@field-name='" + fieldApiName + "']/span")).get(0).getText();
        boolean flag = false;
        try {
            if (amountBudget.equalsIgnoreCase(I.amPerforming().propertiesFileOperationsTo().getValue(key))) {
                flag = true;
            } else {
                flag = false;
            }
        } catch (Exception e) {

        }
        return flag;
    }

    /**
     * @return true if expected calculated amount is displayed inside expenditure table
     */
    private Boolean isExpectedAmountIsDisplayedAtExpenditureTable(String fieldApiName3, String tableId, String fieldApiName1, String fieldApiName2) {
        boolean flag = false;
        String awardBudgetAmount = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id = '" + tableId + "']//field[@field-name='" + fieldApiName1 + "']/span")).get(0).getText();
        String expenditureAmount = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id = '" + tableId + "']//field[@field-name='" + fieldApiName2 + "']/span")).get(0).getText();
        String expectedAmount = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id = '" + tableId + "']//field[@field-name='" + fieldApiName3 + "']/span")).get(0).getText();

        int calculation;

        if (!awardBudgetAmount.equalsIgnoreCase("$0.00") || !expenditureAmount.equalsIgnoreCase("$0.00")) {
            calculation = Integer.valueOf(awardBudgetAmount.replaceAll("[\\$|,|;|']", "").replaceFirst("\\.00", "")) - Integer.valueOf(expenditureAmount.replaceAll("[\\$|,|;|']", "").replaceFirst("\\.00", ""));
            String numberAsString = "$" + calculation + ".00";
            if (expectedAmount.replaceAll("[,]", "").equalsIgnoreCase(numberAsString)) {
                flag = true;
            } else {
                flag = false;
            }
        }
        return flag;
    }

    /**
     * @return total sum value for specific column inside drawdown table
     */
    private double getSummedValueForExpectedColumn(String columnName, String tableId) {
        WebElement row = I.amPerforming().getElementReference().of(By.xpath("//td[descendant-or-self::*[text()='10F']]//ancestor::tr[1]"));
        Set<String> headerTitles = new HashSet<String>();
        headerTitles.add(columnName);
        Map<String, Integer> columnMapping = govgrants.perform().flexTable().constructColumnMapping(row, headerTitles);
        System.out.println("The column number was: " + columnMapping.get(columnName));
        By columnSelector = By
                .xpath("//div[@id='" + tableId + "']//table//tr" + "//td[not(contains(@class, 'ng-hide'))]["
                        + columnMapping.get(columnName) + "]" + "//span//field/span");
        int total = 0;
        for (Elements columnValue : I.amPerforming().getElementReference().forListOfElements().of(columnSelector)) {
            try {
                total += Integer.valueOf(columnValue.getText().replaceAll("[\\$|,|;|']", "").replaceFirst("\\.00", ""));
            } catch (Exception e) {
                I.amPerforming().updatingOfReportWith().write(LogLevel.PROJECT_LAYER_ERROR, "An exception occured with column value '" + columnValue.getText() + "'");
                throw e;
            }
        }
        System.out.println("Total : " + total);
        return total;
    }

    /**
     * return true/false if Due Date is displayed/ not displayed according to provided date
     *
     * @param columnName
     * @param savedDate
     * @param tableId
     */
    private boolean assertDateAccordingProvidedDate(String columnName, String savedDate, String tableId) {
        boolean flag = false;
        try {
            String DueDate = I.amPerforming().getElementReference().of(By.xpath("//div[@id='" + tableId + "']//th//span[text()='" + columnName + "']/ancestor::thead/parent::table//tr//td[6]/span/span")).getText();
            String dueDateAsPerSavedDate = LocalDate.parse(savedDate.substring(0, 10), DateTimeFormatter.ofPattern("MM/dd/yyyy")).plusDays(45).format(DateTimeFormatter.ofPattern("MM/dd/yyyy"));
            if (DueDate.equals(dueDateAsPerSavedDate)) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }
}