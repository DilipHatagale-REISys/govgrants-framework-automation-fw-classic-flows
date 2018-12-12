package com.ggproduct.automation.steps;


import com.automation.rei.controller.Controller;

import com.automation.rei.handlers.CoreHandlers;
import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.pageobjects.PlanningPage;

import cucumber.api.DataTable;
import cucumber.api.java.en.Given;
import java.util.List;
import java.util.Map;


public class PlanningSteps {
    PlanningPage planningPage;

    public PlanningSteps(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        planningPage = new PlanningPage(controller, handler, govgrants);
    }
    
    @Given("^I create a record as user \"([^\"]*)\" from sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void creationOfProgram(String user,String sheetName, String excelFileName, DataTable dataTable) {
        planningPage.creationOfProgram(user, sheetName, excelFileName, dataTable);
    }
    
    @Given("^I complete the Program fields from the sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void editionOfProgram(String sheetName, String excelFileName, DataTable dataTable) {
        planningPage.editionOfProgram(sheetName, excelFileName, dataTable);
    }
    
    @Given("^I associate Contact \"([^\"]*)\", Focus Area \"([^\"]*)\", Objective \"([^\"]*)\" to the program$")
    public void associationOfRecordsToProgram(String contact, String focusArea, String objective) {
        planningPage.associationOfRecordsToProgram(contact, focusArea, objective);
    }
    
    @Given("^I select the Program Approver \"([^\"]*)\", Executive Approver \"([^\"]*)\" for the program$")
    public void approverSelectionForProgram(String programApprover, String executiveApprover) {
        planningPage.approverSelectionForProgram(programApprover, executiveApprover);
    }
    
    @Given("^I add an attachment checklist to upload the file \"([^\"]*)\" to the program$")
    public void additionOfChecklistToProgram(String fileName, DataTable dataTable) {
        planningPage.additionOfChecklistToProgram(fileName, dataTable);
    }
    
    @Given("^I add an attachment \"([^\"]*)\" to a program$")
    public void additionOfAttachmentToProgram(String fileName) {
        planningPage.additionOfAttachmentToProgram(fileName);
    }
    
    @Given("^Approvers \"([^\"]*)\", \"([^\"]*)\" approve the Program \"([^\"]*)\"$")
    public void approversApproveProgram(String programApprover, String executiveApprover, String programName) {
        planningPage.approversApproveProgram(programApprover, executiveApprover, programName);
    }

}
