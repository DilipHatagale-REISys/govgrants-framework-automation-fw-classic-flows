@progressReport
Feature: Validate all scenarios in Progress Report

	Background: Navigate to Award
	Given I login to "As a Grantor" app as "EXE" user

	@taskCreationForSubrecipientProgressReport @progressReport
    Scenario: To assert the task creation for Progress Report
    When User "SPI" receives the task for "Complete Progress Report"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | Grants Portal | SUBPORTAL |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	Then I see status in Progress-bar is "Created" and is "green"
	
	@editProgressReport @progressReport
    Scenario: To edit Progress Report
    Given User "SPI" receives the task for "Complete Progress Report"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | Grants Portal | SUBPORTAL |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
    
    @editKPIProgressReport @progressReport
    Scenario: To edit KPI in Progress Report
    Given User "SPI" receives the task for "Complete Progress Report"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | Grants Portal | SUBPORTAL |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
	| Title					  		| Actual | Reported Date |
	| Automation Program KPI   		| 7      | 01/03/2019    |
	| Automation Announcement KPI   | 7      | 01/03/2019    |
    Then I see that "7" has been added in flextable with Id "flexGridProgressReportKeyOutcomes"
    
    @formFillingProgressReport @progressReport
    Scenario: To fill and complete the form in Progress Report
    Given User "SPI" receives the task for "Complete Progress Report"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | Grants Portal | SUBPORTAL |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Medicaid Community Initiative Progress Report" inside flex table with id "FormComponent"
    When I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    Then I see that "100.00%" has been added in flextable with Id "FormComponent"
    
    @submitProgressReportToGrantor @progressReport
    Scenario: To submit Progress Report to Grantor
    Given User "SPI" receives the task for "Complete Progress Report"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | Grants Portal | SUBPORTAL |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
	| Title					  		| Actual | Reported Date |
	| Automation Program KPI   		| 7      | 01/03/2019    |
	| Automation Announcement KPI   | 7      | 01/03/2019    |
	And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
	| Actions 	  | Step 1   		 	  | Step 2		  |
	| Navigation  | Forms and Attachments | 			  |
	| FlexTable   | Edit				  | FormComponent |
	| Form Button | Save				  | Back 		  |
	| Validation  | Validate			  | FormComponent |
	When I click on "Submit to Grantor" in the page details
	Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
	
	@assignApproversToProgressReport @progressReport
    Scenario: To assign or change th defualt approvers in Progress Report
    Given User "SPI" receives the task for "Complete Progress Report"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | Grants Portal | SUBPORTAL |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
	| Title					  		| Actual | Reported Date |
	| Automation Program KPI   		| 7      | 01/03/2019    |
	| Automation Announcement KPI   | 7      | 01/03/2019    |
	And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
	| Actions 	  | Step 1   		 	  | Step 2		  |
	| Navigation  | Forms and Attachments | 			  |
	| FlexTable   | Edit				  | FormComponent |
	| Form Button | Save				  | Back 		  |
	| Validation  | Validate			  | FormComponent |
	Given I click on "Submit to Grantor" in the page details
	When User "EXE" receives the task for "Review Progress Report"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | As a Grantor  | QA		 |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	When I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				       		   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 			  		   | 		|		    		  |
    | Approver 1 | ProgressReportsRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | ProgressReportsRolesandResponsibilities | Edit	| Fiscal Approver     |
    Then I see that "Automation PM" has been added in flextable with Id "ProgressReportsRolesandResponsibilities"
	
	@submitProgressReportForApproval @progressReport
    Scenario: To submit Progress Report for approval
    Given User "SPI" receives the task for "Complete Progress Report"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | Grants Portal | SUBPORTAL |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
	| Title					  		| Actual | Reported Date |
	| Automation Program KPI   		| 7      | 01/03/2019    |
	| Automation Announcement KPI   | 7      | 01/03/2019    |
	And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
	| Actions 	  | Step 1   		 	  | Step 2		  |
	| Navigation  | Forms and Attachments | 			  |
	| FlexTable   | Edit				  | FormComponent |
	| Form Button | Save				  | Back 		  |
	| Validation  | Validate			  | FormComponent |
	Given I click on "Submit to Grantor" in the page details
	When User "EXE" receives the task for "Review Progress Report"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | As a Grantor  | QA		 |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	When I click on "Submit for Approval" in the page details
	Then I see status in Progress-bar is "Submitted for Approval" and is "green"
	
	@approvalOfProgressReport @progressReportHappyPath @progressReport
    Scenario: To approve Progress Report
    Given User "SPI" receives the task for "Complete Progress Report"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | Grants Portal | SUBPORTAL |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
	| Title					  		| Actual | Reported Date |
	| Automation Program KPI   		| 7      | 01/03/2019    |
	| Automation Announcement KPI   | 7      | 01/03/2019    |
	And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
	| Actions 	  | Step 1   		 	  | Step 2		  |
	| Navigation  | Forms and Attachments | 			  |
	| FlexTable   | Edit				  | FormComponent |
	| Form Button | Save				  | Back 		  |
	| Validation  | Validate			  | FormComponent |
	Given I click on "Submit to Grantor" in the page details
	And User "EXE" receives the task for "Review Progress Report"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | As a Grantor  | QA		 |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	Given I click on "Submit for Approval" in the page details
	When "2" Approvers "PM,FO" approve the record "Approve the Progress Report"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Announcements | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
	Then I see status in Progress-bar is "Approved" and is "green"
	
	@approvalOfProgressReport @progressReportHappyPathWithoutDefaultApprovers @progressReport
    Scenario: To approve Progress Report by changing the defualt approvers in Progress Report
    Given User "SPI" receives the task for "Complete Progress Report"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | Grants Portal | SUBPORTAL |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
	| Title					  		| Actual | Reported Date |
	| Automation Program KPI   		| 7      | 01/03/2019    |
	| Automation Announcement KPI   | 7      | 01/03/2019    |
	And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
	| Actions 	  | Step 1   		 	  | Step 2		  |
	| Navigation  | Forms and Attachments | 			  |
	| FlexTable   | Edit				  | FormComponent |
	| Form Button | Save				  | Back 		  |
	| Validation  | Validate			  | FormComponent |
	Given I click on "Submit to Grantor" in the page details
	And User "EXE" receives the task for "Review Progress Report"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | As a Grantor  | QA		 |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	When I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				       		   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 			  		   | 		|		    		  |
    | Approver 1 | ProgressReportsRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | ProgressReportsRolesandResponsibilities | Edit	| Fiscal Approver     |
	Given I click on "Submit for Approval" in the page details
	When "2" Approvers "PM,FO" approve the record "Approve the Progress Report"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Announcements | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
	Then I see status in Progress-bar is "Approved" and is "green"