package com.ggproduct.automation.projectmanager;

import java.io.IOException;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.Handlers;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

/**
 * for Rei Systems
 * 
 * @author Handles generic/common methods and WebElements of the project. 
 *         
 */
public class ProjectManager extends ProjectWebServices {
    public Handlers reiDriver;
    public Controller controller;
    public final String defaultPassword="SALESFORCE2018";
    public final String defaultLongText="Automation test description";
    
    /**
     * Super Constructor
     * 
     * @param controller
     * @param reiDriver
     */
    public ProjectManager(Controller controller, Handlers reiDriver) {
        this.controller = controller;
        this.reiDriver = reiDriver;
    }
    
    /********* BELOW ARE ONLY EXAMPLE METHODS AND SHALL BE REMOVED ************/
    /****** BELOW PATTREN IS CONSIDERED BEST IN CODING WORLD. ADD JAVA DOCS AND KEEP LOCAL/KEY METHOD CATEGORIES ***/
    
    

    /******* "Key Methods with complete functionality" *****************/

    /**
     * navigate to a url
     * @param urlName
     * @throws IOException 
     */
    public void navigateToURL(String urlName) throws IOException {
        reiDriver.get().navigateToUrl(new UsersAndURL().navigateToAnyUrl(urlName));
    }
    

    /**
     * get main menu tab name to click on it. e.g; planning,announcements etc
     * 
     * @param menuItem
     */
    public void clickMainMenuTab(String menuItem) {
        reiDriver.WaitFor().WaitForElementToBePresent(
                By.xpath("//div/ul[@class='nav navbar-nav']/li/a[@title='" + menuItem + "']")).click();
    }
    
    /**
     * generic method to enter field values from an Excel file on a page form
     * Excel file should have four columns in the following order:
     * Subtab:       The subtab the field input is found on.
     *               Note: Do not leave this blank.  Enter "None" if there is no subtab
     *
     * FieldType:    The type of the field.  Valid types are: "Text", "RichText", "Date", "Date/Time",
     *                                                        "Lookup", "Checkbox", "DropDown", "MultiSelect"
     *               Note: These are case insensitive
     *
     * FieldApiName: The Salesforce API name of the field.
     *               Note: Include the "__c" suffix for the field, even if the field is standard.
     *
     * FieldValue:   The value to be entered into the field.
     *               Note: "Date" and "Date/Time" inputs take an integer offset from the current day.
     *                     They do not currently support entering specific dates
     *
     * Inputs are read starting from the second row of the sheet. This is a feature of reiDriver.excelReader,
     *   allowing you to use the first row as a header.
     *
     * @param fileName
     * @param sheetName
     *
     */
    public void enterInputForFormsFromExcelFile(String fileName, String sheetName) {

        String[][] data = reiDriver.excelReader().readExcelFile(fileName, sheetName);
        String currentSubTab = "";

        if(data != null) {
            for(String[] column : data) {
                String subTab = column[0];
                String fieldType = column[1];
                String fieldApiName = column[2];
                String fieldValue = column[3];

                //Switch to relevant tab
                if(!"None".equalsIgnoreCase(subTab) && !subTab.equalsIgnoreCase(currentSubTab)) {
                    reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//*[@id='topTabsID']"));
                    reiDriver.JavaScript().scrollpageToSpecificElement(By.xpath("//*[@id='page-content-wrapper']"));
                    reiDriver.govGrants().clickSubTabsInsideTableView(subTab);
                    currentSubTab = subTab;
                }
                this.inputData(fieldType, fieldApiName, fieldValue);
            }
        }
    }
    
    public void inputData(String fieldType, String fieldApiName, String fieldValue) {
        int attempts = 0;
        while(attempts < 10 && !reiDriver.is().IsElementPresentQuick(By.xpath("//div[@id='field" + fieldApiName + "']"))) {
            attempts++;
            try{
                reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//div[@id='field" + fieldApiName + "']"));
            }
            catch(Exception e) {

            }
        }

        if("Text".equalsIgnoreCase(fieldType)) {
            handleTextInput(fieldApiName, fieldValue);
        }
        if("Date".equalsIgnoreCase(fieldType)) {
            handleDateInput(fieldApiName, fieldValue, false);
        }
        if("Date/Time".equalsIgnoreCase(fieldType)) {
            handleDateInput(fieldApiName, fieldValue, true);
        }
        if("RichText".equalsIgnoreCase(fieldType)) {
            handleRichTextInput(fieldApiName, fieldValue);
        }
        if("Lookup".equalsIgnoreCase(fieldType)) {
            handleLookUpInput(fieldApiName, fieldValue);
        }
        if("Dropdown".equalsIgnoreCase(fieldType)) {
            handleDropdownInput(fieldApiName, fieldValue);
        }
        if("MultiSelect".equalsIgnoreCase(fieldType)) {
            handleMultiSelectInput(fieldApiName, fieldValue);
        }
        if("CheckBox".equalsIgnoreCase(fieldType)) {
            handleCheckBoxInput(fieldApiName, fieldValue);
        }
    }
    
    public void scrollToTop() {
        WebDriver driver = reiDriver.switchTo().switchToParentFrame();
        JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("document.body.scrollTo(0, 0);");
    }
    
    /******* "Local Methods with Limited functionality " **********/

    /**
     * get any specific column value in pending tasks (Assigned to me)
     */
    private List<WebElement> getToPendingTasksAssignedToMeDesiredColumn(String mycolumnValue) {
        return reiDriver.findMyElement()
                .getElements(By.xpath("//div/table/tbody/tr/td/span/span/span[text()='" + mycolumnValue + "']"));
    }
    
    private void handleTextInput(String fieldApiName, String fieldValue) {
        By fieldInput = By.xpath("//div[@id='field" + fieldApiName + "']//input[@type='text']");
        reiDriver.textInput().clearText(fieldInput);
        reiDriver.textInput().enterText(fieldInput, fieldValue);
    }

    private void handleDateInput(String fieldApiName, String fieldValue, boolean isDateTime){
        String inputFormat = "MM/dd/YYYY";
        if(isDateTime) {
            inputFormat = inputFormat + " hh:mm a";
        }

        int offset = 0;
        try{
            offset = Integer.parseInt(fieldValue);
        }
        catch(Exception e) {

        }

        By fieldInput = By.xpath("//div[@id='field" + fieldApiName + "']//input[@type='text']");
        reiDriver.textInput().clearText(fieldInput);
        reiDriver.textInput().enterText(fieldInput, reiDriver.get().getCurrentDateWithOffsetInDesiredFormat(offset, inputFormat));
        reiDriver.WaitFor().WaitForElementToBePresent(fieldInput).click();
    }

    private void handleRichTextInput(String fieldApiName, String value) {
        reiDriver.switchTo().switchToFrame(By.xpath("//div[@id='field" + fieldApiName + "']//iframe"));
        reiDriver.textInput().clearText(By.xpath("//html/body"));
        reiDriver.findMyElement().getElement(By.xpath("//html/body")).sendKeys(value);
        reiDriver.switchTo().switchToParentFrame();
    }

    private void handleLookUpInput(String fieldApiName, String searchTerm) {
        int attempts = 0;
        while(attempts < 10 && !reiDriver.is().IsElementPresentQuick(By.xpath("//body[contains(@class, 'modal-open')]"))) {
            attempts++;
            try{
                reiDriver.WaitFor().FluentWaitForClick(By.xpath("//div[@id='field" + fieldApiName + "']//dd//a")).click();
                reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//body[contains(@class, 'modal-open')]"));
            }
            catch(Exception e) {
            }
        }
        WebDriver driver = reiDriver.switchTo().switchToFrame(By.xpath("//iframe[@id='iframeCustomLookupModalId']"));

        String tableid = reiDriver.WaitFor().WaitForElementToBePresent(By.xpath("//div[@id='ModalDivID']//div[1]")).getAttribute("id");
        reiDriver.govGrants().performModalSpecificQuickSearch(tableid, searchTerm);
        attempts = 0;
        while(attempts < 10 && !reiDriver.is().IsElementPresentQuick(By.xpath("//td//*[text()='" + searchTerm + "']"))) {
            attempts++;
            reiDriver.govGrants().performModalSpecificQuickSearch(tableid, searchTerm);
        }
        reiDriver.WaitFor().makeThreadSleep(200); // avoid stale elements


        attempts = 0;
        while(attempts < 10 && reiDriver.is().IsElementPresentQuick(By.xpath("//body/*"))){
            reiDriver.WaitFor().FluentWaitForClick(By.xpath("//td//*[text()='" + searchTerm + "']//ancestor::tr[1]//a[@title='Select']")).click();
        }

        driver.switchTo().parentFrame();
        reiDriver.WaitFor().WaitForElementToDisapear(By.xpath("//iframe[@id='iframeCustomLookupModalId']"));
    }

    private void handleDropdownInput(String fieldApiName, String value) {
        reiDriver.WaitFor().WaitForElementListToBePresent(By.xpath("//div[@id='field" + fieldApiName + "']//select"));
        reiDriver.findMyElement().getDropDown(By.xpath("//div[@id='field" + fieldApiName + "']//select")).selectByVisibleText(value);
    }

    private void handleMultiSelectInput(String fieldApiName, String value) {
        reiDriver.WaitFor().WaitForElementListToBePresent(By.xpath("//div[@id='field" + fieldApiName + "']//select"));

        JsonArray values = new JsonParser().parse(value).getAsJsonArray();
        for(JsonElement val : values) {
            String input = val.toString().substring(1, val.toString().length() - 1);
            reiDriver.findMyElement().getDropDown(By.xpath("//div[@id='field" + fieldApiName + "']//optgroup[@label='Available']//..")).selectByVisibleText(input);
        }

        reiDriver.WaitFor().FluentWaitForClick(By.xpath("//div[@id='field" + fieldApiName + "']//img[@title='Add']//..")).click();
    }

    private void handleCheckBoxInput(String fieldApiName, String fieldValue) {
        By fieldInput = By.xpath("//div[@id='field" + fieldApiName + "']//input[@type='checkbox']");
        if("Checked".equalsIgnoreCase(fieldValue) && !reiDriver.WaitFor().WaitForElementToBePresent(fieldInput).isSelected()) {
            reiDriver.WaitFor().FluentWaitForClick(fieldInput).click();
        }
        else if ("Unchecked".equalsIgnoreCase(fieldValue) && reiDriver.WaitFor().WaitForElementToBePresent(fieldInput).isSelected()) {
            reiDriver.WaitFor().FluentWaitForClick(fieldInput).click();
        }
    }

   

}
