package com.ggproduct.automation.steps;


import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.pageobjects.PlanningPage;

import cucumber.api.java.en.Given;


public class PlanningSteps {
    PlanningPage planningPage;

    public PlanningSteps(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
        planningPage = new PlanningPage(controller, handler, govgrants);
    }
    
    @Given("^I create a Program as user \"([^\"]*)\" from sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void creationOfProgram(String user,String sheetName, String excelFileName) {
        planningPage.creationOfProgram(user, sheetName, excelFileName);
    }
    
    @Given("^I complete the Program fields from the sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void editionOfProgram(String sheetName, String excelFileName) {
        planningPage.editionOfProgram(sheetName, excelFileName);
    }
    
    @Given("^I associate Contact \"([^\"]*)\", Focus Area \"([^\"]*)\", Objective \"([^\"]*)\" to the program$")
    public void associationOfRecordsToProgram(String contact, String focusArea, String objective) {
        planningPage.associationOfRecordsToProgram(contact, focusArea, objective);
    }
    
    @Given("^I select the Program Approver \"([^\"]*)\", Executive Approver \"([^\"]*)\" for the program$")
    public void approverSelectionForProgram(String programApprover, String executiveApprover) {
        planningPage.approverSelectionForProgram(programApprover, executiveApprover);
    }
    
    @Given("^I add an attachment checklist \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\" to upload the file \"([^\"]*)\" to the program$")
    public void additionOfChecklistToProgram(String description, String required, String appliesTo, String fileName) {
        planningPage.additionOfChecklistToProgram(description, required, appliesTo, fileName);
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
