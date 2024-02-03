package com.ggproduct.automation.steps.govgrantsSteps;

import com.helperPackage.exception.TestingBlazeCustomException;
import com.helperPackage.register.I;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import jdk.jfr.Description;
import org.junit.Assert;

import java.util.List;

public final class GovGrantsProductSteps {
    private GovGrantsProductObjects ggProductObjects;

    public GovGrantsProductSteps(GovGrantsProductObjects ggProductObjects) {
        this.ggProductObjects = ggProductObjects;
    }

    /****** Product Generic Individual Steps ***********/

    /******* Flex Table ***********/

    @Description("To save the values of specific column of table")
    @When("^I save the value from row \"([^\"]*)\" for column name \"([^\"]*)\" as \"([^\"]*)\" from flex table \"([^\"]*)\"$")
    public void iSaveTheValueFromRowForColumnNameAsFromFlexTable(String columnValueFromRow, String columnName, String key, String flexTableId) {
        ggProductObjects.iSavedSpecificValueFromFlexTableInsideGivenKey(columnValueFromRow, columnName, key, flexTableId);
    }

    @Description("To save the link values of specific column of table")
    @And("I save the link value from row {string} for column name {string} as {string} from flex table {string}")
    public void iSaveTheLinkValueFromRowForColumnNameAsFromFlexTable(String columnValueFromRow, String columnName, String key, String flexTableId) {
        ggProductObjects.iSavedSpecificLinkValueFromFlexTableInsideGivenKey(columnValueFromRow, columnName, key, flexTableId);

    }

    @Description("To assert if the given value is present in the flextable")
    @Then("^I (see|softly see) that \"([^\"]*)\" has been added in flextable with Id \"([^\"]*)\"$")
    public void assertColumnOnTable(String usage, String columnUniqueValue, String flextableId) {
        ggProductObjects.assertColumnOnTable(
                columnUniqueValue,
                flextableId,
                usage.contains("softly")
        );
    }

    @Description("To check no records displayed in flex table")
    @Then("^I (softly see|see|do not see|softly do not see) \"([^\"]*)\" inside flex table with id \"([^\"]*)\"$")
    public void iSeeInsideFlexTableWithId(String usage, String text, String tableID) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(ggProductObjects.isRecordPresentInTheFlexTable(text, tableID)).isTrue();
        } else {
            Assert.assertTrue(ggProductObjects.isRecordPresentInTheFlexTable(text, tableID));
        }
    }

    /******* Input Field(s) ***********/
    @Description("To fill the review form")
    @When("^I complete filling in the Review form with recommendation \"([^\"]*)\"$")
    public void iCompleteFillingInTheReviewFormWithRecommendation(String recommendation) {
        ggProductObjects.fillInReviewForm(
                recommendation
        );
    }

    @When("I complete filling in the Review form with recommendation {string} in review step")
    public void iCompleteFillingInTheReviewFormWithRecommendationInReviewStep(String recommendation) {
        ggProductObjects.fillingInReviewForm(
                recommendation
        );
    }

    @Description("Enter a Peer Review with the given rating")
    @When("^I enter a review as \"([^\"]*)\"$")
    public void enterReview(String rating) {
        ggProductObjects.enterReview(
                rating
        );
    }

    /******** Page/ Record Detail level *************/
    @Description("To Choose a file to upload for (Checklist  or Attachment) and the attachment type")
    @When("^I choose the file \"([^\"]*)\" to upload for \"([^\"]*)\" of type \"([^\"]*)\"$")
    public void uploadFile(String fileName, String uploadSectionName, String attachmentType) {
        ggProductObjects.uploadFile(
                fileName,
                uploadSectionName,
                attachmentType
        );
    }

    @Description("To Choose a file to upload for  and the attachment type")
    @When("^I choose the file \"([^\"]*)\" for upload of type \"([^\"]*)\"$")
    public void uploadTheFile(String fileName, String attachmentType) {
        ggProductObjects.uploadTheFile(
                fileName,
                attachmentType
        );
    }

    @Description("To assert if the Page Block fields is displayed in view mode")
    @Then("^I (see|softly see) that \"([^\"]*)\" rendered in view mode only$")
    public void assertPageBlockDetailElementsDisplayedInViewMode(String usage, String fieldApiName) {
        ggProductObjects.assertFieldsInViewMode(fieldApiName, usage.contains("softly"));
    }

    @Then("^I (softly see|see|softly do not see|do not see|see dropdown for) \"([^\"]*)\" in flex table header \"([^\"]*)\"$")
    public void assertFlexTableHeaderName(String usage, String headerColumnName, String tableId) {
        ggProductObjects.assertTableHeaderColumnName(usage, tableId, headerColumnName);
    }

    /******** Modal **********/
    @Description("After selecting the checkbox for the value passed clicks on the button")
    @When("^I click \"([^\"]*)\" after selection of \"([^\"]*)\" in the table \"([^\"]*)\"$")
    public void chooseRecordForProgramAssociation(String buttonName, String recordUniqueValues, String tableId) {
        ggProductObjects.chooseRecordForAssociation(
                buttonName,
                tableId,
                recordUniqueValues.split(",")
        );
    }

    @Description("After selecting the checkbox for the value passed clicks on the button")
    @When("^I click \"([^\"]*)\" after selection of \"([^\"]*)\" without searching in the table \"([^\"]*)\"$")
    public void chooseRecordForProgramAssociationWithoutSerch(String buttonName, String recordUniqueValues, String tableId) {
        ggProductObjects.chooseRecordForAssociationWithoutSearch(
                buttonName,
                tableId,
                recordUniqueValues.split(",")
        );
    }

    @Description("Validate text message coming on confirmation box")
    @Then("^I (softly see|see) confirmation box with body \"([^\"]*)\" is displayed$")
    public void assertConfirmationBoxWithMessage(String usage, String message) {
        ggProductObjects.assertMessageOfConfirmationBoxPopUp(message, usage.contains("softly"));
    }

    @Then("^I (see|do not see|softly see|softly do not see) \"([^\"]*)\" page block displayed$")
    public void asserPageBlockIsNotDisplayed(String usage, String titleName) {
        ggProductObjects.assertPageBlockIsNotDisplayed(usage, titleName);
    }

    /****** Product Generic Consolidated Steps ***********/

    @Description("To complete all the fields from the given sheet in the given excel")
    @Given("^I complete the fields from the sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void editionOfRecord(String sheetName, String excelFileName, List<List<String>> dataTable) {
        ggProductObjects.editionOfRecord(
                sheetName,
                excelFileName,
                I.amPerforming().conversionOf().listOfListsToMapOfMaps(dataTable)
        );
    }

    @Description("Given number of approvers approve the record in the given order")
    @Given("^\"([^\"]*)\" Approvers \"([^\"]*)\" approve the record \"([^\"]*)\"$")
    public void approversApproveRecord(String noOfApprovers, String approvers, String recordName, List<List<String>> dataTable) throws TestingBlazeCustomException {
        ggProductObjects.approversApproveRecord(
                noOfApprovers,
                recordName,
                I.amPerforming().conversionOf().listOfListsToMapOfMaps(dataTable),
                approvers.split(",")
        );
    }

    @Description("Adding an attachment to a record in the attachment flexTable")
    @Given("^I add an attachment \"([^\"]*)\"$")
    public void additionOfAttachment(String fileName, List<List<String>> dataTable) {
        ggProductObjects.additionOfAttachment(
                fileName,
                I.amPerforming().conversionOf().listOfListsToMapOfMaps(dataTable)
        );
    }

    @Description("To associate any record like Contact, Focus Area, Objective, Funding Account and so on")
    @Given("^I associate \"([^\"]*)\" records \"([^\"]*)\"$")
    public void associationOfRecords(String noOfRecords, String recordsToAssociate, List<List<String>> dataTable) {
        ggProductObjects.associationOfRecords(
                noOfRecords,
                I.amPerforming().conversionOf().listOfListsToMapOfMaps(dataTable),
                recordsToAssociate.split(",")
        );
    }

    @Description("To re-login and view the given record")
    @Given("^I login and view the record \"([^\"]*)\" as \"([^\"]*)\"$")
    public void reloginToViewRecord(String recordName, String recordOwner, List<List<String>> dataTable) throws TestingBlazeCustomException {
        ggProductObjects.reloginToViewRecord(
                recordName,
                recordOwner,
                I.amPerforming().conversionOf().listOfListsToMapOfMaps(dataTable)
        );
    }

    @Description("To check if User has received a task")
    @Given("^User \"([^\"]*)\" receives the task for \"([^\"]*)\"$")
    public void userTask(String user, String uniqueColumnValue, List<List<String>> dataTable) throws TestingBlazeCustomException {
        ggProductObjects.userTask(
                user,
                uniqueColumnValue,
                I.amPerforming().conversionOf().listOfListsToMapOfMaps(dataTable)
        );
    }

    @Description("To click on hyperlink containing some text + todays date")
    @And("^I click on hyperlink which( not)? contains todays date with text \"([^\"]*)\"$")
    public void iClickOnHyperlinkForSnapshotContainingValue(String noDate, String linkName) {
        ggProductObjects.clickOnHyperLinkContainingDate(noDate != null, linkName);
    }

    @And("I send the email under collab tab with following details:")
    public void iSendTheEmailUnderCollabTabWithFollowingDetails(List<List<String>> emaiDetails) {
        ggProductObjects.sendTheEmailOnCollabTab(emaiDetails);
    }

    @Description("To click on table header column using table id")
    @When("^I click on \"([^\"]*)\" column header inside table with id \"([^\"]*)\"$")
    public void ClickOnSpecificTableHeaderColumn(String titleName, String tableId) {
        ggProductObjects.performClickOnSpecificTableColumnHeader(tableId, titleName);
    }

    @And("I enter email id \"([^\"]*)\" into field \"([^\"]*)\"$")
    public void iEnterEmailIdIntoField(String emailId, String fieldAPIName) {
        ggProductObjects.enterEmailId(emailId, fieldAPIName);
    }

    @And("^I get record id into \"([^\"]*)\"$")
    public void iGetRecordIdInto(String recordId) {
        I.amPerforming().propertiesFileOperationsTo().saveValue(recordId, ggProductObjects.iGetRecordIdInto());
    }

    @Then("^I (see|softly see|softly do not see) new tab is opened$")
    public void assertNewTabOpenOnEditClick(String usage) {
        ggProductObjects.assertNewTabOpenedOnActionsClick(usage);
    }

    @Then("^I (softly see|softly do not see) \"([^\"]*)\" field inside header \"([^\"]*)\"$")
    public void assertOverViewHeaderDisplayed(String usage, String headerField, String headerTitle) {
        ggProductObjects.assertFieldDisplayedInsideHeader(usage, headerField, headerTitle);
    }

    @When("I hovering mouse on page block help text icon inside table {string} for column {string}")
    public void iHoveringMouseOnPageBlockHelpTextIconInsideTableWithTooltipId(String tableid, String column) {
        ggProductObjects.getHelpTextAtPageBlockOrInsideTable(tableid, column);
    }

    @And("^I Click on \"([^\"]*)\" icon for \"([^\"]*)\" without tableid")
    public void iClickIconWithOutTableId(String iconName, String recordName) {
        ggProductObjects.clickIconWithOutTableId(iconName, recordName);
    }


}