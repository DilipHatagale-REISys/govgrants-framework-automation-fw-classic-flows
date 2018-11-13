package com.ggproduct.automation.steps;


import com.automation.rei.controller.Controller;
import com.automation.rei.handlers.GovGrantsHandler;
import com.automation.rei.handlers.Handlers;
import com.ggproduct.automation.pageobjects.ProgramPage;

import cucumber.api.java.en.Given;


public class ProgramSteps {
    ProgramPage programPage;

    public ProgramSteps(Controller controller, Handlers handler, GovGrantsHandler govgrants) {
        programPage = new ProgramPage(controller, handler, govgrants);
    }
    
    @Given("^I create a Program$")
    public void creationOfProgram() {
        programPage.creationOfProgram();
    }
    
    @Given("^I enter all the fields for the program$")
    public void editionOfProgram() {
        programPage.editionOfProgram();
    }
    
    @Given("^I associate Contact, Focus Area, Objective to the program$")
    public void associationOfRecordsToProgram() {
        programPage.associationOfRecordsToProgram();
    }
    
    @Given("^I select the approvers for the program$")
    public void approverSelectionForProgram() {
        programPage.approverSelectionForProgram();
    }
    
    @Given("^I add an attachment checklist to the program$")
    public void additionOfChecklistToProgram() {
        programPage.additionOfChecklistToProgram();
    }
    
    @Given("^I add an attachment to a program$")
    public void additionOfAttachmentToProgram() {
        programPage.additionOfAttachmentToProgram();
    }
    
    @Given("^Approvers approve the Program$")
    public void approversApproveProgram() {
        programPage.approversApproveProgram();
    }

}
