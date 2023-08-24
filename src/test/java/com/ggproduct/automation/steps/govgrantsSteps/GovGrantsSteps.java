package com.ggproduct.automation.steps.govgrantsSteps;

import com.helperPackage.handlers.govgrants;
import com.helperPackage.actionsfactory.api.ByUsing;
import com.helperPackage.exception.TestingBlazeCustomException;
import com.helperPackage.register.I;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import jdk.jfr.Description;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.io.File;
import java.util.List;
import java.util.Map;

public final class GovGrantsSteps {
    private final GovGrantsObjects ggObjects;

    public GovGrantsSteps(GovGrantsObjects ggObjects) {
        this.ggObjects = ggObjects;
    }

    /************
     * Navigation
     *
     **************/
    @Description("To navigate to a different URL")
    @Given("^I navigate to url \"([^\"]*)\"$")
    public void navigateToNewURL(String url) {
        if (url.startsWith("/")) {
            String id = I.amPerforming().browserOperationsTo().getCurrentUrl().split("com", 2)[0] + "com";
            url = id + url;
            System.out.println(url);
        }
        govgrants.perform().mainPage().navigateToURL(
                url
        );

    }

    /*********** Login Steps ***********/

    @Description("Complete login process based on user name and password")
    @Given("^I login with username \"([^\"]*)\" and password \"([^\"]*)\"$")
    public void login(String userName, String password) {
        govgrants.perform().mainPage().login(
                userName,
                password);
        try {
            govgrants.perform().mainPage().waitForEgmsHeader();
        } catch (Exception e) {
            /* Ignore Exception */
        }
    }

    @Description("Log out and login again with username and password")
    @When("^I re-login with username \"([^\"]*)\" with password \"([^\"]*)\"$")
    public void reLogin(String userName, String password) {
        ggObjects.clickLogOut();
        govgrants.perform().mainPage().login(
                userName,
                password
        );
        try {
            govgrants.perform().mainPage().waitForEgmsHeader();
        } catch (Exception e) {
            /* Ignore Exception */
        }
    }

    @Given("^I am on \"([^\"]*)\" portal$")
    public void navigateToPortal(String portalType) {
        govgrants.perform().mainPage().navigateToPortal(portalType);
    }

    @Given("^I login as \"([^\"]*)\" user$")
    public void loginssAsUser(String userType) {
        govgrants.perform().mainPage().loginWithUserType(userType);
    }

    @When("^I re-login as \"([^\"]*)\" user on \"([^\"]*)\" portal$")
    public void reLoginWithUrl(String userType, String portalType) {
        ggObjects.clickLogOut();
        govgrants.perform().mainPage().navigateToPortal(portalType);
        govgrants.perform().mainPage().loginWithUserType(userType);
        try {
            govgrants.perform().mainPage().waitForEgmsHeader();
        } catch (Exception e) {
            /* Ignore Exception */
        }
    }

    @When("^I re-login with \"([^\"]*)\" user")
    public void reLoginWithCurrentURL(String userType) {
        ggObjects.clickLogOut();
        govgrants.perform().mainPage().loginWithUserType(userType);
        try {
            govgrants.perform().mainPage().waitForEgmsHeader();
        } catch (Exception e) {
            /* Ignore Exception */
        }
    }

    @Description("Login to the app as any user")
    @Given("^I login to \"([^\"]*)\" app as \"([^\"]*)\" user$")
    public void loginToggleToApp(String appName, String userType) {
        govgrants.perform().mainPage().loginWithUserType(userType);
        govgrants.perform().mainPage().setUpCustomAppDropDown(appName);
    }

    @Description("Re-Login to the app as any user")
    @When("^I re-login to \"([^\"]*)\" app as \"([^\"]*)\" user$")
    public void reloginToggleToApp(String appName, String userType) {
        ggObjects.clickLogOut();
        govgrants.perform().mainPage().loginWithUserType(userType);
        govgrants.perform().mainPage().setUpCustomAppDropDown(appName);
    }

    @Description("Re-Login to the app as any user and with any URL")
    @When("^I re-login to \"([^\"]*)\" app as \"([^\"]*)\" user on \"([^\"]*)\" portal$")
    public void reloginToggleToAppInURL(String appName, String userType, String portalType) {
        try {
            ggObjects.clickLogOut();
            govgrants.perform().mainPage().navigateToPortal(portalType);
            govgrants.perform().mainPage().loginWithUserType(userType);
            govgrants.perform().mainPage().setUpCustomAppDropDown(appName);
        } catch (Exception e) {
            if (I.amPerforming().checkToSee().isElementDisplayed(ByUsing.xpath("//a[@title='GovGrants Launcher Tab']"))) {
                By GovtGrantLauncher = ByUsing.xpath("//a[@title='GovGrants Launcher Tab']");
                I.amPerforming().click().on(GovtGrantLauncher);
                I.amPerforming().waitFor().ElementToDisappear(GovtGrantLauncher);
            }
        }
    }

    @When("^I setup my app as \"([^\"]*)\"$")
    public void setUpMyAppAs(String appName) {
        govgrants.perform().mainPage().setUpCustomAppDropDown(appName);
    }

    @When("^I logout")
    public void onlyLogout() {
        ggObjects.clickLogOut();
    }

    @Then("^I am logged in$")
    public void assertLoggedIn() {
        govgrants.perform().mainPage().assertLoggedIn();
    }

    @When("^I select \"([^\"]*)\" from user dropdown$")
    public void clickOnUserDropdownAndSelectMenu(String dropdownMenu) {
        govgrants.perform().mainPage().clickLoginDropDown();
        govgrants.perform().mainPage().clickLoginDropDownItems(dropdownMenu);
    }

    /******* Main Page + Side Bar ***********/

    @Description("Navigate to any specific Main tab")
    @When("^I navigate to \"([^\"]*)\" tab$")
    public void navigateToMenutab(String tabName) {
        govgrants.perform().mainPage().clickMainMenuBar(tabName);
    }

    @Description("Navigate to sidebar content inside a sidebar subheader")
    @When("^I navigate to \"([^\"]*)\" content inside \"([^\"]*)\" subheader on left panel$")
    public void clickSideBarContent(String sideBarContent, String sideBarSubHeader) {
        govgrants.perform().sideBar().clickSideBarContent(sideBarSubHeader, sideBarContent);
    }

    @Description("Navigate to sidebar content insde a sidebar subheader after clicking a tab")
    @When("^I navigate to \"([^\"]*)\" content inside \"([^\"]*)\" subheader on left panel inside \"([^\"]*)\" tab$")
    public void clickMainMenuTabAndSelectSideBarContent(String sideBarContent, String sideBarSubHeader,
                                                        String tabName) {
        govgrants.perform().mainPage().clickMainMenuBar(tabName);
        govgrants.perform().sideBar().clickSideBarContent(
                sideBarSubHeader,
                sideBarContent
        );
    }

    @Description("Navigate to any specific content inside Notes subtab of HOME Phase")
    @When("^I click on user notes content with icon name \"([^\"]*)\"$")
    public void clickMyWorkSpaceNotesItems(String iconName) {
        govgrants.perform().mainPage().clickOnUserNotesItemInsideMyWorkSpaceNotes(iconName);
    }

    @Description("Navigate to any specific tab of My work space inside HOME Phase")
    @When("^I click on \"([^\"]*)\"$")
    public void clickMyWorkSpaceItems(String myWorkspaceItem) {
        govgrants.perform().mainPage().clickOnMyWorkSpaceSpecificItem(myWorkspaceItem);
    }

    /******* Sub Tabs ***********/

    @Description("Click on sub tab after reaching inside different table page details")
    @When("^I navigate to \"([^\"]*)\" sub tab$")
    public void navigateToSubTabs(String subtabName) {
        ggObjects.clickSubTab(subtabName);
    }

    /******* Flex Table ***********/

    @Description("Clicks on action view icon inside a table")
    @When("^I click on \"([^\"]*)\" icon for \"([^\"]*)\"( with excluding regx)? inside flex table with id \"([^\"]*)\" without waiting for record$")
    public void clickActionIconWithoutWaitForRecord(String actionIcon, String anyUniqueColumnValues, String isExcludeRegx, String flexTableId) {
        if (anyUniqueColumnValues.equalsIgnoreCase("Record Id")) {
            govgrants.perform().flexTable().clickTableActionIcon(flexTableId, actionIcon, govgrants.perform().pageDetails().idOfRecord);
        } else if (null != isExcludeRegx && isExcludeRegx.contains("with excluding regx")) {
            govgrants.perform().flexTable().clickTableActionIcon(flexTableId, actionIcon, anyUniqueColumnValues);
        } else {
            govgrants.perform().flexTable().clickTableActionIcon(flexTableId, actionIcon, anyUniqueColumnValues.split(","));
        }
    }

    @Description("Clicks on any action icon inside a table")
    @When("^I click on \"([^\"]*)\" icon for \"([^\"]*)\" inside table without waiting for record$")
    public void clickActionIconWithoutWait(String actionIcon, String anyUniqueColumnValues) {
        govgrants.perform().flexTable().clickTableActionIcons(
                actionIcon,
                anyUniqueColumnValues.split(",")
        );
    }

    @Description("Clicks on any action icon inside a table and refreshes the page till record appears: max refresh: 10")
    @When("^I click on \"([^\"]*)\" icon for \"([^\"]*)\" inside table with wait for record$")
    public void clickActionIconWithRecordWait(String actionIcon, String anyUniqueColumnValue) {
        ggObjects.clickActionIconWithRecordWaitOnly(
                actionIcon,
                anyUniqueColumnValue.split(",")
        );
    }

    @Description("Clicks on action view icon inside a table and refreshes the page till record appears: max refresh: 10")
    @When("^I click on \"([^\"]*)\" icon for \"([^\"]*)\" inside flex table with id \"([^\"]*)\" with wait for record$")
    public void clickActionIconWithWaitForRecordd(String actionIcon, String anyUniqueColumnValue, String flexTableId) {
        ggObjects.clickActionIconWithRecordWaitOnlyy(
                flexTableId,
                actionIcon,
                anyUniqueColumnValue.split(",")
        );
    }

    @Description("Clicks on action view icon inside a table and also handles last search performed alongwith wait for record: max refresh: 10")
    @When("^I click on \"([^\"]*)\" icon for \"([^\"]*)\" inside table$")
    public void clickAnyActionIconWithWaitAndSearch(String actionIcon, String anyUniqueColumnValue) {
        ggObjects.clickActionIconWithWaitAndSearch(
                actionIcon,
                anyUniqueColumnValue.split(",")
        );
        govgrants.perform().modal().acceptPopUp();
    }

    @Description("Clicks on a series of action view icons inside a table$") // **
    @When("^I click on icons for column values inside table$")
    public void clickAnyActionIcons(List<Map<String, String>> table) {
        for (Map<String, String> map : table) {
            ggObjects.clickActionIconWithWaitAndSearch(map.get("Icon"), map.get("Column Value"));
        }
    }

    @Description("Clicks on action view icon inside a table and also handles last search performed alongwith wait for record: max refresh: 10")
    @When("^I click on \"([^\"]*)\" icon for \"([^\"]*)\" inside flex table with id \"([^\"]*)\"$")
    public void clickActionIconWithWaitAndSearch(String actionIcon, String anyUniqueColumnValue, String flexTableId) {
        ggObjects.clickActionIconWithWaitAndSearchh(
                flexTableId,
                actionIcon,
                anyUniqueColumnValue.split(",")
        );
    }

    @Description("Clicks on top any right button for a table using button name and table id")
    @When("^I click on top right button \"([^\"]*)\" in (flex table without processing having id|flex table with id|notes and attachment with name) \"([^\"]*)\"$")
    public void clickTopRightButtonInFlexTableById(String buttonName, String tableType, String tableIdOrName) {
        if (tableType.contains("notes")) {
            I.amPerforming().click().on(ByUsing.xpath("//a[@title='" + tableIdOrName + "']/parent::div/following-sibling::div//button[text()='" + buttonName + "']"));
        } else if (tableType.contains("without processing")) {
            I.amPerforming().click().on(ByUsing.xpath("//*[" + I.amPerforming().sanityOfXpathTo().equals("@id", tableIdOrName) + "]//input[" + I.amPerforming().sanityOfXpathTo().equals("@value", buttonName)+"]"));
        }
        else {
            govgrants.perform().flexTable().clickTableTopRightButton(
                    tableIdOrName,
                    buttonName
            );
        }
    }

    @Description("Click on toggle button on a flex table for a specific pathway")
    @When("^I click toggle button to select \"([^\"]*)\" in \"([^\"]*)\"$")
    public void clickToggleButtonAndSelect(String menuItemName, String tableID) {
        govgrants.perform().flexTable().waitForFlexTablesToLoad();
        govgrants.perform().phasePanel().clickDoubleArrowDropDownAndSelectItem(
                tableID,
                menuItemName
        );
    }

    @Description("Click on toggle button on a flex table")
    @When("^I click toggle button to select \"([^\"]*)\"$")
    public void clickToggleButtonAndSelect(String menuItemName) {
        govgrants.perform().flexTable().waitForFlexTablesToLoad();
        govgrants.perform().phasePanel().clickDoubleArrowDropDownAndSelectItem(menuItemName);
    }

    @Description("Perform quick search by providing search term")
    @When("^I perform quick search for \"([^\"]*)\"$")
    public void performQuickSearch(String searchTerm) {
        ggObjects.performQuickSearch(searchTerm);
    }

    @Description("Perform quick search inside global search by providing search term")
    @When("^I perform quick search inside global search \"([^\"]*)\"(| without processing)$")
    public void performQuickSearchInsideGlobalSearch(String searchTerm, String usage) {
        if (usage.contains("without processing")) {
            By globalSearchInputBoxWithAutosuggestion = By.cssSelector("div.input-group>input#isTypeAhead");
            I.amPerforming().textInput().toClear(globalSearchInputBoxWithAutosuggestion);
            I.amPerforming().textInput().in(globalSearchInputBoxWithAutosuggestion, searchTerm);
        } else {
            ggObjects.performQuickSearchForGlobalSearch(searchTerm);
        }
    }

    @Description("Perform quick search by providing search term and divTable ID")
    @When("^I perform quick search for \"([^\"]*)\" in \"([^\"]*)\" panel$")
    public void performQuickSearch(String searchTerm, String tableID) throws TestingBlazeCustomException {
        ggObjects.performQuickSearch(
                tableID,
                searchTerm
        );
    }

    @Description("Performs quick search with search term given and the Parent value should be unique")
    @When("^I perform quick search for \"([^\"]*)\" for the parent value \"([^\"]*)\" on grid \"([^\"]*)\"$")
    public void quickSearchOnGridTable(String searchTerm, String anyUniqueColumnValueFromParent, String flexTableDivId) {
        govgrants.perform().quickSearch().performEnhancedGridSearch(
                flexTableDivId,
                anyUniqueColumnValueFromParent,
                searchTerm);
    }

    @Description("click on  Advance filter search icon")
    @When("^I click on advance filter \"([^\"]*)\" of table id \"([^\"]*)\"$")
    public void performClickOnAnvanceFilter(String dataTargetValue, String tableId) {

        ggObjects.performClickOnAdvanceFilterWithTableId(tableId, dataTargetValue);
    }

    @Description("add roles in flex table")
    @When("^I add the following roles to the flex table with id \"([^\"]*)\" :$")
    public void addRoles(String flexTableId, List<Map<String, String>> table) {
        for (Map<String, String> roleMap : table) {
            ggObjects.assignRole(flexTableId, roleMap);
        }
    }

    @When("^I assign the following reviewers in flex table with id \"([^\"]*)\" :$")
    public void assignReviewers(String flexTableId, List<Map<String, String>> table) {
        for (Map<String, String> reviewerMap : table) {
            String stepName = "";
            String panelName = "";
            String userName = "";
            for (String key : reviewerMap.keySet()) {
                if ("Step".equalsIgnoreCase(key) || "StepName".equalsIgnoreCase(key)) {
                    stepName = reviewerMap.get(key);
                } else if ("Panel".equalsIgnoreCase(key) || "PanelName".equalsIgnoreCase(key)) {
                    panelName = reviewerMap.get(key);
                } else if ("User".equalsIgnoreCase(key) || "UserName".equalsIgnoreCase(key)) {
                    userName = reviewerMap.get(key);
                }
            }
            ggObjects.assignReviewer(flexTableId, stepName, panelName, userName);
        }
    }

    @When("^I check \"([^\"]*)\" boxes in flex table with id \"([^\"]*)\"$")
    public void checkFlexRows(String uniqueColumnText, String flexTableId) {
        if ("All".equalsIgnoreCase(uniqueColumnText)) {
            ggObjects.checkFlexRows(flexTableId);
        } else {
            ggObjects.checkFlexRows(flexTableId, uniqueColumnText.split(","));
        }
    }

    @When("^I enter the following values into flex table with id \"([^\"]*)\" by clicking \"([^\"]*)\" :$")
    public void enterFlexTableRows(String flexTableId, String buttonName, List<Map<String, String>> rowValues) {
        govgrants.perform().flexTable().enterFlexTableRows(
                flexTableId,
                buttonName,
                rowValues
        );
    }

    @When("^I edit the following rows inline in flex table with id \"([^\"]*)\" by clicking \"([^\"]*)\" :$")
    public void editFlexTableRowsInline(String flexTableId, String editButtonName, List<List<String>> rowValues) {
        govgrants.perform().flexTable().editFlexTableRowsInline(
                flexTableId,
                editButtonName,
                I.amPerforming().conversionOf().listOfListsToMapOfMaps(rowValues)
        );
    }

    @When("^I collapse page block with name as \"([^\"]*)\"$")
    public void collpasePageBlock(String pageBlockTitle) {
        govgrants.perform().pageDetails().pageBlockExpandOrCollapse(pageBlockTitle, true);
    }

    @When("^I expand nested table containing column value \"([^\"]*)\"$")
    public void expandNestedTable(String uniqueColumnValue) {
        govgrants.perform().flexTable().expandOrCollapseNestedTable(uniqueColumnValue, true);
    }

    @When("^I collapse nested table containing column value \"([^\"]*)\"$")
    public void collapseNestedTable(String uniqueColumnValue) {
        govgrants.perform().flexTable().expandOrCollapseNestedTable(uniqueColumnValue, false);
    }

    @When("^I expand nested table containing column value \"([^\"]*)\" inside nested table containing \"([^\"]*)\"$")
    public void collapseSubsTable(String secondTable, String firstTable) {
        govgrants.perform().flexTable().expandOrCollapseNestedTable(firstTable, true);
        govgrants.perform().flexTable().expandOrCollapseNestedTable(secondTable, true);
    }

    @Description("Clicks on top right buttons in a table")
    @When("^I click on top right buttons in flex tables$")
    public void clickTopRightButtonsInFlexTableById(List<Map<String, String>> table) {
        for (Map<String, String> map : table) {
            govgrants.perform().flexTable().clickTableTopRightButton(map.get("Table Id"), map.get("Button"));
        }
    }

    @When("^I click on \"([^\"]*)\" icon for \"([^\"]*)\" inside table with table id \"([^\"]*)\" without processing$")
    public void clickTableActionIconsWithoutProcessing(String iconName, String anyColumnValues, String flextableId) {
        ggObjects.clickTableActionIconsForSpecificSubjectWithoutProcessing(
                flextableId,
                iconName,
                anyColumnValues.split(",")
        );
    }

    @Description("click on Add button on Attachment page block inside Attachment Sub Tab")
    @When("^I click on \"([^\"]*)\" button inside attachments page block$")
    public void clickAddButton(String buttonName) {
        ggObjects.clickAddUnderAttachmentsPageBlock(buttonName);
    }

    @Description("Used to add attachments in flex table where table id is random")
    @When("^I upload attachment \"([^\"]*)\" of type \"([^\"]*)\"$")
    public void uploadAttachmentInFlexTable(String fileName, String fileType) {
        ggObjects.uploadAttachmentInFlexTable(
                fileName,
                fileType
        );
    }

    @Description("Used to add attachments from computer")
    @When("^I upload attachment (without random number )?\"([^\"]*)\" of type \"([^\"]*)\" from computer$")
    public void uplaodAttachFromComputer(String withoutRandomNumber, String fileName, String fileType) {
        ggObjects.uploadAttachmentInFlexTableFromComputer(
                withoutRandomNumber != null,
                fileName,
                fileType
        );
    }

    /**
     * Uploads an attachment file using a flex table edit action
     *
     * @iconName
     * @fileName the name of the file to upload
     * @fileType the type of file to choose from the dropdown
     */
    @When("^I click on \"([^\"]*)\" attachment to upload attachment \"([^\"]*)\" of type \"([^\"]*)\"$")
    public void editAndUploadAttachmentInFlexTable(String iconName, String fileName, String fileType) {
        ggObjects.clickEditAnduploadAttachmentInFlexTable(iconName, fileName, fileType);
    }

    @Then("^I (see|see row level action|softly see|softly see row level action) table with header \"([^\"]*)\" contains records \"([^\"]*)\" (Edit|Delete|Download|null)$")
    public void assertMultipleRecordsInsideTable(String usage, String flexTableHeader, String recordsName, String actionName) {
        ggObjects.isExpectedRecordsDisplayedInsideTable(usage, flexTableHeader, actionName, recordsName);
    }

    /**
     * Add Notes inside notes page block
     */
    @When("^I add notes records$")
    public void uploadAttachmentInFlexTable() {
        ggObjects.addNotesInFlexTable();
    }

    /******* Modal ***********/

    @When("^I click modal button \"([^\"]*)\"$")
    public void clickModalButton(String buttonName) {
        govgrants.perform().modal().clickModalContentSpecificButton(buttonName);
    }

    @When("^I close modal by clicking the top right x button$")
    public void closeModalByClickingTopRightXButton() {
        govgrants.perform().modal().closeModalByClickingTopRightCloseButton();
    }

    @When("^I click \"([^\"]*)\" on modal confirmation box$")
    public void acceptRejectModalConfirmationBox(String buttonName) {
        govgrants.perform().modal().acceptPopUpWithParameter(buttonName);
    }

    @When("^I close \"([^\"]*)\" modal by clicking the top right x button$")
    public void iCloseModalModalByClickingTheTopRightXButton(String titleName) {
        govgrants.perform().modal().closeModalByClickingTopRightCloseButton(titleName);
    }

    /******* Page Details ***********/

    @Description("click top right button after reaching to page detail from flex table")
    @When("^I click on \"([^\"]*)\" in the (bottom of page details|page details|page details without processing)$")
    public void clickPageButton(String buttonName, String buttonLocation) {
        if (buttonLocation.equalsIgnoreCase("page details")) {
            govgrants.perform().pageDetails().clickAnyTopRightButton(buttonName);
        } else if (buttonLocation.equalsIgnoreCase("bottom of page details")) {
            govgrants.perform().pageDetails().clickAnyBottomRightButton(buttonName);
        } else if (buttonLocation.equalsIgnoreCase("page details without processing")) {
            By topRightButton = govgrants.perform().pageDetails().getAnyTopRightButton(buttonName);
            I.amPerforming().click().on(topRightButton);
        }
    }

    @Description("click top right button after reaching to page detail without processing")
    @When("^I click on \"([^\"]*)\" in the page details immediately$")
    public void clickPageButtonWithoutProcessing(String buttonName) {
        govgrants.perform().pageDetails().clickAnyTopRightButtonWithoutProcessing(buttonName);
    }

    @When("^I click on buttons in the page details$")
    public void clickPageButtons(List<Map<String, String>> table) {
        for (Map<String, String> map : table) {
            govgrants.perform().pageDetails().clickAnyTopRightButton(map.get("Button"));
        }
    }

    @When("^I click \"([^\"]*)\" lookup link$")
    public void clickLookupLink(String lookupRelationshipAPIName) {
        govgrants.perform().pageDetails().clickLookupLink(lookupRelationshipAPIName);
    }

    @When("^I click search icon for lookup \"([^\"]*)\"$")
    public void clickLookUpSearchOwnerOrganization(String searchBtnName) {
        govgrants.perform().pageDetails().clickLookupModalQuickSearch(searchBtnName);
    }

    @Description("Clicks the Validate button for forms, and waits for the results to appear")
    @When("^I validate the forms$")
    public void clickFormValidationButtonAndWaitForResult() {
        govgrants.perform().pageDetails().clickFormValidationButtonAndWaitForResult();
    }

    @Description("provide title or table id for dashboard of the phase annd item to select from 3 parallel lines menu")
    @When("^I select \"([^\"]*)\" from parallel lines dropdown of \"([^\"]*)\"$")
    public void selectFromDropdownUsingBarTitle(String menuItemName, String panelTitleName) {
        govgrants.perform().phasePanel().selectItemFromParallelMenuBars(
                panelTitleName,
                menuItemName
        );
    }

    @Description("Click the parallel menu bar on page block with data target value")
    @When("^I click on parallel lines menu bar with data target value \"([^\"]*)\"$")
    public void clickMenuBarOnPageBlocksWithDataTargetValue(String dataTargetValue) {
        govgrants.perform().phasePanel().clickParallelMenuBarsWithDataTargetValue(dataTargetValue);
    }

    @Description("Click the parallel menu bar on page block with page block title")
    @When("^I click on parallel lines menu bar with panel title \"([^\"]*)\"$")
    public void clickTopRightParallelLinesBar(String panelTitleName) {
        govgrants.perform().phasePanel().clickParallelMenuBars(panelTitleName);
    }

    @Description("Click on botom menu to enable govgrant setup")
    @And("I click on botton menu \"([^\"]*)\"$")
    public void performClickAndSelectBottonMenuOption(String id) {
        I.amPerforming().click().on(govgrants.perform().phasePanel().getStickyBottomMenu(id));
    }

    @When("^I hovering mouse on help text icon inside \"([^\"]*)\" as \"([^\"]*)\"$")
    public void getHelpTextIconsAtPageBlock(String pageBlockTitle, String pageBlockName) {
        govgrants.perform().pageDetails().performMouseHoverOnExpectedElements(pageBlockTitle, pageBlockName);
    }

    @When("^I click on \"([^\"]*)\" icon in rich text area editor menu options$")
    public void clickOnIconInRichTextAreaEditorMenuOption(String iconName) {
        govgrants.perform().pageDetails().clickAtIconInRichTextAreaEditorMenuOptions(iconName);
    }

    @When("^I create hyperlink for \"([^\"]*)\" as \"([^\"]*)\" at rich text area field$")
    public void createHyperlinkInCKEditor(String displayTextOrURL, String value) {
        govgrants.perform().pageDetails().createHyperlinkUsingCKEditorAtDescriptionField(displayTextOrURL, value);
    }

    @When("^I click on footer links \"([^\"]*)\"$")
    public void clickFooterLinks(String footerLinks) {
        govgrants.perform().pageDetails().clickOnAnyFooterLinks(footerLinks);
    }

    @And("^I click on \"([^\"]*)\" hyperlink in page instruction block$")
    public void clickOnButtonAtPageInstruction(String linkName) {
        govgrants.perform().pageDetails().clickOnLinkAtPageInstruction(linkName);
    }

    @Description("Perform click on actions at send email and library file modal window")
    @When("^I click on \"([^\"]*)\" button in send email modal$")
    public void clickOnSendEmailModalButton(String buttonName) {
        govgrants.perform().pageDetails().clickOnSendEmailModalButton(buttonName);
    }

    @Description("Perform click on dropdown to navigate between forms on form layout")
    @When("I select {string} from dropdown at forms")
    public void iSelectFromDropdownAtForms(String options) {
        govgrants.perform().pageDetails().selectValueFromDropdownAtFormLayout(options);
    }

    @Description("To enter value in collab my feed section and share the post and comment")
    @And("^I enter value \"([^\"]*)\" in my feed section and share the (post|comment)$")
    public void iEnterValueInMyFeedSectionAndShareThePost(String value, String sharingType) {
        govgrants.perform().pageDetails().enterValueInMyFeedSectionAndShareThePost(value, sharingType.equalsIgnoreCase("post"));
    }

    @Description("To perform click on actions at comments under my feed section ex: like, Delete,Share etc")
    @And("^I click on \"([^\"]*)\" (action|action from dropdown) at \"([^\"]*)\" comment inside my feed$")
    public void iClickOnActionsAtCommentInsideMyFeed(String actionName, String chooseAction, String comment) {
        govgrants.perform().pageDetails().clickOnActionsAtCommentSection(actionName, chooseAction.equalsIgnoreCase("action"), comment);
    }

    @Description("To select below checkbox options for field")
    @Then("^I select below checkbox options for field \"([^\"]*)\"$")
    public void iSelectBelowCheckboxOptionsForField(String fieldName, List<String> checkboxes) {
        govgrants.perform().pageDetails().selectBelowCheckboxOptionsForField(fieldName, checkboxes);
    }

    /******* Form Filling ***********/

    @Description("Reads and inputs field info from the excel file and sheet specified ")
    @When("^I (enter|enter in modal|enter in form) \"([^\"]*)\" values from \"([^\"]*)\"$")
    public void enterInputForFormsFromExcelFile(String usage, String sheetName, String fileName) {
        govgrants.perform().inputForms().enterInputFieldsFromExcelFile(
                fileName,
                sheetName,
                usage
        );
    }

    @Description("Enters the value in any specific field and also covers lookup data entry")
    @When("^I (enter|enter in modal) value \"([^\"]*)\" into field \"([^\"]*)\"$")
    public void inputValue(String usage, String fieldValue, String fieldApiName) {
        govgrants.perform().inputForms().inputFormDataByFieldApiName(
                fieldApiName,
                fieldValue,
                usage.contains("modal")
        );
    }

    @When("^I enter values into fields$")
    public void inputValue(List<Map<String, String>> table) {
        for (Map<String, String> map : table) {
            govgrants.perform().inputForms().inputFormDataByFieldApiName(map.get("Field"), map.get("Value"), false);
        }
    }

    @Description("Enters the value/s using Data Table in any specific field/s of page block and also covers forms data entry")
    @When("^I (enter|clear) values into \"([^\"]*)\" page block$")
    public void iEnterBelowValuesIntoBlock(String operation, String pageBlock, List<Map<String, String>> table) {
        govgrants.perform().inputForms().inputDataIntoForms(operation, pageBlock, table);
    }

    @When("^I (clear|clear in modal) the value from field \"([^\"]*)\"$")
    public void clearValue(String usage, String fieldApiName) {
        govgrants.perform().inputForms().clearFormDataByFieldApiName(fieldApiName, usage.contains("modal"));
    }

    @When("^I clear the values from fields:$")
    public void clearValues(List<Map<String, String>> table) {
        for (Map<String, String> map : table) {
            govgrants.perform().inputForms().clearFormDataByFieldApiName(map.get("Field"), false);
        }
    }

    @When("^I get the \"([^\"]*)\"$")
    public void getFieldValue(String fieldLable) {
        govgrants.perform().pageDetails().getFieldValue(fieldLable);
    }

    @When("^I save the field (labeled|containing) \"([^\"]*)\" as \"([^\"]*)\"$")
    public void saveFieldValue(String labeledOrContaining, String fieldLabel, String fieldKey) {
        I.amPerforming().propertiesFileOperationsTo().saveValue(fieldKey, govgrants.perform().pageDetails().getFieldValue(fieldLabel, labeledOrContaining.equalsIgnoreCase("labeled")));
    }

    /******* stickey Notes ***********/
    @Description("It will delete sticky notes inside HOME phase by clicking on close icon. It will accept parameer as iconName")
    @When("^I delete stickey notes by clicking on \"([^\"]*)\"$")
    public void deleteStickeyNotes(String icon) {
        govgrants.perform().mainPage().deleteAddedStickeyNotes(icon);
        govgrants.perform().modal().acceptPopUp();
    }

    @Description("It will delete sticky notes inside HOME phase by clicking on close icon. It will accept first parameer as sticky title and second parameter is icon")
    @When("^I delete specific Sticky Notes with title \"([^\"]*)\" on clicking \"([^\"]*)\"$")
    public void deleteStickyNotesWithTitle(String stickyTitle, String icon) {
        govgrants.perform().mainPage().deleteAddedStickeyNotesWithTitle(stickyTitle, icon);
        govgrants.perform().modal().acceptPopUp();
    }

    /**** Select dropdown options *****/

    @When("^I (select|select without accepting alert) \"([^\"]*)\" from dropdown$")
    public void selectFromDropdown(String usage, String itemName) {
        WebElement element = govgrants.perform().pageDetails().getMenuItemFromParallelLinesDropDown(itemName);
        if (usage.contains("without")) {
            I.amPerforming().waitFor().makeThreadSleep(2000);
            element.click();//element.click(); @allowed : Only due to a very specific requirement in Framework automation.
            I.amPerforming().waitFor().makeThreadSleep(2000);
        } else {
            I.amPerforming().click().on(element);
        }
    }

    @Description("This will download the file using javascript")
    @When("^I download the file$")
    public void saveTheFileToTarget() throws Throwable {
        I.amPerforming().fileHandling().toDownloadAnyFileUsingURL("govgrants.pdf");
        File file = new File(System.getProperty("user.dir") + File.separatorChar + "target");
        I.amPerforming().waitFor().makeThreadSleep(5000);
        I.amPerforming().fileHandling().toRenameFileWithSpecificExtension(file, "govgrant", "pdf", "pdf");
        I.amPerforming().waitFor().makeThreadSleep(2000);
    }

    @Description("Click on Burger Icon present or enhanced view in flex table top right corner")
    @And("I click on (enhanced view|parallel menu) button in flex table title \"([^\"]*)\"$")
    public void iClickOnParallelMenuButtonInFlexTableTitled(String usage, String flexTableTitle) {
        if (usage.equalsIgnoreCase("parallel menu")) {
            By menuButton = By.xpath("//*[" + I.amPerforming().sanityOfXpathTo().equals("text()", flexTableTitle) + "]//ancestor::div[@id and contains(@class,'ng-scope') and @ng-controller]//div[contains(@class,'panel-heading')]//*[@title='Menu' or contains(@class,'fa-bars')] | //*[" + I.amPerforming().sanityOfXpathTo().equals("text()", flexTableTitle) + "]/preceding-sibling::span//*[@title='Menu' or contains(@class,'fa-bars')] | //*[text()='"+ flexTableTitle +"']//ancestor::div[@id and contains(@class,'ng-scope') and @ng-controller]//*[@title='Menu' or contains(@class,'fa fa-bars')]");
            if (I.amPerforming().getElementReference().forListOfElements().of(menuButton).size() > 2) {
                menuButton = By.xpath("//*[" + I.amPerforming().sanityOfXpathTo().equals("text()", flexTableTitle) + "]//ancestor::div[contains(@class,'panel-heading')]//*[@title='Menu' or contains(@class,'fa-bars') | //*[" + I.amPerforming().sanityOfXpathTo().equals("text()", flexTableTitle) + "]//ancestor::div[contains(@class,'panel-heading')]//*[@title='Menu' or contains(@class,'fa fa-bars')]");
            }
            I.amPerforming().click().on(menuButton);

        } else if (usage.equalsIgnoreCase("enhanced view")) {
            By menuButton = By.xpath("//*[text()='"+ flexTableTitle +"']//ancestor::div[@id and contains(@class,'ng-scope') and @ng-controller]//*[@title='Enhanced View' or contains(@class,'fa fa-arrows-alt')]");
            I.amPerforming().click().on(menuButton);
        }
    }

    @When("^I enter advance filter values inside id \"([^\"]*)\"$")
    public void enterValuesForAdvanceFilter(String advanceFilterId, List<String> rowValues) {
        govgrants.perform().phasePanel().handleDropdownInputForAdvanceFilter(advanceFilterId, rowValues);
    }

    @When("I enter comments {string} and click {string}")
    public void enterCommentsAndClick(String comments, String buttonName) {
        govgrants.perform().modal().enterCommentsOnPopup(comments, buttonName);
    }

    @When("^I click search icon for look up field \"([^\"]*)\" (without clearing|with clearing)$")
    public void clickLookUpSearchOwnerOrganization(String lookupFieldName, String usage) {
        govgrants.perform().modal().clickLookupModalQuickSearch(lookupFieldName, usage.contains("with clearing"));
    }

    @And("^I enter title in Notes$")
    public void enterDataInNotes() {
        By notesTitle = By.xpath("//div[@id='addAtt']//label[text()='Title']/..//input");
        I.amPerforming().textInput().in(notesTitle, "Notes Record");
    }

    @And("^I enter description in Notes$")
    public void enterDescriptionInNotes() {
        By notesDescriptionPath = By.xpath("//div[@id='addAtt']//label[text()='Description']/..//textarea");
        I.amPerforming().textInput().in(notesDescriptionPath, "Automation Notes");
    }

    @Description("Select options from dropdown present on top right corner of the flex table")
    @And("I select {string} from dropdown present on top right of flex table id {string}")
    public void iSelectFromDropdownPresentOnTopRightOfFlexTableId(String selectOption, String tableId) {
        By selectOptionLocator = By.xpath("//div[@id='" + tableId + "']//div[@class='panel-heading']//select");
        I.amPerforming().dropDownSelection().from(selectOptionLocator).selectByVisibleText(selectOption);
    }

    /**** Enhanced Charts *****/
    @When("^I perform quick search for \"([^\"]*)\" inside charts modal with id \"([^\"]*)\"$")
    public void performSearchInsideChartsModal(String searchInput, String chartTableId) {
        govgrants.perform().charts().performQuickSearchInsideChartsModal(searchInput, chartTableId);
    }

    @Then("^I (see|softly see) multiple selected options in \"([^\"]*)\":$")
    public void iSeeFollowingOptionsIn(String usage, String cellName, List<String> options) {
        govgrants.perform().pageDetails().verifyMultipleSelectedOption(usage, cellName, options);
    }

    @And("^I click on Link containing value \"([^\"]*)\" in flex table id \"([^\"]*)\"$")
    public void clickOnLink(String linkText, String tableId) {
        govgrants.perform().flexTable().clickOnLinkInsideTable(tableId, linkText);
    }

    @When("^I hovering mouse on enhanced charts id \"([^\"]*)\" and charts type \"([^\"]*)\"$")
    public void getStepProgressStatusContent(String chartId, String chartsType) {
        govgrants.perform().charts().getHoveringOnEnhancedCharts(chartId, chartsType);
    }

    @When("^I hovering mouse on specific enhanced charts id \"([^\"]*)\" and charts type \"([^\"]*)\"$")
    public void performHoverOnSpecificEnhancedCharts(String chartId, String chartsType) {
        govgrants.perform().charts().getHoveringOnSpecificEnhancedCharts(chartId, chartsType);
    }

    /**** Library Files *****/

    @Description("Click on expand icon at library or folder under library files tree view")
    @When("^I click on expand icon at library/folder \"([^\"]*)\"$")
    public void clickOnExpandIconAtLibrary(String libraryFileFolderName) {
        govgrants.perform().libraryFiles().clickOnExpandIconAtLibraryFolder(libraryFileFolderName);
    }

    @Description("Click on dropdown menu at library or file or folder under library files tree view")
    @When("^I click on dropdown at library/folder/file \"([^\"]*)\"$")
    public void clickOnDropdownIconAtLibrary(String libraryFileFolderName) {
        govgrants.perform().libraryFiles().clickOnDropdownIconAtLibraryFolderFile(libraryFileFolderName);
    }

    @Description("Enter values in fields presentunder modal window at library or file or folder under library files tree view")
    @When("^I enter value as \"([^\"]*)\" in field \"([^\"]*)\" at Library Files$")
    public void enterValueInFieldsAtModalWindowAtLibrary(String value, String fieldName) {
        govgrants.perform().libraryFiles().enterValueInFieldsAtModalWindow(value, fieldName);
    }

    @When("^I upload file \"([^\"]*)\" into (library|library with sharing)$")
    public void uploadFileInLibrary(String attachmentName, String usage) {
        govgrants.perform().libraryFiles().uploadFileInLibraryAtHomePhase(attachmentName, usage);
    }

    @Description("Perform click on selectChangeFolder option at upload file modal")
    @When("^I click on SelectChange Folder in add file modal$")
    public void clickOnSelectChangeFolderInAddFileModal() {
        govgrants.perform().libraryFiles().clickOnSelectChangeFolderInAddFileModalUnderLibrary();
    }

    @Description("Select folder to upload a file at upload file modal")
    @When("^I Select/Change Folder as \"([^\"]*)\" in add file modal$")
    public void selectOrChangeFolderInAddFileModalUnderLibrary(String folderName) {
        govgrants.perform().libraryFiles().selectOrChangeFolderInAddFileModalUnderLibrary(folderName);
    }

    @Description("Perform quick search for folder or file or library under library files tree view")
    @When("^I perform quick search for \"([^\"]*)\" under files library$")
    public void performQuickSearchUnderFilesLibrary(String searchValue) {
        govgrants.perform().libraryFiles().performQuickSearchUnderFilesLibrary(searchValue);
    }

    @Description("Select classification at upload file modal")
    @When("^I select Classification as \"([^\"]*)\" at upload file modal$")
    public void selectClassificationAtUploadFileModal(String classification) {
        govgrants.perform().libraryFiles().selectClassificationAtUploadFileModalUnderLibrary(classification);
    }

    @Description("Perform click to select tabs to upload file from computer or library")
    @And("^I click on \"([^\"]*)\" tab at files library upload modal$")
    public void clickOnTabAtFilesLibraryUploadModal(String tabName) {
        govgrants.perform().libraryFiles().clickOnTabAtFilesLibraryUploadModal(tabName);
    }

    @Description("Upload file from Library")
    @And("^I upload file( with classification type)?( \"([^\"]*)\")? present in the flex table \"([^\"]*)\" from library$")
    public void iUploadFileFromLibrary(String usage, String classificationType, String tableId) {
        govgrants.perform().libraryFiles().uploadFilesFromLibrary(usage, tableId, classificationType);
    }

    @Description("To handle the alert pop up")
    @When("^I click alert button \"([^\"]*)\"$")
    public void iClickAlertButton(String buttonName) {
        govgrants.perform().modal().clickAlertContentSpecificButton(buttonName);
    }

    @Description("Checkout to yopmail")
    @And("^I checkout to (yopmail|maildrop) with mailid \"([^\"]*)\"$")
    public void iCheckoutToYopmailWithMailid(String mailportal, String mailid) {
        govgrants.perform().email().ckeckoutYopMail(mailportal, mailid);
    }

    @Description("To click on any hyperlink with value or id inside page details")
    @And("^I click (in table|on) (subaward dashboard|hyperlink|link name) containing value \"([^\"]*)\"$")
    public void iClickOnHyperlinkContainingValue(String check, String usage, String linkName) {
        govgrants.perform().pageDetails().clickOnLink(check.contains("table"), usage, linkName);
    }

    @Description("To validate the help text inside page details")
    @Then("^I (see|softly see) \"([^\"]*)\" shown as help text( for label \"([^\"]*)\")?$")
    public void assertHelpText(String usage, String helpText, String fieldLabel) {
        if(fieldLabel != null)
            govgrants.perform().pageDetails().assertHelpTextAtField(usage, helpText, fieldLabel);
        else
            govgrants.perform().pageDetails().assertHelpTextAtPageBlock(usage, helpText);
    }

    @Description("To mouse hover on help text icon inside page details")
    @When("^I hovering mouse on help text icon inside (page block detail|modal) \"([^\"]*)\"$")
    public void getHelpTextIconsAtPageBlockDetail(String usage, String pageBlockDetailTitle) {
        if(usage.equalsIgnoreCase("modal"))
            govgrants.perform().pageDetails().getHelpTextAtModalWindow(pageBlockDetailTitle);
        else
            govgrants.perform().pageDetails().getHelpTextAtPageBlockDetail(pageBlockDetailTitle);
    }

    @Description("To verify sub header content displayed inside sidebar")
    @Then("^I (see|do not see) \"([^\"]*)\" inside \"([^\"]*)\" is displayed$")
    public void assertSubHeaderContentNameDisplayed(String usage, String sideBarCategory, String accordianSubHeaderDetail) {
        govgrants.perform().sideBar().assertSubHeaderContentDisplayed(usage, accordianSubHeaderDetail, sideBarCategory);
    }

    @Description("Clicks on top any right button for a table using button name and table id without processing")
    @When("^I click on top right button \"([^\"]*)\" in flex table with id \"([^\"]*)\" without processing$")
    public void clickTopRightButtonInFlexTableByIdWithoutProcessing(String buttonName, String tableId) {
        govgrants.perform().flexTable().clickTableTopRightButtonWithoutProcessing(tableId, buttonName);
    }

    @Description("mouse hover at row level value/icon inside flex grid")
    @When("I hovering mouse on table id {string} with table row level icon {string} for column value {string}")
    public void hoveringMouseOnRowLevelActionIcon(String flexTableId, String iconName, String uniqueColumnValues) {
        govgrants.perform().flexTable().mouseHoverAtTableRowLevelIcon(flexTableId, iconName, uniqueColumnValues);
    }

    @Description("Navigate to sidebar content at collab left panel")
    @When("I navigate to {string} submenu inside {string} menu on collab left panel")
    public void iNavigateToSubmenuInsideMenuOnCollabLeftPanel(String subMenu, String mainMenu) {
        govgrants.perform().pageDetails().clickSideBarContentInsideCollab(subMenu, mainMenu);
    }

    @Then("^I (see|softly see|do not see|softly do not see) the Instruction text in the page$")
    public void iSeeTheInstructionTextInThePage(String usage, List<String> texts) {
        govgrants.perform().registration().assertTheInstructionTextInThePage(usage, texts);
    }

    @Description("To click on different tabs of registration page")
    @And("I click on {string} tab of registration page")
    public void iClickOnTabOfRegistrationPage(String tabName) {
        govgrants.perform().registration().clickOnTabName(tabName);
    }

    @When("^I begin \"([^\"]*)\" registration$")
    public void startRegistration(String officeType) {
        govgrants.perform().registration().beginRegistration(officeType);
    }

    @And("^I click on \"([^\"]*)\" button$")
    public void iClickOnButton(String buttonName) {
        govgrants.perform().registration().clickRegisterationLink(buttonName);
    }

    @Description("Select the value in any specific field and also covers lookup data entry")
    @When("^I (select|select in modal) value \"([^\"]*)\" into field \"([^\"]*)\"$")
    public void selectValue(String usage, String fieldValue, String fieldApiName) {
        govgrants.perform().inputForms().inputFormDataByFieldApiName(fieldApiName, fieldValue, usage.contains("modal"));
        I.amPerforming().click().on(By.xpath("//div[@id='select2-drop']//ul[contains(@class, 'select2-results')]//div"));
    }

    @Description("Edit Notes inside notes page block")
    @And("^I edit the notes$")
    public void iEditTheNotes() {
        I.amPerforming().click().on(By.xpath("//div[contains(@id,'toggleNotes')]//a[@title='Edit']"));
        By notesTitle = By.xpath("//div[@id='addAtt']//label[text()='Title']/..//input");
        By notesDescriptionPath = By.xpath("//div[@id='addAtt']//label[text()='Description']/..//textarea");
        I.amPerforming().textInput().toClear(notesDescriptionPath);
        I.amPerforming().textInput().toClear(notesTitle);
        I.amPerforming().textInput().in(notesTitle, "Updated Notes Record");
        I.amPerforming().textInput().in(notesDescriptionPath, "Updated Automation Notes");
    }

    @Description("hovering mouse on help text icon at enhanced grid table column")
    @When("^I hovering mouse on help text icon inside \"([^\"]*)\" for enhanced grid table column$")
    public void getHelpTextIconsAtFlexTableColumn(String columnTitle) {
        govgrants.perform().flexTable().getHelpTextAtEnhancedGridTableSpecificColumn(columnTitle);
    }

    @Description("To clear value from form fields")
    @And("I clear value from {string} page block :")
    public void iClearValueFromPageBlock(String pageBlock, List<Map<String, String>> table) {
        for (Map<String, String> map : table) {
            govgrants.perform().inputForms().clearFormData(pageBlock, map.get("Field"));
        }
    }

    @Description("To click at button to attach file at collab - my feed section")
    @And("I click on {string} button at collab")
    public void iClickOnButtonAtCollab(String buttonName) {
        govgrants.perform().libraryFiles().clickOnButtonAtCollab(buttonName);
    }

    @Description("To click at close icon under upload files modal")
    @When("^I click on \"([^\"]*)\" icon at \"([^\"]*)\" modal under Library$")
    public void clickOnCloseIconAtLibraryModal(String icon, String modalTitle) {
        govgrants.perform().libraryFiles().clickOnCloseIconAtLibraryFolderFileModal(icon, modalTitle);
    }

    @Description("To click on back arrow")
    @And("I click on back arrow")
    public void iClickOnBackArrow() {
        ggObjects.backNavigation();
    }

    @Description("To mouse hover on help text icon inside page block")
    @When("^I hovering mouse on help text icon inside \"([^\"]*)\"$")
    public void getHelpTextIconsAtPageBlock(String blockTitle) {
        govgrants.perform().pageDetails().getHelpTextAtPageBlock(blockTitle);
    }

    @Description("To enter number of characters into field")
    @And("^I (enter|enter in modal) \"([^\"]*)\" characters into field \"([^\"]*)\"$")
    public void iEnterCharactersIntoField(String usage, String nubmerOfChar, String fieldApi) {
        govgrants.perform().inputForms().iEnterCharactersIntoField(usage.contains("modal"), nubmerOfChar, fieldApi);
    }

    @Description("To click on global search and select value at sidebar")
    @When("^I click on global search and select \"([^\"]*)\"$")
    public void iClickOnGlobalSearchAll(String dropDownValue) {
        govgrants.perform().sideBar().clickOnGlobalSearchAll(dropDownValue);
    }

    @Description("To perform click at session timeout dialogbox modal actions")
    @When("I click on \"([^\"]*)\" Button in Session Timeout dialogbox$")
    public void clickOnButtonInSessionTimeoutDialogbox(String buttonName) {
        govgrants.perform().pageDetails().clickOnButtonsAtCalendar(buttonName);
    }

    @Description("To click on week/month/day buttons at calendar")
    @And("I click on {string} Button at calendar")
    public void iClickOnButtonAtCalendar(String buttonName) {
        govgrants.perform().pageDetails().clickOnButtonsAtCalendar(buttonName);
    }

    @Description("To upload attachment in send email modal")
    @When("^I upload attachment \"([^\"]*)\" in send email modal$")
    public void uploadAttachmentOnSendEmailModal(String attachmentName) {
        govgrants.perform().pageDetails().uploadAttachmentInSendEmailModal(attachmentName);
    }

    @Description("To click on lookup link on calendar")
    @When("^I click on lookup link \"([^\"]*)\" on calender$")
    public void clickOnLookupLinkAtCalender( String lookupLink) {
        govgrants.perform().pageDetails().performClickOnLookupLink( lookupLink);
    }
//
//    @When("We copy data from {string} and generate report to {string}")
//    public void weCopyDataFromAndGenerateReportTo(String fromPath, String toPath) throws IOException {
//        EnvironmentFactory.setReportAnalysisPath(fromPath, toPath);
//        RunReportAnalyzer.perform().executeAnalysis();
//    }

    @When("I hover mouse on text with id {string}")
    public void iHoverMouseOnTextName(String id) {
        I.amPerforming().scroll().toMoveToElement(By.id(id));
    }

    @And("I press enter key")
    public void iPressEnterKey() {
        govgrants.perform().libraryFiles().pressKeyFromkeyboard();
    }

    @When("^I (see|do not see) radio button \"([^\"]*)\" for field \"([^\"]*)\"$")
    public void iSeeRadioButtonForField(String usage,String radioButton, String fieldApiName) {
        govgrants.perform().pageDetails().assertRadioButtonPresents(usage,radioButton,fieldApiName);
    }


}