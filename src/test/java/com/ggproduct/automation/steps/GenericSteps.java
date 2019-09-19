package com.ggproduct.automation.steps;

import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.Register.EyeThink;
import io.cucumber.java.en.*;
import org.junit.Assert;
import org.springframework.context.annotation.Description;
import javax.mail.MessagingException;
import java.io.File;
import java.util.List;

public class GenericSteps {
    ProjectManager projectManager;

    public GenericSteps() {
        projectManager = new ProjectManager();
    }

    @Given("^I delete the record \"([^\"]*)\" from the object \"([^\"]*)\"$")
    public void deleteTestData(String recordName, String objectType) {
        projectManager.deletionApi(recordName, objectType);
    }

    @Description("API call used to create a post award records i.e. Payment Request, Progress Report and Closout and will fetch the record ID for that record")
    @When("^I create a post award record \"([^\"]*)\" for the Award \"([^\"]*)\" having object api name as \"([^\"]*)\"$")
    public void iCreateAPostAwardRecordForTheAwardHavingObjectApiNameAs(String objectType, String recordName, String objectApiName) {
        projectManager.getRecordIdFromResponse(objectType, recordName, objectApiName);
    }

    @Description("To verify field value is blank in flex table")
    @Then("^I see field name \"([^\"]*)\" is blank in flex table$")
    public void iSeeFieldNameIsBlank(String fieldname) {
        projectManager.assertColumnValuIsBlank(fieldname);
    }

    @Description("To verify total records available under flex table")
    @Then("^I see total records count \"([^\"]*)\" in flex table \"([^\"]*)\"$")
    public void iSeeTotalRecordsCountInFlexTable(String totalRecords, String tableId) {
        projectManager.AssertTotalRecordsCountInFlexTable(totalRecords, tableId);
    }

    @Then("^I (can see|cannot see) page block \"([^\"]*)\"$")
    public void iCanSeeCannotSeePageBlock(String usage, String pageblockName) {
        projectManager.AssertPageBlockDisplayed(pageblockName, "can see".equalsIgnoreCase(usage));
    }

    @Description("To capture message on approval decision box")
    @Then("^I see the message \"([^\"]*)\" on approval decision box$")
    public void iSeeTheMessageOnApprovalDecisionBox(String message) {
        projectManager.captureMessageOnApprovalDecisionBox(message);
    }

    @Description("To get the field value from page block")
    @And("^I get the field value \"([^\"]*)\" from sub tab \"([^\"]*)\"$")
    public void iGetTheFieldValueFromSubTab(String fieldName, String subTabName) {
        projectManager.getFieldValue(fieldName, subTabName);
    }

    @Description("To compare two different field values")
    @Then("^I compare field \"([^\"]*)\" from sub tab \"([^\"]*)\" with expected field$")
    public void iCompareFieldFromSubTabWithExpectedField(String fieldName, String subTabName) {
        projectManager.assertTwoFieldValues(fieldName, subTabName);
    }

    @Description("To check no records displayed in flex table")
    @Then("^I see \"([^\"]*)\" inside flex table with id \"([^\"]*)\"$")
    public void iSeeInsideFlexTableWithId(String text, String tableID) {
        Assert.assertTrue(projectManager.isRecordPresentInTheFlexTable(text, tableID));
    }

    @Description("To verify text under attachment flex table")
    @Then("^I see \"([^\"]*)\" has been added in \"([^\"]*)\" flex table$")
    public void iSeeHasBeenAddedInFlexTable(String valueToBeSearch, String flexTableHeader) {
        projectManager.AssertFieldValueIsPresentInFlexTable(valueToBeSearch, flexTableHeader);
    }

    @Description("To upload attachment from default workspace")
    @And("^I upload attachment \"([^\"]*)\" from workspace$")
    public void iUploadAttachmentFromWorkspace(String fileNameToBeUpload) {
        projectManager.uploadAttachmentFromWorkspace(fileNameToBeUpload);
    }

    @When("^I click on top right parallel lines bar for \"([^\"]*)\"$")
    public void clickTopRightParallelLinesBar(String title) {
        projectManager.clickRightHeaderBars(title);
    }

    @Then("^I verify that \"([^\"]*)\" file is downloaded$")
    public void iVerifyThatPdfFileIsDownloaded(String fileType) {
        projectManager.assertThatFileIsDownloaded(fileType);
    }

    @Description("To verify no of rows checked for field name")
    @Then("^I can see \"([^\"]*)\" record value is checked for field name \"([^\"]*)\"$")
    public void iCanSeeRecordValueIsCheckedForFieldName(String count, String fieldName) {
        projectManager.AssertFieldValueIsChecked(fieldName,count);
    }

    @Given("^I can see mail notification for \"([^\"]*)\" user with following subject:$")
    public void iSeeMailSubject(String userType, List<String> subjectList) throws MessagingException {
        String subject = subjectList.get(0);
        Assert.assertTrue(projectManager.validateMailSubject(userType,subject));
    }

    @Description("Navigate to last page of the flex table")
    @And("I navigate to last page in flex table \"([^\"]*)\"")
    public void iNavigateToLastPageInFlexTable(String flexTableId) {
        try {
            EyeThink.saas().flexTable().flexTablePagination(flexTableId, "Last");
        } catch (Exception e){
            // eating exception....
        }
    }

    @Description("Get last value for specified column name in the flex table")
    @And("I get the value from row {string} for column name {string} in flex table {string}")
    public void iGetTheSpecifiedValueForColumnNameInFlexTable(String columnValueFromRow, String columnName, String flexTableId) {
        projectManager.iSavedSpecificValueFromFlexTable(columnValueFromRow, columnName,flexTableId);
    }

    @Description("Validation of equality for values of Schedule end date AND Reporting Period End Date")
    @Then("I verify that the Schedule end date is matching with Reporting Period End Date")
    public void iVerifyThatTheScheduleEndDateIsMatchingWithReportingPeriodEndDate() {
        Assert.assertEquals(EyeThink.core().Properties().getValue("lastValueFromTableForCol"),
                EyeThink.core().Properties().getValue("ScheduleEndDate"));
    }

    @Then("I verify that the Schedule start date is matching with Reporting Period start Date")
    public void iVerifyThatTheScheduleStartDateIsMatchingWithReportingPeriodStartDate() {
        Assert.assertEquals(EyeThink.core().Properties().getValue("lastValueFromTableForCol"),
                EyeThink.core().Properties().getValue("ScheduleStartDate"));
    }

    @When("^I save the value from row \"([^\"]*)\" for column name \"([^\"]*)\" as \"([^\"]*)\" from flex table \"([^\"]*)\"$")
    public void iSaveTheValueFromRowForColumnNameAsFromFlexTable(String columnValueFromRow, String columnName, String key, String flexTableId) {
        projectManager.iSavedSpecificValueFromFlexTableInsideGivenKey(columnValueFromRow, columnName, key, flexTableId);
    }

    @Then("^I (see|do not see) that the fields in flex table title as \"([^\"]*)\" are editable$")
    public void iSeeThatTheFieldsInFlexTableTitleAsAreEditable(String editable, String tableTitle) {
        if (editable.equals("see")){
            Assert.assertTrue(projectManager.verifyIfFieldsAreEditableInFlexTable(tableTitle));
        } else {
            Assert.assertFalse(projectManager.verifyIfFieldsAreEditableInFlexTable(tableTitle));
        }
    }

    @When("I add the Notes for progress report")
    public void iAddTheNotesForProgressReport() {
        projectManager.addNotesToPR();
    }

    @Then("I verify that the file {string} is downloaded")
    public void iVerifyThatTheFileIsDownloaded(String fileName) {
        EyeThink.core().WaitFor().makeThreadSleep(10000);
        boolean yes = false;
        File[] list = EyeThink.core().file().getCompleteFilesListOnLocalDirectory(System.getProperty("user.dir")+"/target");
        for (File f : list){
            if (fileName.equalsIgnoreCase(f.getName())){
                yes = true;
            }
        }
        Assert.assertTrue(yes);
    }

    @Then("I verify that field {string} is not editable by entering {string} value")
    public void iVerifyThatFieldIsNotEditableByEnteringValue(String fieldApi, String value) {

        boolean verify = true;
        try {
            EyeThink.saas().inputForms().inputFormDataByFieldApiName(fieldApi, value);
            verify = false;
        } catch (Exception ex){

        }
        Assert.assertTrue(verify);
    }
}