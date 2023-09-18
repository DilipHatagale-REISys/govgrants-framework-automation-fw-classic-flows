package com.ggproduct.automation.projectmanager;

import com.helperPackage.handlers.govgrants;
import com.helperPackage.handlers.*;
import com.helperPackage.misclib.Emails;
import com.helperPackage.objects.Elements;
import com.helperPackage.register.EnvironmentFactory;
import com.helperPackage.register.I;
import org.assertj.core.util.Files;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import javax.mail.MessagingException;
import java.io.File;
import java.io.IOException;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

public class GrantorProjectManager extends ProjectManager {
    private String fieldValue;

    /******
     * BELOW PATTREN IS CONSIDERED BEST IN CODING WORLD. ADD JAVA DOCS AND KEEP
     * LOCAL/KEY METHOD CATEGORIES
     ***/

    /******* "Key Methods with complete functionality" *****************/



    /*handles to verify blank value is present inside flex table */
    public boolean isColumnValueBlank(String fieldName) {
        if (I.amPerforming().actionToGet().text(By.xpath("//*[@field-name='" + fieldName + "' or @id='" + fieldName + "']")).equals("")) {
            return true;
        }
        return false;
    }

    public void assertColumnValuIsBlank(String fieldName, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(isColumnValueBlank(fieldName)).isTrue();
        } else {
            Assert.assertTrue(isColumnValueBlank(fieldName));
        }
    }

    /* handles to veify total records present in flex table */
    public String totalRecordsCount(String tableId) {
        return (I.amPerforming().actionToGet().text(By.xpath("//div[@id='" + tableId + "']//following-sibling::span[contains(text(),'Total Records')]")));
    }

    public void AssertTotalRecordsCountInFlexTable(String totalRecord, String tableId, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(totalRecordsCount(tableId)).isEqualTo(totalRecord);
        } else {
            Assert.assertEquals(totalRecord, totalRecordsCount(tableId));
        }
    }

    public By pageBlock(String pageBlockName) {
        return By.xpath("//div[contains(@class,'panel-title') or contains(@class,'panel-heading')]//*[text()='" + pageBlockName + "' or @title='" + pageBlockName + "']");
    }

    /**
     * @param pageblockName - page block name
     * @param assertcan     - can see|cannot see
     * @Author - Mahadev.hanme
     */
    public void AssertPageBlockDisplayed(String pageblockName, boolean assertcan, boolean isSoftly) {
        List<Elements> elements = I.amPerforming().getElementReference().forListOfElements().of(pageBlock(pageblockName), false);
        if (assertcan) {
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

    /*
     * To capture field value by passing field label
     * @param fieldName - Label of field
     * @param  subTabName - subTab Name
     * @Author - Mahadev.hanme
     */
    public void getFieldValue(String fieldName, String subTabName) {
        govgrants.perform().pageDetails().clickSubTabsInsideTableView(subTabName);
        fieldValue = govgrants.perform().pageDetails().getFieldValue(fieldName);
    }

    /**
     * To compare two different field values
     *
     * @param fieldName  - Label of field
     * @param subTabName - subTab Name
     * @Author - Mahadev.hanme
     */
    public Boolean compareTwoFieldValues(String fieldName, String subTabName) {
        govgrants.perform().pageDetails().clickSubTabsInsideTableView(subTabName);
        if (fieldValue.equalsIgnoreCase(govgrants.perform().pageDetails().getFieldValue(fieldName)))
            return true;
        else
            return false;
    }

    public void assertTwoFieldValues(String targetValue, String subTabName, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(compareTwoFieldValues(targetValue, subTabName)).isTrue();
        } else {
            Assert.assertTrue(compareTwoFieldValues(targetValue, subTabName));
        }
    }

    /**
     * To verify any value is present specifically in attachment flex table or not
     *
     * @param value
     * @param flexTableHeader
     * @return
     */
    public Boolean isValueInsideFlexTable(String value, String flexTableHeader) {
        try {
            return I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[@id='myTabbedContent']//a[@title='" + flexTableHeader + "']/../../../following-sibling::div//tbody//td//span[text()='" + value + "']|//div[@id='myTabbedContent']//a//span[contains(text(),'" + flexTableHeader + "')]/ancestor::div/following-sibling::div//tbody//td//span[text()='" + value + "']"));
        } catch (Exception e) {
        }
        return false;
    }

    /**
     * Handles to upload the file from workspace
     *
     * @param fileNameFromWorkSpace - file which is to be upload
     */
    public void uploadAttachmentFromWorkspace(String fileNameFromWorkSpace) {
        I.amPerforming().click().on(By.xpath("//div[@id='myTabbedContent']//span[contains(text(),'Attachment')]/..//div[@class='panel-heading']//*[text()='Add']"));
        I.amPerforming().click().on(By.xpath("//div[@id='Attachmentadd']//span[text()='Upload file from Workspace']"));
        I.amPerforming().click().on((By.xpath("//div[@id='Attachmentadd']//td[text()='" + fileNameFromWorkSpace + "']/..//input")));
        govgrants.perform().modal().clickModalContentSpecificButton("Attach");
        govgrants.perform().modal().closeModalByClickingTopRightCloseButton("Add Attachments");
    }

    public void clickRightHeaderBars(String title) {
        govgrants.perform().phasePanel().clickParallelMenuBars(title);
    }

    public void assertThatFileIsDownloaded(String fileType, boolean isSoftly) {
        File file = new File(System.getProperty("user.dir") + File.separatorChar + "target");
        File[] directory = I.amPerforming().fileHandling().toGetCompleteFilesListOnLocalDirectory(file.getAbsolutePath());
        for (File files : directory) {
            if (files.getName().endsWith(".tmp")) {
                new File(files.getAbsolutePath().toString())
                        .renameTo(new File(file.getAbsolutePath() + "govgrant." + fileType + ""));
                break;
            }
        }
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(Files.fileNamesIn(file.getAbsolutePath(), false)).contains("govgrant." + fileType);
        } else {
            Assert.assertTrue(new File(file.getAbsolutePath() + "govgrant." + fileType + "").exists());
        }
    }

    public void AssertFieldValueIsChecked(String fieldName, String count, boolean isSoftly) {
        if (isSoftly) {
            I.amPerforming().assertionsTo().assertThat(Integer.parseInt(count)).isEqualTo(getCheckedFieldValueCount(fieldName));
        } else {
            Assert.assertEquals(Integer.parseInt(count), getCheckedFieldValueCount(fieldName));
        }
    }

    /**
     * To get the count of row values checked for field available in flex table
     *
     * @param fieldName - Field API name
     * @return
     */
    private int getCheckedFieldValueCount(String fieldName) {
        List<Elements> checkSymbol = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//field[@field-name='" + fieldName + "']/i[contains(@class,'fa-check')]"));
        return checkSymbol.size();
    }


    /**
     * @param userType e.g (INTERNAL,EXTERNAL)
     * @param subject  e.g Subject of mail that needs to be verified
     * @return true if we get expected Subject in mail notification
     * @throws MessagingException
     */
    public boolean validateMailSubject(String userType, String subject) throws MessagingException {
        Map<String, String> credentials = usersAndURL.getUserCredentialsForMailNotification(userType);

        if (subject.toLowerCase().contains("<award id>")) {
            subject = subject.replace("<award id>", getRecordId("Automation Permanent Award", "GrantAwardName__c", "Award__c").asString().replaceAll("^\"|\"$", ""));
        }

        if (subject.toLowerCase().contains("<payment id>")) {
            subject = subject.replace("<payment id>", I.amPerforming().propertiesFileOperationsTo().getValue("PaymentId"));
        }

        if (subject.contains("SavedValue")) {
            String expected = subject.split(">")[0].split("<")[1];
            subject = subject.replace("<" + expected + ">", I.amPerforming().propertiesFileOperationsTo().getValue(expected.split(":")[1]));
        }

        if (subject.toLowerCase().contains("<subrecipient name>")) {
            if (System.getProperty("env").equalsIgnoreCase("auto")) {
                subject = subject.replace("<subrecipient name>", "Automation SPI");
            }
        }

        String subjectString = I.amPerforming().emailOperationsTo().accessEmail(
                credentials.get("username"),
                credentials.get("password"),
                Emails.HostName.GMAIL,
                Emails.MailClient.GMAIL,
                Emails.EmailFolder.INBOX).getSubjectOfLatestMessage();

        if (subjectString.contains(subject)) {
            return true;
        }

        return false;
    }

    /**
     * @param recordName      - the name or title of the record
     * @param fieldName       - the name of the field that stores the title like e.g. Title__c.
     * @param objectType      - the object API name of the record from which you want to
     * @param outputFieldName - Field API name of which you want to get the value
     * @return
     */
    public String getFieldValueFromAPI(String recordName, String fieldName, String objectType, String outputFieldName) {
        return getRecordId(recordName, fieldName, objectType, outputFieldName).asString().replaceAll("\"", "");
    }

    /**
     * Initialise the data based on environment
     */
    public void initData() {
        Properties p = new Properties();
        if (null != EnvironmentFactory.getEnvironmentName() && !"".equalsIgnoreCase(EnvironmentFactory.getEnvironmentName()) && EnvironmentFactory.getEnvironmentName().equalsIgnoreCase("QA")) {
            try {
                p.load(this.getClass().getResourceAsStream("/properties/QAEnvData.properties"));
            } catch (IOException e) {

            }
        } else {
            try {
                p.load(this.getClass().getResourceAsStream("/properties/AUTOEnvData.properties"));
            } catch (IOException e) {

            }
        }

        Iterator i = p.keySet().iterator();
        while (i.hasNext()) {
            String currentKey = i.next().toString();
            I.amPerforming().propertiesFileOperationsTo().saveValue(currentKey, p.getProperty(currentKey));
        }
    }

    /**
     * @param rowNumber   Specify the row number such as 1,2,3 and so on. and if you want column value from last row then mention "last row"
     * @param columnName  Name of the column from which you want a value
     * @param flexTableId Id of flex table
     * @return value from specified row for specified column from the Flex Table.
     * @author jitendra.pisal
     * @Updated by: Aashish P.
     */
    private String getValueOfSpecifiedColFromTableHavingColumnNameAs(String rowNumber, String columnName, String flexTableId) {

        int columnValueFromRowInInt = 0;
        int counter = 1;
        By columnHeaders = By.xpath("//div[@id='" + flexTableId + "']//th");
        List<Elements> columnList = I.amPerforming().getElementReference().forListOfElements().of(columnHeaders);

        // get the column index of required column.
        for (Elements columnEle : columnList) {
            if (columnEle.getText().equalsIgnoreCase(columnName)) {
                break;
            }
            counter++;
        }

        List<Elements> listOfDataInColumn = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='" + flexTableId + "']//th//span[text()='" + columnName + "']/ancestor::thead/parent::table//tr//td[" + counter + "]/span/field/span"));
        if (listOfDataInColumn.size() == 0) {
            listOfDataInColumn = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='" + flexTableId + "']//th//span[text()='" + columnName + "']/ancestor::thead/parent::table//tr//td[" + counter + "]/span/span/span"));
            if (listOfDataInColumn.size() == 0) {
                listOfDataInColumn = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='" + flexTableId + "']//th//span[text()='" + columnName + "']/ancestor::thead/parent::table//tr//td[" + counter + "]/span"));
            }
        }
        columnValueFromRowInInt = rowNumber.equalsIgnoreCase("last row") ? listOfDataInColumn.size()
                : Integer.parseInt(rowNumber);

        return listOfDataInColumn.get(columnValueFromRowInInt - 1).getText();
    }

    public void iSavedSpecificValueFromFlexTable(String columnValueFromRow, String columnName, String flexTableId) {
        I.amPerforming().propertiesFileOperationsTo().saveValue("lastValueFromTableForCol", getValueOfSpecifiedColFromTableHavingColumnNameAs(columnValueFromRow,
                columnName, flexTableId));
    }

    public void iSavedSpecificValueFromFlexTableInsideGivenKey(String columnValueFromRow, String columnName, String key, String flexTableId) {
        I.amPerforming().propertiesFileOperationsTo().saveValue(key, getValueOfSpecifiedColFromTableHavingColumnNameAs(columnValueFromRow,
                columnName, flexTableId));
    }

    public boolean verifyIfFieldsAreEditableInFlexTable(String headingTitle) {
        String tableId = I.amPerforming().getElementReference().of(By.xpath("//*[contains(@class, 'panel-heading')]//a[text()='" + headingTitle + "']")).getAttribute("data-target");
        tableId = tableId.substring(1);
        By editableFields = By.xpath("//*[@id='" + tableId + "']//textarea");
        try {
            I.amPerforming().getElementReference().of(editableFields);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /***
     *  Add note to progress report
     */
    public void addNotesToPR() {
        By addBtnNotes = By.xpath("//div[contains(@id,'Notes')]//*[text()='Add']");
        I.amPerforming().click().on(addBtnNotes);
        I.amPerforming().textInput().in(By.xpath("//label[@for='Title']/following-sibling::input"), "Note Title");
        I.amPerforming().textInput().in(By.xpath("//label[@for='Description']/following-sibling::textarea"), "Note Description");
        govgrants.perform().modal().clickModalContentSpecificButton("Save");
        govgrants.perform().modal().closeModalByClickingTopRightCloseButton("Add Notes");
    }

    public void editDataInAttachment(String iconName, String fileName, String fileType) {
        By attachmentClassificationPath = By.xpath("//select[@title='Classification' or text()='Classification']");
        By attachmentDescriptionPath = By.xpath("//div//label[text()='Description']/..//textarea");
        By attachmentFilePath = By.xpath("//td//input[@type='file']");
        String defaultFilePath = System.getProperty("user.dir") + "/src/main/resources/";
        String tableId = I.amPerforming().actionToGet().attribute(By.xpath("//*[contains(@class, 'panel-heading')]//button[text()='Add']"), "data-target");
        tableId = tableId.substring(tableId.length() - 18);
        govgrants.perform().flexTable().clickTableActionIcon(tableId, iconName, new String[]{fileName});
        I.amPerforming().dropDownSelection().from(attachmentClassificationPath).selectByValue(fileType);
        I.amPerforming().textInput().toClear(attachmentDescriptionPath);
        I.amPerforming().textInput().in(attachmentDescriptionPath, "T&CDefault Comment");
        I.amPerforming().textInput().in(attachmentFilePath, defaultFilePath + fileName);
        I.amPerforming().click().on(By.xpath("//input[@value='Save']"));
    }

    /**
     * To verify RIsk level image
     */
    public Boolean assertRiskLevelImage(String fieldLabel, String imageName) throws IOException {
        if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//span[@class='customLabelstyle' and contains(text(),'" + fieldLabel + "')]/ancestor::dl[1]//dd//img[contains(@src,'"+imageName+"')]"))) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * To verify Active Sub Tab
     */
    public boolean getSelectedSubTab(String elementText) {
        String activeSubTab = I.amPerforming().actionToGet().text(By.xpath("//div[@id='myTabs']/ul//li[contains(@class,'active')]//span[not(@class)]"));

        if (elementText.equals(activeSubTab)) {
            return true;
        }
        return false;
    }

    /**
     * To verify button is present on modal or not
     *
     * @param buttonName
     * @return
     */
    public Boolean isButtonDisplayedOnModal(String buttonName) {
        try {
            return I.amPerforming().checkToSee().isDisplayed(By.xpath("//div[contains(@id,'modaltemp')]//button[@title='"+buttonName+"']"));
        } catch (Exception e) {
        }
        return false;
    }

    /**
     * upload digital signature document
     *
     * @param fileName
     * @param fileType
     */
    public void uploadDocument(String fileName, String fileType) {
        By attachmentClassificationPath = By.xpath("//select[@title='Classification' or text()='Classification']");
        By attachmentDescriptionPath = By.xpath("//div//label[text()='Description']/..//textarea");
        By attachmentFilePath = By.xpath(""
                + "//td//label[text()='File']/../..//input[@type='file']"
                + " | //div//label[text()='File']/..//input[@type='file']"
                + " | //div//span[text()='File']/../..//input[@type='file']");
        String defaultFilePath = System.getProperty("user.dir") + "/src/main/resources/";

        // Step 1
        String tableId = I.amPerforming().actionToGet().attribute(By.xpath("//*[contains(@class, 'panel-heading')]//button[text()='Add']"), "data-target");
        tableId = tableId.substring(tableId.length() - 18);

        // Step 2
        I.amPerforming().click().on(By.xpath("//div[@class='panel-heading']//button[text()='Add Document']"));

        // Step 3
        I.amPerforming().dropDownSelection().from(attachmentClassificationPath).selectByValue(fileType);
        I.amPerforming().textInput().in(attachmentDescriptionPath, "Default Comment");
        I.amPerforming().textInput().in(attachmentFilePath, defaultFilePath + fileName);

        // Step 4
        I.amPerforming().click().on(By.xpath("//input[@value='Save']"));

        // Step 5
        govgrants.perform().modal().closeModalByClickingTopRightCloseButton();
    }

    /**
     * To click on table top right button
     *
     * @param buttonName
     * @param flexTableId
     */
    public void clickTableTopRightButton(String buttonName, String flexTableId) {
        I.amPerforming().click().on(govgrants.perform().flexTable().getTopRightButtonLocatorByTableId(flexTableId, buttonName));
    }

    /**
     * @param usage        softly or not
     * @param projectRoles - list of roles
     * @author jitendra.pisal
     */
    public void compareContactListEquality(String usage, List<String> projectRoles) {
        List<String> listofRoles = new ArrayList<>();
        List<WebElement> ll = I.amPerforming().dropDownSelection().from(By.xpath("//field[@field-name='ProjectRole__c']//select")).getOptions();
        for (WebElement e :
                ll) {
            listofRoles.add(e.getText().trim());
        }
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(
                    listofRoles.containsAll(projectRoles)
            ).isTrue();
        } else {
            Assert.assertTrue(
                    listofRoles.containsAll(projectRoles)
            );
        }
    }

    /**
     * @param usage       - softly or not
     * @param savedValue1 - Saved field 1 value from page
     * @param savedValue2 Saved field 2 value from page
     * @author jitendra.pisal
     */
    public void compareTwoSavedStringValueEquality(String usage, String savedValue1, String savedValue2) {
        if (savedValue1.contains("SavedValue")
                && savedValue2.contains("SavedValue")) {
            savedValue1 = I.amPerforming().propertiesFileOperationsTo().getValue(savedValue1.split(":")[1]);
            savedValue2 = I.amPerforming().propertiesFileOperationsTo().getValue(savedValue2.split(":")[1]);
        }
        if (usage.contains("softly see")) {
            I.amPerforming().assertionsTo().assertThat(savedValue1).isEqualToIgnoringCase(savedValue2);
        } else if (usage.contains("not")) {
            Assert.assertNotEquals("Saved value :" + savedValue1 + " is not equals to saved value " + savedValue2, savedValue1, savedValue2);
        }
    }

    /**
     * @param usage            softly or not
     * @param iniBudgetBalance
     * @param decreasedBy
     * @param currentBalance
     * @Author jitendra pisal
     */
    public void verifyBalanceBudget(String usage, String iniBudgetBalance, String decreasedBy, String currentBalance) {
        try {
            Number a = NumberFormat.getCurrencyInstance(Locale.US).parse(iniBudgetBalance);
            Number b = NumberFormat.getCurrencyInstance(Locale.US).parse(currentBalance);
            if (usage.contains("softly")) {
                I.amPerforming().assertionsTo().assertThat(a.intValue() - Integer.parseInt(decreasedBy)).isEqualTo(b.intValue());
            } else {
                Assert.assertEquals(a.longValue() - Long.parseLong(decreasedBy), b.longValue());
            }
        } catch (ParseException p) {
            throw new RuntimeException("Please provide valid amount in us dollar. Given budget amount is " + iniBudgetBalance + "" +
                    "or " + currentBalance);
        }
    }

    public void validateModalEnlargeAndGrantDetails(String usage) {
        By modalEnlarge = By.xpath("//div[@id='editDiv']/div/div[2]");
        List<String> ids = List.of(
                "LaverageAllowed__c",
                "IsProgramIncomeAnticipated__c",
                "IsAdvancePermitted__c",
                "FocusAreaRequired__c",
                "IsGoalsRequired__c",
                "KPIsRequired__c",
                "RiskAssessmentRequired__c",
                "IsBuildUpFunctionality__c",
                "AreExpensesBuildIUpLevel__c",
                "IsMatchRequired__c",
                "GranteeMatch__c",
                "BudgetRedirectionThreshhold__c"
        );
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().checkToSee().isDisplayed(modalEnlarge)).isTrue();
            ids.forEach(
                    id -> I.amPerforming().assertionsTo().assertThat(I.amPerforming().checkToSee().isDisplayed(By.xpath("//*[@id='" + id + "']"))).isTrue()
            );
        } else {
            Assert.assertTrue(I.amPerforming().checkToSee().isDisplayed(modalEnlarge));
            ids.forEach(
                    id -> Assert.assertTrue(I.amPerforming().checkToSee().isDisplayed(By.xpath("//*[@id='" + id + "']")))
            );
        }
    }

    public void allFieldsCheckSiteVisit(String usage) {
        List<String> ids = List.of("Title__c",
                "GranteePOCContact__c",
                "MonitoringType__c");

        if (usage.contains("softly")) {
            ids.forEach(
                    id -> I.amPerforming().assertionsTo().assertThat(
                            I.amPerforming().checkToSee().isDisplayed(By.xpath("//*[@id='" + id + "']"))
                    ).isTrue().as("Field having Id " + id + " is not present on page")
            );
        } else {
            ids.forEach(
                    id -> Assert.assertTrue(
                            "Field having Id " + id + " is not present on page",
                            I.amPerforming().checkToSee().isDisplayed(By.xpath("//*[@id='" + id + "']"))
                    )
            );
        }
    }

    public boolean assertToCheckFieldPresentOnPageUnderSpecificTable(String fieldLabel, String tableHeaderTitle) {
        By fieldToFindOnPage = By.xpath("//a[text()='" + tableHeaderTitle + "']//ancestor::div[@class='tab-inner-content']//span[text()='" + fieldLabel + "']");
        try {
            I.amPerforming().getElementReference().of(fieldToFindOnPage);
            return true;
        } catch (Exception ee) {
            return false;
        }
    }

    public boolean isFieldDateGreaterThanOrLessThanTodaysDate(String fieldLabel, String lessOrGreater) throws ParseException {
        String currentDate = govgrants.perform().pageDetails().getFieldValue(fieldLabel, true);
        String todayDate = I.amPerforming().dateOperationsToGet().currentDateInDesiredFormat(DateTimeFormatter.ofPattern("M/d/yyyy"));
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        Date actualDate = sdf.parse(currentDate);
        Date today = sdf.parse(todayDate);
        if (lessOrGreater.equalsIgnoreCase("less")) {
            if (actualDate.before(today)) {
                return true;
            } else {
                return false;
            }
        } else {
            if (actualDate.after(today)) {
                return true;
            } else {
                return false;
            }
        }
    }

    public boolean isFieldDateGreaterThanOrLessThanExpectedDate(String fieldLabel1, String lessOrGreater, String fieldLabel2) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        Date actualEndDate = sdf.parse(fieldLabel1);
        Date actualStartDate = sdf.parse(fieldLabel2);
        if (lessOrGreater.equalsIgnoreCase("less")) {
            if (actualEndDate.before(actualStartDate)) {
                return true;
            } else {
                return false;
            }
        } else {
            if (actualEndDate.after(actualStartDate)) {
                return true;
            } else {
                return false;
            }
        }
    }

    /**
     * @param flextableId - Table Id
     * @author Keerti Munde
     */
    public void clickAllDeleteButtonsInsideFlexTable(String flextableId) {
        By columnSelector = By.xpath("//*[@id='" + flextableId + "']//table//tr//td[1]");
        List<Elements> rowValues = I.amPerforming().getElementReference().forListOfElements().of(columnSelector);
        int rowSize = rowValues.size();
        int counter = 0;
        for (int i = rowValues.size() - 1; i >= 0; i--) {
            List<Elements> rowValues2 = I.amPerforming().getElementReference().forListOfElements().of(columnSelector);
            if (rowValues2.get(counter).getText().equalsIgnoreCase("No Records Found")) {
                counter++;
            } else {
                I.amPerforming().click().on(govgrants.perform().flexTable().getTableActionIcon(flextableId, "Delete", rowValues2.get(counter).getText()));
                govgrants.perform().modal().acceptPopUp();
            }
        }
    }

    /**
     * assert if text is present inside history table
     */
    public void assertTextInHistoryTable(String usage, String colName, String rowNo, String tData, String text) {
        if (usage.contains("softly")) {
            if (usage.contains("cannot")) {
                I.amPerforming().assertionsTo().assertThat(isTextPresentInsideHistoryTable(colName, rowNo, tData, text)).isFalse();
            } else {
                I.amPerforming().assertionsTo().assertThat(isTextPresentInsideHistoryTable(colName, rowNo, tData, text)).isTrue();
            }
        } else {
            if (usage.contains("cannot")) {
                Assert.assertFalse(isTextPresentInsideHistoryTable(colName, rowNo, tData, text));
            } else {
                Assert.assertTrue(isTextPresentInsideHistoryTable(colName, rowNo, tData, text));
            }
        }
    }

    /**
     * @return true if expected text is displayed inside history table
     */
    private boolean isTextPresentInsideHistoryTable(String colName, String rowNo, String tData, String text) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(I.amPerforming().getElementReference().of(By.xpath("//th[text()='" + colName + "']//ancestor::tbody/following-sibling::tbody[" + rowNo + "]/tr[" + tData + "]//td//*[text()='" + text + "']")))) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    public Boolean isFieldStatusVisibleInPageblock(String fieldName, String fieldValue, String pageblockName) {
        boolean flag = false;
        if (I.amPerforming().checkToSee().isDisplayed(By.xpath("//a[text()='" + pageblockName + "']/ancestor::div[@class='panel-heading']//following-sibling::div//span[text()='" + fieldName + "']/ancestor::div[@class='textFieldWrapFlex']//div//dd//span[text()='" + fieldValue + "']"))) {
            flag = true;
        } else {
            flag = false;
        }

        return flag;

    }

    public void seeFieldStatusInPageBlock(String usage, String fieldName, String fieldValue, String pageblockName) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isFieldStatusVisibleInPageblock(fieldName, fieldValue, pageblockName));
        } else if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isFieldStatusVisibleInPageblock(fieldName, fieldValue, pageblockName)).isTrue();
        } else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(isFieldStatusVisibleInPageblock(fieldName, fieldValue, pageblockName));
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isFieldStatusVisibleInPageblock(fieldName, fieldValue, pageblockName)).isFalse();
        }

    }

    public void assertButtonDisplayedOnModal(String usage, String buttonName) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isButtonDisplayedOnModal(buttonName));
        } else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(isButtonDisplayedOnModal(buttonName));
        } else if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isButtonDisplayedOnModal(buttonName)).isTrue();
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isButtonDisplayedOnModal(buttonName)).isFalse();
        }
    }
}
