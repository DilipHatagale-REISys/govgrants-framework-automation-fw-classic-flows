package com.ggproduct.automation.projectmanager;

import eyethink.automation.bots.Register.EyeThink;
import eyethink.automation.bots.corelib.Emails;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.springframework.context.annotation.Description;

import javax.mail.MessagingException;
import java.awt.*;
import java.io.File;
import java.util.List;
import java.util.Map;


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

    /*
     * Handles association of various related records
     *
     * @param recordName
     * @param recordUniqueName
     * @param buttonName
     */
    public void chooseRecordForAssociation(String buttonName, String flexTableId, String... recordUniqueValues) {
        for (String recordUniqueValue : recordUniqueValues) {
            EyeThink.saas().quickSearch().performModalSpecificQuickSearch(flexTableId, recordUniqueValue);
            EyeThink.saas().mainPage().waitForNavigationLogoToDisappear();
            EyeThink.core().WaitFor().makeThreadSleep(1000);
            EyeThink.saas().flexTable().selectCheckBoxes(flexTableId, recordUniqueValue);
        }
        EyeThink.saas().phasePannel().clickAnyRightPannelButton(flexTableId, buttonName);
    }

    /**
     * Handles entering the comments in a confirmation box and click OK
     *
     * @param comments
     * @param confirmation
     */
    public void enteringCommentsOnConfirmation(String comments, String confirmation) {
        EyeThink.core().findMyElement().getElement(By.xpath("//form[@class='bootbox-form']//textarea")).sendKeys(comments);
        EyeThink.saas().modal().handleModalAlert(confirmation);
    }

    public void attemptDeletion(String columnValues, String tableId) {
        try {
            EyeThink.saas().flexTable().clickTableActionIcon(tableId, "Delete", columnValues);
        } catch (Exception e) {
        }
    }

    /*handles to get the record id of a record */
    public void getRecordIdFromResponse(String objectType, String recordName, String objectApiName) {
        EyeThink.saas().pageDetails().idOfRecord = (automationBatchExecuteApi(objectType, recordName, objectApiName)).asString().replace("\"", "");
    }

    /* handles to verify no record is present in flex table */
    public boolean isRecordPresentInTheFlexTable(String text, String tableId) {
        try {
            return  EyeThink.core().findMyElement().getElement(By.xpath("//div[@id='" + tableId + "']//*[" + EyeThink.core().xpath().contains("text()", text) + "]")).isDisplayed();
        } catch (Exception e) {
        }
        return false;
    }

    /*handles to verify blank value is present inside flex table */
    public boolean isColumnValueBlank(String fieldName) {
        WebElement fieldValue = EyeThink.core().findMyElement().getElement(By.xpath("//*[@field-name='" + fieldName + "' or @id='" + fieldName + "']"));
        String value = fieldValue.getText();
        if (value.equals("")) {
            return true;
        }
        return false;
    }

    public void assertColumnValuIsBlank(String fieldName) {
        Assert.assertTrue(isColumnValueBlank(fieldName));
    }

    /* handles to veify total records present in flex table */
    public String totalRecordsCount(String tableId) {
        return (EyeThink.core().findMyElement().getElement(By.xpath("//div[@id='" + tableId + "']//following-sibling::span[contains(text(),'Total Records')]"))).getText();
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
        List<WebElement> elements = EyeThink.core().findMyElement().getElements(pageBlock(pageblockName),false);
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
            EyeThink.core().findMyElement().getElement(expectedMsg);
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
        if (EyeThink.core().WaitFor().WaitForElementToBePresent(By.xpath("//div[@id='myTabbedContent']//a[@title='" + flexTableHeader + "']/../../../following-sibling::div//tbody//td//span[text()='" + value + "']")).isDisplayed())
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
        EyeThink.core().findMyElement().getElement(By.xpath("//div[@id='myTabbedContent']//span[contains(text(),'Attachment')]/..//div[@class='panel-heading']//*[text()='Add']")).click();
        EyeThink.core().switchTo().switchToFrame(By.xpath("//iframe[contains(@ng-src, 'apex') or contains(@src,'apex')]"));
        EyeThink.core().findMyElement().getElement(By.xpath("//div[@id='Attachmentadd']//span[text()='Upload file from Workspace']")).click();
        EyeThink.core().findMyElement().getElement(By.xpath("//div[@id='Attachmentadd']//td[text()='" + fileNameFromWorkSpace + "']/..//input")).click();
        EyeThink.saas().modal().clickModalContentSpecificButton("Attach");
        EyeThink.saas().modal().closeModalByClickingTopRightCloseButton();
    }

    /**
     * save file using robot class
     *
     * @throws AWTException
     */
    public void saveFile() throws AWTException {
        EyeThink.core().switchTo().switchToWindowHandler(1);
        EyeThink.core().WaitFor().makeThreadSleep(20000);
        EyeThink.core().RobotActions().ctrl_Save();
        EyeThink.core().WaitFor().makeThreadSleep(2000);
        EyeThink.core().RobotActions().Robot_Enter();
        EyeThink.core().WaitFor().makeThreadSleep(20000);
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
        List<WebElement> checkSymbol = EyeThink.core().findMyElement().getElements(By.xpath("//field[@field-name='"+fieldName+"']/i[contains(@class,'fa-check')]"));
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
}