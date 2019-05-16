@preApplication @regression 
Feature: Validate all scenarios in the Pre-Application 

Background: Qualify Announcement and Create PreApplication 
	Given I delete the record "Automation Announcement for Pre-Application" from the object "PreApplication" 
	And I delete the record "Automation Announcement for Pre-Application" from the object "Application" 
	Given I am on "SUBPORTAL" portal 
	And I login as "SPI" user 
	When I navigate to "Opportunities" tab 
	And I navigate to "Qualified" content inside "Opportunities" subheader on left panel 
	And I perform quick search for "Automation Announcement for Pre-Application" in "qleads" panel 
	When I click on "View" icon for "Automation Announcement for Pre-Application" inside table 
	And I click on "Create Pre-Application" in the page details 
	When I enter value "Automation Announcement for Application " into field "Title__c" 
	When I click modal button "Save and Continue" 
	And I click on "Save" in the page details 
	
@51292 @preApplicationCreation 
Scenario: Creating a Pre Application 
	Then I see status in Progress-bar is "Created" and is "green" 
	
@51293 @preApplicationEdition 
Scenario: Validate edition of pre-application 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "PreApplication_Field_Values" 
	When I click on "Save" in the page details 
	Then I see status in Progress-bar is "Created" and is "green" 
	
@51295 @addBudgetDetailsToPreApplication 
Scenario: Addition of budget in the budget grid to an pre-application 
	When I navigate to "Budget" sub tab 
	And I expand nested table containing column value "BP01" 
	When I edit the following rows inline in flex table with id "flexGridEnhancePreApplicationProjectsAndBudgetCategories" by clicking "Edit" : 
		| Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
		| Construction  | 5000   | 1000       | 5000           | 100            |
	Then I see the following messages in the page details contains: 
		| Saved Successfully! |
		
@51296 @PreApplicationAttachmentChecklistCA 
Scenario: Validate the attachment checklist of the PreApplication 
	When I navigate to "Attachments" sub tab 
	When I click on "Attach" icon for "Not Applicable" inside flex table with id "flexGridPreAppRecipientChecklists" 
	And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement" 
	When I close Modal 
	Then I see that "Active" has been added in flextable with Id "flexGridPreAppRecipientChecklists" 
	
@51297 @PreApplicationAttachmentCA 
Scenario: Validate the attachment of the PreApplication 
	When I navigate to "Attachments" sub tab 
	And I click on top right button "Add" in flex table with id "a150b000003fLctAAE" 
	When I choose the file "Announcement_Field_Values.xlsx" to upload for "Attachment" of type "Other" 
	And I close Modal 
	Then I see that "Other" has been added in flextable with Id "a150b000003fLctAAE" 
	
@51298 @submitPreApplication 
Scenario: Submitting an pre application to Grantor 
	Given I click on "Edit" in the page details 
	And I enter "Edition" values from "PreApplication_Field_Values.xlsx" 
	When I click on "Save" in the page details 
	Given I expand nested table containing column value "BP01" 
	And I edit the following rows inline in flex table with id "flexGridEnhancePreApplicationProjectsAndBudgetCategories" by clicking "Edit" : 
		| Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
		| Construction  | 500    | 100        | 50             | 100           |
	When I navigate to "Attachments" sub tab 
	When I click on "Attach" icon for "Not Applicable" inside flex table with id "flexGridPreAppRecipientChecklists" 
	And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement" 
	When I close Modal 
	And I click on top right button "Add" in flex table with id "a150b000003fLctAAE" 
	When I choose the file "Announcement_Field_Values.xlsx" to upload for "Attachment" of type "Other" 
	And I close Modal 
	When I click on "Submit to Grantor" in the page details 
	Then I see status in Progress-bar is "Submitted" and is "green" 
	
@51299 @preApplicationSubmittedToGrantorPendingTask 
Scenario: Validate Grantor accept the submitted pre-application 
	Given I click on "Edit" in the page details 
	And I enter "Edition" values from "PreApplication_Field_Values.xlsx" 
	When I click on "Save" in the page details 
	Given I expand nested table containing column value "BP01" 
	And I edit the following rows inline in flex table with id "flexGridEnhancePreApplicationProjectsAndBudgetCategories" by clicking "Edit" : 
		| Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
		| Construction  | 500    | 100        | 50             | 100           |
	When I navigate to "Attachments" sub tab 
	When I click on "Attach" icon for "Not Applicable" inside flex table with id "flexGridPreAppRecipientChecklists" 
	And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement" 
	When I close Modal 
	And I click on top right button "Add" in flex table with id "a150b000003fLctAAE" 
	When I choose the file "Announcement_Field_Values.xlsx" to upload for "Attachment" of type "Other" 
	And I close Modal 
	When I click on "Submit to Grantor" in the page details 
	Given I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal 
	When I navigate to "Applications" tab 
	And I navigate to "Applications" content inside "Applications" subheader on left panel 
	Given "1" Approvers "EXE" approve the record "Record id" 
		| Actions    | Step 1        | Step 2       | Step 3                | Step 4 |
		| Navigation | As a Grantor  | Applications |                       |        |
		| FlexTable  | Pending Tasks | My Tasks     | PhasePendingTasks     |        |
		| Approval   | Start         | Accept       | Accept after approval | Ok     |
	Then I see status in Progress-bar is "Accepted" and is "green" 
	
@preApplicationtoApplication 
Scenario Outline:
Validate Grantor accept the submitted pre-application and converted it to application 
	Given I click on "Edit" in the page details 
	And I enter "Edition" values from "PreApplication_Field_Values.xlsx" 
	When I click on "Save" in the page details 
	Given I expand nested table containing column value "BP01" 
	And I edit the following rows inline in flex table with id "flexGridEnhancePreApplicationProjectsAndBudgetCategories" by clicking "Edit" : 
		| Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
		| Construction  | 500    | 100        | 50             | 100           |
	When I navigate to "Attachments" sub tab 
	When I click on "Attach" icon for "Not Applicable" inside flex table with id "flexGridPreAppRecipientChecklists" 
	And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement" 
	When I close Modal 
	And I click on top right button "Add" in flex table with id "a150b000003fLctAAE" 
	When I choose the file "Announcement_Field_Values.xlsx" to upload for "Attachment" of type "Other" 
	And I close Modal 
	When I click on "Submit to Grantor" in the page details 
	Given I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal 
	When I navigate to "Applications" tab 
	And I navigate to "Applications" content inside "Applications" subheader on left panel 
	Given "1" Approvers "EXE" approve the record "Record id" 
		| Actions    | Step 1        | Step 2       | Step 3                | Step 4 |
		| Navigation | As a Grantor  | Applications |                       |        |
		| FlexTable  | Pending Tasks | My Tasks     | PhasePendingTasks     |        |
		| Approval   | Start         | Accept       | Accept after approval | Ok     |
	Given I complete the fields from the sheet "Edition" in excel "Application_Field_Values.xlsx" 
		| Actions                | Step 1 | Step 2 |
		| Edition Buttons | Edit   | Save   |
	And I navigate to "Budget" sub tab 
	Given I expand nested table containing column value "BP01" 
	And I edit the following rows inline in flex table with id "applicationIntake::budgetPeriodTableId" by clicking "Edit" : 
		| Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
		| Construction  | 100    | 100        | 100            | 100            |
	When I navigate to "Proposal" sub tab 
	When I edit the following rows inline in flex table with id "applicationIntake::kpiTableId" by clicking "Edit" : 
		| EGMS ID                                 | Target |
		| Automation Permanent KPI for Regression | 10     |
	And I navigate to "Attachments" sub tab 
	And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "applicationIntake::allFormsTableId" 
	Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx" 
	And I click on "Save" in the page details 
	Given I click on "Back" in the page details 
	And I click on "Edit" icon for "Application Form - Project H.E.A.T." inside flex table with id "applicationIntake::allFormsTableId" 
	Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx" 
	And I click on "Save" in the page details 
	Given I click on "Back" in the page details 
	When I click on "Submit Application" in the page details 
	Given I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal 
	When I navigate to "Applications" tab 
	And I navigate to "Applications" content inside "Applications" subheader on left panel 
	When I click toggle button to select "All Applications" 
	When I click on "View" icon for "<Application Name>" inside table 
	Then I see status in Progress-bar is "Submitted" and is "green" 
	Examples: 
		| User | Application Name                            |
		| EXE  | Automation Announcement for Pre-Application |
