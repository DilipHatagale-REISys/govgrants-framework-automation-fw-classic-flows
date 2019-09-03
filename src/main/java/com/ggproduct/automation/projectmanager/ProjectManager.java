package com.ggproduct.automation.projectmanager;

import eyethink.automation.bots.Register.EyeThink;
import eyethink.automation.bots.controller.EnvironmentFetcher;
import eyethink.automation.bots.corelib.Emails;
import eyethink.automation.bots.objects.Elements;
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
        EyeThink.saas().pageDetails().idOfRecord = (automationBatchExecuteApi(objectType, recordName, objectApiName)).asString().replace("\"", "");
        EyeThink.core().Properties().saveValue("Record Id",EyeThink.saas().pageDetails().idOfRecord);
    }

    /* handles to verify no record is present in flex table */
    public boolean isRecordPresentInTheFlexTable(String text, String tableId) {
        try {
            return EyeThink.core().is().onWeb().isDisplayed(By.xpath("//div[@id='" + tableId + "']//*[" + EyeThink.core().xpath().contains("text()", text) + "]"));
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

    public void assertColumnValuIsBlank(String fieldName) {
        Assert.assertTrue(isColumnValueBlank(fieldName));
    }

    /* handles to veify total records present in flex table */
    public String totalRecordsCount(String tableId) {
        return (EyeThink.core().get().text(By.xpath("//div[@id='" + tableId + "']//following-sibling::span[contains(text(),'Total Records')]")));
    }

    public void AssertTotalRecordsCountInFlexTable(String totalRecord, String tableId) {
        Assert.assertEquals(totalRecord, totalRecordsCount(tableId));
    }

    public By pageBlock(String pageBlockName) {
        return By.xpath("//h3//a[contains(text(),'" + pageBlockName + "')]");
    }

    /**
     * @param pageblockName - page block name
     * @param assertcan     - can see|cannot see
     * @Author - Mahadev.hanme
     */
    public void AssertPageBlockDisplayed(String pageblockName, boolean assertcan) {
        List<Elements> elements = EyeThink.core().elementReference().listOfElements().onWeb(pageBlock(pageblockName),false);

        if (assertcan) {
            Assert.assertNotEquals(elements.size(), 0);
        } else {
            Assert.assertEquals(elements.size(), 0);
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
            EyeThink.core().elementReference().onWeb(expectedMsg);
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
    public void assertTwoFieldValues(String targetValue, String subTabName) {
        Assert.assertTrue(compareTwoFieldValues(targetValue, subTabName));
    }

    /**
     * To verify any value is present specifically in attachment flex table or not
     *
     * @param value
     * @param flexTableHeader
     * @return
     */
    public Boolean iSeeValueInFlexTable(String value, String flexTableHeader) {
        WebElement elementValueFlexTable = EyeThink.core().elementReference().onWeb(By.xpath("//div[@id='myTabbedContent']//a[@title='" + flexTableHeader + "']/../../../following-sibling::div//tbody//td//span[text()='" + value + "']"));
        if (EyeThink.core().is().onWeb().isDisplayed(elementValueFlexTable))
            return true;
        else
            return false;
    }

    public void AssertFieldValueIsPresentInFlexTable(String valueToBeSearch, String flexTableHeader) {
        Assert.assertTrue(iSeeValueInFlexTable(valueToBeSearch, flexTableHeader));
    }

    /**
     * Handles to upload the file from workspace
     * @param fileNameFromWorkSpace - file which is to be upload
     */
    public void uploadAttachmentFromWorkspace(String fileNameFromWorkSpace) {
        EyeThink.core().click().onWeb(By.xpath("//div[@id='myTabbedContent']//span[contains(text(),'Attachment')]/..//div[@class='panel-heading']//*[text()='Add']"));
        EyeThink.core().switchTo().switchToFrame(By.xpath("//iframe[contains(@ng-src, 'apex') or contains(@src,'apex')]"));
        EyeThink.core().click().onWeb(By.xpath("//div[@id='Attachmentadd']//span[text()='Upload file from Workspace']"));
        EyeThink.core().click().onWeb((By.xpath("//div[@id='Attachmentadd']//td[text()='" + fileNameFromWorkSpace + "']/..//input")));
        EyeThink.saas().modal().clickModalContentSpecificButton("Attach");
        EyeThink.saas().modal().closeModalByClickingTopRightCloseButton();
    }

    public void clickRightHeaderBars(String title) {
        EyeThink.saas().phasePannel().clickParallelMenuBars(title);
    }

    public void assertThatFileIsDownloaded(String fileType){
        File file = new File(System.getProperty("user.dir") + "\\target");
        File[] directory = EyeThink.core().file().getCompleteFilesListOnLocalDirectory(file.getAbsolutePath());
        for (File files : directory) {
            if (files.getName().endsWith(".tmp")) {
                new File(files.getAbsolutePath().toString())
                        .renameTo(new File(file.getAbsolutePath() + "govgrant."+fileType+""));
                break;
            }
        }
        Assert.assertTrue(new File(file.getAbsolutePath() + "govgrant."+fileType+"").exists());
    }

    public void AssertFieldValueIsChecked(String fieldName,String count){
        Assert.assertEquals(Integer.parseInt(count),getCheckedFieldValueCount(fieldName));
    }
    
       /**
     * To get the count of row values checked for field available in flex table
     * @param fieldName - Field API name
     * @return
     */
    private int getCheckedFieldValueCount(String fieldName){
        List<Elements> checkSymbol = EyeThink.core().elementReference().listOfElements().onWeb(By.xpath("//field[@field-name='"+fieldName+"']/i[contains(@class,'fa-check')]"));
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
        if (null != EnvironmentFetcher.environmentName && !"".equalsIgnoreCase(EnvironmentFetcher.environmentName) && EnvironmentFetcher.environmentName.equalsIgnoreCase("QA")) {
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
        List<Elements> columnList = EyeThink.core().elementReference().listOfElements().onWeb(columnHeaders);

        // get the column index of required column.
        for (Elements columnEle : columnList){
            if (columnEle.getText().equalsIgnoreCase(columnName)){
                break;
            }
            counter++;
        }

        List<Elements> listOfDataInColumn = EyeThink.core().elementReference().listOfElements().onWeb(By.xpath("//div[@id='"+flexTableId+"']//th//span[text()='"+columnName+"']/ancestor::thead/parent::table//tr//td["+counter+"]/span/field/span"));
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
}