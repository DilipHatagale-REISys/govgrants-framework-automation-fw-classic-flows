package com.ggproduct.automation.steps.grantor;

import com.helperPackage.handlers.govgrants;
import com.ggproduct.automation.projectmanager.GrantorProjectManager;
import com.ggproduct.automation.webservices.GrantorWebServices;
import com.helperPackage.objects.Elements;
import com.helperPackage.register.I;
import io.cucumber.java.Before;
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
import java.text.ParseException;
import java.util.List;
import java.util.Map;

public class GenericSteps {
    private GrantorProjectManager grantorProjectManager;
    private GrantorWebServices grantorWebServices;

    public GenericSteps(GrantorProjectManager grantorProjectManager, GrantorWebServices grantorWebServices) {
        this.grantorProjectManager = grantorProjectManager;
        this.grantorWebServices = grantorWebServices;
    }

    @Description("API call used to create a post award records i.e. Payment Request, Progress Report and Closout and will fetch the record ID for that record. These step we can only use after Award Activation")
    @When("^I create a post award record \"([^\"]*)\" for the Award \"([^\"]*)\" having object api name as \"([^\"]*)\"$")
    public void iCreateAPostAwardRecordForTheAwardHavingObjectApiNameAs(String objectType, String recordName, String objectApiName) {
        I.amPerforming().waitFor().makeThreadSleep(20000);
        grantorWebServices.getRecordIdFromResponse(objectType, recordName, objectApiName);
    }

    @Description("To verify field value is blank in flex table")
    @Then("^I (softly see|see) field name \"([^\"]*)\" is blank in flex table$")
    public void iSeeFieldNameIsBlank(String usage, String fieldname) {
        grantorProjectManager.assertColumnValuIsBlank(fieldname,
                usage.contains("softly")
        );
    }

    @Description("To verify total records available under flex table")
    @Then("^I (softly see|see) total records count \"([^\"]*)\" in flex table \"([^\"]*)\"$")
    public void iSeeTotalRecordsCountInFlexTable(String usage, String totalRecords, String tableId) {
        grantorProjectManager.AssertTotalRecordsCountInFlexTable(totalRecords,
                tableId,
                usage.contains("softly")
        );
    }

    @Then("^I (softly can see|can see|cannot see|softly cannot see) page block \"([^\"]*)\"$")
    public void iCanSeeCannotSeePageBlock(String usage, String pageblockName) {
        grantorProjectManager.AssertPageBlockDisplayed(pageblockName,
                "can see".equalsIgnoreCase(usage) || "softly can see".equalsIgnoreCase(usage),
                usage.contains("softly")
        );
    }

    @Description("To get the field value from page block")
    @And("^I get the field value \"([^\"]*)\" from sub tab \"([^\"]*)\"$")
    public void iGetTheFieldValueFromSubTab(String fieldName, String subTabName) {
        grantorProjectManager.getFieldValue(fieldName, subTabName);
    }

    @Description("To compare two different field values")
    @Then("^I (compare|softly compare) field \"([^\"]*)\" from sub tab \"([^\"]*)\" with expected field$")
    public void iCompareFieldFromSubTabWithExpectedField(String usage, String fieldName, String subTabName) {
        grantorProjectManager.assertTwoFieldValues(fieldName,
                subTabName,
                usage.contains("softly")
        );
    }

    @Description("To verify text under attachment flex table")
    @Then("^I (softly see|see|do not see|softly do not see) \"([^\"]*)\" has been added in \"([^\"]*)\" flex table$")
    public void iSeeHasBeenAddedInFlexTable(String usage, String valueToBeSearch, String flexTableHeader) {
        if (usage.equals("see")) {
            Assert.assertTrue(grantorProjectManager.isValueInsideFlexTable(valueToBeSearch, flexTableHeader));
        } else if (usage.equals("do not see")) {
            Assert.assertFalse(grantorProjectManager.isValueInsideFlexTable(valueToBeSearch, flexTableHeader));
        } else if (usage.equals("softly see")) {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.isValueInsideFlexTable(valueToBeSearch, flexTableHeader)).isTrue();
        } else {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.isValueInsideFlexTable(valueToBeSearch, flexTableHeader)).isFalse();
        }
    }

    @Description("To upload attachment from default workspace")
    @And("^I upload attachment \"([^\"]*)\" from workspace$")
    public void iUploadAttachmentFromWorkspace(String fileNameToBeUpload) {
        grantorProjectManager.uploadAttachmentFromWorkspace(fileNameToBeUpload);
    }

    @When("^I click on top right parallel lines bar for \"([^\"]*)\"$")
    public void clickTopRightParallelLinesBar(String title) {
        grantorProjectManager.clickRightHeaderBars(title);
    }

    @Then("^I (verify|softly verify) that \"([^\"]*)\" file is downloaded$")
    public void iVerifyThatPdfFileIsDownloaded(String usage, String fileType) {
        grantorProjectManager.assertThatFileIsDownloaded(fileType,
                usage.contains("softly")
        );
    }

    @Description("To verify no of rows checked for field name")
    @Then("^I can (softly see|see) \"([^\"]*)\" record value is checked for field name \"([^\"]*)\"$")
    public void iCanSeeRecordValueIsCheckedForFieldName(String usage, String count, String fieldName) {
        grantorProjectManager.AssertFieldValueIsChecked(fieldName,
                count,
                usage.contains("softly")
        );
    }

    @Given("^I (softly can see|can see) mail notification for \"([^\"]*)\" user with following subject:$")
    public void iSeeMailSubject(String usage, String userType, List<String> subjectList) throws MessagingException {
        String subject = subjectList.get(0);
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.validateMailSubject(userType, subject)).isTrue();
        } else {
            Assert.assertTrue(grantorProjectManager.validateMailSubject(userType, subject));
        }
    }

    @Description("Navigate to last page of the flex table")
    @And("^I navigate to last page in flex table \"([^\"]*)\"$")
    public void iNavigateToLastPageInFlexTable(String flexTableId) {
        try {
            govgrants.perform().flexTable().flexTablePagination(flexTableId, "Last");
        } catch (Exception e) {
            // eating exception....
        }
    }

    @Description("Get last value for specified column name in the flex table")
    @And("I get the value from row {string} for column name {string} in flex table {string}")
    public void iGetTheSpecifiedValueForColumnNameInFlexTable(String columnValueFromRow, String columnName, String flexTableId) {
        grantorProjectManager.iSavedSpecificValueFromFlexTable(columnValueFromRow, columnName, flexTableId);
    }

    @Description("Validation of equality for values of Schedule end date AND Reporting Period End Date")
    @Then("^I (verify|softly verify) that the Schedule end date is matching with Reporting Period End Date$")
    public void iVerifyThatTheScheduleEndDateIsMatchingWithReportingPeriodEndDate(String usage) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().propertiesFileOperationsTo().getValue("lastValueFromTableForCol"))
                    .isEqualTo(I.amPerforming().propertiesFileOperationsTo().getValue("ScheduleEndDate"));
        } else {
            Assert.assertEquals(I.amPerforming().propertiesFileOperationsTo().getValue("lastValueFromTableForCol"),
                    I.amPerforming().propertiesFileOperationsTo().getValue("ScheduleEndDate"));
        }
    }

    @Then("^I (verify|softly verify) that the Schedule start date is matching with Reporting Period start Date$")
    public void iVerifyThatTheScheduleStartDateIsMatchingWithReportingPeriodStartDate(String usage) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().propertiesFileOperationsTo().getValue("lastValueFromTableForCol"))
                    .isEqualTo(I.amPerforming().propertiesFileOperationsTo().getValue("ScheduleStartDate"));
        } else {
            Assert.assertEquals(I.amPerforming().propertiesFileOperationsTo().getValue("lastValueFromTableForCol"),
                    I.amPerforming().propertiesFileOperationsTo().getValue("ScheduleStartDate"));
        }
    }

    @Then("^I (see|do not see|softly see|softly do not see) that the fields in flex table title as \"([^\"]*)\" are editable$")
    public void iSeeThatTheFieldsInFlexTableTitleAsAreEditable(String editable, String tableTitle) {
        if (editable.equals("see")) {
            Assert.assertTrue(grantorProjectManager.verifyIfFieldsAreEditableInFlexTable(tableTitle));
        } else if (editable.equals("do not see")) {
            Assert.assertFalse(grantorProjectManager.verifyIfFieldsAreEditableInFlexTable(tableTitle));
        } else if (editable.equals("softly see")) {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.verifyIfFieldsAreEditableInFlexTable(tableTitle)).isTrue();
        } else {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.verifyIfFieldsAreEditableInFlexTable(tableTitle)).isFalse();
        }
    }

    @When("I add the Notes for progress report")
    public void iAddTheNotesForProgressupdatingOfReportWith() {
        grantorProjectManager.addNotesToPR();
    }

    @Then("^I (softly verify|verify) that the file \"([^\"]*)\" is downloaded$")
    public void iVerifyThatTheFileIsDownloaded(String usage, String fileName) {
        I.amPerforming().waitFor().makeThreadSleep(10000);
        boolean yes = false;
        File[] list = I.amPerforming().fileHandling().toGetCompleteFilesListOnLocalDirectory(System.getProperty("user.dir") + "/target");
        for (File f : list) {
            if (fileName.equalsIgnoreCase(f.getName())) {
                yes = true;
            }
        }
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(yes).isTrue();
        } else {
            Assert.assertTrue(yes);
        }
    }

    @Then("^I (softly verify|verify) that field \"([^\"]*)\" is not editable by entering \"([^\"]*)\" value$")
    public void iVerifyThatFieldIsNotEditableByEnteringValue(String usage, String fieldApi, String value) {

        boolean verify = true;
        try {
            govgrants.perform().inputForms().inputFormDataByFieldApiName(fieldApi, value, false);
            verify = false;
        } catch (Exception ex) {

        }
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(verify).isTrue();
        } else {
            Assert.assertTrue(verify);
        }
    }

    @Then("^I (softly see|see) snapshot with name containing \"([^\"]*)\" as name$")
    public void iSeeSnapshotWithNameContainingAsName(String usage, String snapshotName) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().getElementReference().of(By.xpath("//tbody//tr//*[contains(text(),'" + snapshotName + "')]")).isDisplayed()).isTrue();
        } else {
            Assert.assertTrue(I.amPerforming().getElementReference().of(By.xpath("//tbody//tr//*[contains(text(),'" + snapshotName + "')]")).isDisplayed());
        }
    }

    @And("I create multiple records from sheet {string} of {string} with following data")
    public void createMultipleData(String sheetName, String spreadsheetName, List<List<String>> testData) {
        String[][] data = I.amPerforming().fileHandling().forExcelAnd().readExcelFile(spreadsheetName, sheetName);
        String currentSubTab = "";
        Map<String, Map<String, String>> map = I.amPerforming().conversionOf().listOfListsToMapOfMaps(testData);

        String key = map.keySet().iterator().next();
        Map<String, String> testDataMap = map.get(key);

        if (data != null) {

            for (int i = 2; i < data.length; i++) {
                int colLen = data[i].length;
                govgrants.perform().mainPage().clickMainMenuBar(testDataMap.get("Navigation"));
                govgrants.perform().sideBar().clickSideBarContent(testDataMap.get("subHeader"), testDataMap.get("subHeaderContent"));
                govgrants.perform().flexTable().clickTableTopRightButton(testDataMap.get("FlexTableId"), testDataMap.get("PageDetailsButton"));

                for (int j = 0; j < colLen; j++) {
                    String subTab = data[0][j].trim();
                    String apiName = data[1][j].trim();
                    String value = data[i][j].trim();

                    if (subTab != null && !"None".equalsIgnoreCase(subTab) && !subTab.equalsIgnoreCase(currentSubTab)) {
                        govgrants.perform().pageDetails().clickSubTabsInsideTableView(subTab);
                        currentSubTab = subTab;
                    }
                    govgrants.perform().inputForms().inputFormDataByFieldApiName(apiName, value, false);
                }

                govgrants.perform().modal().clickModalContentSpecificButton(testDataMap.get("ModalButton"));
                govgrants.perform().pageDetails().clickAnyTopRightButton("Save");
            }
        }
    }

    @When("I create a risk assessment record for organization {string}")
    public void iCreateARiskAssessmentRecordForOrganization(String organizationName) {
        grantorWebServices.riskAssessmentApi(organizationName);
    }

    @Then("^I (softly see|see) \"([^\"]*)\" image as \"([^\"]*)\"$")
    public void compareImages(String usage, String fieldLabel, String imageName) throws IOException {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.assertRiskLevelImage(fieldLabel, imageName)).isTrue();
        } else {
            Assert.assertTrue(grantorProjectManager.assertRiskLevelImage(fieldLabel, imageName));
        }
    }

    @Then("^I (softly see|see) selected element \"([^\"]*)\"$")
    public void saveCurrentSelectedElementValue(String usage, String elementText) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.getSelectedSubTab(elementText)).isTrue();
        } else {
            Assert.assertTrue(grantorProjectManager.getSelectedSubTab(elementText));
        }
    }

    @Then("^I can (softly see|see) modal button \"([^\"]*)\"$")
    public void iCanSeeModalButton(String usage, String buttonName) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.isButtonDisplayedOnModal(buttonName)).isTrue();
        } else {
            Assert.assertTrue(grantorProjectManager.isButtonDisplayedOnModal(buttonName));
        }
    }

    @And("I upload document {string} of type {string}")
    public void iUploadDocumentOfType(String fileName, String fileType) {
        grantorProjectManager.uploadDocument(fileName, fileType);
    }

    @Then("^I (see|softly see) that Budget Period field contains the updated Budget Period End Date$")
    public void iSeeThatBudgetPeriodFieldContainsTheUpdatedBudgetPeriodEndDate(String usage) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(govgrants.perform().pageDetails().getFieldValue("Budget Period")).contains(govgrants.perform().pageDetails().getFieldValue("Budget Period End Date"));
        } else {
            Assert.assertTrue(govgrants.perform().pageDetails().getFieldValue("Budget Period").contains(govgrants.perform().pageDetails().getFieldValue("Budget Period End Date")));
        }
    }

    @Description("handles to click on table Top right button which will not accept any alert if any")
    @When("I click table top right button {string} in flex table with id {string}")
    public void iClickTableTopRightButtonInFlexTableWithId(String buttonName, String flexTableId) {
        grantorProjectManager.clickTableTopRightButton(buttonName, flexTableId);
    }

    @And("I click {string} button in modal")
    public void iClickButtonInModal(String buttonName) {
        I.amPerforming().click().on(By.xpath("//div[@id='ModalDivID']//button[contains(text(),'" + buttonName + "')]"));
    }

    @Then("^I (softly verify|verify) that All the following projects roles are available in picklist :$")
    public void iVerifyThatAllProjectsRolesAreAvailableInPicklist(String usage, List<String> projectRoles) {
        grantorProjectManager.compareContactListEquality(usage, projectRoles);
    }

    @Then("^I (softly see|see|softly cannot see) that the saved value \"([^\"]*)\" and \"([^\"]*)\" are equal$")
    public void iSeeThatTheSavedValueAndAreEqual(String usage, String savedValue1, String savedValue2) {
        grantorProjectManager.compareTwoSavedStringValueEquality(usage, savedValue1, savedValue2);
    }

    @Then("^I (softly see|see) initial budget balance \"([^\"]*)\" is decreased by \"([^\"]*)\" and is matched with current budget balance \"([^\"]*)\"$")
    public void iSeeInitialBudgetBalanceIsDecreasedByAndIsMatchedWithCurrentBudgetBalance(String usage, String iniBudgetBalance, String decreasedBy, String currentBalance) {
        grantorProjectManager.verifyBalanceBudget(usage, iniBudgetBalance, decreasedBy, currentBalance);
    }

    @Then("^I (softly see|see) grant details on modal and it gets enlarge$")
    public void iSeeGrantDetailsOnModalAndItGetsEnlarge(String usage) {
        grantorProjectManager.validateModalEnlargeAndGrantDetails(usage);
    }

    @And("^I (softly see|see) all the fields are present for site visit while initializing it$")
    public void iSeeAllTheFieldsArePresentForSiteVisit(String usage) {
        grantorProjectManager.allFieldsCheckSiteVisit(usage);
    }

    @Then("^I (softly cannot see|cannot see|softly see|see) field label \"([^\"]*)\" present on page under \"([^\"]*)\" table$")
    public void iDoNotSeeFieldLabelPresentOnPageUnderTable(String usage, String fieldLabel, String tableHeaderTitle) {
        if (usage.contains("softly")) {
            if (usage.contains("not")) {
                I.amPerforming().assertionsTo().assertThat(grantorProjectManager.assertToCheckFieldPresentOnPageUnderSpecificTable(fieldLabel, tableHeaderTitle))
                        .isFalse().as("Field " + fieldLabel + " is still present on the page under table " + tableHeaderTitle);
            } else {
                I.amPerforming().assertionsTo().assertThat(grantorProjectManager.assertToCheckFieldPresentOnPageUnderSpecificTable(fieldLabel, tableHeaderTitle))
                        .isTrue().as("Field " + fieldLabel + " is not present on the page under table " + tableHeaderTitle);
            }
        } else {
            if (usage.contains("not")) {
                Assert.assertFalse(
                        grantorProjectManager.assertToCheckFieldPresentOnPageUnderSpecificTable(fieldLabel, tableHeaderTitle)
                );
            } else {
                Assert.assertTrue(
                        grantorProjectManager.assertToCheckFieldPresentOnPageUnderSpecificTable(fieldLabel, tableHeaderTitle)
                );
            }
        }
    }

    @And("^I click on top right button \"([^\"]*)\" in notes flex table having header \"([^\"]*)\"$")
    public void clickOnTopButtonInFlexTable(String buttonName, String flextTableHeader) {
        I.amPerforming().click().on(By.xpath("//*[" + I.amPerforming().sanityOfXpathTo().translate(flextTableHeader) + "]//ancestor::div[(@id and @class='ng-scope')]//button[text()='" + buttonName + "' or @title='" + buttonName + "']"));
    }

    @Description("Check the users status against value in Approval History table inside Hsitory Tab")
    @Then("I see {string} against {string} in approval history")
    public void seeStatusOfRecordInApprovalHistory(String seeThisString, String againstThisString) {
        By listOfsUsers = By.xpath("//div[@id='chevronBarId']//ul[1]//li//a");
        List<Elements> listOfLoc = I.amPerforming().getElementReference().forListOfElements().of(listOfsUsers);
        int expectedIndex = 0;
        for (int i = 0; i < listOfLoc.size(); i++) {
            expectedIndex = expectedIndex + 1;
            if (listOfLoc.get(i).getText().trim().equalsIgnoreCase(againstThisString)) {
                break;
            }
        }
        I.amPerforming().assertionsTo().assertThat(I.amPerforming().actionToGet().text(By.xpath("//div[@id='chevronBarId']//ul[2]//li[" + expectedIndex + "]//a")).trim()).isEqualToIgnoringCase(seeThisString);
    }

    @Description("Check the Application Due Date is Less/greater than today's Date")
    @Then("^I (softly see|see) field \"([^\"]*)\" contains date (less|greater) than todays date$")
    public void isFieldDateGreaterThanOrLessThanTodaysDate(String usage, String fieldLabel, String lessORgreater) throws ParseException {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.isFieldDateGreaterThanOrLessThanTodaysDate(fieldLabel, lessORgreater)).isTrue();
        } else {
            Assert.assertTrue(grantorProjectManager.isFieldDateGreaterThanOrLessThanTodaysDate(fieldLabel, lessORgreater));
        }
    }

    @Description("Check the Application Due Date is Less/greater than today's Date")
    @Then("^I (softly see|see) field \"([^\"]*)\" contains date (less|greater) than \"([^\"]*)\" date$")
    public void isFieldDateGreaterThanOrLessThanExpectedDate(String usage, String fieldLabel1, String lessORgreater, String fieldLabel2) throws ParseException {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(grantorProjectManager.isFieldDateGreaterThanOrLessThanExpectedDate(fieldLabel1, lessORgreater, fieldLabel2)).isTrue();
        } else {
            Assert.assertTrue(grantorProjectManager.isFieldDateGreaterThanOrLessThanExpectedDate(fieldLabel1, lessORgreater, fieldLabel2));
        }
    }

    @Description("To click on Submit Review modal button of Grantor Review")
    @And("^I click on modal button Submit Review$")
    public void iClickOnModalButtonSubmitReview() {
        try {
            By buttonPath = By.xpath("//div[@id='footerButtonsPanel']//*[text()='Submit Review' or @title='Submit Review']");
            I.amPerforming().click().on(buttonPath);
        } catch (Exception ee) {
            I.amPerforming().waitFor().makeThreadSleep(5000);
            By buttonPath = By.xpath("//div[@id='footerButtonsPanel']//*[text()='Submit Review' or @title='Submit Review']");
            I.amPerforming().click().on(buttonPath);
        }
    }

    @Then("^I (softly see|see) following details for email sent under collab:$")
    public void iSoftlySeeFollowingDetailsForEmailSentUnderCollab(String usage, List<List<String>> text) {
        for (int i = 0; i < text.size(); i++) {
            By path = By.xpath("//div[@id='sendEmail']//*[text()='" + text.get(i).get(0) + "']");
            I.amPerforming().assertionsTo().assertThat(I.amPerforming().checkToSee().isDisplayed(path)).isTrue();
        }
    }

    @Before(order = 5)
    public void initializeData() {
        grantorProjectManager.initData();
    }

    @And("I delete all rows inside flex table with id {string}")
    public void performDeleteActionForAllRows(String flexTableId) {
        grantorProjectManager.clickAllDeleteButtonsInsideFlexTable(flexTableId);
    }

    @And("I clear all the filter from the table id {string}")
    public void iClearAllTheFilterFromTheTableId(String filterTableId) {
        By clearAll = By.xpath("//*[@id='" + filterTableId + "']//*[@title='Clear All']//i");
        I.amPerforming().click().on(clearAll);
    }

    @And("I enter value {string} in my feed section and share the post")
    public void iEnterValueInMyFeedSectionAndShareThePost(String value) {
        By feedSection = By.xpath("//div/textarea[@class='mention-for-post']");
        I.amPerforming().textInput().in(feedSection, value);
        I.amPerforming().waitFor().makeThreadSleep(2000);
        I.amPerforming().click().on(By.xpath("//div[@class='mentions-input-box']//div[3]"));
        I.amPerforming().click().on(By.xpath("//div/input[@id='PostToFeedButton']"));
    }

    @Given("I initiated an application review for application {string} on announcement {string} with properties {string}")
    public void iInitiatedAnApplicationReviewOnAnnouncement(String applicationTitle, String announcmentTitle, String filter) {
        I.amPerforming().waitFor().makeThreadSleep(20000); //ToDO- This API gets failed as It needs Announcement Record, So added wait time as of now
        grantorWebServices.initateApplicationReviewOnAnnouncement(applicationTitle, announcmentTitle, filter);
    }

    @Given("I created approved FDM on application {string}")
    public void iCreatedApprovedFDMWithProperties(String applicationName) {
        I.amPerforming().waitFor().makeThreadSleep(40000); //ToDO- This API gets failed as It needs Application Record, So added wait time as of now
        grantorWebServices.approveDFM(applicationName);
    }

    @Given("I reviewed the application {string}")
    public void reviewedApplication(String applicationName) {
        I.amPerforming().waitFor().makeThreadSleep(40000); //ToDO- This API gets failed as It needs Application Record, So added wait time as of now
        grantorWebServices.reviewedApplication(applicationName);
    }

    @Given("I activate award from FDM having application name {string}")
    public void iActivateAwardFromDFMWith(String applicationName) {
        grantorWebServices.activateFMD(applicationName);
    }

    @Given("I created award from approved FDM with announcement {string}")
    public void iCreatedAwardFromApprovedFDMWithAnnouncement(String announcementName) {
        grantorWebServices.createAwardFromFDM(announcementName);
    }

    @Given("I created award from approved FDM with announcement {string} and properties {string}")
    public void iCreatedAwardFromApprovedFDMWithAnnouncement(String announcementName, String Type) {
        grantorWebServices.createAwardFromFDM(announcementName, Type);
    }

    @And("I published {string} type announcement having name {string} and properties {string}")
    public void iPublishedTypeAnnouncementHavingNameAndProperties(String annType, String annName, String filter) {
        String newAnnName = annName + I.amPerforming().addOnsTo().getRandomNumber();
        I.amPerforming().propertiesFileOperationsTo().saveValue(annName, newAnnName);
        annName = newAnnName;
        grantorWebServices.publishAnnouncment(annType, annName, filter);
    }

    @And("I activated standalone subaward {string} with properties {string}")
    public void iActivatedStandaloneSubawardWithProperties(String grantName, String filter) {
        String newGrantName = grantName + I.amPerforming().addOnsTo().getRandomNumber();
        I.amPerforming().propertiesFileOperationsTo().saveValue(grantName, newGrantName);
        grantName = newGrantName;
        grantorWebServices.activateSubaward(grantName, filter);
    }

    @And("I activated standalone subaward {string} with properties {string} of type {string}")
    public void iActivatedStandaloneSubawardWithPropertiesAndType(String grantName, String filter, String Type) {
        String newGrantName = grantName + I.amPerforming().addOnsTo().getRandomNumber();
        I.amPerforming().propertiesFileOperationsTo().saveValue(grantName, newGrantName);
        grantName = newGrantName;
        grantorWebServices.activateSubaward(grantName, filter, Type);
    }

    @And("I click on submit review")
    public void iClickOnSubmitReview() {
        By submit_button = By.xpath("//div[@class='panel-footer']//div[@id='footerButtonsPanel']//*[text()='Submit Review' or @title='Submit Review']");
        I.amPerforming().click().on(submit_button);
    }

    @And("I click on Menu icon present on top right corner of the page")
    public void iClickOnMenuIconPresentOnTopRightCornerOfThePage() {
        By menu = By.xpath("//*[contains(@class,'overview-header')]//*[@title='Menu' or (contains(@class,'menu') and (@class='bars'))]");
        I.amPerforming().click().on(menu);
    }

    @And("I upload the attachment {string} of type {string} from computer")
    public void uploadAttachmentFromComputer(String fileName, String fileClassificationType) {
        By classificationType = By.xpath("//select[@title='Classification' or @name='Classification']");
        By filePath = By.xpath("//label[contains(@id,'file')]/../input");
        String defaultFilePath = System.getProperty("user.dir") + "/src/main/resources/";
        I.amPerforming().dropDownSelection().from(classificationType).selectByValue(fileClassificationType);
        I.amPerforming().textInput().in(filePath, defaultFilePath + fileName);
        I.amPerforming().click().on(By.xpath("//button[text()='Upload']"));
    }

    @And("I enter value {string} in email body")
    public void iEnterValueIntoEmailBody(String enterValue) {
        By emailBody = By.xpath("//body[contains(@id,'accountInvitation')]");
        I.amPerforming().textInput().in(emailBody, enterValue);
    }

    @Then("^I (softly see|softly cannot see|cannot see|see) column \"([^\"]*)\" inside row \"([^\"]*)\" at position \"([^\"]*)\" contains text \"([^\"]*)\"$")
    public void iSeeInsideRowOfIndexAndColumnIndex(String usage, String colName, String rowNo, String tData, String text) {
        grantorProjectManager.assertTextInHistoryTable(usage, colName, rowNo, tData, text);
    }

    @And("^I (see|softly see|do not see|softly do not see) field \"([^\"]*)\" as \"([^\"]*)\" in \"([^\"]*)\" pageblock$")
    public void iSeeFieldStatusInPageBlock(String usage, String fieldName, String fieldValue, String pageblockName) {
        grantorProjectManager.seeFieldStatusInPageBlock(usage, fieldName, fieldValue, pageblockName);
    }

    @Then("^I (see|softly see|do not see|softly do not see) \"([^\"]*)\" button is displayed On Modal$")
    public void assertButtonDisplayedOnModal(String usage, String buttonName) {
        grantorProjectManager.assertButtonDisplayedOnModal(usage, buttonName);
    }
}