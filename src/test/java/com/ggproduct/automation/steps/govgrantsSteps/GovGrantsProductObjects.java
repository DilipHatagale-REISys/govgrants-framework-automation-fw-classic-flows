package com.ggproduct.automation.steps.govgrantsSteps;

import com.helperPackage.handlers.govgrants;
import com.helperPackage.actionsfactory.api.ByUsing;
import com.helperPackage.exception.TestingBlazeCustomException;
import com.helperPackage.objects.Elements;
import com.helperPackage.register.I;
import org.junit.Assert;
import org.openqa.selenium.By;

import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public final class GovGrantsProductObjects {
    private final String defaultLongText = "Automation test description";
    private final By
            attachmentClassificationPath = By.xpath("//select[@title='Classification' or text()='Classification' or @name='Classification']"),
            attachmentDescriptionPath = By.xpath("//div//label[text()='Description']/..//textarea"),
            attachmentFilePath = By.xpath("" + "//td//label[text()='File']/../..//input[@type='file'] | "
                    + "//div//label[text()='File']/..//input[@type='file'] | "
                    + "//div//label[contains(text(),'File')]/..//input[@type='file'] | "
                    + "//div//span[text()='File']/../..//input[@type='file']"),
            confirmationBoxMessage = By.xpath("//div[contains(@class,'modal-dialog')]//div[contains(@class, 'bootbox-body')]");

    /**
     * Handles entering of Peer review
     */
    public void enterReview(String rating) {
        I.amPerforming().dropDownSelection().from(By.xpath("//div[@id='fieldRating__c']//select"))
                .selectByVisibleText(rating);
        I.amPerforming().textInput().in(By.xpath("//div[@id='fieldReviewComments__c']//textarea"), "Automation Reviewer comments");
    }

    /**
     * Handles association of various related records
     *
     * @param buttonName
     * @param flexTableId
     * @param recordUniqueValues
     * @author hema.ananthan
     */
    public void chooseRecordForAssociation(String buttonName, String flexTableId, String... recordUniqueValues) {
        for (String recordUniqueValue : recordUniqueValues) {
            govgrants.perform().quickSearch().performModalSpecificQuickSearch(flexTableId, recordUniqueValue);
            I.amPerforming().waitFor().makeThreadSleep(1000);
            govgrants.perform().flexTable().selectCheckBoxes(flexTableId, recordUniqueValue);
        }
        govgrants.perform().phasePanel().clickAnyRightPannelButton(flexTableId, buttonName);
    }

    /**
     * Handles association of various related records
     *
     * @param buttonName
     * @param flexTableId
     * @param recordUniqueValues
     * @author jitendra.pisal
     */
    public void chooseRecordForAssociationWithoutSearch(String buttonName, String flexTableId, String... recordUniqueValues) {
        for (String recordUniqueValue : recordUniqueValues) {
            I.amPerforming().waitFor().makeThreadSleep(1000);
            govgrants.perform().flexTable().selectCheckBoxes(flexTableId, recordUniqueValue);
        }
        govgrants.perform().phasePanel().clickAnyRightPannelButton(flexTableId, buttonName);
    }

    /**
     * Handles uploading of file
     *
     * @param fileName
     * @param uploadSectionName
     * @author hema.ananthan
     */
    public void uploadFile(String fileName, String uploadSectionName, String attachmentType) {
        String defaultFilePath = System.getProperty("user.dir") + "/src/main/resources/";
        if (!uploadSectionName.equals("Checklist")) {
            I.amPerforming().dropDownSelection().from(attachmentClassificationPath).selectByValue(attachmentType);
            I.amPerforming().textInput().in(attachmentDescriptionPath, defaultLongText);
        }
        I.amPerforming().waitFor().makeThreadSleep(1000);
        I.amPerforming().textInput().in(attachmentFilePath, defaultFilePath + fileName);
        try {
            govgrants.perform().modal().clickModalContentSpecificButton("Save");
        } catch (Exception ee) {
            I.amPerforming().click().on(By.xpath("//*[@id='addAtt']//input[@value='Save' or @type='submit']"));
        }
    }

    public void uploadTheFile(String fileName, String attachmentType) {
        String defaultFilePath = System.getProperty("user.dir") + "/src/main/resources/";

            I.amPerforming().dropDownSelection().from(attachmentClassificationPath).selectByValue(attachmentType);
            I.amPerforming().textInput().in(attachmentDescriptionPath, defaultLongText);
            I.amPerforming().waitFor().makeThreadSleep(1000);
            I.amPerforming().textInput().in(attachmentFilePath, defaultFilePath + fileName);
        try {
            govgrants.perform().modal().clickModalContentSpecificButton("Save");
        } catch (Exception ee) {
            I.amPerforming().click().on(By.xpath("//*[@id='addAtt']//input[@value='Save' or @type='submit']"));
        }
    }

    /**
     * Asserts if a column value is present inside the given flextable
     *
     * @param columnUniqueValue
     * @param flextableId
     * @author hema.ananthan
     */
    public void assertColumnOnTable(String columnUniqueValue, String flextableId, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(govgrants.perform().flexTable().getSpecificTableColumn(flextableId, columnUniqueValue.split(",")).isEnabled()).isTrue();
        } else {
            Assert.assertTrue(
                    govgrants.perform().flexTable().getSpecificTableColumn(flextableId, columnUniqueValue.split(",")).isEnabled());
        }
    }

    /**
     * handles to verify no record is present in flex table
     *
     * @param text
     * @param tableId
     * @author Monu Kumar
     */
    public boolean isRecordPresentInTheFlexTable(String text, String tableId) {
        try {
            return I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[@id='" + tableId + "']//*[" + I.amPerforming().sanityOfXpathTo().contains("text()", text) + "]"));
        } catch (Exception e) {
        }
        return false;
    }

    /**
     * Asserts if fields is displayed in only view mode at page details
     *
     * @param fieldApiName
     * @author Monu.Kumar
     * @modify Aashish P.
     * @Modify Keerti.Munde
     */
    public void assertFieldsInViewMode(String fieldApiName, boolean isSoftly) {
        By pageBlockFields = By.xpath("//div[@id='" + fieldApiName + "' or @id='field" + fieldApiName + "']//span[@class='readonlySpan']  | //div[@id='" + fieldApiName + "' or @id='field" + fieldApiName + "']//input[@disabled] | //div//span[contains(text(),'" + fieldApiName + "')]");
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().checkToSee().isDisplayed(pageBlockFields)).isTrue();
        } else {
            Assert.assertTrue(I.amPerforming().checkToSee().isDisplayed(pageBlockFields));
        }
    }

    /**
     * Asserts if columns is displayed in provided tableId
     *
     * @param tableId
     * @param usage
     * @author Monu.Kumar
     * @modify Aashish P. --Added condition to see dropdown
     */

    public void assertTableHeaderColumnName(String usage, String tableId, String headerColumnName) {
        if (usage.equalsIgnoreCase("see dropdown for")) {
            I.amPerforming().assertionsTo().assertThat(isTableColumnDropDownPresent(tableId, headerColumnName)).isTrue();
        } else {
            if (usage.equalsIgnoreCase("softly see")) {
                I.amPerforming().assertionsTo().assertThat(isTableColumnHeaderName(tableId, headerColumnName)).isTrue();
            } else if (usage.equalsIgnoreCase("see")) {
                Assert.assertTrue(isTableColumnHeaderName(tableId, headerColumnName));
            } else if (usage.equalsIgnoreCase("do not see")) {
                Assert.assertFalse(isTableColumnHeaderName(tableId, headerColumnName));
            } else if (usage.equalsIgnoreCase("softly do not see")) {
                I.amPerforming().assertionsTo().assertThat(isTableColumnHeaderName(tableId, headerColumnName)).isFalse();
            }
        }
    }

    private Boolean isTableColumnHeaderName(String tableId, String titleName) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(govgrants.perform().flexTable().getSpecificElementFromTableHeader(tableId, titleName))
                    || I.amPerforming().checkToSee().isEnabled(govgrants.perform().flexTable().getSpecificElementFromTableHeader(tableId, titleName))) {
                flag = true;
            }
        } catch (org.openqa.selenium.NoSuchElementException e) {
            flag = false;
        }
        return flag;
    }

    private Boolean isTableColumnDropDownPresent(String tableId, String titleName) {
        boolean flag = false;
        try {
            I.amPerforming().scroll().toMoveToElement(ByUsing.xpath("//div[@id='" + tableId + "']//tr//th//span[contains(text(),'" + titleName + "')]"));
            String dropdownXpath = "//div[@id='" + tableId + "']//tr//th//span[contains(text(),'" + titleName + "')]//following::div[@class='dropdown thDropMenu']";
            if (I.amPerforming().checkToSee().isDisplayed(ByUsing.xpath(dropdownXpath))) {
                flag = true;
            }
        } catch (org.openqa.selenium.NoSuchElementException e) {
            flag = false;
        }
        return flag;
    }


    /**
     * assert if message is displayed on confirmation box pop up
     *
     * @param message
     * @author Monu.Kumar
     * @updated by Aashish P.
     */
    public void assertMessageOfConfirmationBoxPopUp(String message, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(message).isEqualTo(
                    I.amPerforming().actionToGet().attribute(confirmationBoxMessage, "innerText").replaceAll("\\u00a0", " ")
            );
        } else {
            Assert.assertEquals(I.amPerforming().actionToGet().attribute(confirmationBoxMessage, "innerText").replaceAll("\\u00a0", " "), message);
        }
    }


    /**
     * assert if page block is not displayed
     *
     * @param titleName
     * @param usage
     * @Created Aashish P.
     * @modifier Monu kumar
     */
    public void assertPageBlockIsNotDisplayed(String usage, String titleName) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isPageBlockTitleDisplayed(titleName));
        } else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(isPageBlockTitleDisplayed(titleName));
        } else if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isPageBlockTitleDisplayed(titleName)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isPageBlockTitleDisplayed(titleName)).isFalse();
        }
    }

    /**
     * @param titleName
     * @return true if page block title is displayed
     * @author Monu.Kumar
     * @Modifier keerti.munde
     * @modifier meenakshi.jha added xpath for pageblock title
     * @modifier yugandhara.chibade added xpath for library pageblock title
     * @modifier komal.mukhekar added xpath for form page block title
     */
    private boolean isPageBlockTitleDisplayed(String titleName) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//h3//a[contains(text(),'" + titleName + "')] | //a[@title='" + titleName + "'] | //a[not(parent::li)]/span[" + I.amPerforming().sanityOfXpathTo().equals("text()", titleName) + "] | //a[text()='" + titleName + "'] | //h3[text()='" + titleName + "'] | //h2[(text()='" + titleName + "')] | //*[text()='" + titleName + "']"))) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    /**
     * Handles filling up of any given review form
     *
     * @author hema.ananthan
     * @modifiled mahadev.hanme
     */
    public void fillInReviewForm(String recommendation) {
        govgrants.perform().inputForms().completeFillingReviewForm(recommendation);
    }

    public void fillingInReviewForm(String recommendation) {
        govgrants.perform().inputForms().completeFillReviewForm(recommendation);
    }

    /******* "Consolidated Methods" **********/

    /**
     * Handles filling up of fields from the sheet in an excel
     *
     * @param sheetName
     * @param excelFileName
     * @author hema.ananthan
     */
    public void editionOfRecord(String sheetName, String excelFileName, Map<String, Map<String, String>> dataTableMap) {
        govgrants.perform().pageDetails().clickAnyTopRightButton(dataTableMap.get("Edition Buttons").get("Step 1"));
        govgrants.perform().inputForms().enterInputFieldsFromExcelFile(excelFileName, sheetName, "enter");
        govgrants.perform().pageDetails().clickAnyTopRightButton(dataTableMap.get("Edition Buttons").get("Step 2"));
    }

    /**
     * Handles approving of any record by all approvers
     *
     * @param noOfApprovers
     * @param recordName
     * @param dataTableMap
     * @throws IOException
     * @author hema.ananthan
     */
    public void approversApproveRecord(String noOfApprovers, String recordName, Map<String, Map<String, String>> dataTableMap,
                                       String... approvers) throws TestingBlazeCustomException {
        if (recordName.equalsIgnoreCase("Record id")) {
            recordName = govgrants.perform().pageDetails().idOfRecord;
        }
        int numberOfApprovers = Integer.parseInt(noOfApprovers);
        for (int i = 1; i <= numberOfApprovers; i++) {
            singleApproverApproval(recordName, approvers[i - 1], dataTableMap);
        }
    }

    /**
     * Handles association of records to a particular record
     *
     * @param noOfRecords
     * @param dataTableMap
     * @param recordsToAssociate
     * @author hema.ananthan
     */
    public void associationOfRecords(String noOfRecords, Map<String, Map<String, String>> dataTableMap, String... recordsToAssociate) {
        int numberOfRecords = Integer.parseInt(noOfRecords);
        for (int i = 1; i <= numberOfRecords; i++) {
            singleRecordAssociation(i, recordsToAssociate[i - 1], dataTableMap);
        }
    }

    /**
     * Handles adding an attachment
     *
     * @param fileName
     * @author hema.ananthan
     */
    public void additionOfAttachment(String fileName, Map<String, Map<String, String>> dataTableMap) {
        govgrants.perform().pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Attachment Navigation").get("Step 1"));
        govgrants.perform().flexTable().clickTableTopRightButton(dataTableMap.get("Attachment Navigation").get("Step 3"),
                dataTableMap.get("Attachment Navigation").get("Step 2"));
        uploadFile(fileName, dataTableMap.get("Attachment Details").get("Step 1"),
                dataTableMap.get("Attachment Details").get("Step 2"));
        closeModal();
    }


    /**
     * Handles logging in as specified subrecipient and checking for task
     *
     * @param user
     * @param uniqueColumnValue
     * @param dataTableMap
     * @throws IOException
     * @author hema.ananthan
     */
    public void userTask(String user, String uniqueColumnValue, Map<String, Map<String, String>> dataTableMap) throws TestingBlazeCustomException {
        govgrants.perform().mainPage().navigateToPortal(dataTableMap.get("Navigation").get("Step 3"));
        govgrants.perform().mainPage().loginToggleToApp(dataTableMap.get("Navigation").get("Step 2"), user);
        govgrants.perform().mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 1"));
        govgrants.perform().sideBar().getSideBarContent(dataTableMap.get("Left Panel").get("Step 2"),
                dataTableMap.get("Left Panel").get("Step 1")).click();
        if (uniqueColumnValue.equalsIgnoreCase("Record Id")) {
            govgrants.perform().quickSearch().performTableSpecificQuickSearch(dataTableMap.get("FlexTable").get("Step 1"),
                    govgrants.perform().pageDetails().idOfRecord);
            govgrants.perform().flexTable().clickTableActionIcons(dataTableMap.get("FlexTable").get("Step 2"),
                    govgrants.perform().pageDetails().idOfRecord);
        } else {
            govgrants.perform().quickSearch().performTableSpecificQuickSearch(dataTableMap.get("FlexTable").get("Step 1"),
                    uniqueColumnValue);
            govgrants.perform().flexTable().clickTableActionIcons(dataTableMap.get("FlexTable").get("Step 2"), uniqueColumnValue);
        }
    }

    /**
     * logs in or Re-logs in to view any given record
     *
     * @param recordName
     * @param recordOwner
     * @param dataTableMap
     * @throws IOException
     * @author hema.ananthan
     */
    public void reloginToViewRecord(String recordName, String recordOwner, Map<String, Map<String, String>> dataTableMap) throws TestingBlazeCustomException {
        try {
            govgrants.perform().mainPage().reloginToggleToApp(dataTableMap.get("Owner Navigation").get("Step 1"), recordOwner);
        } catch (Exception ex) {
            govgrants.perform().mainPage().loginToggleToApp(dataTableMap.get("Owner Navigation").get("Step 1"), recordOwner);
        }
        govgrants.perform().mainPage().clickMainMenuBar(dataTableMap.get("Owner Navigation").get("Step 2"));
        govgrants.perform().sideBar().getSideBarContent(dataTableMap.get("Owner Navigation").get("Step 4"),
                dataTableMap.get("Owner Navigation").get("Step 3")).click();
        try {
            govgrants.perform().phasePanel()
                    .clickDoubleArrowDropDownAndSelectItem(dataTableMap.get("Complete Review").get("Step 1"));
        } catch (Exception ex) {
            /* Ignore Exception */
        }
        if (recordName.equalsIgnoreCase("Record id")) {
            recordName = govgrants.perform().pageDetails().idOfRecord;
        }
        govgrants.perform().quickSearch().performTableSpecificQuickSearch(dataTableMap.get("Complete Review").get("Step 2"),
                recordName);
        govgrants.perform().flexTable().clickTableActionIcons(dataTableMap.get("Complete Review").get("Step 3"), recordName);
    }

    /**
     * It will save specific column values of table
     *
     * @param columnValueFromRow
     * @param columnName
     * @param flexTableId
     */
    public void iSavedSpecificValueFromFlexTableInsideGivenKey(String columnValueFromRow, String columnName, String key, String flexTableId) {
        I.amPerforming().propertiesFileOperationsTo().saveValue(key, getValueOfSpecifiedColFromTableHavingColumnNameAs(columnValueFromRow,
                columnName, flexTableId));
    }

    /**
     * It will save specific column values of table
     *
     * @param columnValueFromRow
     * @param columnName
     * @param flexTableId
     */
    public void iSavedSpecificLinkValueFromFlexTableInsideGivenKey(String columnValueFromRow, String columnName, String key, String flexTableId) {
        I.amPerforming().propertiesFileOperationsTo().saveValue(key, getValueOfSpecifiedLinkColFromTableHavingColumnNameAs(columnValueFromRow,
                columnName, flexTableId));
    }

    /******* "Local Methods with Limited functionality " **********/

    private void singleApproverApproval(String recordName, String approver,
                                        Map<String, Map<String, String>> dataTableMap) throws TestingBlazeCustomException {
        govgrants.perform().mainPage().reloginToggleToApp(dataTableMap.get("Navigation").get("Step 1"), approver);
        govgrants.perform().mainPage().clickMainMenuBar(dataTableMap.get("Navigation").get("Step 2"));
        govgrants.perform().sideBar().getSideBarContent(dataTableMap.get("FlexTable").get("Step 2"),
                dataTableMap.get("FlexTable").get("Step 1")).click();
        if (recordName.equalsIgnoreCase("Record Id")) {
            govgrants.perform().quickSearch().performTableSpecificQuickSearch(dataTableMap.get("FlexTable").get("Step 3"),
                    govgrants.perform().pageDetails().idOfRecord);
            govgrants.perform().flexTable().clickTableActionIcons(dataTableMap.get("Approval").get("Step 1"),
                    govgrants.perform().pageDetails().idOfRecord);
        } else {
            govgrants.perform().quickSearch().performTableSpecificQuickSearch(dataTableMap.get("FlexTable").get("Step 3"),
                    recordName);
            govgrants.perform().flexTable().clickTableActionIcons(dataTableMap.get("Approval").get("Step 1"), recordName);
        }
        govgrants.perform().approvals().selectRadioButton(dataTableMap.get("Approval").get("Step 2"));
        govgrants.perform().approvals().enterComment(defaultLongText);
        govgrants.perform().approvals().submitApproval(true);
    }

    private void singleRecordAssociation(int qNumber, String recordToAssociate,
                                         Map<String, Map<String, String>> dataTableMap) {
        govgrants.perform().pageDetails().clickSubTabsInsideTableView(dataTableMap.get("Associate " + qNumber).get("Step 1"));
        govgrants.perform().flexTable().clickTableTopRightButton(dataTableMap.get("Associate " + qNumber).get("Step 3"),
                dataTableMap.get("Associate " + qNumber).get("Step 2"));
        chooseRecordForAssociation(dataTableMap.get("Associate " + qNumber).get("Step 4"),
                dataTableMap.get("Associate " + qNumber).get("Step 5"), recordToAssociate.split(";"));
        try {
            closeModal();
        } catch (Exception ex) {
            I.amPerforming().browserOperationsTo().refreshPage();
        }

    }

    private void closeModal() {
        govgrants.perform().modal().closeModalByClickingTopRightCloseButton();
        I.amPerforming().browserOperationsTo().refreshPage();
    }

    /**
     * @param rowNumber   Specify the row number such as 1,2,3 and so on. and if you want column value from last row then mention "last row"
     * @param columnName  Name of the column from which you want a value
     * @param flexTableId Id of flex table
     * @return value from specified row for specified column from the Flex Table.
     * @author jitendra.pisal
     * @Updated by: Aashish P.
     * @Updated by: komal.mukhekar- Added XPATH to get column value from table
     */
    private String getValueOfSpecifiedColFromTableHavingColumnNameAs(String rowNumber, String columnName, String flexTableId) {
        int columnValueFromRowInInt = 0;
        int counter = 1;
        By columnHeaders = By.xpath("//div[@id='" + flexTableId + "']//th[not(contains(@class,'hide'))]");
        List<Elements> columnList = I.amPerforming().getElementReference().forListOfElements().of(columnHeaders);

        // get the column index of required column.
        for (Elements columnEle : columnList) {
            if (columnEle.getText().equalsIgnoreCase(columnName)) {
                break;
            }
            counter++;
        }
        List<Elements> listOfDataInColumn = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='" + flexTableId + "']//th//span[text()='" + columnName + "']/ancestor::thead/parent::table//tr//td[not(contains(@class,'hide'))][" + counter + "]/span/field/span"));
        if (listOfDataInColumn.size() == 0) {
            listOfDataInColumn = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='" + flexTableId + "']//th//span[text()='" + columnName + "']/ancestor::thead/parent::table//tr//td[not(contains(@class,'hide'))][" + counter + "]/span/span/span"));
            if (listOfDataInColumn.size() == 0) {
                listOfDataInColumn = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='" + flexTableId + "']//th//span[text()='" + columnName + "']/ancestor::thead/parent::table//tr//td[not(contains(@class,'hide'))][" + counter + "]/span"));
                if (listOfDataInColumn.size() == 0) {
                    listOfDataInColumn = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='" + flexTableId + "']//th//span[text()='" + columnName + "']/ancestor::th/ancestor::table//tr//td[not(contains(@class,'hide'))][" + counter + "]/span//field/span"));
                    if (listOfDataInColumn.size() == 0) {
                        listOfDataInColumn = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='" + flexTableId + "']//th//span[text()='" + columnName + "']/ancestor::th/ancestor::table//tr//td[not(contains(@class,'hide'))][" + (counter - 1) + "]/span//field/span"));
                    }
                }
            }
        }
        columnValueFromRowInInt = rowNumber.equalsIgnoreCase("last row") ? listOfDataInColumn.size()
                : Integer.parseInt(rowNumber);
        return listOfDataInColumn.get(columnValueFromRowInInt - 1).getText();
    }

    /**
     * @param rowNumber   Specify the row number such as 1,2,3 and so on. and if you want column value from last row then mention "last row"
     * @param columnName  Name of the column from which you want a value
     * @param flexTableId Id of flex table
     * @return value from specified row for specified column from the Flex Table.
     * @author jitendra.pisal
     * @Updated by: Vaibhav.Chandratre
     */
    private String getValueOfSpecifiedLinkColFromTableHavingColumnNameAs(String rowNumber, String columnName, String flexTableId) {
        int columnValueFromRowInInt = 0;
        int counter = 1;
        By columnHeaders = By.xpath("//div[@id='" + flexTableId + "']//th[not(contains(@class,'hide'))]");
        List<Elements> columnList = I.amPerforming().getElementReference().forListOfElements().of(columnHeaders);

        // get the column index of required column.
        for (Elements columnEle : columnList) {
            if (columnEle.getText().equalsIgnoreCase(columnName)) {
                break;
            }
            counter++;
        }
        List<Elements> listOfDataInColumn = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='" + flexTableId + "']//th//span[text()='" + columnName + "']/ancestor::thead/parent::table//tr//td[not(contains(@class,'hide'))][" + counter + "]/span//a"));
        if (listOfDataInColumn.size() == 0) {
            listOfDataInColumn = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='" + flexTableId + "']//th//span[text()='" + columnName + "']/ancestor::thead/parent::table//tr//td[not(contains(@class,'hide'))][" + counter + "]/span//a"));
            if (listOfDataInColumn.size() == 0) {
                listOfDataInColumn = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='" + flexTableId + "']//th//span[text()='" + columnName + "']/ancestor::thead/parent::table//tr//td[not(contains(@class,'hide'))][" + counter + "]/span//a"));
                if (listOfDataInColumn.size() == 0) {
                    listOfDataInColumn = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='" + flexTableId + "']//th//span[text()='" + columnName + "']/ancestor::thead/parent::table//tr//td[not(contains(@class,'hide'))][" + counter + "]/span//a"));
                    if (listOfDataInColumn.size() == 0) {
                        listOfDataInColumn = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='" + flexTableId + "']//th//span[text()='" + columnName + "']/ancestor::th/ancestor::table//tr//td[not(contains(@class,'hide'))][" + (counter - 1) + "]/span//a"));
                    }
                }
            }
        }
        columnValueFromRowInInt = rowNumber.equalsIgnoreCase("last row") ? listOfDataInColumn.size()
                : Integer.parseInt(rowNumber);
        return listOfDataInColumn.get(columnValueFromRowInInt - 1).getText();
    }

    /**
     * perform click table header column with table id and title name
     *
     * @param tableId
     * @param titleName
     * @author meenakshi.jha
     */
    public void performClickOnSpecificTableColumnHeader(String tableId, String titleName) {
        I.amPerforming().click().on(govgrants.perform().flexTable().getSpecificElementFromTableHeader(tableId, titleName));
    }

    public void enterEmailId(String emailId, String fieldAPIName) {
        By emailTextField = By.xpath("//div[@id='field" + fieldAPIName + "' or @id='" + fieldAPIName + "']//input");
        if (emailId.contains("mailDrop")) {
            String newEmailId = emailId + I.amPerforming().addOnsTo().getStringRandomNumber() + "@maildrop.cc";
            I.amPerforming().textInput().in(emailTextField, newEmailId);
            I.amPerforming().propertiesFileOperationsTo().saveValue("EmailId", newEmailId);
        } else {
            String newEmailId = emailId + I.amPerforming().addOnsTo().getStringRandomNumber() + "@yopmail.com";
            I.amPerforming().textInput().in(emailTextField, newEmailId);
            I.amPerforming().propertiesFileOperationsTo().saveValue("EmailId", newEmailId);
        }
    }

    /**
     * method to get id from current url
     *
     * @return id from url
     * @author tejal.gadewar
     */
    public String iGetRecordIdInto() {
        String currentURL = I.amPerforming().browserOperationsTo().getCurrentUrl();
        String uri = currentURL.split("\\?")[1];
        String[] params = uri.split("&");
        Map<String, String> map = new HashMap<String, String>();
        for (String param : params) {
            String name = param.split("=")[0].toLowerCase();
            String value = param.split("=")[1];
            map.put(name, value);
        }
        return map.get("id").replaceAll("[^a-zA-Z0-9]", "");
    }

    /**
     * return true if field is present inside header
     *
     * @param headerField
     * @param headerTitle
     * @author tejal.gadewar
     */
    public void assertFieldDisplayedInsideHeader(String usage, String headerField, String headerTitle) {
        if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isFieldDisplayedInsideHeader(headerField, headerTitle)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isFieldDisplayedInsideHeader(headerField, headerTitle)).isFalse();
        }
    }

    /**
     * assert if new tab is opened or not on button/link/icon click
     */
    public void assertNewTabOpenedOnActionsClick(String usage) {
        if (usage.equalsIgnoreCase("see")) {
            I.amPerforming().assertionsTo().assertThat(isNewTabOpened()).isTrue();
        } else if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isNewTabOpened()).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isNewTabOpened()).isFalse();
        }
    }

    /**
     * Boolean status of lookuplink/button/icon opens in another tab
     *
     * @return
     */
    private Boolean isNewTabOpened() {
        boolean myNewTabFound = false;
        if (I.amPerforming().switchTo().getWindowsHandlers().size() > 1)
            myNewTabFound = true;
        return myNewTabFound;
    }

    /**
     * click on hyperlink containing date for history
     *
     * @param linkName
     * @author aashish.pardeshi
     */
    public void clickOnHyperLinkContainingDate(boolean noDate, String linkName) {
        if (noDate) {
            clickOnLink(linkName);
        } else {
            clickOnLink(linkName + " " + I.amPerforming().dateOperationsToGet().currentDateInDesiredFormat(DateTimeFormatter.ofPattern("M/d/yyyy")));
        }
    }

    public void clickOnLink(String linkName) {
        I.amPerforming().click().on(By.xpath("//a[contains(text(),'" + linkName + "')] | //span[contains(text(),'" + linkName + "')]"));
    }

    /**
     * Fill and send the mail from collab Tab
     *
     * @param emailDetails
     * @author aashish.pardeshi
     * @modifier meenakshi.jha added xpath for the Email address
     */
    public void sendTheEmailOnCollabTab(List<List<String>> emailDetails) {
        for (int i = 1; i < emailDetails.size(); i++) {
            List<String> ll = emailDetails.get(i);
            I.amPerforming().textInput().toClear(By.xpath("//*[@id='upload']/div[2]/div/div/div[1]/input|//*[@id='upload']/div[2]/div//input"));
            I.amPerforming().textInput().in(By.xpath("//*[@id='upload']/div[2]/div/div/div[1]/input|//*[@id='upload']/div[2]/div//input"), ll.get(0));
            I.amPerforming().textInput().toClear(By.xpath("//input[@id='inputPassword']"));
            I.amPerforming().textInput().in(By.xpath("//input[@id='inputPassword']"), ll.get(1));
            I.amPerforming().click().on(By.xpath("//div[@id='sendEmail']//*[text()='Send']"));
        }
    }

    /**
     * return true if field is displayed insider header
     *
     * @param headerField
     * @param headerTitle
     * @return
     */
    private boolean isFieldDisplayedInsideHeader(String headerField, String headerTitle) {
        try {
            return I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[@class='overviewHeader']//span[contains(text(),'" + headerTitle + "')]/../../../../../../../following-sibling::div//span[contains(text(),'" + headerField + "')]"));
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * hover on help text at page block inside child table
     *
     * @param tableId
     * @author saranjit.modak
     */
    public void getHelpTextAtPageBlockOrInsideTable(String tableId, String toolTipId) {
        By elem = By.xpath("//div[@id='" + tableId + "']//th//span[text()='" + toolTipId + "']//ancestor::th//helpicon//span[contains(@class,'helpIcon')]");
        I.amPerforming().scroll().toMoveToElement(elem);
    }

    /**
     * Fill and send the mail from collab Tab
     * click on an icon on  table
     *
     * @param iconName
     * @param recordName
     * @author
     * @modifier richa sharma added the step to saas
     */
    public void clickIconWithOutTableId(String iconName, String recordName) {
        I.amPerforming().click().on(By.xpath("//td//*[text()='" + recordName + "']//ancestor::tr[1]//td//*[@title='" + iconName + "']|//td[text()='" + recordName + "']//ancestor::tr[1]//td//*[@title='" + iconName + "']"));
    }
}
