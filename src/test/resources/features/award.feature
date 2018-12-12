@award
Feature: Validate all scenarios in the Award

	Background: Create Award from FDM
	Given I create a subaward from the Announcement "Automation Announcement" for the Application "Automation Announcement application"
		
	@38213 @awardCreation @award
	Scenario: Creation of an award
	Then I see that "Created" status is in "green" on progress bar
	
	@38217 @awardEdition @award
	Scenario: Edition of an award
	When I click on "Edit" button
	And I enter "Edition" values from "Award_Field_Values.xlsx"
	When I click on "Save" button
	Then I see that "Created" status is in "green" on progress bar
	
	@awardFundingAccount @award
 	Scenario Outline: Funding Account budget addition to Award
	When I click on "Budget" subtab
	And I edit the following rows inline in flex table with id "flexGridAwardFundingAccounts" by clicking "Edit" :
	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  | 
    Then I see that "<EGMS Id>" has been added in flextable "<Flextable Name>" with Id "flexGridAwardFundingAccounts"
	Examples:
	| EGMS Id | Flextable Name 			    |
	| FA--21  | Funding Account Information |
	
	@awardBudgetEdition @award
  	Scenario Outline: Budget addition to Award
	When I click on "Budget" subtab
    And I click on the "Add Line Items" icon for the "Construction" on the flextable "<Flextable Name>"
    When I edit the following rows inline in flex table with id "inlineEditGridLineItem" by clicking "Edit" :
	| Budget Category | Cash Match |
	| Construction    | 2000 	   | 
    And I close Modal
    Then I see that "Construction" has been added in flextable "<Flextable Name>" with Id "inlineEditGridAwardBudgetCategoryFlexGrid"
	Examples:
	| Flextable Name |
	| Award Budget   |
	
	@awardPaymentRequestSchedule @award
  	Scenario Outline: Payment Request Schedule in an award
	When I click on "Management" subtab
   	And I click on "New" button on "<Flextable Name>" flextable with Id "flexGridPaymentSchedules"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click on "Save" button in the modal
    When I close Modal
    Then I see that "Payment Request" has been added in flextable "<Flextable Name>" with Id "flexGridPaymentSchedules"
	Examples:
	| Flextable Name			|
	| Payment Request Schedules |
	
	@awardProgressReportSchedule @award
  	Scenario Outline: Progress Report Schedule in an award
	When I click on "Management" subtab
   	And I click on "New" button on "<Flextable Name>" flextable with Id "flexGridTnCSchedules"
    When I enter "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click on "Save" button in the modal
    When I close Modal
    Then I see that "Progress Report" has been added in flextable "<Flextable Name>" with Id "flexGridTnCSchedules"
	Examples:
	| Flextable Name			|
	| Progress Report Schedule  |
	
	@awardRiskAssessmentCreation @award
  	Scenario Outline: Risk Assessment creation in an award
	When I click on "Management" subtab
   	And I click on "New" button on "<Flextable Name>" flextable with Id "flexGridAwardRiskAssessmentView"
    When I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    And I click on "Save" button
    Then I see that "Created" status is in "green" on progress bar
	Examples:
	| Flextable Name	|
	| Risk Assessments  |
	
	@awardRiskAssessmentApproverSelection @award
  	Scenario Outline: Risk Assessment approver selection in an award
    Given I create a Risk Assessment from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    When I click on "Responsibilities" subtab
    And I click on the "Edit" icon for the "Program Approver" on the flextable "<Flextable Name>"
    When I fill in the "Automation PM" for the Approver details
    And I close Modal
    When I click on the "Edit" icon for the "Fiscal Approver" on the flextable "<Flextable Name>"
    And I fill in the "Automation FO" for the Approver details
    When I close Modal
    Then I see that "Automation PM" has been added in flextable "Approvers" with Id "GrantorRiskAssessmentRolesandResponsibilities"
	Examples:
	| Flextable Name |
	| Approvers		 |
	
	@awardRiskAssessmentSubmitForApproval @award
  	Scenario: Risk Assessment submission for approval in an award
    Given I create a Risk Assessment from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    And I select the Program Approver as "Automation PM" and Fiscal Approver as "Automation FO" for Risk Assessment
    When I click on "Submit for Approval" button
    Then I see that "Submitted for Approval" status is in "green" on progress bar
	
	@awardRiskAssessmentApprovalAndActivation @award
  	Scenario: Risk Assessment approval in an award
    Given I create a Risk Assessment from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    And I select the Program Approver as "Automation PM" and Fiscal Approver as "Automation FO" for Risk Assessment
    Given I click on "Submit for Approval" button
    When I re-login to "As a Grantor" app as "PM" User
    And I navigate to "Monitoring" tab
	When I click "Pending Tasks" inside side bar "My Tasks"
    And I perform quick search "Approve Risk Assessment" on table "PhasePendingTasks"
    When I click on the "Start" icon for the "Approve Risk Assessment" 
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" User
    And I navigate to "Monitoring" tab
	When I click "Pending Tasks" inside side bar "My Tasks"
    And I perform quick search "Approve Risk Assessment" on table "PhasePendingTasks"
    When I click on the "Start" icon for the "Approve Risk Assessment" 
    And I click on "Approve" on the approval decision box
    Then I see that "Active" status is in "green" on progress bar
	
	@awardApproverSelection @award
  	Scenario Outline: Validate the assignment of Approvers for the award
    When I click on "Responsibilities" subtab
    And I click on the "Edit" icon for the "Program Approver" on the flextable "<Flextable Name>"
    When I fill in the "Automation PM" for the Approver details
    And I close Modal
    When I click on the "Edit" icon for the "Fiscal Approver" on the flextable "<Flextable Name>"
    And I fill in the "Automation FO" for the Approver details
    And I close Modal
    And I click on the "Edit" icon for the "Executive Approver" on the flextable "<Flextable Name>"
    When I fill in the "Automation EXE" for the Approver details
    And I close Modal
    Then I see that "Automation EXE" has been added in flextable "Approvers" with Id "GrantorAwardApprover"
    Examples:
	| Flextable Name |
	| Approvers		 |
	
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
    And I click on "Submit for Approval" button
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Application Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
	Then I click on "Send to Subrecipient" button
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
    And I click on "Submit for Approval" button
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" button
  	When I re-login to Grants Portal as "SPI"
	And I navigate to "Grants" tab
	When I click "Pending Tasks" inside side bar "My Tasks"
    And I perform quick search "<Award Name>" on table "PhasePendingTasks"
    When I click on the "Start" icon for the "<Award Name>" 
    And I click on "Accept" button
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
    And I click on "Submit for Approval" button
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" button
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	When I re-login to "As a Grantor" app as "EXE" User
  	And I navigate to "Grants" tab
	When I click "Grants and Subawards" inside side bar "Grants, Awards & Amendments"
	And I toggle to "Draft Grants"
	When I perform quick search "<Award Name>" on table "ActiveGrants"
	And I click on the "View" icon for the "<Award Name>"
	When I click on "Subawards" subtab
	And I click on the "View" icon for the "<Award EGMS Id>" on the flextable "Subawards"
	When I click on "Responsibilities" subtab
	And I click on "New" button on "<Flextable Name>" flextable with Id "flexGridGrantorAwardReviewer"
	When I enter "Reviewer" values from "Award_Field_Values.xlsx"
	And I click on "Save" button in the modal
	When I close Modal
	Then I see that "Automation FO" has been added in flextable "<Flextable Name>" with Id "flexGridGrantorAwardReviewer"
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id | Flextable Name |
	| Automation Announcement to be deleted Application | AD-AuGr--01   | Peer Reviewers |
	
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
    And I click on "Submit for Approval" button
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" button
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	When I re-login to "As a Grantor" app as "EXE" User
  	And I navigate to "Grants" tab
	When I click "Grants and Subawards" inside side bar "Grants, Awards & Amendments"
	And I toggle to "Draft Grants"
	When I perform quick search "<Award Name>" on table "ActiveGrants"
	And I click on the "View" icon for the "<Award Name>"
	When I click on "Subawards" subtab
	And I click on the "View" icon for the "<Award EGMS Id>" on the flextable "Subawards"
	When I click on "Responsibilities" subtab
	And I click on "New" button on "<Flextable Name>" flextable with Id "flexGridGrantorAwardReviewer"
	When I enter "Reviewer" values from "Award_Field_Values.xlsx"
	And I click on "Save" button in the modal
	When I close Modal
	And I click on the "Send for Review" icon for the "Created" on the flextable "<Flextable Name>"
	Then I see that "Sent for Review" has been added in flextable "<Flextable Name>" with Id "flexGridGrantorAwardReviewer"
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id | Flextable Name |
	| Automation Announcement to be deleted Application | AD-AuGr--01   | Peer Reviewers |
	
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
    And I click on "Submit for Approval" button
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" button
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	And I assign, initiate a reviewer for an award from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
  	When I re-login to "As a Grantor" app as "FO" User
    And I navigate to "Grants" tab
	When I click "Pending Tasks" inside side bar "My Tasks"
    And I perform quick search "<Award Name>" on table "PhasePendingTasks"
    When I click on the "Start" icon for the "<Award Name>" 
    And I click on "Responsibilities" subtab
    When I click on the "Enter Review" icon for the "Automation FO" on the flextable "<Flextable Name>"
    And I enter a review
    When I click on "Save" button in the modal
    And I click on "Submit Review" button in the modal
    And I close Modal
    Then I see that "Submitted" has been added in flextable "<Flextable Name>" with Id "flexGridGrantorAwardReviewer"
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id | Flextable Name |
	| Automation Announcement to be deleted Application | AD-AuGr--01   | Peer Reviewers |
	
	
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
    And I click on "Submit for Approval" button
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" button
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	And I assign, initiate a reviewer for an award from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
  	Given Review is completed as user "FO" for the award "<Award EGMS Id>" with name "<Award Name>" created by "EXE"
  	When I click on "Submit for Approval" button
	Then I see that "Submitted for Approval" status is in "green" on progress bar
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
    And I click on "Submit for Approval" button
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" button
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	And I assign, initiate a reviewer for an award from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
  	Given Review is completed as user "FO" for the award "<Award EGMS Id>" with name "<Award Name>" created by "EXE"
  	And I click on "Submit for Approval" button
  	Given I re-login to "As a Grantor" app as "PM" User
	When I navigate to "Grants" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "<Award Name>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Award Name>" 
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "FO" User
	When I navigate to "Grants" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "<Award Name>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Award Name>" 
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "EXE" User
	When I navigate to "Grants" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "<Award Name>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Award Name>" 
    When I click on "Approve" on the approval decision box
    Then I see that "Approved" status is in "green" on progress bar
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
    And I click on "Submit for Approval" button
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" button
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	And I assign, initiate a reviewer for an award from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
  	Given Review is completed as user "FO" for the award "<Award EGMS Id>" with name "<Award Name>" created by "EXE"
  	And I click on "Submit for Approval" button
  	Given Approvers "PM", "FO", "EXE" approve the award "<Award Name>"
  	When I re-login to "As a Grantor" app as "EXE" User
	And I navigate to "Grants" tab
	When I click "Grants and Subawards" inside side bar "Grants, Awards & Amendments"
	And I toggle to "Draft Grants"
	When I perform quick search "<Award Name>" on table "ActiveGrants"
	And I click on the "View" icon for the "<Award Name>"
	When I click on "Subawards" subtab
	And I click on the "View" icon for the "<Award EGMS Id>" on the flextable "Subawards"
	When I click on "Send to Subrecipient after Approval" button
	Then I see that "Sent to Subrecipient" status is in "green" on progress bar
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
    And I click on "Submit for Approval" button
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" button
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	And I assign, initiate a reviewer for an award from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
  	Given Review is completed as user "FO" for the award "<Award EGMS Id>" with name "<Award Name>" created by "EXE"
  	And I click on "Submit for Approval" button
  	Given Approvers "PM", "FO", "EXE" approve the award "<Award Name>"
  	And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
  	Given I click on "Send to Subrecipient after Approval" button
  	When I re-login to Grants Portal as "SPI"
	And I navigate to "Grants" tab
	When I click "Pending Tasks" inside side bar "My Tasks"
    And I perform quick search "<Award Name>" on table "PhasePendingTasks"
    When I click on the "Start" icon for the "<Award Name>" 
    And I click on "Accept after Approval" button
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
    And I click on "Submit for Approval" button
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" button
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	And I assign, initiate a reviewer for an award from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
  	Given Review is completed as user "FO" for the award "<Award EGMS Id>" with name "<Award Name>" created by "EXE"
  	And I click on "Submit for Approval" button
  	Given Approvers "PM", "FO", "EXE" approve the award "<Award Name>"
  	And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
  	Given I click on "Send to Subrecipient after Approval" button
  	And The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	Given I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
	When I click on "Activate" button
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
    And I click on "Submit for Approval" button
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" button
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	And I assign, initiate a reviewer for an award from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
  	Given Review is completed as user "FO" for the award "<Award EGMS Id>" with name "<Award Name>" created by "EXE"
  	And I click on "Submit for Approval" button
  	Given Approvers "PM", "FO", "EXE" approve the award "<Award Name>"
  	And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
  	Given I click on "Send to Subrecipient after Approval" button
  	And The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	Given I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
	And I click on "Activate" button
	When I click on "Management" subtab
	When I click on "Initiate Site Visit" button on "<Flextable Name>" flextable with Id "GrantorSiteVisitsAward"
    And I enter "Site Visit" values from "Award_Field_Values.xlsx"
    When I click on "Save And Close" button in the modal
    And I click on "Cancel" button
    Then I see that "Created" status is in "green" on progress bar
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id | Flextable Name |
	| Automation Announcement to be deleted Application | AD-AuGr--01   | Site Visits    |
	
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
    And I click on "Submit for Approval" button
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" button
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	And I assign, initiate a reviewer for an award from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
  	Given Review is completed as user "FO" for the award "<Award EGMS Id>" with name "<Award Name>" created by "EXE"
  	And I click on "Submit for Approval" button
  	Given Approvers "PM", "FO", "EXE" approve the award "<Award Name>"
  	And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
  	Given I click on "Send to Subrecipient after Approval" button
  	And The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	Given I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
	And I click on "Activate" button	
	When I click on "Management" subtab
	When I click on "Initiate Desk Review" button on "<Flextable Name>" flextable with Id "GrantorDeskReviewAward"
    And I enter "Desk Review" values from "Award_Field_Values.xlsx"
    When I click on "Save And Close" button in the modal
    And I click on "Cancel" button
    Then I see that "Created" status is in "green" on progress bar
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id | Flextable Name |
	| Automation Announcement to be deleted Application | AD-AuGr--01   | Desk Reviews   |
	
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
    And I click on "Submit for Approval" button
    Given I approve Risk Assessment as Program Approver "PM" and Fiscal Approver "FO"
    And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    Given I select the Program Approver as "Automation PM", Fiscal Approver as "Automation FO" and Executive Approver as "Automation EXE" for Award
    And I click on "Send to Subrecipient" button
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	And I assign, initiate a reviewer for an award from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
  	Given Review is completed as user "FO" for the award "<Award EGMS Id>" with name "<Award Name>" created by "EXE"
  	And I click on "Submit for Approval" button
  	Given Approvers "PM", "FO", "EXE" approve the award "<Award Name>"
  	And I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
  	Given I click on "Send to Subrecipient after Approval" button
  	And The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	Given I re-login and view the award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
	And I click on "Activate" button	
	Given I initiate Site Visit from sheet "Site Visit" in excel "Award_Field_Values.xlsx" for award
	And I initiate Desk Review from sheet "Desk Review" in excel "Award_Field_Values.xlsx" for award
	Then I see that "Activated" status is in "green" on progress bar
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |