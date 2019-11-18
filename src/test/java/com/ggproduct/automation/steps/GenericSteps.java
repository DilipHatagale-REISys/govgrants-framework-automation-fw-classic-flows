package com.ggproduct.automation.steps;

import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.Register.EyeThink;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.springframework.context.annotation.Description;

import javax.mail.MessagingException;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

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
    @Then("^I (softly see|see) field name \"([^\"]*)\" is blank in flex table$")
    public void iSeeFieldNameIsBlank(String usage, String fieldname) {
        projectManager.assertColumnValuIsBlank(fieldname,
                usage.contains("softly")
                );
    }

    @Description("To verify total records available under flex table")
    @Then("^I (softly see|see) total records count \"([^\"]*)\" in flex table \"([^\"]*)\"$")
    public void iSeeTotalRecordsCountInFlexTable(String usage, String totalRecords, String tableId) {
        projectManager.AssertTotalRecordsCountInFlexTable(totalRecords,
                tableId,
                usage.contains("softly")
                );
    }

    @Then("^I (softly can see|can see|cannot see|softly cannot see) page block \"([^\"]*)\"$")
    public void iCanSeeCannotSeePageBlock(String usage, String pageblockName) {
        projectManager.AssertPageBlockDisplayed(pageblockName,
                "can see".equalsIgnoreCase(usage) || "softly can see".equalsIgnoreCase(usage),
                usage.contains("softly")
        );
    }

    @Description("To capture message on approval decision box")
    @Then("^I (softly see|see) the message \"([^\"]*)\" on approval decision box$")
    public void iSeeTheMessageOnApprovalDecisionBox(String usage, String message) {
        if (usage.contains("softly")){
            EyeThink.core().assertion().assertThat(projectManager.captureMessageOnApprovalDecisionBox(message)).isTrue();
        } else {
            Assert.assertTrue(projectManager.captureMessageOnApprovalDecisionBox(message));
        }
    }

    @Description("To get the field value from page block")
    @And("^I get the field value \"([^\"]*)\" from sub tab \"([^\"]*)\"$")
    public void iGetTheFieldValueFromSubTab(String fieldName, String subTabName) {
        projectManager.getFieldValue(fieldName, subTabName);
    }

    @Description("To compare two different field values")
    @Then("^I (compare|softly compare) field \"([^\"]*)\" from sub tab \"([^\"]*)\" with expected field$")
    public void iCompareFieldFromSubTabWithExpectedField(String usage, String fieldName, String subTabName) {
        projectManager.assertTwoFieldValues(fieldName,
                subTabName,
                usage.contains("softly")
        );
    }

    @Description("To check no records displayed in flex table")
    @Then("^I (softly see|see) \"([^\"]*)\" inside flex table with id \"([^\"]*)\"$")
    public void iSeeInsideFlexTableWithId(String usage, String text, String tableID) {
        if (usage.contains("softly")){
            EyeThink.core().assertion().assertThat(projectManager.isRecordPresentInTheFlexTable(text, tableID)).isTrue();
        } else {
            Assert.assertTrue(projectManager.isRecordPresentInTheFlexTable(text, tableID));
        }
    }

    @Description("To verify text under attachment flex table")
    @Then("^I (softly see|see) \"([^\"]*)\" has been added in \"([^\"]*)\" flex table$")
    public void iSeeHasBeenAddedInFlexTable(String usage, String valueToBeSearch, String flexTableHeader) {
        projectManager.AssertFieldValueIsPresentInFlexTable(valueToBeSearch,
                flexTableHeader,
                usage.contains("softly")
        );
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

    @Then("^I (verify|softly verify) that \"([^\"]*)\" file is downloaded$")
    public void iVerifyThatPdfFileIsDownloaded(String usage, String fileType) {
        projectManager.assertThatFileIsDownloaded(fileType,
                usage.contains("softly")
        );
    }

    @Description("To verify no of rows checked for field name")
    @Then("^I can (softly see|see) \"([^\"]*)\" record value is checked for field name \"([^\"]*)\"$")
    public void iCanSeeRecordValueIsCheckedForFieldName(String usage, String count, String fieldName) {
        projectManager.AssertFieldValueIsChecked(fieldName,
                count,
                usage.contains("softly")
        );
    }

    @Given("^I (softly can see|can see) mail notification for \"([^\"]*)\" user with following subject:$")
    public void iSeeMailSubject(String usage, String userType, List<String> subjectList) throws MessagingException {
        String subject = subjectList.get(0);
        if (usage.contains("softly")){
            EyeThink.core().assertion().assertThat(projectManager.validateMailSubject(userType,subject)).isTrue();
        } else {
            Assert.assertTrue(projectManager.validateMailSubject(userType, subject));
        }
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
    @Then("^I (verify|softly verify) that the Schedule end date is matching with Reporting Period End Date$")
    public void iVerifyThatTheScheduleEndDateIsMatchingWithReportingPeriodEndDate(String usage) {
        if (usage.contains("softly")){
            EyeThink.core().assertion().assertThat(EyeThink.core().Properties().getValue("lastValueFromTableForCol"))
                    .isEqualTo(EyeThink.core().Properties().getValue("ScheduleEndDate"));
        } else {
            Assert.assertEquals(EyeThink.core().Properties().getValue("lastValueFromTableForCol"),
                    EyeThink.core().Properties().getValue("ScheduleEndDate"));
        }
    }

    @Then("^I (verify|softly verify) that the Schedule start date is matching with Reporting Period start Date$")
    public void iVerifyThatTheScheduleStartDateIsMatchingWithReportingPeriodStartDate(String usage) {
        if (usage.contains("softly")){
            EyeThink.core().assertion().assertThat(EyeThink.core().Properties().getValue("lastValueFromTableForCol"))
                    .isEqualTo(EyeThink.core().Properties().getValue("ScheduleStartDate"));
        } else {
            Assert.assertEquals(EyeThink.core().Properties().getValue("lastValueFromTableForCol"),
                    EyeThink.core().Properties().getValue("ScheduleStartDate"));
        }
    }

    @When("^I save the value from row \"([^\"]*)\" for column name \"([^\"]*)\" as \"([^\"]*)\" from flex table \"([^\"]*)\"$")
    public void iSaveTheValueFromRowForColumnNameAsFromFlexTable(String columnValueFromRow, String columnName, String key, String flexTableId) {
        projectManager.iSavedSpecificValueFromFlexTableInsideGivenKey(columnValueFromRow, columnName, key, flexTableId);
    }

    @Then("^I (see|do not see|softly see|softly do not see) that the fields in flex table title as \"([^\"]*)\" are editable$")
    public void iSeeThatTheFieldsInFlexTableTitleAsAreEditable(String editable, String tableTitle) {
        if (editable.equals("see")){
            Assert.assertTrue(projectManager.verifyIfFieldsAreEditableInFlexTable(tableTitle));
        } else if(editable.equals("do not see")){
            Assert.assertFalse(projectManager.verifyIfFieldsAreEditableInFlexTable(tableTitle));
        } else if(editable.equals("softly see")){
            EyeThink.core().assertion().assertThat(projectManager.verifyIfFieldsAreEditableInFlexTable(tableTitle)).isTrue();
        } else {
            EyeThink.core().assertion().assertThat(projectManager.verifyIfFieldsAreEditableInFlexTable(tableTitle)).isFalse();
        }
    }

    @When("I add the Notes for progress report")
    public void iAddTheNotesForProgressReport() {
        projectManager.addNotesToPR();
    }

    @Then("^I (softly verify|verify) that the file \"([^\"]*)\" is downloaded$")
    public void iVerifyThatTheFileIsDownloaded(String usage, String fileName) {
        EyeThink.core().WaitFor().makeThreadSleep(10000);
        boolean yes = false;
        File[] list = EyeThink.core().file().getCompleteFilesListOnLocalDirectory(System.getProperty("user.dir")+"/target");
        for (File f : list){
            if (fileName.equalsIgnoreCase(f.getName())){
                yes = true;
            }
        }
        if (usage.contains("softly")){
            EyeThink.core().assertion().assertThat(yes).isTrue();
        } else {
            Assert.assertTrue(yes);
        }
    }

    @Then("^I (softly verify|verify) that field \"([^\"]*)\" is not editable by entering \"([^\"]*)\" value$")
    public void iVerifyThatFieldIsNotEditableByEnteringValue(String usage, String fieldApi, String value) {

        boolean verify = true;
        try {
            EyeThink.saas().inputForms().inputFormDataByFieldApiName(fieldApi, value, false);
            verify = false;
        } catch (Exception ex){

        }
        if (usage.contains("softly")){
            EyeThink.core().assertion().assertThat(verify).isTrue();
        } else {
            Assert.assertTrue(verify);
        }
    }

    @Then("^I (softly see|see) snapshot with name containing \"([^\"]*)\" as name$")
    public void iSeeSnapshotWithNameContainingAsName(String usage,String snapshotName) {
        if (usage.contains("softly")){
            EyeThink.core().assertion().assertThat(EyeThink.core().elementReference().of(By.xpath("//tbody//tr//*[contains(text(),'" + snapshotName + "')]")).isDisplayed()).isTrue();
        } else {
            Assert.assertTrue(EyeThink.core().elementReference().of(By.xpath("//tbody//tr//*[contains(text(),'" + snapshotName + "')]")).isDisplayed());
        }
    }

    @And("I create multiple records from sheet {string} of {string} with following data")
    public void createMultipleData(String sheetName, String spreadsheetName, List<List<String>> testData) {
        String [][] data = EyeThink.core().file().excel().readExcelFile(spreadsheetName, sheetName);
        String currentSubTab = "";
        Map<String, Map<String,String>> map= EyeThink.core().convert().convertListOfListsToMapOfMaps(testData);

        String key = map.keySet().iterator().next();
        Map<String, String> testDataMap = map.get(key);

        if (data != null) {

            for (int i = 2; i < data.length; i++) {
                int colLen = data[i].length;
                EyeThink.saas().mainPage().clickMainMenuBar(testDataMap.get("Navigation"));
                EyeThink.saas().sideBar().clickSideBarContent(testDataMap.get("subHeader"), testDataMap.get("subHeaderContent"));
                EyeThink.saas().flexTable().clickTableTopRightButton(testDataMap.get("FlexTableId"), testDataMap.get("PageDetailsButton"));

                for (int j = 0; j < colLen; j++) {
                    String subTab = data[0][j].trim();
                    String apiName = data[1][j].trim();
                    String value = data[i][j].trim();

                    if (subTab != null && !"None".equalsIgnoreCase(subTab) && !subTab.equalsIgnoreCase(currentSubTab)) {
                        EyeThink.saas().pageDetails().clickSubTabsInsideTableView(subTab);
                        currentSubTab = subTab;
                    }
                    EyeThink.saas().inputForms().inputFormDataByFieldApiName(apiName, value, false);
                }

                EyeThink.saas().modal().clickModalContentSpecificButton(testDataMap.get("ModalButton"));
                EyeThink.saas().pageDetails().clickAnyTopRightButton("Save");
            }
        }
    }

    @When("I create a risk assessment record for organization {string}")
    public void iCreateARiskAssessmentRecordForOrganization(String organizationName) {
        projectManager.riskAssessmentApi(organizationName);
    }

    @Then("I see {string} image as {string}")
    public void compareImages(String fieldLabel,String imageName) throws IOException, IOException {
        projectManager.assertRiskLevelImage(fieldLabel,imageName);
    }
}