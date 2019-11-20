package com.ggproduct.automation.projectmanager;

import eyethink.automation.bots.Register.EnvironmentFetcher;
import eyethink.automation.bots.Register.EyeThink;
import eyethink.automation.bots.corelib.Emails;
import eyethink.automation.bots.objects.Elements;
import org.assertj.core.util.Files;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.springframework.context.annotation.Description;

import javax.mail.MessagingException;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;


/**
 * for Rei Systems
 *
 * @author Handles generic/common methods and WebElements of the project.
 */
public class ProjectManager extends ProjectWebServices {
    UsersAndURL usersAndURL = new UsersAndURL();
    public final String defaultLongText = "Automation test description";
    private String fieldValue;

    /******
     * BELOW PATTREN IS CONSIDERED BEST IN CODING WORLD. ADD JAVA DOCS AND KEEP
     * LOCAL/KEY METHOD CATEGORIES
     ***/

    /******* "Key Methods with complete functionality" *****************/

    /*handles to get the record id of a record */
    public void getRecordIdFromResponse(String objectType, String recordName, String objectApiName) {
       String response ="";
        response = (automationBatchExecuteApi(objectType, recordName, objectApiName.split(","))).asString().replace("\"", "");
        if(!response.equalsIgnoreCase("Completed")) {
            EyeThink.saas().pageDetails().idOfRecord = response;
            EyeThink.core().Properties().saveValue("Record Id", EyeThink.saas().pageDetails().idOfRecord);
        }
    }

    /* handles to verify no record is present in flex table */
    public boolean isRecordPresentInTheFlexTable(String text, String tableId) {
        try {
            return EyeThink.core().is().isDisplayed(By.xpath("//div[@id='" + tableId + "']//*[" + EyeThink.core().xpath().contains("text()", text) + "]"));
        } catch (Exception e) {
        }
        return false;
    }

    /*handles to verify blank value is present inside flex table */
    public boolean isColumnValueBlank(String fieldName) {
        if (EyeThink.core().get().text(By.xpath("//*[@field-name='" + fieldName + "' or @id='" + fieldName + "']")).equals("")) {
            return true;
        }
        return false;
    }

    public void assertColumnValuIsBlank(String fieldName, boolean isSoftly) {
        if (isSoftly){
            EyeThink.core().assertion().assertThat(isColumnValueBlank(fieldName)).isTrue();
        } else {
            Assert.assertTrue(isColumnValueBlank(fieldName));
        }
    }

    /* handles to veify total records present in flex table */
    public String totalRecordsCount(String tableId) {
        return (EyeThink.core().get().text(By.xpath("//div[@id='" + tableId + "']//following-sibling::span[contains(text(),'Total Records')]")));
    }

    public void AssertTotalRecordsCountInFlexTable(String totalRecord, String tableId, boolean isSoftly) {
        if (isSoftly){
            EyeThink.core().assertion().assertThat(totalRecordsCount(tableId)).isEqualTo(totalRecord);
        } else {
            Assert.assertEquals(totalRecord, totalRecordsCount(tableId));
        }
    }

    public By pageBlock(String pageBlockName) {
        return By.xpath("//div[contains(@class,'panel-title') or contains(@class,'panel-heading')]//*[text()='"+pageBlockName+"' or @title='"+pageBlockName+"']");
    }

    /**
     * @param pageblockName - page block name
     * @param assertcan     - can see|cannot see
     * @Author - Mahadev.hanme
     */
    public void AssertPageBlockDisplayed(String pageblockName, boolean assertcan, boolean isSoftly) {
        List<Elements> elements = EyeThink.core().elementReference().listOfElements().of(pageBlock(pageblockName),false);
        if (assertcan) {
            if (isSoftly){
                EyeThink.core().assertion().assertThat(0).isNotEqualTo(elements.size());
            } else {
                Assert.assertNotEquals(elements.size(), 0);
            }
        } else {
            if (isSoftly){
                EyeThink.core().assertion().assertThat(0).isEqualTo(elements.size());
            } else {
                Assert.assertEquals(elements.size(), 0);
            }
        }
    }

    /*
     * handles to capture message on approval decision box
     * @param - message - message which needs to verify
     * @Author - Mahadev.hanme
     */
    public Boolean captureMessageOnApprovalDecisionBox(String message) {
        By expectedMsg = By.xpath("//div[@id='ApprovalDecisionComponent']//span[contains(text(),'" + message + "')]");

        try {
            EyeThink.core().elementReference().of(expectedMsg);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    /*
     * To capture field value by passing field label
     * @param fieldName - Label of field
     * @param  subTabName - subTab Name
     * @Author - Mahadev.hanme
     */
    public void getFieldValue(String fieldName, String subTabName) {
        EyeThink.saas().pageDetails().clickSubTabsInsideTableView(subTabName);
        fieldValue = EyeThink.saas().pageDetails().getFieldValue(fieldName);
    }

    /**
     * To compare two different field values
     *
     * @param fieldName  - Label of field
     * @param subTabName - subTab Name
     * @Author - Mahadev.hanme
     */
    public Boolean compareTwoFieldValues(String fieldName, String subTabName) {
        EyeThink.saas().pageDetails().clickSubTabsInsideTableView(subTabName);
        if (fieldValue.equalsIgnoreCase(EyeThink.saas().pageDetails().getFieldValue(fieldName)))
            return true;
        else
            return false;
    }

    @Description("To verify two different field values are equal or not")
    public void assertTwoFieldValues(String targetValue, String subTabName, boolean isSoftly) {
        if (isSoftly) {
            EyeThink.core().assertion().assertThat(compareTwoFieldValues(targetValue, subTabName)).isTrue();
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
    public Boolean iSeeValueInFlexTable(String value, String flexTableHeader) {
        WebElement elementValueFlexTable = EyeThink.core().elementReference().of(By.xpath("//div[@id='myTabbedContent']//a[@title='" + flexTableHeader + "']/../../../following-sibling::div//tbody//td//span[text()='" + value + "']"));
        if (EyeThink.core().is().isDisplayed(elementValueFlexTable))
            return true;
        else
            return false;
    }

    public void AssertFieldValueIsPresentInFlexTable(String valueToBeSearch, String flexTableHeader, boolean isSoftly) {
        if (isSoftly){
            EyeThink.core().assertion().assertThat(iSeeValueInFlexTable(valueToBeSearch, flexTableHeader)).isTrue();
        } else {
            Assert.assertTrue(iSeeValueInFlexTable(valueToBeSearch, flexTableHeader));
        }
    }

    /**
     * Handles to upload the file from workspace
     * @param fileNameFromWorkSpace - file which is to be upload
     */
    public void uploadAttachmentFromWorkspace(String fileNameFromWorkSpace) {
        EyeThink.core().click().on(By.xpath("//div[@id='myTabbedContent']//span[contains(text(),'Attachment')]/..//div[@class='panel-heading']//*[text()='Add']"));
        EyeThink.core().click().on(By.xpath("//div[@id='Attachmentadd']//span[text()='Upload file from Workspace']"));
        EyeThink.core().click().on((By.xpath("//div[@id='Attachmentadd']//td[text()='" + fileNameFromWorkSpace + "']/..//input")));
        EyeThink.saas().modal().clickModalContentSpecificButton("Attach");
        EyeThink.saas().modal().closeModalByClickingTopRightCloseButton("Add Attachments");
    }

    public void clickRightHeaderBars(String title) {
        EyeThink.saas().phasePanel().clickParallelMenuBars(title);
    }

    public void assertThatFileIsDownloaded(String fileType, boolean isSoftly){
        File file = new File(System.getProperty("user.dir") + "\\target");
        File[] directory = EyeThink.core().file().getCompleteFilesListOnLocalDirectory(file.getAbsolutePath());
        for (File files : directory) {
            if (files.getName().endsWith(".tmp")) {
                new File(files.getAbsolutePath().toString())
                        .renameTo(new File(file.getAbsolutePath() + "govgrant."+fileType+""));
                break;
            }
        }
        if (isSoftly){
            EyeThink.core().assertion().assertThat(Files.fileNamesIn(file.getAbsolutePath(), false)).contains("govgrant."+fileType);
        } else {
            Assert.assertTrue(new File(file.getAbsolutePath() + "govgrant." + fileType + "").exists());
        }
    }

    public void AssertFieldValueIsChecked(String fieldName,String count, boolean isSoftly){
        if (isSoftly){
            EyeThink.core().assertion().assertThat(Integer.parseInt(count)).isEqualTo(getCheckedFieldValueCount(fieldName));
        } else {
            Assert.assertEquals(Integer.parseInt(count), getCheckedFieldValueCount(fieldName));
        }
    }
    
       /**
     * To get the count of row values checked for field available in flex table
     * @param fieldName - Field API name
     * @return
     */
    private int getCheckedFieldValueCount(String fieldName){
        List<Elements> checkSymbol = EyeThink.core().elementReference().listOfElements().of(By.xpath("//field[@field-name='"+fieldName+"']/i[contains(@class,'fa-check')]"));
        return checkSymbol.size();
    }


    /**
     *
     * @param userType e.g (INTERNAL,EXTERNAL)
     * @param subject e.g Subject of mail that needs to be verified
     *
     * @return true if we get expected Subject in mail notification
     * @throws MessagingException
     */
    public boolean validateMailSubject(String userType, String subject) throws MessagingException {
        Map<String,String> credentials = usersAndURL.getUserCredentialsForMailNotification(userType);

        if (subject.toLowerCase().contains("<award id>")){
            subject = subject.replace("<award id>",automateGetApi("Automation Permanent Award","GrantAwardName__c","Award__c").asString().replaceAll("^\"|\"$", ""));
        }

        if (subject.toLowerCase().contains("<payment id>")){
            subject = subject.replace("<payment id>",EyeThink.core().Properties().getValue("PaymentId"));
        }

        if(subject.toLowerCase().contains("<subrecipient name>")){
            if(System.getProperty("env").equalsIgnoreCase("auto")){
                subject = subject.replace("<subrecipient name>","Automation SPI");
            }
        }

        String subjectString = EyeThink.core().email().accessEmail(
                credentials.get("username"),
                credentials.get("password"),
                Emails.HostName.GMAIL,
                Emails.MailClient.GMAIL,
                Emails.EmailFolder.INBOX).getSubjectOfLatestMessage();

        if (subjectString.contains(subject)){
            return true;
        }

        return false;
    }

    /**
     *
     * @param recordName - the name or title of the record
     * @param fieldName - the name of the field that stores the title like e.g. Title__c.
     * @param objectType - the object API name of the record from which you want to
     * @param outputFieldName - Field API name of which you want to get the value
     * @return
     */
    public String getFieldValueFromAPI(String recordName, String fieldName, String objectType,String outputFieldName ){
        return automateGetApi(recordName,fieldName,objectType,outputFieldName).asString().replaceAll("\"","");
    }

    /**
     *  Initialise the data based on environment
     */
    public void initData() {
        Properties p = new Properties();
        if (null != EnvironmentFetcher.getEnvironmentName() && !"".equalsIgnoreCase(EnvironmentFetcher.getEnvironmentName()) && EnvironmentFetcher.getEnvironmentName().equalsIgnoreCase("QA")) {
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
            EyeThink.core().Properties().saveValue(currentKey, p.getProperty(currentKey));
        }
    }

    /**
     * @param rowNumber  Specify the row number such as 1,2,3 and so on. and if you want column value from last row then mention "last row"
     * @param columnName Name of the column from which you want a value
     * @param flexTableId Id of flex table
     * @return value from specified row for specified column from the Flex Table.
     * @author jitendra.pisal
     */
    private String getValueOfSpecifiedColFromTableHavingColumnNameAs(String rowNumber, String columnName, String flexTableId){

        int columnValueFromRowInInt = 0;
        int counter = 1;
        By columnHeaders = By.xpath("//div[@id='"+flexTableId+"']//th//span[@ng-bind='fieldLabel']");
        List<Elements> columnList = EyeThink.core().elementReference().listOfElements().of(columnHeaders);

        // get the column index of required column.
        for (Elements columnEle : columnList){
            if (columnEle.getText().equalsIgnoreCase(columnName)){
                break;
            }
            counter++;
        }

        List<Elements> listOfDataInColumn = EyeThink.core().elementReference().listOfElements().of(By.xpath("//div[@id='"+flexTableId+"']//th//span[text()='"+columnName+"']/ancestor::thead/parent::table//tr//td["+counter+"]/span/field/span"));
        columnValueFromRowInInt = rowNumber.equalsIgnoreCase("last row") ? listOfDataInColumn.size()
                : Integer.parseInt(rowNumber);

        return listOfDataInColumn.get(columnValueFromRowInInt-1).getText();
    }

    public void iSavedSpecificValueFromFlexTable(String columnValueFromRow, String columnName, String flexTableId){
        EyeThink.core().Properties().saveValue("lastValueFromTableForCol",getValueOfSpecifiedColFromTableHavingColumnNameAs(columnValueFromRow,
                columnName, flexTableId));
    }

    public void iSavedSpecificValueFromFlexTableInsideGivenKey(String columnValueFromRow, String columnName, String key, String flexTableId){
        EyeThink.core().Properties().saveValue(key,getValueOfSpecifiedColFromTableHavingColumnNameAs(columnValueFromRow,
                columnName, flexTableId));
    }

    public boolean verifyIfFieldsAreEditableInFlexTable(String headingTitle){
        String tableId = EyeThink.core().elementReference().of(By.xpath("//*[contains(@class, 'panel-heading')]//a[text()='"+headingTitle+"']")).getAttribute("data-target");
        tableId = tableId.substring(1);
        By editableFields = By.xpath("//*[@id='"+tableId+"']//textarea");
        try {
            EyeThink.core().elementReference().of(editableFields);
            return true;
        } catch (Exception e){
            return false;
        }
    }

    /***
     *  Add note to progress report
     */
    public void addNotesToPR(){
        By addBtnNotes= By.xpath("//div[contains(@id,'Notes')]//*[text()='Add']");
        EyeThink.core().click().on(addBtnNotes);
        EyeThink.core().enterText().in(By.xpath("//label[@for='Title']/following-sibling::input"),  "Note Title");
        EyeThink.core().enterText().in(By.xpath("//label[@for='Description']/following-sibling::textarea"), "Note Description");
        EyeThink.saas().modal().clickModalContentSpecificButton("Save");
        EyeThink.saas().modal().closeModalByClickingTopRightCloseButton("Add Notes");
    }

    public void editDataInAttachment(String iconName, String fileName, String fileType){
        By attachmentClassificationPath = By.xpath("//select[@title='Classification' or text()='Classification']");
        By attachmentDescriptionPath = By.xpath("//div//label[text()='Description']/..//textarea");
        By attachmentFilePath = By.xpath("//td//input[@type='file']");
        String defaultFilePath = System.getProperty("user.dir") + "/src/main/resources/";
        String tableId = EyeThink.core().get().attribute(By.xpath("//*[contains(@class, 'panel-heading')]//button[text()='Add']"), "data-target");
        tableId = tableId.substring(tableId.length() - 18);
        EyeThink.saas().flexTable().clickTableActionIcon(tableId, iconName, new String[]{fileName});
        EyeThink.core().select().from(attachmentClassificationPath).selectByValue(fileType);
        EyeThink.core().enterText().clear(attachmentDescriptionPath);
        EyeThink.core().enterText().in(attachmentDescriptionPath, "T&CDefault Comment");
        EyeThink.core().enterText().in(attachmentFilePath, defaultFilePath + fileName);
        EyeThink.core().click().on(By.xpath("//input[@value='Save']"));
    }

    /**
     * To verify RIsk level image
     */
    public Boolean assertRiskLevelImage(String fieldLabel,String imageName) throws IOException {
        WebElement pathForRiskLevel = EyeThink.core().elementReference().of(By.xpath("//span[@class='customLabelstyle' and contains(text(),'"+fieldLabel+"')]/ancestor::dl[1]//dd//img"));
        EyeThink.core().screenCapture().takeElementScreenShot(pathForRiskLevel, "green");
        return EyeThink.core().compare().image().isElementImage(pathForRiskLevel,imageName);
    }


}