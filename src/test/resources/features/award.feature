@award
Feature: Validate all scenarios in the Award

	Background: Create Award from FDM
	Given I create a subaward from the Announcement "Automation Announcement" for the Application "Automation Announcement application" as user "EXE"
	 | Actions    | Step 1       | Step 2		| Step 3		  | Step 4 						|
	 | Navigation | As a Grantor | Applications | Applications    | Funding Decision Memo (FDM) |
	 | FlexTable  | FDMList1	 | View			| Create Subaward | Recommended Applications	|
	 | Buttons 	  | Yes			 | Save			|				  |								|
		
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
    Given I create a monitoring record from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    | Actions  | Step 1     | Step 2	   		   			  | Step 3 | Step 4 |
    | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save   |
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
    Given I create a monitoring record from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    | Actions  | Step 1     | Step 2	   		   			  | Step 3 | Step 4 |
    | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				      				 | Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 			 				 | 		  |		    		   |
    | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver   |
    | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit	  | Executive Approver |
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
	
	@awardRiskAssessmentApprovalAndActivation @award
  	Scenario: Risk Assessment approval in an award
    Given I create a monitoring record from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    | Actions  | Step 1     | Step 2	   		   			  | Step 3 | Step 4 |
    | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				      				 | Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 			 				 | 		  |		    		   |
    | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver   |
    | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit	  | Executive Approver |
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user
    And I navigate to "Monitoring" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Approve Risk Assessment" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Approve Risk Assessment" inside table
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user
    And I navigate to "Monitoring" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Approve Risk Assessment" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Approve Risk Assessment" inside table 
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
  	Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "flexGridAwardFundingAccounts" by clicking "Edit" :
	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction 	  | 2000 	   | 
	And I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   | Step 3 | Step 4 |
    | Creation | Management | flexGridTnCSchedules | New    | Save   |
  	Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   	   | Step 3 | Step 4 |
    | Creation | Management | flexGridPaymentSchedules | New    | Save   |
  	And I create a monitoring record from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    | Actions  | Step 1     | Step 2	   		   			  | Step 3 | Step 4 |
    | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				      				 | Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 			 				 | 		  |		    		   |
    | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver   |
    | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit	  | Executive Approver |
    And I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Approve Risk Assessment"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Monitoring	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
    And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    		| Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 					| 		 |		    		   |
    | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit	 | Executive Approver  |
    Then I click on "Send to Subrecipient" in the page details
	Examples:
	| Award Name 				     	    	  	    | Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardAcceptanceByRecipientBeforeApproval @award
  	Scenario Outline: Validate the assignment of Approvers for the award 
  	Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
  	And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "flexGridAwardFundingAccounts" by clicking "Edit" :
	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction	  | 2000 	   | 
  	And I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   | Step 3 | Step 4 |
    | Creation | Management | flexGridTnCSchedules | New    | Save   |
  	Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   	   | Step 3 | Step 4 |
    | Creation | Management | flexGridPaymentSchedules | New    | Save   |
  	And I create a monitoring record from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    | Actions  | Step 1     | Step 2	   		   			  | Step 3 | Step 4 |
    | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				      				 | Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 			 				 | 		  |		    		   |
    | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver   |
    | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit	  | Executive Approver |
    And I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Approve Risk Assessment"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Monitoring	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
     And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    		| Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 					| 		 |		    		   |
    | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit	 | Executive Approver  |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
	And I navigate to "Grants" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "<Award Name>" in "PhasePendingTasks" panel
    When I click on "Start" icon for "<Award Name>" inside table 
    And I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    Then I see that "Subaward" is in "Created" status
	Examples:
	| Award Name 				     	    	        | Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardReviewerAssignment @award
  	Scenario Outline: Validate the assignment of Reviewer for the award
  	Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
  	And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "flexGridAwardFundingAccounts" by clicking "Edit" :
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction    | 2000 	   |
  	And I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   | Step 3 | Step 4 |
    | Creation | Management | flexGridTnCSchedules | New    | Save   |
  	Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   	   | Step 3 | Step 4 |
    | Creation | Management | flexGridPaymentSchedules | New    | Save   |
  	And I create a monitoring record from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    | Actions  | Step 1     | Step 2	   		   			  | Step 3 | Step 4 |
    | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save   |
    | Actions  | Step 1     | Step 2	   		   			  | Step 3 | Step 4 |
    | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				      				 | Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 			 				 | 		  |		    		   |
    | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver   |
    | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit	  | Executive Approver |
    And I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Approve Risk Assessment"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Monitoring	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
    And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    		| Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 					| 		 |		    		   |
    | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit	 | Executive Approver  |
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	| Actions 	 | Step 1		 | Step 2		  | Step 3 			      | Step 4			  |
  	| Login		 | Grants Portal | SUBPORTAL	  |						  |					  |
  	| Navigation | Grants		 | Pending Tasks  | My Tasks			  | PhasePendingTasks |
  	| Acceptance | Start 		 | Accept		  | Accept after Approval | OK				  |
  	When I re-login to "As a Grantor" app as "EXE" user
  	And I navigate to "Grants" tab
  	When I navigate to "Grants and Subawards" content inside "Grants, Awards & Amendments" subheader on left panel
  	And I click toggle button to select "Draft Grants"
	When I perform quick search for "<Award Name>" in "ActiveGrants" panel
	And I click on "View" icon for "<Award Name>" inside table 
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
  	Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
  	And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "flexGridAwardFundingAccounts" by clicking "Edit" :
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction    | 2000 	   | 
  	And I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   | Step 3 | Step 4 |
    | Creation | Management | flexGridTnCSchedules | New    | Save   |
  	Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   	   | Step 3 | Step 4 |
    | Creation | Management | flexGridPaymentSchedules | New    | Save   |
  	And I create a monitoring record from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    | Actions  | Step 1     | Step 2	   		   			  | Step 3 | Step 4 |
    | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				      				 | Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 			 				 | 		  |		    		   |
    | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver   |
    | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit	  | Executive Approver |
    And I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Approve Risk Assessment"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Monitoring	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
    And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    		| Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 					| 		 |		    		   |
    | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit	 | Executive Approver  |
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	| Actions 	 | Step 1 | Step 2		  | Step 3 			      | Step 4			  |
  	| Navigation | Grants | Pending Tasks | My Tasks			  | PhasePendingTasks |
  	| Acceptance | Start  | Accept		  | Accept after Approval | OK				  |
  	When I re-login to "As a Grantor" app as "EXE" user
  	And I navigate to "Grants" tab
	When I navigate to "Grants and Subawards" content inside "Grants, Awards & Amendments" subheader on left panel
	And I click toggle button to select "Draft Grants"
	When I perform quick search for "<Award Name>" in "ActiveGrants" panel
	And I click on "View" icon for "<Award Name>" inside table 
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
  	Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
  	And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "flexGridAwardFundingAccounts" by clicking "Edit" :
  	| Funding Account	| Award Encumbrance |
	| FA--21 			| 100000 			|
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction    | 2000 	   | 
  	And I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   | Step 3 | Step 4 |
    | Creation | Management | flexGridTnCSchedules | New    | Save   |
  	Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   	   | Step 3 | Step 4 |
    | Creation | Management | flexGridPaymentSchedules | New    | Save   |
  	And I create a monitoring record from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    | Actions  | Step 1     | Step 2	   		   			  | Step 3 | Step 4 |
    | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				      				 | Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 			 				 | 		  |		    		   |
    | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver   |
    | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit	  | Executive Approver |
    And I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Approve Risk Assessment"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Monitoring	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
    And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    		| Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 					| 		 |		    		   |
    | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit	 | Executive Approver  |
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	| Actions 	 | Step 1 | Step 2		  | Step 3 			      | Step 4			  |
  	| Navigation | Grants | Pending Tasks | My Tasks			  | PhasePendingTasks |
  	| Acceptance | Start  | Accept		  | Accept after Approval | OK				  |
  	And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	 		 | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					 		 |		   |
	| FlexTable 		  | New				      | flexGridGrantorAwardReviewer | Save    |
	| Send Review		  | Send for Review       | Created 			 		 |		   |
  	When I re-login to "As a Grantor" app as "FO" user
    And I navigate to "Grants" tab
	When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "<Award Name>" in "PhasePendingTasks" panel
    When I click on "Start" icon for "<Award Name>" inside table  
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridGrantorAwardReviewer"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    Then I see that "Submitted" has been added in flextable with Id "flexGridGrantorAwardReviewer"
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	
	@awardSubmissionForApproval @award
  	Scenario Outline: Validate award submission for approval	
  	Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
  	And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "flexGridAwardFundingAccounts" by clicking "Edit" :
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction 	  | 2000 	   | 
  	And I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   | Step 3 | Step 4 |
    | Creation | Management | flexGridTnCSchedules | New    | Save   |
  	Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   	   | Step 3 | Step 4 |
    | Creation | Management | flexGridPaymentSchedules | New    | Save   |
  	And I create a monitoring record from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    | Actions  | Step 1     | Step 2	   		   			  | Step 3 | Step 4 |
    | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				      				 | Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 			 				 | 		  |		    		   |
    | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver   |
    | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit	  | Executive Approver |
    And I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Approve Risk Assessment"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Monitoring	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
     And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    		| Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 					| 		 |		    		   |
    | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit	 | Executive Approver  |
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	| Actions 	 | Step 1 | Step 2		  | Step 3 			      | Step 4			  |
  	| Navigation | Grants | Pending Tasks | My Tasks			  | PhasePendingTasks |
  	| Acceptance | Start  | Accept		  | Accept after Approval | OK				  |
  	And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	 		 | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					 		 |		   |
	| FlexTable 		  | New				      | flexGridGrantorAwardReviewer | Save    |
	| Send Review		  | Send for Review       | Created 			 		 |		   |
  	Given Review is completed as user "FO" for the record "<Award Name>" 
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		 		 | Step 4 		   |
	| Reviewer Navigation | As a Grantor        | Grants		 					  | Pending Tasks 		  		 | My Tasks 	   |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridGrantorAwardReviewer | Enter Review    | 
	| Enter Review		  | Sent for Review	    | Passed	  						  |	Save		  		  		 | Submit Review   |
  	And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
  	When I click on "Submit for Approval" in the page details
	Then I see status in Progress-bar is "Submitted for Approval" and is "green"
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardApproval @award
  	Scenario Outline: Validate award Approval by respective approvers	
  	Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
  	And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "flexGridAwardFundingAccounts" by clicking "Edit" :
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction 	  | 2000 	   | 
  	And I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   | Step 3 | Step 4 |
    | Creation | Management | flexGridTnCSchedules | New    | Save   |
  	Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   	   | Step 3 | Step 4 |
    | Creation | Management | flexGridPaymentSchedules | New    | Save   |
  	And I create a monitoring record from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    | Actions  | Step 1     | Step 2	   		   			  | Step 3 | Step 4 |
    | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				      				 | Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 			 				 | 		  |		    		   |
    | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver   |
    | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit	  | Executive Approver |
    And I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Approve Risk Assessment"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Monitoring	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
     And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    		| Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 					| 		 |		    		   |
    | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit	 | Executive Approver  |
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	| Actions 	 | Step 1 | Step 2		  | Step 3 			      | Step 4			  |
  	| Navigation | Grants | Pending Tasks | My Tasks			  | PhasePendingTasks |
  	| Acceptance | Start  | Accept		  | Accept after Approval | OK				  |
  	And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	 		 | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					 		 |		   |
	| FlexTable 		  | New				      | flexGridGrantorAwardReviewer | Save    |
	| Send Review		  | Send for Review       | Created 			 		 |		   |
  	Given Review is completed as user "FO" for the record "<Award Name>" 
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		 		 | Step 4 		   |
	| Reviewer Navigation | As a Grantor        | Grants		 					  | Pending Tasks 		  		 | My Tasks 	   |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridGrantorAwardReviewer | Enter Review    | 
	| Enter Review		  | Sent for Review	    | Passed	  						  |	Save		  		  		 | Submit Review   |
  	And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
  	And I click on "Submit for Approval" in the page details
  	Given I re-login to "As a Grantor" app as "PM" user
	When I navigate to "Grants" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Award Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Award Name>" inside table  
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "FO" user
	When I navigate to "Grants" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Award Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Award Name>" inside table 
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "EXE" user
	When I navigate to "Grants" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Award Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Award Name>" inside table 
    When I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardSendToRecipientAfterApproval @award
  	Scenario Outline: Validate award Approval by respective approvers	
  	Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
  	And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "flexGridAwardFundingAccounts" by clicking "Edit" :
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			 |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction 	  | 2000 		| 
  	And I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   | Step 3 | Step 4 |
    | Creation | Management | flexGridTnCSchedules | New    | Save   |
  	Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   	   | Step 3 | Step 4 |
    | Creation | Management | flexGridPaymentSchedules | New    | Save   |
  	And I create a monitoring record from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    | Actions  | Step 1     | Step 2	   		   			  | Step 3 | Step 4 |
    | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				      				 | Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 			 				 | 		  |		    		   |
    | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver   |
    | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit	  | Executive Approver |
    And I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Approve Risk Assessment"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Monitoring	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
     And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    		| Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 					| 		 |		    		   |
    | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit	 | Executive Approver  |
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	| Actions 	 | Step 1 | Step 2		  | Step 3 			      | Step 4			  |
  	| Navigation | Grants | Pending Tasks | My Tasks			  | PhasePendingTasks |
  	| Acceptance | Start  | Accept		  | Accept after Approval | OK				  |
  	And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	 		 | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					 		 |		   |
	| FlexTable 		  | New				      | flexGridGrantorAwardReviewer | Save    |
	| Send Review		  | Send for Review       | Created 			 		 |		   |
  	Given Review is completed as user "FO" for the record "<Award Name>" 
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		 		 | Step 4 		   |
	| Reviewer Navigation | As a Grantor        | Grants		 					  | Pending Tasks 		  		 | My Tasks 	   |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridGrantorAwardReviewer | Enter Review    | 
	| Enter Review		  | Sent for Review	    | Passed	  						  |	Save		  		  		 | Submit Review   |
  	And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
  	And I click on "Submit for Approval" in the page details
  	Given "3" Approvers "PM,FO,EXE" approve the record "<Award Name>"
	| Actions 	 | Step 1 	  	 | Step 2	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Grants	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 	 | 					 |
  	When I re-login to "As a Grantor" app as "EXE" user
	And I navigate to "Grants" tab
	When I navigate to "Grants and Subawards" content inside "Grants, Awards & Amendments" subheader on left panel
	And I click toggle button to select "Draft Grants"
	When I perform quick search for "<Award Name>" in "ActiveGrants" panel
	And I click on "View" icon for "<Award Name>" inside table
	When I navigate to "Subawards" sub tab
	And I click on "View" icon for "<Award EGMS Id>" inside flex table with id "RelatedAwards1"
	When I click on "Send to Subrecipient after Approval" in the page details
	Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardAcceptanceByRecipientAfterApproval @award
  	Scenario Outline: Validate award Approval by respective approvers	
  	Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
  	And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "flexGridAwardFundingAccounts" by clicking "Edit" :
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction    | 2000 	   | 
  	And I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   | Step 3 | Step 4 |
    | Creation | Management | flexGridTnCSchedules | New    | Save   |
  	Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   	   | Step 3 | Step 4 |
    | Creation | Management | flexGridPaymentSchedules | New    | Save   |
  	And I create a monitoring record from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    | Actions  | Step 1     | Step 2	   		   			  | Step 3 | Step 4 |
    | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				      				 | Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 			 				 | 		  |		    		   |
    | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver   |
    | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit	  | Executive Approver |
    And I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Approve Risk Assessment"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Monitoring	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
    And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    		| Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 					| 		 |		    		   |
    | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit	 | Executive Approver  |
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	| Actions 	 | Step 1 | Step 2		  | Step 3 			      | Step 4			  |
  	| Navigation | Grants | Pending Tasks | My Tasks			  | PhasePendingTasks |
  	| Acceptance | Start  | Accept		  | Accept after Approval | OK				  |
  	And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	 		 | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					 		 |		   |
	| FlexTable 		  | New				      | flexGridGrantorAwardReviewer | Save    |
	| Send Review		  | Send for Review       | Created 			 		 |		   |
  	Given Review is completed as user "FO" for the record "<Award Name>" 
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		 		 | Step 4 		   |
	| Reviewer Navigation | As a Grantor        | Grants		 					  | Pending Tasks 		  		 | My Tasks 	   |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridGrantorAwardReviewer | Enter Review    | 
	| Enter Review		  | Sent for Review	    | Passed	  						  |	Save		  		  		 | Submit Review   |
  	And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
  	And I click on "Submit for Approval" in the page details
  	Given "3" Approvers "PM,FO,EXE" approve the record "<Award Name>"
	| Actions 	 | Step 1 	  	 | Step 2	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Grants	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 	 | 					 |
  	And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
  	Given I click on "Send to Subrecipient after Approval" in the page details
  	When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
	And I navigate to "Grants" tab
	When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "<Award Name>" in "PhasePendingTasks" panel
    When I click on "Start" icon for "<Award Name>" inside table 
    And I click on "Accept after Approval" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    Then I see that "Subaward" is in "Accepted" status
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardActivation @award
  	Scenario Outline: Validate award Approval by respective approvers	
  	Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
  	And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "flexGridAwardFundingAccounts" by clicking "Edit" :
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction    | 2000 	   | 
  	And I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   | Step 3 | Step 4 |
    | Creation | Management | flexGridTnCSchedules | New    | Save   |
  	Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   	   | Step 3 | Step 4 |
    | Creation | Management | flexGridPaymentSchedules | New    | Save   |
  	And I create a monitoring record from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    | Actions  | Step 1     | Step 2	   		   			  | Step 3 | Step 4 |
    | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				      				 | Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 			 				 | 		  |		    		   |
    | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver   |
    | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit	  | Executive Approver |
    And I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Approve Risk Assessment"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Monitoring	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
    And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    		| Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 					| 		 |		    		   |
    | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit	 | Executive Approver  |
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	| Actions 	 | Step 1 | Step 2		  | Step 3 			      | Step 4			  |
  	| Navigation | Grants | Pending Tasks | My Tasks			  | PhasePendingTasks |
  	| Acceptance | Start  | Accept		  | Accept after Approval | OK				  |
  	And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	 		 | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					 		 |		   |
	| FlexTable 		  | New				      | flexGridGrantorAwardReviewer | Save    |
	| Send Review		  | Send for Review       | Created 			 		 |		   |
  	Given Review is completed as user "FO" for the record "<Award Name>" 
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		 		 | Step 4 		   |
	| Reviewer Navigation | As a Grantor        | Grants		 					  | Pending Tasks 		  		 | My Tasks 	   |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridGrantorAwardReviewer | Enter Review    | 
	| Enter Review		  | Sent for Review	    | Passed	  						  |	Save		  		  		 | Submit Review   |
  	And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
  	And I click on "Submit for Approval" in the page details
  	Given "3" Approvers "PM,FO,EXE" approve the record "<Award Name>"
	| Actions 	 | Step 1 	  	 | Step 2	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Grants	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 	 | 					 |
  	And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
  	Given I click on "Send to Subrecipient after Approval" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	| Actions 	 | Step 1 | Step 2		  | Step 3 			      | Step 4			  |
  	| Navigation | Grants | Pending Tasks | My Tasks			  | PhasePendingTasks |
  	| Acceptance | Start  | Accept		  | Accept after Approval | OK				  |
  	And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
	When I click on "Activate" in the page details
	Then I see that "Subaward" is in "Activated" status  	
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardSiteVisit @award
  	Scenario Outline: Validate award Approval by respective approvers	
  	Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
  	And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "flexGridAwardFundingAccounts" by clicking "Edit" :
  	| 		 | Award Encumbrance |
	| FA--21 | 100000 			 |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction 	  | 2000 	   | 
  	And I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   | Step 3 | Step 4 |
    | Creation | Management | flexGridTnCSchedules | New    | Save   |
  	Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   	   | Step 3 | Step 4 |
    | Creation | Management | flexGridPaymentSchedules | New    | Save   |
  	And I create a monitoring record from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    | Actions  | Step 1     | Step 2	   		   			  | Step 3 | Step 4 |
    | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				      				 | Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 			 				 | 		  |		    		   |
    | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver   |
    | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit	  | Executive Approver |
    And I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Approve Risk Assessment"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Monitoring	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
    And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    		| Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 					| 		 |		    		   |
    | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit	 | Executive Approver  |
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	| Actions 	 | Step 1 | Step 2		  | Step 3 			      | Step 4			  |
  	| Navigation | Grants | Pending Tasks | My Tasks			  | PhasePendingTasks |
  	| Acceptance | Start  | Accept		  | Accept after Approval | OK				  |
  	And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	 		 | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					 		 |		   |
	| FlexTable 		  | New				      | flexGridGrantorAwardReviewer | Save    |
	| Send Review		  | Send for Review       | Created 			 		 |		   |
  	Given Review is completed as user "FO" for the record "<Award Name>"
  	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		 		 | Step 4 		   |
	| Reviewer Navigation | As a Grantor        | Grants		 					  | Pending Tasks 		  		 | My Tasks 	   |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridGrantorAwardReviewer | Enter Review    | 
	| Enter Review		  | Sent for Review	    | Passed	  						  |	Save		  		  		 | Submit Review   |
  	And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
  	And I click on "Submit for Approval" in the page details
  	Given "3" Approvers "PM,FO,EXE" approve the record "<Award Name>"
	| Actions 	 | Step 1 	  	 | Step 2	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Grants	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 	 | 					 |
  	And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
  	Given I click on "Send to Subrecipient after Approval" in the page details
  	And The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	| Actions 	 | Step 1 | Step 2		  | Step 3 			      | Step 4			  |
  	| Navigation | Grants | Pending Tasks | My Tasks			  | PhasePendingTasks |
  	| Acceptance | Start  | Accept		  | Accept after Approval | OK				  |
  	Given I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
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
  	Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
  	And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "flexGridAwardFundingAccounts" by clicking "Edit" :
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match |
	| Construction	  | 2000 	   | 
  	And I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   | Step 3 | Step 4 |
    | Creation | Management | flexGridTnCSchedules | New    | Save   |
  	Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   	   | Step 3 | Step 4 |
    | Creation | Management | flexGridPaymentSchedules | New    | Save   |
  	And I create a monitoring record from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    | Actions  | Step 1     | Step 2	   		   			  | Step 3 | Step 4 |
    | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				      				 | Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 			 				 | 		  |		    		   |
    | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver   |
    | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit	  | Executive Approver |
    And I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Approve Risk Assessment"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Monitoring	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
    And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    		| Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 					| 		 |		    		   |
    | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit	 | Executive Approver  |
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	| Actions 	 | Step 1 | Step 2		  | Step 3 			      | Step 4			  |
  	| Navigation | Grants | Pending Tasks | My Tasks			  | PhasePendingTasks |
  	| Acceptance | Start  | Accept		  | Accept after Approval | OK				  |
  	And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	 		 | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					 		 |		   |
	| FlexTable 		  | New				      | flexGridGrantorAwardReviewer | Save    |
	| Send Review		  | Send for Review       | Created 			 		 |		   |
  	Given Review is completed as user "FO" for the record "<Award Name>" 
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		 		 | Step 4 		   |
	| Reviewer Navigation | As a Grantor        | Grants		 					  | Pending Tasks 		  		 | My Tasks 	   |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridGrantorAwardReviewer | Enter Review    | 
	| Enter Review		  | Sent for Review	    | Passed	  						  |	Save		  		  		 | Submit Review   |
  	And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
  	And I click on "Submit for Approval" in the page details
  	Given "3" Approvers "PM,FO,EXE" approve the record "<Award Name>"
	| Actions 	 | Step 1 	  	 | Step 2	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Grants	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 	 | 					 |
  	And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
  	Given I click on "Send to Subrecipient after Approval" in the page details
  	And The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	| Actions 	 | Step 1 | Step 2		  | Step 3 			      | Step 4			  |
  	| Navigation | Grants | Pending Tasks | My Tasks			  | PhasePendingTasks |
  	| Acceptance | Start  | Accept		  | Accept after Approval | OK				  |
  	Given I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
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
  	Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
  	And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "flexGridAwardFundingAccounts" by clicking "Edit" :
  	| Funding Account | Award Encumbrance |
	| FA--21 		  | 100000 			  |
  	Given I edit the Budget details in award for line item "Construction"
  	| Budget Category | Cash Match  |
	| Construction 	  | 2000 		|
  	And I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   | Step 3 | Step 4 |
    | Creation | Management | flexGridTnCSchedules | New    | Save   |
  	Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   	   | Step 3 | Step 4 |
    | Creation | Management | flexGridPaymentSchedules | New    | Save   |
  	And I create a monitoring record from sheet "Risk Assessment" in excel "Award_Field_Values.xlsx"
    | Actions  | Step 1     | Step 2	   		   			  | Step 3 | Step 4 |
    | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				      				 | Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 			 				 | 		  |		    		   |
    | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver   |
    | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit	  | Executive Approver |
    And I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Approve Risk Assessment"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Monitoring	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
    And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    		| Step 2 | Step 3 			   |
    | Subtab	 | Responsibilities 					| 		 |		    		   |
    | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit	 | Executive Approver  |
    And I click on "Send to Subrecipient" in the page details
  	Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	| Actions 	 | Step 1 | Step 2		  | Step 3 			      | Step 4			  |
  	| Navigation | Grants | Pending Tasks | My Tasks			  | PhasePendingTasks |
  	| Acceptance | Start  | Accept		  | Accept after Approval | OK				  |
  	And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	 		 | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					 		 |		   |
	| FlexTable 		  | New				      | flexGridGrantorAwardReviewer | Save    |
	| Send Review		  | Send for Review       | Created 			 		 |		   |
  	Given Review is completed as user "FO" for the record "<Award Name>" 
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		 		 | Step 4 		   |
	| Reviewer Navigation | As a Grantor        | Grants		 					  | Pending Tasks 		  		 | My Tasks 	   |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridGrantorAwardReviewer | Enter Review    | 
	| Enter Review		  | Sent for Review	    | Passed	  						  |	Save		  		  		 | Submit Review   |
  	And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
  	And I click on "Submit for Approval" in the page details
  	Given "3" Approvers "PM,FO,EXE" approve the record "<Award Name>"
	| Actions 	 | Step 1 	  	 | Step 2	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Grants	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 	 | 					 |
  	And I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
  	Given I click on "Send to Subrecipient after Approval" in the page details
  	And The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
  	| Actions 	 | Step 1 | Step 2		  | Step 3 			      | Step 4			  |
  	| Navigation | Grants | Pending Tasks | My Tasks			  | PhasePendingTasks |
  	| Acceptance | Start  | Accept		  | Accept after Approval | OK				  |
  	Given I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
	And I click on "Activate" in the page details	
	Given I create a monitoring record from sheet "Site Visit" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   	 | Step 3 				  | Step 4			 |
    | Creation | Management | GrantorSiteVisitsAward | Initiate Site Visit    | Save And Close   |
    Given I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
    Given I create a monitoring record from sheet "Desk Review" in excel "Award_Field_Values.xlsx"
	| Actions  | Step 1     | Step 2	   		   	 | Step 3 				   | Step 4			  |
    | Creation | Management | GrantorDeskReviewAward | Initiate Desk Review    | Save And Close   |
    Given I login and view the "Draft" award "<Award EGMS Id>" with name "<Award Name>" as User "Exe"
    | Actions 	 | Step 1 	  	 | Step 2		  | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		  | Grants and Subawards   | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1 | View				   |							 |
	Then I see status in Progress-bar is "Activated" and is "green"
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |