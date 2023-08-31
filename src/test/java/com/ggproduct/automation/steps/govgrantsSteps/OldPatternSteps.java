package com.ggproduct.automation.steps.govgrantsSteps;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import jdk.jfr.Description;
import org.junit.Assert;
import com.helperPackage.register.I;

public class OldPatternSteps {

    OldPatternObjects opObjects;

    public OldPatternSteps(OldPatternObjects opObjects) {
        this.opObjects = opObjects;
    }

    @Description("To verify the Panel header")
    @Then("^I (softly see|see) \"([^\"]*)\" Panel Header$")
    public void VerifyPanelHeader(String usage, String PanelName) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(opObjects.VerifyHeader(PanelName)).isTrue();
        } else {
            Assert.assertTrue(opObjects.VerifyHeader(PanelName));
        }
    }

    @Description("To navigate to the inside subheader on left panel")
    @When("^I navigate to \"([^\"]*)\" content inside \"([^\"]*)\" subheader on left panel on old pattern$")
    public void clickSideBarContent(String sideBarContent, String sideBarSubHeader) {
        opObjects.clickSideBarContent(sideBarSubHeader, sideBarContent);
    }


    @Description("To verify the message in panel")
    @Then("^I (softly see|see) message \"([^\"]*)\" in approval \"([^\"]*)\" Panel with old pattern$")
    public void verifyErrorMessageInPanel(String usage, String Message, String PanelName) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(opObjects.verifyErrorMessageinPanelBlock(Message, PanelName)).isTrue();
        } else {
            Assert.assertTrue(opObjects.verifyErrorMessageinPanelBlock(Message, PanelName));
        }
    }

    @Description("To enter date|text|select|date only|check value using fieldName")
    @When("^I enter (date|text|select|check|date only) value as \"([^\"]*)\" for label \"([^\"]*)\"$")
    public void enterValueIntoFieldAtDynamicFormsLayout(String parameter, String enterValue, String labelName) {
        opObjects.enterValueIntoLabel(parameter, enterValue, labelName);
    }

    @Description("To verify the value with title against another value inside table")
    @Then("^I (softly see|softly cannot see|cannot see|see) value \"([^\"]*)\" for title \"([^\"]*)\" against \"([^\"]*)\" inside table$")
    public void iverifyValueInsideTableAgainstValue(String usage, String value, String colName, String against) {
        opObjects.assertValueinDecisionTable(usage, value, colName, against);
    }

    @Description("To verify the searchbox is present for specific area and table id")
    @Then("^I (softly see|see) quick search box is visible for \"([^\"]*)\" flex table with id \"([^\"]*)\" of old pattern$")
    public void validateSearchBox(String usage, String area, String id) {
        if (usage.contains("softly")) {
            I.amPerforming().assertionsTo().assertThat(opObjects.isQuickSearchBoxIsPresentAtFlexTable(area, id)).isTrue();
        } else {
            Assert.assertTrue(opObjects.isQuickSearchBoxIsPresentAtFlexTable(area, id));
        }
    }

    @Description("To verify the status is present for specific column")
    @Then("^I (see|do not see) the status \"([^\"]*)\" for column \"([^\"]*)\" on old pattern$")
    public void iSeeStatusForColumn(String usage,String status,String columnName) {
        opObjects.assertStatusForColumn(usage,status,columnName);
    }
}