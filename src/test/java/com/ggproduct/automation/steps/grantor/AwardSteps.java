package com.ggproduct.automation.steps.grantor;

import com.helperPackage.handlers.govgrants;
import com.ggproduct.automation.pageobjects.grantor.AwardPage;
import com.helperPackage.objects.Elements;
import com.helperPackage.register.I;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.springframework.context.annotation.Description;

import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class AwardSteps {
    AwardPage awardPage;

    public AwardSteps(){
        this.awardPage = new AwardPage();
    }

    @Description("To verify text area is editable ")
    @Then("^I (see|softly see) textarea field \"([^\"]*)\" is editable$")
    public void iSeeTextareaFieldIsEditable(String usage,String fieldAPIName) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(awardPage.isFieldEditable(fieldAPIName)).isTrue();
        } else {
            Assert.assertTrue(awardPage.isFieldEditable(fieldAPIName));
        }
    }

    @And("^I (softly see|see) \"([^\"]*)\" is present after mouse hover for active subaward$")
    public void iSeeIsPresentAfterMouseHoverForActiveSubaward(String usage, String createdUser) {
        awardPage.assertSeeTextAfterHoveringOnAward(usage,createdUser);
    }

    @And("^I mouse hover to link contains \"([^\"]*)\"$")
    public void iMouseHoverToLinkContains(String link) {
        I.amPerforming().scroll().toMoveToElement(I.amPerforming()
        .getElementReference().of(By.xpath("//a[text()='"+link+"']")));
    }

    @And("^I save the field value having link labeled \"([^\"]*)\" as \"([^\"]*)\"$")
    public void iSaveTheFieldValueHavingLinkLabeledAs(String label, String fieldKey) {
        awardPage.saveFieldValueHavingLinkLabeledAs(label,fieldKey);
    }

    @And("^I click \"([^\"]*)\" link present on hovered tooltip$")
    public void iClickLinkPresentOnHoveredTooltip(String text) {
        I.amPerforming().click().on(By.xpath("//div[contains(@class,'form-group')]//a[text()='"+text+"']"));
    }

    @Then("^I (softly see|see) page title contains as \"([^\"]*)\"$")
    public void iSeeWindowTitleContainsAs(String usage, String textContains) {
        awardPage.assertToSeeWindowTitleContains(usage, textContains);
    }

    @And("^I calculate the total from the column header \"([^\"]*)\" and saved it as \"([^\"]*)\" from the flex table \"([^\"]*)\"$")
    public void iCalculateTheTotalFromTheColumnHeaderAndSavedItAsFromTheFlexTable(String colName, String key, String tableId) {
        I.amPerforming().waitFor().makeThreadSleep(5000);
        WebElement row = I.amPerforming().getElementReference().of(By.xpath("//div[@id='" + tableId + "']//table//tbody//tr"));
        Map<String, Integer> columnMapping = govgrants.perform().flexTable().constructColumnMapping(row, Collections.singleton(colName));
        By specificColumnValue = By.xpath("//div[@id='GrantorActiveGrantsgrid']//th//span[text()='"+colName+"']/ancestor::thead/following-sibling::tbody/tr[not(contains(@ng-if,'noRecords'))]//td["+columnMapping.get(colName)+"]//span/field[@field-Name='TotalAwardedAmount__c']");
        I.amPerforming().waitFor().ElementListToBePresent(specificColumnValue);
        List<Elements> rowValues = I.amPerforming().getElementReference().forListOfElements().of(specificColumnValue);
        double total = rowValues.stream().mapToDouble(
                locator-> {
                    try {
                        I.amPerforming().getElementReference().of(locator);
                        return NumberFormat.getCurrencyInstance(Locale.US).parse(locator.getText()).doubleValue();
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    return 0.0;
                }
        ).sum();

        I.amPerforming().propertiesFileOperationsTo().saveValue(key,String.valueOf(total));
    }

    @Then("^I (softly see|see) the field \"([^\"]*)\" is equal to the sum of the following fields :$")
    public void verifySumOfFields(String usage, String fieldToCompare, List<String> fieldsToSum) {
        awardPage.verifyTotalObligation(usage,fieldToCompare,fieldsToSum);

    }
    @Then("^I (softly see|see) the field \"([^\"]*)\" is equal to the field \"([^\"]*)\" minus the following fields :$")
    public void verifyDifferenceOfFields(String usage, String fieldToCompare, String initialFieldValue, List<String> fieldsToSum) {
        awardPage.validateAvailableBalance(usage,fieldToCompare,initialFieldValue, fieldsToSum);
    }

    @And("^I save the total records from the flex table id \"([^\"]*)\" as \"([^\"]*)\"$")
    public void iGetTheTotalRecordsFromTheFlexTableId(String flexTableId, String key) {
       I.amPerforming().propertiesFileOperationsTo().saveValue(key,I.amPerforming().actionToGet().text(By.xpath(
             "//div[@id='"+flexTableId+"']//*[@ng-bind='totalRecords'] | //div[@id='"+flexTableId+"']//table//tfoot//tr[last()]//*[contains(@class, 'ng-binding')]"
       )));
    }

    @Then("^I (softly see|see) table with header \"([^\"]*)\" contains records \"([^\"]*)\"$")
    public void assertMultipleRecordsInsideTable(String usage, String flexTableHeader, String recordsName) {
        awardPage.assertExpectedRecordsInsideTable(usage.contains("softly"), flexTableHeader, recordsName);
    }

    @Then("I (softly see|softly do not see) \"([^\"]*)\" field is editable inside enhanced grid$")
    public void assertFieldIsNotEditableInsideTable(String usage, String fieldApiName) {
        awardPage.assertFieldIsNotEditableAtEnhancedTable(usage , fieldApiName);
    }
}
