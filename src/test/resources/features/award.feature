@award
Feature: Validate all scenarios in the Award

	Background: Create Award from FDM
	Given I create a subaward from the Announcement "Automation Announcement" for the Application "Automation Announcement application"
		
	@38213 @awardCreation @award
	Scenario: Creation of an award
	Then I see status in Progress-bar is "Created" and is "green"
	
	@38217 @awardEdition @award
	Scenario: Edition of an award
	When I click on "Edit" in the page details
	And I enter "Edition" values from "Award_Field_Values.xlsx"
	When I click on "Save" in the page details
	Then I see status in Progress-bar is "Created" and is "green"
	
	@awardFundingAccount @award
 	Scenario Outline: Funding Account budget addition to Award
	When I navigate to "Budget" sub tab
	And I edit the following rows inline in flex table with id "flexGridAwardFundingAccounts" by clicking "Edit" :
	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  | 
    Then I see that "<EGMS Id>" has been added in flextable with Id "flexGridAwardFundingAccounts"
	Examples:
	| EGMS Id |
	| FA--21  |
	
	@awardBudgetEdition @award
  	Scenario: Budget addition to Award
	When I navigate to "Budget" sub tab
    And I click on "Add Line Items" icon for "Construction" inside flex table with id "inlineEditGridAwardBudgetCategoryFlexGrid"
    When I edit the following rows inline in flex table with id "inlineEditGridLineItem" by clicking "Edit" :
	| Budget Category | Cash Match |
	| Construction    | 2000 	   | 
    And I close Modal
    Then I see that "Construction" has been added in flextable with Id "inlineEditGridAwardBudgetCategoryFlexGrid"
	
	@awardPaymentRequestSchedule @award
  	Scenario: Payment Request Schedule in an award
	When I navigate to "Management" sub tab
   	And I click on top right button "New" in flex table with id "flexGridPaymentSchedules"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    Then I see that "Payment Request" has been added in flextable with Id "flexGridPaymentSchedules"
	
	@awardProgressReportSchedule @award
  	Scenario: Progress Report Schedule in an award
	When I navigate to "Management" sub tab
   	And I click on top right button "New" in flex table with id "flexGridTnCSchedules"
    When I enter "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    Then I see that "Progress Report" has been added in flextable with Id "flexGridTnCSchedules"
	
	@awardRiskAssessmentCreation @award
  	Scenario: Risk Assessment creation in an award
	When I navigate to "Management" sub tab
   	And I click on top right button "New" in flex table with id "flexGridAwardRiskAssessmentView"
    When I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
	
	@awardRiskAssessmentApproverSelection @award
  	Scenario: Risk Assessment approver selection in an award
    Given I create a Risk Assessment from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    When I navigate to "Responsibilities" sub tab
    And I click on "Edit" icon for "Program Approver" inside flex table with id "GrantorRiskAssessmentRolesandResponsibilities"
    When I fill in the "Automation PM" for the Approver details
    And I close Modal
    When I click on "Edit" icon for "Fiscal Approver" inside flex table with id "GrantorRiskAssessmentRolesandResponsibilities"
    And I fill in the "Automation FO" for the Approver details
    When I close Modal
    Then I see that "Automation PM" has been added in flextable with Id "GrantorRiskAssessmentRolesandResponsibilities"
	
	@awardRiskAssessmentSubmitForApproval @award
  	Scenario: Risk Assessment submission for approval in an award
    Given I create a Risk Assessment from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    And I select the Program Approver as "Automation PM" and Fiscal Approver as "Automation FO" for Risk Assessment
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
	
	@awardRiskAssessmentApprovalAndActivation @award
  	Scenario: Risk Assessment approval in an award
    Given I create a Risk Assessment from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    And I select the Program Approver as "Automation PM" and Fiscal Approver as "Automation FO" for Risk Assessment
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" User
    And I navigate to "Monitoring" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search "Approve Risk Assessment" on table "PhasePendingTasks"
    When I click on the "Start" icon for the "Approve Risk Assessment" 
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" User
    And I navigate to "Monitoring" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search "Approve Risk Assessment" on table "PhasePendingTasks"
    When I click on the "Start" icon for the "Approve Risk Assessment" 
    And I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Active" and is "green"
	
	@awardApproverSelection @award
  	Scenario: Validate the assignment of Approvers for the award
    When I navigate to "Responsibilities" sub tab
    And I click on "Edit" icon for "Program Approver" inside flex table with id "GrantorAwardApprover"
    When I fill in the "Automation PM" for the Approver details
    And I close Modal
    When I click on "Edit" icon for "Fiscal Approver" inside flex table with id "GrantorAwardApprover"
    And I fill in the "Automation FO" for the Approver details
    And I close Modal
    And I click on "Edit" icon for "Executive Approver" inside flex table with id "GrantorAwardApprover"
    When I fill in the "Automation EXE" for the Approver details
    And I close Modal
    Then I see that "Automation EXE" has been added in flextable with Id "GrantorAwardApprover"
	
	@awardSendToRecipientBeforeApproval @award
  	Scenario Outline: Validate the assignment of Approvers for the award 
  	Given I complete the Award fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
  	And I add budget in the Award Funding Account
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction 	  | 2000 	   | 
  	And I add the Payment Request schedule from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx" to an award
  	Given I add the Progress Report schedule from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx" to an award
  	And I create a Risk Assessment from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    Given I select the Program Approver as "Automation PM" and Fiscal Approver as "Automation FO" for Risk Assessment
    And I click on "Submit for Approval" in the page details
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Application Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
	Then I click on "Send to Subrecipient" in the page details
	Examples:
	| Application Name 				     	    	    | Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardAcceptanceByRecipientBeforeApproval @award
  	Scenario Outline: Validate the assignment of Approvers for the award 
  	Given I complete the Award fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
  	And I add budget in the Award Funding Account
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction	  | 2000 	   | 
  	And I add the Payment Request schedule from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx" to an award
  	Given I add the Progress Report schedule from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx" to an award
  	And I create a Risk Assessment from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    Given I select the Program Approver as "Automation PM" and Fiscal Approver as "Automation FO" for Risk Assessment
    And I click on "Submit for Approval" in the page details
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" in the page details
  	When I re-login to Grants Portal as "SPI"
	And I navigate to "Grants" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search "<Award Name>" on table "PhasePendingTasks"
    When I click on the "Start" icon for the "<Award Name>" 
    And I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    Then I see that "Subaward" is in "Created" status
	Examples:
	| Award Name 				     	    	        | Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardReviewerAssignment @award
  	Scenario Outline: Validate the assignment of Reviewer for the award
  	Given I complete the Award fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
  	And I add budget in the Award Funding Account
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction    | 2000 	   |
  	And I add the Payment Request schedule from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx" to an award
  	Given I add the Progress Report schedule from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx" to an award
  	And I create a Risk Assessment from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    Given I select the Program Approver as "Automation PM" and Fiscal Approver as "Automation FO" for Risk Assessment
    And I click on "Submit for Approval" in the page details
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	When I re-login to "As a Grantor" app as "EXE" User
  	And I navigate to "Grants" tab
  	And I navigate to "Grants and Subawards" content inside "Grants, Awards & Amendments" subheader on left panel
	And I toggle to "Draft Grants"
	When I perform quick search "<Award Name>" on table "ActiveGrants"
	And I click on the "View" icon for the "<Award Name>"
	When I navigate to "Subawards" sub tab
	And I click on "View" icon for "<Award EGMS Id>" inside flex table with id "RelatedAwards1"
	When I navigate to "Responsibilities" sub tab
	And I click on top right button "New" in flex table with id "flexGridGrantorAwardReviewer"
	When I enter "Reviewer" values from "Award_Field_Values.xlsx"
	And I click modal button "Save"
	When I close Modal
	Then I see that "Automation FO" has been added in flextable with Id "flexGridGrantorAwardReviewer"
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardReviewerInitiation @award
  	Scenario Outline: Validate initiation of review for the award 
  	Given I complete the Award fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
  	And I add budget in the Award Funding Account
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction    | 2000 	   | 
  	And I add the Payment Request schedule from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx" to an award
  	Given I add the Progress Report schedule from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx" to an award
  	And I create a Risk Assessment from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    Given I select the Program Approver as "Automation PM" and Fiscal Approver as "Automation FO" for Risk Assessment
    And I click on "Submit for Approval" in the page details
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	When I re-login to "As a Grantor" app as "EXE" User
  	And I navigate to "Grants" tab
	When I navigate to "Grants and Subawards" content inside "Grants, Awards & Amendments" subheader on left panel
	And I toggle to "Draft Grants"
	When I perform quick search "<Award Name>" on table "ActiveGrants"
	And I click on the "View" icon for the "<Award Name>"
	When I navigate to "Subawards" sub tab
	And I click on "View" icon for "<Award EGMS Id>" inside flex table with id "RelatedAwards1"
	When I navigate to "Responsibilities" sub tab
	And I click on top right button "New" in flex table with id "flexGridGrantorAwardReviewer"
	When I enter "Reviewer" values from "Award_Field_Values.xlsx"
	And I click modal button "Save"
	When I close Modal
	And I click on "Send for Review" icon for "Created" inside flex table with id "flexGridGrantorAwardReviewer"
	Then I see that "Sent for Review" has been added in flextable with Id "flexGridGrantorAwardReviewer"
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardReviewComplete @award
  	Scenario Outline: Validate completion of review for the award 
  	Given I complete the Award fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
  	And I add budget in the Award Funding Account
  	| Funding Account	| Award Encumbrance |
	| FA--21 			| 100000 			|
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction    | 2000 	   | 
  	And I add the Payment Request schedule from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx" to an award
  	Given I add the Progress Report schedule from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx" to an award
  	And I create a Risk Assessment from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    Given I select the Program Approver as "Automation PM" and Fiscal Approver as "Automation FO" for Risk Assessment
    And I click on "Submit for Approval" in the page details
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	And I assign, initiate a reviewer for an award from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
  	When I re-login to "As a Grantor" app as "FO" User
    And I navigate to "Grants" tab
	When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search "<Award Name>" on table "PhasePendingTasks"
    When I click on the "Start" icon for the "<Award Name>" 
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridGrantorAwardReviewer"
    And I enter a review
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    Then I see that "Submitted" has been added in flextable with Id "flexGridGrantorAwardReviewer"
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	
	@awardSubmissionForApproval @award
  	Scenario Outline: Validate award submission for approval	
  	Given I complete the Award fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
  	And I add budget in the Award Funding Account
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction 	  | 2000 	   | 
  	And I add the Payment Request schedule from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx" to an award
  	Given I add the Progress Report schedule from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx" to an award
  	And I create a Risk Assessment from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    Given I select the Program Approver as "Automation PM" and Fiscal Approver as "Automation FO" for Risk Assessment
    And I click on "Submit for Approval" in the page details
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	And I assign, initiate a reviewer for an award from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
  	Given Review is completed as user "FO" for the award "<Award EGMS Id>" with name "<Award Name>" created by "EXE"
  	When I click on "Submit for Approval" in the page details
	Then I see status in Progress-bar is "Submitted for Approval" and is "green"
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardApproval @award
  	Scenario Outline: Validate award Approval by respective approvers	
  	Given I complete the Award fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
  	And I add budget in the Award Funding Account
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction 	  | 2000 	   | 
  	And I add the Payment Request schedule from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx" to an award
  	Given I add the Progress Report schedule from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx" to an award
  	And I create a Risk Assessment from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    Given I select the Program Approver as "Automation PM" and Fiscal Approver as "Automation FO" for Risk Assessment
    And I click on "Submit for Approval" in the page details
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	And I assign, initiate a reviewer for an award from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
  	Given Review is completed as user "FO" for the award "<Award EGMS Id>" with name "<Award Name>" created by "EXE"
  	And I click on "Submit for Approval" in the page details
  	Given I re-login to "As a Grantor" app as "PM" User
	When I navigate to "Grants" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search "<Award Name>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Award Name>" 
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "FO" User
	When I navigate to "Grants" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search "<Award Name>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Award Name>" 
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "EXE" User
	When I navigate to "Grants" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search "<Award Name>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Award Name>" 
    When I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardSendToRecipientAfterApproval @award
  	Scenario Outline: Validate award Approval by respective approvers	
  	Given I complete the Award fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
  	And I add budget in the Award Funding Account
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			 |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction 	  | 2000 		| 
  	And I add the Payment Request schedule from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx" to an award
  	Given I add the Progress Report schedule from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx" to an award
  	And I create a Risk Assessment from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    Given I select the Program Approver as "Automation PM" and Fiscal Approver as "Automation FO" for Risk Assessment
    And I click on "Submit for Approval" in the page details
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	And I assign, initiate a reviewer for an award from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
  	Given Review is completed as user "FO" for the award "<Award EGMS Id>" with name "<Award Name>" created by "EXE"
  	And I click on "Submit for Approval" in the page details
  	Given Approvers "PM", "FO", "EXE" approve the award "<Award Name>"
  	When I re-login to "As a Grantor" app as "EXE" User
	And I navigate to "Grants" tab
	When I navigate to "Grants and Subawards" content inside "Grants, Awards & Amendments" subheader on left panel
	And I toggle to "Draft Grants"
	When I perform quick search "<Award Name>" on table "ActiveGrants"
	And I click on the "View" icon for the "<Award Name>"
	When I navigate to "Subawards" sub tab
	And I click on "View" icon for "<Award EGMS Id>" inside flex table with id "RelatedAwards1"
	When I click on "Send to Subrecipient after Approval" in the page details
	Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardAcceptanceByRecipientAfterApproval @award
  	Scenario Outline: Validate award Approval by respective approvers	
  	Given I complete the Award fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
  	And I add budget in the Award Funding Account
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction    | 2000 	   | 
  	And I add the Payment Request schedule from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx" to an award
  	Given I add the Progress Report schedule from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx" to an award
  	And I create a Risk Assessment from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    Given I select the Program Approver as "Automation PM" and Fiscal Approver as "Automation FO" for Risk Assessment
    And I click on "Submit for Approval" in the page details
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	And I assign, initiate a reviewer for an award from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
  	Given Review is completed as user "FO" for the award "<Award EGMS Id>" with name "<Award Name>" created by "EXE"
  	And I click on "Submit for Approval" in the page details
  	Given Approvers "PM", "FO", "EXE" approve the award "<Award Name>"
  	And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
  	Given I click on "Send to Subrecipient after Approval" in the page details
  	When I re-login to Grants Portal as "SPI"
	And I navigate to "Grants" tab
	When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search "<Award Name>" on table "PhasePendingTasks"
    When I click on the "Start" icon for the "<Award Name>" 
    And I click on "Accept after Approval" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    Then I see that "Subaward" is in "Accepted" status
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardActivation @award
  	Scenario Outline: Validate award Approval by respective approvers	
  	Given I complete the Award fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
  	And I add budget in the Award Funding Account
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction    | 2000 	   | 
  	And I add the Payment Request schedule from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx" to an award
  	Given I add the Progress Report schedule from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx" to an award
  	And I create a Risk Assessment from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    Given I select the Program Approver as "Automation PM" and Fiscal Approver as "Automation FO" for Risk Assessment
    And I click on "Submit for Approval" in the page details
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	And I assign, initiate a reviewer for an award from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
  	Given Review is completed as user "FO" for the award "<Award EGMS Id>" with name "<Award Name>" created by "EXE"
  	And I click on "Submit for Approval" in the page details
  	Given Approvers "PM", "FO", "EXE" approve the award "<Award Name>"
  	And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
  	Given I click on "Send to Subrecipient after Approval" in the page details
  	And The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	Given I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
	When I click on "Activate" in the page details
	Then I see that "Subaward" is in "Activated" status  	
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardSiteVisit @award
  	Scenario Outline: Validate award Approval by respective approvers	
  	Given I complete the Award fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
  	And I add budget in the Award Funding Account
  	| 		 | Award Encumbrance |
	| FA--21 | 100000 			 |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction 	  | 2000 	   | 
  	And I add the Payment Request schedule from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx" to an award
  	Given I add the Progress Report schedule from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx" to an award
  	And I create a Risk Assessment from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    Given I select the Program Approver as "Automation PM" and Fiscal Approver as "Automation FO" for Risk Assessment
    And I click on "Submit for Approval" in the page details
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	And I assign, initiate a reviewer for an award from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
  	Given Review is completed as user "FO" for the award "<Award EGMS Id>" with name "<Award Name>" created by "EXE"
  	And I click on "Submit for Approval" in the page details
  	Given Approvers "PM", "FO", "EXE" approve the award "<Award Name>"
  	And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
  	Given I click on "Send to Subrecipient after Approval" in the page details
  	And The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	Given I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
	And I click on "Activate" in the page details
	When I navigate to "Management" sub tab
	When I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Site Visit" values from "Award_Field_Values.xlsx"
    When I click modal button "Save And Close"
    And I click on "Cancel" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardDeskReview @award
  	Scenario Outline: Validate award Approval by respective approvers	
  	Given I complete the Award fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
  	And I add budget in the Award Funding Account
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction	  | 2000 	   | 
  	And I add the Payment Request schedule from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx" to an award
  	Given I add the Progress Report schedule from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx" to an award
  	And I create a Risk Assessment from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    Given I select the Program Approver as "Automation PM" and Fiscal Approver as "Automation FO" for Risk Assessment
    And I click on "Submit for Approval" in the page details
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	And I assign, initiate a reviewer for an award from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
  	Given Review is completed as user "FO" for the award "<Award EGMS Id>" with name "<Award Name>" created by "EXE"
  	And I click on "Submit for Approval" in the page details
  	Given Approvers "PM", "FO", "EXE" approve the award "<Award Name>"
  	And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
  	Given I click on "Send to Subrecipient after Approval" in the page details
  	And The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	Given I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
	And I click on "Activate" in the page details
	When I navigate to "Management" sub tab
	When I click on top right button "Initiate Desk Review" in flex table with id "GrantorDeskReviewAward"
    And I enter "Desk Review" values from "Award_Field_Values.xlsx"
    When I click modal button "Save And Close"
    And I click on "Cancel" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardHappyPath @award
  	Scenario Outline: Validate award Approval by respective approvers	
  	Given I complete the Award fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
  	And I add budget in the Award Funding Account
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match  |
	| Construction 	  | 2000 		|
  	And I add the Payment Request schedule from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx" to an award
  	Given I add the Progress Report schedule from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx" to an award
  	And I create a Risk Assessment from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    Given I select the Program Approver as "Automation PM" and Fiscal Approver as "Automation FO" for Risk Assessment
    And I click on "Submit for Approval" in the page details
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	And I assign, initiate a reviewer for an award from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
  	Given Review is completed as user "FO" for the award "<Award EGMS Id>" with name "<Award Name>" created by "EXE"
  	And I click on "Submit for Approval" in the page details
  	Given Approvers "PM", "FO", "EXE" approve the award "<Award Name>"
  	And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
  	Given I click on "Send to Subrecipient after Approval" in the page details
  	And The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	Given I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
	And I click on "Activate" in the page details	
	Given I initiate Site Visit from sheet "Site Visit" in excel "Award_Field_Values.xlsx" for award
	And I initiate Desk Review from sheet "Desk Review" in excel "Award_Field_Values.xlsx" for award
	Then I see status in Progress-bar is "Activated" and is "green"
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |