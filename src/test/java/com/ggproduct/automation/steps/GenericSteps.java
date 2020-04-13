package com.ggproduct.automation.steps;

import com.ggproduct.automation.projectmanager.ProjectManager;
import eyethink.automation.bots.Register.EyeThink;
import eyethink.automation.bots.objects.Elements;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.springframework.context.annotation.Description;

import javax.mail.MessagingException;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.*;

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

    @Description("To verify text under attachment flex table")
    @Then("^I (softly see|see|do not see|softly do not see) \"([^\"]*)\" has been added in \"([^\"]*)\" flex table$")
    public void iSeeHasBeenAddedInFlexTable(String usage, String valueToBeSearch, String flexTableHeader) {
        if (usage.equals("see")) {
            Assert.assertTrue(projectManager.isValueInsideFlexTable(valueToBeSearch, flexTableHeader));
        } else if (usage.equals("do not see")) {
            Assert.assertFalse(projectManager.isValueInsideFlexTable(valueToBeSearch, flexTableHeader));
        } else if (usage.equals("softly see")) {
            EyeThink.core().assertion().assertThat(projectManager.isValueInsideFlexTable(valueToBeSearch, flexTableHeader)).isTrue();
        } else {
            EyeThink.core().assertion().assertThat(projectManager.isValueInsideFlexTable(valueToBeSearch, flexTableHeader)).isFalse();
        }
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
        if (usage.contains("softly")) {
            EyeThink.core().assertion().assertThat(projectManager.validateMailSubject(userType, subject)).isTrue();
        } else {
            Assert.assertTrue(projectManager.validateMailSubject(userType, subject));
        }
    }

    @Description("Navigate to last page of the flex table")
    @And("^I navigate to last page in flex table \"([^\"]*)\"$")
    public void iNavigateToLastPageInFlexTable(String flexTableId) {
        try {
            EyeThink.saas().flexTable().flexTablePagination(flexTableId, "Last");
        } catch (Exception e) {
            // eating exception....
        }
    }

    @Description("Get last value for specified column name in the flex table")
    @And("I get the value from row {string} for column name {string} in flex table {string}")
    public void iGetTheSpecifiedValueForColumnNameInFlexTable(String columnValueFromRow, String columnName, String flexTableId) {
        projectManager.iSavedSpecificValueFromFlexTable(columnValueFromRow, columnName, flexTableId);
    }

    @Description("Validation of equality for values of Schedule end date AND Reporting Period End Date")
    @Then("^I (verify|softly verify) that the Schedule end date is matching with Reporting Period End Date$")
    public void iVerifyThatTheScheduleEndDateIsMatchingWithReportingPeriodEndDate(String usage) {
        if (usage.contains("softly")) {
            EyeThink.core().assertion().assertThat(EyeThink.core().Properties().getValue("lastValueFromTableForCol"))
                    .isEqualTo(EyeThink.core().Properties().getValue("ScheduleEndDate"));
        } else {
            Assert.assertEquals(EyeThink.core().Properties().getValue("lastValueFromTableForCol"),
                    EyeThink.core().Properties().getValue("ScheduleEndDate"));
        }
    }

    @Then("^I (verify|softly verify) that the Schedule start date is matching with Reporting Period start Date$")
    public void iVerifyThatTheScheduleStartDateIsMatchingWithReportingPeriodStartDate(String usage) {
        if (usage.contains("softly")) {
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
        if (editable.equals("see")) {
            Assert.assertTrue(projectManager.verifyIfFieldsAreEditableInFlexTable(tableTitle));
        } else if (editable.equals("do not see")) {
            Assert.assertFalse(projectManager.verifyIfFieldsAreEditableInFlexTable(tableTitle));
        } else if (editable.equals("softly see")) {
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
        File[] list = EyeThink.core().file().getCompleteFilesListOnLocalDirectory(System.getProperty("user.dir") + "/target");
        for (File f : list) {
            if (fileName.equalsIgnoreCase(f.getName())) {
                yes = true;
            }
        }
        if (usage.contains("softly")) {
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
        } catch (Exception ex) {

        }
        if (usage.contains("softly")) {
            EyeThink.core().assertion().assertThat(verify).isTrue();
        } else {
            Assert.assertTrue(verify);
        }
    }

    @Then("^I (softly see|see) snapshot with name containing \"([^\"]*)\" as name$")
    public void iSeeSnapshotWithNameContainingAsName(String usage, String snapshotName) {
        if (usage.contains("softly")) {
            EyeThink.core().assertion().assertThat(EyeThink.core().elementReference().of(By.xpath("//tbody//tr//*[contains(text(),'" + snapshotName + "')]")).isDisplayed()).isTrue();
        } else {
            Assert.assertTrue(EyeThink.core().elementReference().of(By.xpath("//tbody//tr//*[contains(text(),'" + snapshotName + "')]")).isDisplayed());
        }
    }

    @And("I create multiple records from sheet {string} of {string} with following data")
    public void createMultipleData(String sheetName, String spreadsheetName, List<List<String>> testData) {
        String[][] data = EyeThink.core().file().excel().readExcelFile(spreadsheetName, sheetName);
        String currentSubTab = "";
        Map<String, Map<String, String>> map = EyeThink.core().convert().convertListOfListsToMapOfMaps(testData);

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

    @Then("^I (softly see|see) \"([^\"]*)\" image as \"([^\"]*)\"$")
    public void compareImages(String usage, String fieldLabel, String imageName) throws IOException {
        if (usage.contains("softly")) {
            EyeThink.core().assertion().assertThat(projectManager.assertRiskLevelImage(fieldLabel, imageName)).isTrue();
        } else {
            Assert.assertTrue(projectManager.assertRiskLevelImage(fieldLabel, imageName));
        }
    }

    @Then("^I (softly see|see) selected element \"([^\"]*)\"$")
    public void saveCurrentSelectedElementValue(String usage, String elementText) {
        if (usage.contains("softly")) {
            EyeThink.core().assertion().assertThat(projectManager.getSelectedSubTab(elementText)).isTrue();
        } else {
            Assert.assertTrue(projectManager.getSelectedSubTab(elementText));
        }
    }

    @Then("^I can (softly see|see) modal button \"([^\"]*)\"$")
    public void iCanSeeModalButton(String usage, String buttonName) {
        if (usage.contains("softly")) {
            EyeThink.core().assertion().assertThat(projectManager.isButtonDisplayedOnModal(buttonName)).isTrue();
        } else {
            Assert.assertTrue(projectManager.isButtonDisplayedOnModal(buttonName));
        }
    }

    @And("I upload document {string} of type {string}")
    public void iUploadDocumentOfType(String fileName, String fileType) {
        projectManager.uploadDocument(fileName, fileType);
    }

    @Then("^I (see|softly see) that Budget Period field contains the updated Budget Period End Date$")
    public void iSeeThatBudgetPeriodFieldContainsTheUpdatedBudgetPeriodEndDate(String usage) {
        if (usage.contains("softly")) {
            EyeThink.core().assertion().assertThat(EyeThink.saas().pageDetails().getFieldValue("Budget Period")).contains(EyeThink.saas().pageDetails().getFieldValue("Budget Period End Date"));
        } else {
            Assert.assertTrue(EyeThink.saas().pageDetails().getFieldValue("Budget Period").contains(EyeThink.saas().pageDetails().getFieldValue("Budget Period End Date")));
        }
    }

    @Description("handles to click on table Top right button which will not accept any alert if any")
    @When("I click table top right button {string} in flex table with id {string}")
    public void iClickTableTopRightButtonInFlexTableWithId(String buttonName, String flexTableId) {
        projectManager.clickTableTopRightButton(buttonName, flexTableId);
    }

    @And("I click {string} button in modal")
    public void iClickButtonInModal(String buttonName) {
        EyeThink.core().click().on(By.xpath("//div[@id='ModalDivID']//button[contains(text(),'" + buttonName + "')]"));
    }

    @Then("I see that approver is not present after searching in dropdown")
    public void iSeeThatApproverIsNotPresentAfterSearchingInDropdown() {
        WebElement ll = EyeThink.core().elementReference().of(By.xpath("//div[@id='select2-drop' and contains(@style,'block')]//li"));
        Assert.assertTrue(ll.getText().equalsIgnoreCase("No matches found"));
    }

    @And("I search {string} approver in flex table with id {string}")
    public void iSearchApproverInFlexTaableWithId(String user, String flexTableDivId) {
        EyeThink.core().elementReference().of((By.xpath("//div[@id='" + flexTableDivId + "']//td")));
        EyeThink.saas().flexTable().clickTableActionIcon(flexTableDivId, "Edit");
        EyeThink.core().click().on(By.xpath("//*[@id='" + flexTableDivId + "']//td[1]//span[@class='select2-chosen']"));
        EyeThink.core().enterText().in(By.xpath("//div[@id='select2-drop']//input[@class='select2-input']"), user);
    }

    @Then("^I (softly verify|verify) that All the following projects roles are available in picklist :$")
    public void iVerifyThatAllProjectsRolesAreAvailableInPicklist(String usage, List<String> projectRoles) {
        projectManager.compareContactListEquality(usage, projectRoles);
    }

    @Then("^I (softly see|see) that the saved value \"([^\"]*)\" and \"([^\"]*)\" are equal$")
    public void iSeeThatTheSavedValueAndAreEqual(String usage, String savedValue1, String savedValue2) {
        projectManager.compareTwoSavedStringValueEquality(usage, savedValue1, savedValue2);
    }

    @Then("^I (see|softly see) multiple selected options in \"([^\"]*)\":$")
    public void iSeeFollowingOptionsIn(String usage, String cellName, List<String> options) {
        projectManager.verifyMultipleSelectedOption(usage, cellName, options);
    }

    @Then("^I (softly see|see) initial budget balance \"([^\"]*)\" is decreased by \"([^\"]*)\" and is matched with current budget balance \"([^\"]*)\"$")
    public void iSeeInitialBudgetBalanceIsDecreasedByAndIsMatchedWithCurrentBudgetBalance(String usage, String iniBudgetBalance, String decreasedBy, String currentBalance) {
        projectManager.verifyBalanceBudget(usage, iniBudgetBalance, decreasedBy, currentBalance);
    }

    @Then("^I (softly see|see) grant details on modal and it gets enlarge$")
    public void iSeeGrantDetailsOnModalAndItGetsEnlarge(String usage) {
        projectManager.validateModalEnlargeAndGrantDetails(usage);
    }

    @And("^I (softly see|see) all the fields are present for site visit while initializing it$")
    public void iSeeAllTheFieldsArePresentForSiteVisit(String usage) {
        projectManager.allFieldsCheckSiteVisit(usage);
    }

    @Then("^I (softly cannot see|cannot see|softly see|see) field label \"([^\"]*)\" present on page under \"([^\"]*)\" table$")
    public void iDoNotSeeFieldLabelPresentOnPageUnderTable(String usage, String fieldLabel, String tableHeaderTitle) {
        if (usage.contains("softly")) {
            if (usage.contains("not")) {
                EyeThink.core().assertion().assertThat(projectManager.assertToCheckFieldPresentOnPageUnderSpecificTable(fieldLabel, tableHeaderTitle))
                        .isFalse().as("Field " + fieldLabel + " is still present on the page under table " + tableHeaderTitle);
            } else {
                EyeThink.core().assertion().assertThat(projectManager.assertToCheckFieldPresentOnPageUnderSpecificTable(fieldLabel, tableHeaderTitle))
                        .isTrue().as("Field " + fieldLabel + " is not present on the page under table " + tableHeaderTitle);
            }
        } else {
            if (usage.contains("not")) {
                Assert.assertFalse(
                        projectManager.assertToCheckFieldPresentOnPageUnderSpecificTable(fieldLabel, tableHeaderTitle)
                );
            } else {
                Assert.assertTrue(
                        projectManager.assertToCheckFieldPresentOnPageUnderSpecificTable(fieldLabel, tableHeaderTitle)
                );
            }
        }
    }

    @And("^I click on top right button \"([^\"]*)\" in notes flex table having header \"([^\"]*)\"$")
    public void clickOnTopButtonInFlexTable(String buttonName, String flextTableHeader){
        EyeThink.core().click().on(By.xpath("//*["+EyeThink.core().xpath().translate(flextTableHeader)+"]//ancestor::div[(@id and @class='ng-scope')]//button[text()='"+buttonName+"' or @title='"+buttonName+"']"));
    }

    @And("^I edit the notes$")
    public void iEditTheNotes() {
        EyeThink.core().click().on(By.xpath("//div[contains(@id,'toggleNotes')]//a[@title='Edit']"));
        By notesTitle = By.xpath("//div[@id='addAtt']//label[text()='Title']/..//input");
        By notesDescriptionPath = By.xpath("//div[@id='addAtt']//label[text()='Description']/..//textarea");
        EyeThink.core().enterText().clear(notesDescriptionPath);
        EyeThink.core().enterText().clear(notesTitle);
        EyeThink.core().enterText().in(notesTitle, "Updated Notes Record");
        EyeThink.core().enterText().in(notesDescriptionPath, "Updated Automation Notes");
    }

    @Description("Check the users status against value in Approval History table inside Hsitory Tab")
    @Then("I see {string} against {string} in approval history")
    public void seeStatusOfRecordInApprovalHistory(String seeThisString, String againstThisString) {
        By listOfsUsers = By.xpath("//div[@id='chevronBarId']//ul[1]//li//a");
        List<Elements> listOfLoc = EyeThink.core().elementReference().listOfElements().of(listOfsUsers);
        int expectedIndex = 0;
        for (int i=0; i<listOfLoc.size(); i++){
            if (listOfLoc.get(i).getText().trim().equalsIgnoreCase(againstThisString)){
                expectedIndex = expectedIndex + 1;
            }
        }

        EyeThink.core().assertion().assertThat(EyeThink.core().get().text("//div[@id='chevronBarId']//ul[2]//li["+expectedIndex+"]//a").trim()).isEqualToIgnoringCase(seeThisString);
    }

    @Description("Check the Application Due Date is Less/greater than today's Date")
    @Then("^I (softly see|see) field \"([^\"]*)\" contains date (less|greater) than todays date$")
    public void isFieldDateGreaterThanOrLessThanTodaysDate(String usage, String fieldLabel, String lessORgreater) throws ParseException {
        if (usage.contains("softly")) {
            EyeThink.core().assertion().assertThat(projectManager.isFieldDateGreaterThanOrLessThanTodaysDate(fieldLabel,lessORgreater)).isTrue();
        } else {
            Assert.assertTrue(projectManager.isFieldDateGreaterThanOrLessThanTodaysDate(fieldLabel,lessORgreater));
        }
    }

    @Description("To click on Submit Review modal button of Grantor Review")
    @And("^I click on modal button Submit Review$")
    public void iClickOnModalButtonSubmitReview() {
        try {
            By buttonPath = By.xpath("//div[@id='footerButtonsPanel']//*[text()='Submit Review' or @title='Submit Review']");
            EyeThink.core().click().on(buttonPath);
        } catch (Exception ee) {
            EyeThink.core().WaitFor().makeThreadSleep(5000);
            By buttonPath = By.xpath("//div[@id='footerButtonsPanel']//*[text()='Submit Review' or @title='Submit Review']");
            EyeThink.core().click().on(buttonPath);
        }
    }
}