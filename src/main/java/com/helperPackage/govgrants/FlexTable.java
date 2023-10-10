package com.helperPackage.govgrants;


import com.helperPackage.handlers.govgrants;
import com.helperPackage.interfaces.FlexTableComponent;
import com.helperPackage.actionsfactory.api.ByUsing;
import com.helperPackage.controller.ScenarioController;
import com.helperPackage.objects.Elements;
import com.helperPackage.register.EnvironmentFactory;
import com.helperPackage.register.I;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import java.time.format.DateTimeFormatter;
import java.util.*;

public final class FlexTable implements FlexTableComponent {
    private final By
            completeTableHeader = By.xpath(
            "//div[@class='panel-heading']/following-sibling::div[contains(@class,'panel-body')]//div/table/thead/tr"),
            completeTableRow = By.xpath(
                    "//div[@class='panel-heading']/following-sibling::div[contains(@class,'panel-body')]//div/table/tbody/tr | //div[contains(@class,'panel-body')]//div/table/tbody/tr");

    /******* "Key Methods with complete functionality - Public" *****************/

    /**
     * fetch the complete header of table
     *
     * @return
     */
    @Override
    public List<Elements> getCompleteTableHeader() {
        return I.amPerforming().getElementReference().forListOfElements().of(completeTableHeader);
    }

    /**
     * get any element from title table bar except Action
     *
     * @param titleName
     * @return
     */
    public WebElement getSpecificElementFromTableHeader(String titleName) {
        By tableHeaderElement = By.xpath("//div[@class='panel-heading']"
                + "/following-sibling::div[contains(@class,'panel-body')]" + "//div/table/thead/tr/th//span["
                + I.amPerforming().sanityOfXpathTo().equals("@title", titleName) + " or "
                + I.amPerforming().sanityOfXpathTo().equals("text()", titleName)
                + "] | //div[contains(@class,'panel-body')]//div/table/thead/tr/th//span["
                + I.amPerforming().sanityOfXpathTo().equals("@title", titleName) + " or "
                + I.amPerforming().sanityOfXpathTo().equals("text()", titleName) + "]");

        return I.amPerforming().getElementReference().of(tableHeaderElement);
    }

    /**
     * get any element from title table bar except Action with table id
     *
     * @param tableId
     * @param titleName
     * @return
     */
    public WebElement getSpecificElementFromTableHeader(String tableId, String titleName) {
        By tableHeaderElement = By
                .xpath("//div[@id='" + tableId + "']//div/table/thead/tr/th//span["
                        + I.amPerforming().sanityOfXpathTo().equals("@title", titleName) + " or "
                        + I.amPerforming().sanityOfXpathTo().equals("text()", titleName) + "] | //div[@id='" + tableId + "']//tr//th//span[contains(text(),'" + titleName + "')]|" +
                        "//div[@id='" + tableId + "']//div/table/thead/tr/th[@title='" + titleName + "' or text()='" + titleName + "'] | " +
                        "//div[@id='" + tableId + "']//div/table/thead/tr/th/div[contains(text(),'" + titleName + "')] | //div[@id='" + tableId + "']//div//table//th[contains(text(),'" + titleName + "')] ");
        return I.amPerforming().getElementReference().of(tableHeaderElement);
    }

    /**
     * get complete rows of flea table. It will return us rows of table which donot have any expand/collapse(+) icon.
     *
     * @return
     */
    public List<Elements> getCompleteTableRow() {
        return I.amPerforming().getElementReference().forListOfElements().of(completeTableRow);
    }

    /**
     * get complete rows of flex grid. It will return us rows of table having (+)/expand icon or child table in it. It will include table like enhanced grid, mass editable grid, N2g grid.
     * And It will only return rows of Parent table.
     *
     * @param tableId
     * @return
     * @author Monu.Kumar
     */
    public List<Elements> getCompleteFlexGridRow(String tableId) {
        By tableRow = By.xpath("//div[@id='" + tableId + "']//div/table/tbody[contains(@ng-repeat,'row')]");
        return I.amPerforming().getElementReference().forListOfElements().of(tableRow);
    }

    /**
     * return locator for status column
     *
     * @param columnValueName
     * @return
     * @modifier saranjit.modak - modified To validate the icon inside a flex table for DCDOH Project
     */
    public By getFlexTableColumn(String columnValueName) {
        return By.xpath("//td//span[@title='" + columnValueName + "' or text()='"
                + columnValueName + "']|//td//span//a[@title='" + columnValueName + "' or text()='" + columnValueName + "']");
    }

    /**
     * return specific table row cell value element
     *
     * @param columnValueName
     * @return
     * @modifier Monu.Kumar
     */
    public WebElement getTableCellValue(String tableId, String columnValueName) {
        By tableCellValue = By.xpath("//div[@id='" + tableId + "']//td//span["
                + I.amPerforming().sanityOfXpathTo().equals("@title", columnValueName) + "or "
                + I.amPerforming().sanityOfXpathTo().equals("text()", columnValueName) + "]");
        return I.amPerforming().getElementReference().of(tableCellValue);
    }

    /**
     * Clicks on the top right button of a flex table based on the flex table id
     *
     * @param flexTableId
     * @param buttonName
     * @author john.phillips
     */
    public void clickTableTopRightButton(String flexTableId, String buttonName) {
        I.amPerforming().click().on(getTopRightButtonLocatorByTableId(flexTableId, buttonName));
        govgrants.perform().modal().acceptPopUp();
    }

    /**
     * click flex table item based on program name/subject , status and icon name
     *
     * @param iconName
     * @param anyUniqueColumnValues
     * @author john.phillips
     */
    public void clickTableActionIcon(String flexTableId, String iconName, String... anyUniqueColumnValues) {
        I.amPerforming().click().on(getTableActionIcon(flexTableId, iconName, anyUniqueColumnValues));
        govgrants.perform().modal().acceptPopUp();
    }

    /**
     * click any table action icon using column
     *
     * @param iconName
     * @param anyUniqueColumnValues
     * @author john.phillips
     */
    public void clickTableActionIcons(String iconName, String... anyUniqueColumnValues) {
        I.amPerforming().click().on(getTableActionIconWithoutTableId(iconName, anyUniqueColumnValues));
    }

    /**
     * get next column value
     *
     * @param anyColumnValues
     * @return
     */
    public WebElement getTableFollowingColumn(String... anyColumnValues) {
        String desiredLocator = "";
        for (String uniqueColumnValue : anyColumnValues) {
            desiredLocator += "//td//descendant-or-self::*["
                    + I.amPerforming().sanityOfXpathTo().equals("@title", uniqueColumnValue) + " or "
                    + I.amPerforming().sanityOfXpathTo().equals("text()", uniqueColumnValue)
                    + "]/ancestor::tr[1]";
        }
        desiredLocator = desiredLocator.substring(0, desiredLocator.length() - 16);
        return I.amPerforming().getElementReference().of(By.xpath(desiredLocator));
    }

    /**
     * @param columnName
     * @param tableId
     * @return specific column values inside table while passing column name
     * @author Monu.Kumar
     */
    public List<Elements> getTableSpecificColumnValues(String columnName, String tableId) {
        WebElement row = I.amPerforming().getElementReference().of(By.xpath("//div[@id='" + tableId + "']//table//tbody//tr"));
        Set<String> headerTitles = new HashSet<String>();
        headerTitles.add(columnName);
        Map<String, Integer> columnMapping = govgrants.perform().flexTable().constructColumnMapping(row, headerTitles);
        System.out.println("The column number was: " + columnMapping.get(columnName));
        By columnSelector = By
                .xpath("//div[@id='" + tableId + "']//table//tr" + "//td[not(contains(@class, 'ng-hide'))]["
                        + columnMapping.get(columnName) + "]" + "//field/span");
        return I.amPerforming().getElementReference().forListOfElements().of(columnSelector);
    }

    /**
     * Checks a checkbox in each row of a flex table containing given strings
     *
     * @param flexTableId
     * @param uniqueColumnTexts
     * @author daniel.hilla
     * @modified jitendra pisal
     * @modifier ashwini.mahore - added xpath to select boxes at upload file modal and also to select radio button
     */
    public void selectCheckBoxes(String flexTableId, String... uniqueColumnTexts) {
        // if passed no strings, it will check the "select all" box at the top
        if (uniqueColumnTexts.length == 0) {
            By checkAllSelector = By.xpath("//div[@id='" + flexTableId + "']"
                    + "//div[@id='flexTableDivId' or @id='flexGridDivId' or @id='flexGridEnhancedDivId' or @id='flexGridEnhancedDivIdStepReviews']"
                    + "//th//input[(@type='checkbox' or @id='StepReviewscheckBox') and not(parent::label)]");
            I.amPerforming().click().on(checkAllSelector);
        }
        for (String uniqueColumn : uniqueColumnTexts) {
            By rowCheckboxSelector = By.xpath("//div[@id='" + flexTableId
                    + "']/div[@id='flexTableDivId' or @id='flexGridDivId' or @id='flexGridEnhancedDivId']"
                    + "//td//*[text()='" + uniqueColumn + "']/ancestor::tr[1]//input[@type='checkbox']" +
                    "| //div[@id='" + flexTableId + "']//td//*[text()='" + uniqueColumn + "']/ancestor::tr[1]//input[@type='checkbox']" +
                    "| //div[@id='" + flexTableId + "']//th//*[text()='" + uniqueColumn + "']/ancestor::tr[1]//input[@type='checkbox' or @type='radio']");
            try {
                I.amPerforming().click().on(rowCheckboxSelector);
            } catch (org.openqa.selenium.ElementClickInterceptedException e) {
                I.amPerforming().click().withJavaScript(rowCheckboxSelector);
            }
        }
    }

    /**
     * Either expands or collapses a sub table in a nested flex grid
     *
     * @param uniqueColumnValue
     * @param isExpand
     * @author john.phillips
     * @modifier Monu.Kumar
     * @modifier komal.mukhekar - Added xpath
     */
    public void expandOrCollapseNestedTable(String uniqueColumnValue, boolean isExpand) {
        String plusOrMinus = isExpand ? "plus" : "minus";
        By circleIconSelector = By.xpath(".//td//*[text()='" + uniqueColumnValue + "']//ancestor::tr[1]"
                + "//i[contains(@class, 'fa-" + plusOrMinus + "')]");
        By collapsingRow = By.xpath("//tr//*[contains(@class, 'collapsing')] | //tr//*[contains(@class, 'collapse')]");

        WebElement circleIconRow = I.amPerforming().getElementReference().of(circleIconSelector).findElement(By.xpath(".//ancestor::tr[1]"));
        I.amPerforming().click().on(circleIconSelector);

        boolean clickedAgain = false;

        for (long startTime = System.currentTimeMillis(), elapsedTime = 0;
             elapsedTime < EnvironmentFactory.getMaxWaitTime() && (I.amPerforming().checkToSee().IsElementPresentQuick(collapsingRow) || circleIconRow.findElements(circleIconSelector).size() != 0);
             elapsedTime = (System.currentTimeMillis() - startTime) / 1000
        ) {
            if (!clickedAgain && elapsedTime > EnvironmentFactory.getMaxWaitTime() / 2) {
                clickedAgain = true;
                try {
                    I.amPerforming().click().on(circleIconSelector, false);
                } catch (Exception e) {
                    /* Ignore Exception */
                }
            }
        }
    }

    /**
     * width - 150 is best slide for left
     *
     * @param flexTableId
     */
    public void slideNestedFlexTable(String flexTableId, int slideOffset) {
        By sliderLocator = By.xpath("//div[@id='" + flexTableId + "']//tfoot[@class='tbody-no-border-top']");
        int width = I.amPerforming().getElementReference().of(sliderLocator).getSize().getWidth();
        I.amPerforming().scroll().toMoveSliderByOffset(sliderLocator, width - slideOffset, 0);
    }

    /**
     * returns the By locator for an icon in a flex table row with two given column
     * values
     *
     * @param iconName
     * @param uniqueColumnValues
     * @modifier Monu.Kumar
     * @modifier meenakshi.jha added xpath
     */
    public By getTableActionIconWithoutTableId(String iconName, String... uniqueColumnValues) {
        String desiredAction = "";
        for (String uniqueColumnValue : uniqueColumnValues) {
            desiredAction += "//td//*["
                    + I.amPerforming().sanityOfXpathTo().equals("@title", uniqueColumnValue) + " or "
                    + I.amPerforming().sanityOfXpathTo().equals("text()", uniqueColumnValue) + "]"
                    + "/ancestor::tr[1]";

        }
        desiredAction += "//td//a[" + I.amPerforming().sanityOfXpathTo().equals("@title", iconName)
                + " or text()='" + iconName + "']";
        return By.xpath(desiredAction);
    }

    /**
     * returns the By locator for an icon in a flex table row with two given column
     * values
     *
     * @param flexTableId
     * @param uniqueColumnValues
     */
    public WebElement getSpecificTableColumn(String flexTableId, String... uniqueColumnValues) {
        String desiredColumn = "//div[" + I.amPerforming().sanityOfXpathTo().equals("@id", flexTableId)
                + "]";
        for (String uniqueColumnValue : uniqueColumnValues) {

            if (uniqueColumnValue.equalsIgnoreCase("Record Id")) {
                uniqueColumnValue = govgrants.perform().pageDetails().idOfRecord;
            }

            desiredColumn += "//td//*["
                    + I.amPerforming().sanityOfXpathTo().equals("@title", uniqueColumnValue) + " or "
                    + I.amPerforming().sanityOfXpathTo().equals("text()", uniqueColumnValue) + "]"
                    + "/ancestor::tr[1]";
        }
        desiredColumn = desiredColumn.substring(0, desiredColumn.length() - 16);
        return I.amPerforming().getElementReference().of(By.xpath(desiredColumn));
    }

    /**
     * @author john.phillips
     */
    public void waitForFlexTablesToLoad() {
        By loadingFlexTable = By
                .xpath("//*[@id='flexTableDivId' or @id='flexGridDivId']//*[contains(@class, 'progress-bar')]");
        try {
            while (I.amPerforming().checkToSee().IsElementPresentQuick(loadingFlexTable)) {
                I.amPerforming().waitFor().ElementToDisappear(loadingFlexTable);
            }
        } catch (Exception e) {
            /* Ignore Exception */
        }
    }

    /**
     * Enters new rows into a flex tale
     *
     * @param flexTableDivId The id of the flex table where the values are to be
     *                       added.
     * @param buttonName     The button which must be clicked to add a new row to
     *                       the table (usually will be "New", but could be
     *                       something else).
     * @param rowValues      The rows which are to be added. Note the data type. The
     *                       Map is from column headers to values (i.e. what will go
     *                       in each cell). For example: "Maximum application" => 1
     *                       "Title" => "Owner" etc. Note that for the inner maps,
     *                       all the keys should be the same across the different
     *                       rows. (i.e. Every row should enter values into the same
     *                       columns) DO NOT CHANGE IT TO DATATABLE - DISCUSSION
     *                       REQUIRED WITH HEMA
     * @author john.phillips
     * @modified keerti.munde (09/24/2020) - Added support for Runtime Record.
     */
    public void enterFlexTableRows(String flexTableDivId, String buttonName, List<Map<String, String>> rowValues) {
        Map<String, Integer> mapColumnHeaderToColumnPosition = null;
        WebElement table = null;
        for (Map<String, String> rowValue : rowValues) {
            clickTableTopRightButton(flexTableDivId, buttonName);
            if (table == null) {
                table = getCorrectTable(
                        I.amPerforming().getElementReference().of(getTopRightButtonLocatorByTableId(flexTableDivId, buttonName)));
            }

            WebElement newRow = I.amPerforming().getElementReference().ofNested(table, By.xpath("(.//tr[not(descendant::th)])[1]"));

            if (mapColumnHeaderToColumnPosition == null) {
                mapColumnHeaderToColumnPosition = constructColumnMapping(newRow, rowValues.get(0).keySet());
            }

            for (String value : rowValue.keySet()) {
                String values = rowValue.get(value);
                if (values.startsWith("Automation Runtime")) {
                    var newFieldValue = values + I.amPerforming().addOnsTo().getStringRandomNumber();
                    I.amPerforming().propertiesFileOperationsTo().saveValue(values, newFieldValue);
                    values = newFieldValue;
                }
                WebElement rowCell = I.amPerforming().getElementReference().ofNested(newRow,
                        By.xpath(".//td[not(contains(@class, 'ng-hide'))][" + mapColumnHeaderToColumnPosition.get(value) + "]"));
                this.handleFlexTableDataInputs(rowCell, values);
            }
        }
        if (I.amPerforming().checkToSee().IsElementPresentQuick(getTopRightButtonLocatorByTableId(flexTableDivId, "Save"))) {
            clickTableTopRightButton(flexTableDivId, "Save");
        } else {
            I.amPerforming().click().on(By.xpath("//*[" + I.amPerforming().sanityOfXpathTo().equals("@id", flexTableDivId) + "]"
                    + "/ancestor::div[contains(@class, 'tab-content')]//*[text()='Save' or @value='Save' or @type='Save']"));
        }
    }

    /**
     * @param flexTableDivId The id of the flex table where the rows are to be
     *                       edited
     * @param editButtonName The value of the button which must be clicked to edit a
     *                       row (usually "Edit", but could be something different)
     * @param flexTableMap   The table which is to be edited. Data table should be
     *                       of the following form: | Ignored | ColumnHeader1 |
     *                       ColumnHeader2 | etc. | | UniqueColumnValue1 |
     *                       RowValue1.1 | RowValue1.2 | ... | | UniqueColumnValue2
     *                       | RowValue2.1 | RowValue2.2 | ... | | etc. | ... | ...
     *                       | ... |
     *                       <p>
     *                       The UniqueColumnValues are used to choose which rows of
     *                       the table are to be edited The ColumnHeadrs are used to
     *                       determine into which columns values will be entered The
     *                       top-left table cell is ignored, and can be left blank,
     *                       or filled with a dummy value
     * @author john.phillips
     * @modifier hema.ananthan
     * @modified john.phillips (03/27/2019) - Added support for editing data in nested Enhanced Flex Tables
     */
    public void editFlexTableRowsInline(String flexTableDivId, String editButtonName, Map<String, Map<String, String>> flexTableMap) {
        Set<String> headerRows = flexTableMap.values().iterator().next().keySet();
        Map<String, Integer> mapColumnHeaderToColumnPosition = null;
        waitForFlexTablesToLoad();
        try {
            I.amPerforming().getElementReference().of((By.xpath("//div[@id='" + flexTableDivId + "']//td")));
        } catch (Exception ee) {
            I.amPerforming().waitFor().makeThreadSleep(2000);
            I.amPerforming().getElementReference().of((By.xpath("//div[@id='" + flexTableDivId + "']//td")));
        }
        for (String key : flexTableMap.keySet()) {
            By currentRowLocator = By.xpath("//div[@id='" + flexTableDivId + "']//td//*[" + I.amPerforming().sanityOfXpathTo().equals("text()", key) + "]//ancestor::tr[1]");
            Map<String, String> currentRowValues = flexTableMap.get(key);
            WebElement currentRow = I.amPerforming().getElementReference().of((currentRowLocator));

            if (mapColumnHeaderToColumnPosition == null) {
                mapColumnHeaderToColumnPosition = constructColumnMapping(currentRow, headerRows);
            }

            clickTableActionIcon(flexTableDivId, editButtonName, key);
            for (String columnName : currentRowValues.keySet()) {
                WebElement rowCell = I.amPerforming().getElementReference().ofNested(currentRow, By.xpath(".//td[not(contains(@class, 'ng-hide'))][" + mapColumnHeaderToColumnPosition.get(columnName) + "]"));
                this.handleFlexTableDataInputs(rowCell, currentRowValues.get(columnName));
            }
        }
        if (I.amPerforming().checkToSee().IsElementPresentQuick(getTopRightButtonLocatorByTableId(flexTableDivId, "Save"))) {
            clickTableTopRightButton(flexTableDivId, "Save");
        } else {
            I.amPerforming().click().on(By.xpath("//*[" + I.amPerforming().sanityOfXpathTo().equals("@id", flexTableDivId) + "]"
                    + "/ancestor::div[contains(@class, 'tab-content')]//*[text()='Save' or @value='Save' or @type='Save']"));
        }
    }

    /**
     * Handles assertion of column value for the given column title in the given
     * flextable
     *
     * @param columnValue
     * @param columnTitle
     * @param flexTableDivId
     * @return
     * @author john.phillips
     * modifier saranjit.modak - added xpath in nested table row 29-12-2022
     */
    public boolean assertCoulmnValueAgainstColumnTitle(String columnValue, String columnTitle, String flexTableDivId) {
        try {
            I.amPerforming().getElementReference().of((By.xpath("//div[@id='" + flexTableDivId + "']//tr")));
            WebElement row = I.amPerforming().getElementReference().of((By.xpath("//div[@id='" + flexTableDivId + "']//*[" + I.amPerforming().sanityOfXpathTo().equals("text()", columnValue) + "]//ancestor::tr[1]")));
            Map<String, Integer> columnMapping = constructColumnMapping(row, Collections.singleton(columnTitle));
            I.amPerforming().getElementReference().ofNested(row, By.xpath(".//td[not(contains(@class, 'ng-hide'))][" + columnMapping.get(columnTitle) + "]//descendant-or-self::*[" + I.amPerforming().sanityOfXpathTo().equals("text()", columnValue) + "] | //span[@title='"+columnValue+"']"));
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * Handles assertion of column value for the given column title in the given
     * flextable against the particular unique value
     *
     * @param columnValue
     * @param columnTitle    * @param uniqueColumnValue
     * @param flexTableDivId
     * @return
     * @author hema.ananthan
     */
    public Boolean assertCoulmnValueInColumnTitleAgainstUniqueValue(String columnValue, String columnTitle,
                                                                    String uniqueColumnValue, String flexTableDivId) {
        Set<String> columnTitleSet = new HashSet<>();
        columnTitleSet.add(columnTitle);
        I.amPerforming().getElementReference().of(By.xpath("//div[@id='" + flexTableDivId + "']"));
        waitForFlexTablesToLoad();
        By currentRowLocator = By
                .xpath("//*[text()='" + uniqueColumnValue + "']//ancestor::tr[1]");
        WebElement currentRow = I.amPerforming().getElementReference().of(currentRowLocator);

        Map<String, Integer> mapColumnHeaderToColumnPosition = constructColumnMapping(currentRow, columnTitleSet);

        int columnTitleNumber = mapColumnHeaderToColumnPosition.get(columnTitle);
        By columnValuePath = By.xpath("//*[text()='" + uniqueColumnValue
                + "']//ancestor::tr[1]//td[not(contains(@class,'ng-hide'))][" + columnTitleNumber
                + "]//descendant-or-self::*[text()='" + columnValue + "' or contains(@class,'" + columnValue + "')]");
        try {
            if (I.amPerforming().checkToSee().isEnabled(columnValuePath, false)) {
                return true;
            }
        } catch (Exception e) {
            /* Ignore Exception */
        }
        return false;
    }

    /**
     * get footer element from table Flex/Enhanced grid like Show/Entries Total
     * Records and Pagination
     *
     * @param text
     * @param tableId
     * @return
     * @author Monu.Kumar
     */
    public WebElement getFooterElementsFromTable(String text, String tableId) {
        return I.amPerforming().getElementReference().of(By.xpath("//div[@id='" + tableId
                + "']//div[contains(@class,'panel-body')]//following-sibling::span[contains(text(),'"
                + text + "')] | //div[@id='" + tableId + "']//following-sibling::span[contains(text(),'" + text + "')] "));
    }

    /**
     * get complete rows of table Flex/Enhanced
     *
     * @param tableId
     * @return
     * @author Monu.Kumar
     */
    public List<Elements> getCompleteTableRow(String tableId) {
        By tableRow = By.xpath("//div[@id='" + tableId
                + "']//div[contains(@class,'panel-body')]//div/table/tbody/tr | //div[@id='" + tableId + "']//div/table/tbody/tr ");
        return I.amPerforming().getElementReference().forListOfElements().of(tableRow);
    }

    /**
     * Select number of enteries from flextable footer
     *
     * @param flexTableId
     * @param numberofEntries
     * @author nauman.shahid
     * @modifier ashwini.mahore (modified xpath for files upload table at modal)
     */
    public void flexTableShowEntriesDropDown(String flexTableId, String numberofEntries) {
        By entriesDropDown = ByUsing.xpath(
                "//*[@id='" + flexTableId + "']//span[text()='Show' or text()='Records Per Page']/ancestor::div[1]//select");
        WebElement entriesDD = I.amPerforming().getElementReference().of(entriesDropDown);
        try {
            entriesDD.click();
            new Select(entriesDD).selectByVisibleText(numberofEntries);
        } catch (Exception e) {
            entriesDD.click();
            new Select(entriesDD).selectByVisibleText(numberofEntries);
        }
    }

    /**
     * move to next or previous paginations
     *
     * @param flexTableId
     * @param NextPrevious
     * @author nauman.shahid
     */
    public void flexTablePagination(String flexTableId, String NextPrevious) {
        By paginationChoice = By.xpath("//*[@id='" + flexTableId + "']//a[@title='"
                + NextPrevious + "']");
        I.amPerforming().click().on(paginationChoice);
    }

    /******* "Private Methods with Limited functionality " **********/

    /**
     * returns the By locator for a top right button in a flex table with the given
     * id value
     *
     * @param flexTableDivId
     * @param buttonName
     * @modified john.phillips (03/27/2019) - Added support for finding the top right buttons of
     * nested Enhanced Flex Tables
     * @modifier saranjit.modak (04/01/2022) - Added Condition for OSPI testcase 117618 specific
     */
    public By getTopRightButtonLocatorByTableId(String flexTableDivId, String buttonName) {
        By locator = By.xpath("//*[" + I.amPerforming().sanityOfXpathTo().equals("@id", flexTableDivId) + "]"
                + "//div[" + I.amPerforming().sanityOfXpathTo().contains("@class", "panel-heading") + "]"
                + "//*[" + I.amPerforming().sanityOfXpathTo().equals("text()", buttonName)
                + " or " + I.amPerforming().sanityOfXpathTo().equals("@value", buttonName)
                + " or " + I.amPerforming().sanityOfXpathTo().equals("@type", buttonName) + "]"
                + " | //*[" + I.amPerforming().sanityOfXpathTo().equals("@id", flexTableDivId) + "]"
                + "//*[" + I.amPerforming().sanityOfXpathTo().equals("text()", buttonName)
                + " or " + I.amPerforming().sanityOfXpathTo().equals("@value", buttonName)
                + " or " + I.amPerforming().sanityOfXpathTo().equals("@type", buttonName) + "]"
                // This section is for finding the top right buttons of nested Enhanced Flex Tables
                + " | //*[" + I.amPerforming().sanityOfXpathTo().equals("@id", flexTableDivId) + "]"
                + "/ancestor::tr"
                + "//*[" + I.amPerforming().sanityOfXpathTo().equals("text()", buttonName)
                + " or " + I.amPerforming().sanityOfXpathTo().equals("@value", buttonName)
                + " or " + I.amPerforming().sanityOfXpathTo().equals("@type", buttonName) + "]"
                + " | "
                + "//div[" + I.amPerforming().sanityOfXpathTo().contains("@class", "active") + "]//button[" + I.amPerforming().sanityOfXpathTo().equals("@id", flexTableDivId) + "]"
        );
        try {
            if(EnvironmentFactory.getProjectName().contains("OSPI") && ScenarioController.getScenario().getSourceTagNames().contains("@117618")){
                I.amPerforming().checkToSee().isElementDisplayed(locator);
            }
            else{
                I.amPerforming().waitFor().ElementToBePresent(locator, 2);
            }
        } catch (Exception ee) {
            System.out.println("Element was not present...");
        }
        return locator;
    }

    /**
     * returns the By locator for an icon in a flex table row with two given column
     * values
     *
     * @param iconName
     * @param uniqueColumnValues
     * @modifier hema.ananthan
     */
    public By getTableActionIcon(String flexTableId, String iconName, String... uniqueColumnValues) {
        String desiredAction = "//div[" + I.amPerforming().sanityOfXpathTo().equals("@id", flexTableId) + "]";
        for (String uniqueColumnValue : uniqueColumnValues) {
            desiredAction += "//td//*["
                    + I.amPerforming().sanityOfXpathTo().equals("@title", uniqueColumnValue) + " or "
                    + I.amPerforming().sanityOfXpathTo().equals("text()", uniqueColumnValue) + "]"
                    + "/ancestor::tr[1]";
        }
        desiredAction += "//td//*[" + I.amPerforming().sanityOfXpathTo().equals("@title", iconName) + "]";
        return By.xpath(desiredAction);
    }

    /**
     * @param row
     * @param headerLabels
     * @return
     * @author john.phillips
     * @modifier Monu.Kumar
     */
    public Map<String, Integer> constructColumnMapping(WebElement row, Set<String> headerLabels) {
        By headerRowLocator = By.xpath(".//ancestor::table[1]//th//ancestor::tr[position()=1]");
        WebElement headerRow = I.amPerforming().getElementReference().ofNested(row, headerRowLocator);

        Map<String, Integer> mapHeaderLabelsToColumnPositions = new HashMap<>();

        int columnCount = I.amPerforming().getElementReference().forListOfElements().ofNested(headerRow, By.xpath(".//th")).size();
        for (String headerLabel : headerLabels) {
            for (int i = 1; i <= columnCount; i++) {
                if (I.amPerforming().getElementReference().forListOfElements().ofNested(headerRow, By.xpath(".//*[(local-name()='th' or local-name()='td') and not(contains(@class, 'ng-hide'))][" + i + "]//span[text()='"
                        + headerLabel + "']")).size() > 0) {
                    mapHeaderLabelsToColumnPositions.put(headerLabel, i);
                }
            }
        }
        return mapHeaderLabelsToColumnPositions;
    }

    /**
     * Chooses the correct data input method based on the contents of the
     * fieldWrapper parameter The order of the if statements is important, so do not
     * change without verifying that all types of input still work as expected.
     *
     * @param fieldWrapper
     * @param fieldValue
     * @author john.phillips
     */
    private void handleFlexTableDataInputs(WebElement fieldWrapper, String fieldValue) {
        long preTestTime = System.nanoTime();
        long postTestTime = System.nanoTime();

        while ((postTestTime - preTestTime) / 1_000_000_000.0 < 5) {
            if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//*[contains(@class, 'select2-container')]")).size() > 0) {
                handleFlexTableLookupInput(fieldWrapper, fieldValue);
                break;
            } else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//input[(@type='text' or @type='number' or @type='email') and not(@time-picker or @date-time-picker or @e-grid-date-picker)] | .//textarea"))
                    .size() > 0) {
                handleTextInput(fieldWrapper, fieldValue);
                break;
            } else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//input[@type='text' and (@time-picker or @date-time-picker or @e-grid-date-picker)]"))
                    .size() > 0) {
                handleDateInput(fieldWrapper, fieldValue);
                break;
            } else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//select")).size() > 0) {
                Select select = new Select(fieldWrapper.findElement(By.xpath(".//select")));
                handleDropdownInput(select, fieldWrapper, fieldValue);
                break;
            } else if (I.amPerforming().getElementReference().forListOfElements().ofNested(fieldWrapper, By.xpath(".//input[@type='checkbox']")).size() > 0) {
                handleCheckBoxInput(fieldWrapper, fieldValue);
                break;
            }
            postTestTime = System.nanoTime();
        }
    }

    /**
     * @param fieldWrapper
     * @param fieldValue
     * @author john.phillips
     */
    private void handleFlexTableLookupInput(WebElement fieldWrapper, String fieldValue) {
        By dropDownSelector = By.xpath(".//field");
        By inputBoxSelector = By.xpath("//div[@id='select2-drop']//div[contains(@class, 'select2-search')]//input");
        By desiredValueSelector = By.xpath("//div[@id='select2-drop']//ul[contains(@class, 'select2-results')]"
                + "//*[text()='" + fieldValue + "']");
        I.amPerforming().click().on(I.amPerforming().getElementReference().ofNested(fieldWrapper, dropDownSelector));
        I.amPerforming().textInput().in(inputBoxSelector, fieldValue);
        WebElement desiredValue = I.amPerforming().getElementReference().of(desiredValueSelector);
        I.amPerforming().getElementReference().of(inputBoxSelector);
        I.amPerforming().click().on(desiredValue);
    }

    /**
     * @param fieldWrapper
     * @param fieldValue
     * @author john.phillips
     */
    private void handleTextInput(WebElement fieldWrapper, String fieldValue) {
        By inputBoxSelector = By.xpath(".//input[@type='text' or @type='number' or @type='email'] | .//textarea");
        WebElement inputBox = I.amPerforming().getElementReference().ofNested(fieldWrapper, inputBoxSelector);
        I.amPerforming().textInput().toClear(inputBox);
        I.amPerforming().textInput().in(inputBox, fieldValue);
    }

    /**
     * @param fieldWrapper
     * @param fieldValue
     * @author john.phillips
     */
    private void handleDateInput(WebElement fieldWrapper, String fieldValue) {
        By inputBoxSelector = By.xpath(".//input[@type='text']");

        String inputValue;
        try {
            int offset = Integer.parseInt(fieldValue);
            inputValue = I.amPerforming().dateOperationsToGet().currentDateWithOffsetInDesiredFormat(offset, DateTimeFormatter.ofPattern("M/d/uuuu"));
        } catch (NumberFormatException e) {
            inputValue = fieldValue;
        }

        WebElement inputBox = I.amPerforming().getElementReference().ofNested(fieldWrapper, inputBoxSelector);
        I.amPerforming().textInput().toClear(inputBox);
        I.amPerforming().textInput().in(inputBox, inputValue);
    }

    /**
     * @param fieldWrapper
     * @param fieldValue
     * @author john.phillips
     */
    private void handleCheckBoxInput(WebElement fieldWrapper, String fieldValue) {
        By checkBoxSelector = By.xpath(".//input[@type='checkbox']");
        WebElement checkBox = I.amPerforming().getElementReference().ofNested(fieldWrapper, checkBoxSelector);
        if ("Checked".equalsIgnoreCase(fieldValue) && !checkBox.isSelected()
                || "Unchecked".equalsIgnoreCase(fieldValue) && checkBox.isSelected()) {
            I.amPerforming().click().on(checkBox);
        }
    }

    /**
     * @param select
     * @param fieldWrapper
     * @param value
     * @author john.phillips
     */
    private void handleDropdownInput(Select select, WebElement fieldWrapper, String value) {
        By dropDownSelector = By.xpath(".//select");
        WebElement selectBox = I.amPerforming().getElementReference().ofNested(fieldWrapper, dropDownSelector);
        I.amPerforming().dropDownSelection().from(selectBox).selectByVisibleText(value);
    }

    /**
     * @param button
     * @return
     * @author john.phillips
     */
    private WebElement getCorrectTable(WebElement button) {
        By interiorNestedTableLocator = By.xpath(".//ancestor::table");

        WebElement table;
        if (I.amPerforming().getElementReference().forListOfElements().ofNested(button, interiorNestedTableLocator).size() > 0) {
            table = I.amPerforming().getElementReference().ofNested(button, By.xpath(
                    "./ancestor::div[contains(@class, 'branch')]//table | ./ancestor::tr[contains(@class, 'ng-scope')]//table"));
        } else {
            table = I.amPerforming().getElementReference().ofNested(button, By.xpath(
                    "./ancestor::div[@id='flexTableDivId' or @id='flexGridDivId' or contains(@id, 'flexGridEnhancedDivId') or @ng-controller='inlineEditGridCtrl' or contains]//table"));
        }

        return table;
    }

    /**
     * To click on hyperlink which is present in flextable column
     *
     * @param linkText
     * @param tableId
     * @author aashish p.
     * @modifier saranjit.modak added xpath
     */
    public void clickOnLinkInsideTable(String tableId, String linkText) {
        I.amPerforming().click().on(By.xpath("//*[@id='" + tableId + "']//a[contains(text(),'" + linkText + "')]|//*[@id='"+tableId+"']//span[contains(text(),'"+linkText+"')]"));
    }

    /**
     * To click on the top right button of a flex table based on the flex table id without processing
     *
     * @param flexTableId
     * @param buttonName
     * @author meenakshi.jha
     */
    public void clickTableTopRightButtonWithoutProcessing(String flexTableId, String buttonName) {
        I.amPerforming().click().on(ByUsing.xpath("//div[@id='" + flexTableId + "']//div[contains(@class,'panel-heading')]//span/span//button[contains(text(),'" + buttonName + "')]"), false);
    }

    /**
     * hover on table row level icon
     *
     * @param flexTableId,iconName,uniqueColumnValues
     * @author monu.kumar
     */
    public void mouseHoverAtTableRowLevelIcon(String flexTableId, String iconName, String... uniqueColumnValues) {
        I.amPerforming().scroll().toMoveToElement(govgrants.perform().flexTable().getTableActionIcon(flexTableId, iconName, uniqueColumnValues));
    }

    /**
     * click on help text inside enhanced grid table specific to internal
     * organization column
     *
     * @param columnTitle
     * @author monu.kumar
     */
    public void getHelpTextAtEnhancedGridTableSpecificColumn(String columnTitle) {
        I.amPerforming().scroll().toMoveToElement(I.amPerforming().getElementReference().of(ByUsing.xpath("//th//span[@title='" + columnTitle + "' or text()='" + columnTitle + "']/../..//helpicon//span[contains(@class,'fa-info')]")));
    }
}
