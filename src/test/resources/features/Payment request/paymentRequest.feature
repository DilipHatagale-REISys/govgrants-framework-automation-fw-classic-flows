@paymentRequest
Feature: Validate all scenarios in Payment Request

	Background: Navigate to award
	Given I delete the record "Automation Payment Request" from the object "Payment Request"
	And I am on "SUBPORTAL" portal
	Given I login and view the "Active" award "AD-AuGr--01" with name "Automation Announcement to be deleted Application" as User "SPI"
	| Actions 	 | Step 1 	  	 | Step 2		 		   | Step 3  	 		   | Step 4						 |
    | Navigation | Grants Portal | Grants		 		   | Grants and Subawards  | Grants, Awards, Amendments  |
    | FlexTable  | Grants		 | RecipientActiveGrants   | View				   |							 |
    | Subaward   | Subawards	 | RecipientsRelatedAwards1| View				   |							 |
	
	@38840 @creationOfAdhocReimbursementPaymentRequest @reimbursementPaymentRequest @paymentRequest @all
	Scenario: To create an Adhoc Reimbursement Payment Request
	When I navigate to "Requests" sub tab
	And I click on top right button "Reimbursement Request" in flex table with id "flexGridRecipientsAwardPaymentRequests"
	When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
	And I click modal button "Save And Close"
	When I click on "Save" in the page details
	Then I see status in Progress-bar is "Created" and is "green"
	
	@38661 @EditionOfPaymentRequest @reimbursementPaymentRequest @advancePaymentRequest @paymentRequest @all
	Scenario: To edit an Adhoc Reimbursement Payment Request
	Given I create a adhoc "Reimbursement" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
	| Actions 	 | Step 1 	  							  | Step 2		 		    | Step 3  	 		   | 
	| Navigation | Requests								  | Reimbursement Request   | Advance			   |
	| FlexTable  | flexGridRecipientsAwardPaymentRequests | Save And Close			| Save				   |
	When I click on "Edit" in the page details
	And I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
	When I click on "Save" in the page details
	Then I see field "Acknowledgement" as "I Agree"
	
	@38660 @budgetAdditionPaymentRequest @reimbursementPaymentRequest @advancePaymentRequest @paymentRequest @all
	Scenario: To edit the budget an Adhoc Reimbursement Payment Request
	Given I create a adhoc "Reimbursement" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
	| Actions 	 | Step 1 	  							  | Step 2		 		    | Step 3  	 		   | 
	| Navigation | Requests								  | Reimbursement Request   | Advance			   |
	| FlexTable  | flexGridRecipientsAwardPaymentRequests | Save And Close			| Save				   |
	Given I complete the fields from the sheet "Edition" in excel "PaymentRequest_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	When I navigate to "Financials" sub tab
	When I edit the following rows inline in flex table with id "flexGridReimbursementRequestEnhanced" by clicking "Edit" :
 	| Budget Category | Spent This Action | Program Income Spent | Cash Match | Non Cash Match |
 	| Construction 	  | 1000              | 500					 | 200		  | 200			   |
	Then I see that "1000" has been added in flextable with Id "flexGridReimbursementRequestEnhanced"
	
	@paymentRequestAddAttachment @reimbursementPaymentRequest @advancePaymentRequest @paymentRequest @all
  	Scenario: Validate the attachment for Payment Request
  	Given I create a adhoc "Reimbursement" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
	| Actions 	 | Step 1 	  							  | Step 2		 		    | Step 3  	 		   | 
	| Navigation | Requests								  | Reimbursement Request   | Advance			   |
	| FlexTable  | flexGridRecipientsAwardPaymentRequests | Save And Close			| Save				   |
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "a150b000003epDJAAY"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Invoice"
    And I close Modal
    Then I see that "Invoice" has been added in flextable with Id "a150b000003epDJAAY"
    
    @paymentRequestSendToGrantor @reimbursementPaymentRequest @advancePaymentRequest @paymentRequest @all
    Scenario: Send Payment Request to Grantor
    Given I create a adhoc "Reimbursement" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
	| Actions 	 | Step 1 	  							  | Step 2		 		    | Step 3  	 		   | 
	| Navigation | Requests								  | Reimbursement Request   | Advance			   |
	| FlexTable  | flexGridRecipientsAwardPaymentRequests | Save And Close			| Save				   |
	And I complete the fields from the sheet "Edition" in excel "PaymentRequest_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	Given I navigate to "Financials" sub tab
	And I edit the following rows inline in flex table with id "flexGridReimbursementRequestEnhanced" by clicking "Edit" :
 	| Budget Category | Spent This Action | Program Income Spent | Cash Match | Non Cash Match |
 	| Construction 	  | 1000              | 500					 | 200		  | 200			   |
 	Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	| Step 3			 |
    | Attachment Navigation | Attachments | Add		| a150b000003epDJAAY |
    | Attachment Details    | Attachment  | Invoice |					 |
    When I click on "Submit to Grantor" in the page details
    
    @enterFundingAccountAmountPaymentRequest @reimbursementPaymentRequest @advancePaymentRequest @paymentRequest @all
    Scenario: Enter Funding Account amount in Payment Request
    Given I create a adhoc "Reimbursement" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
	| Actions 	 | Step 1 	  							  | Step 2		 		    | Step 3  	 		   | 
	| Navigation | Requests								  | Reimbursement Request   | Advance			   |
	| FlexTable  | flexGridRecipientsAwardPaymentRequests | Save And Close			| Save				   |
	And I complete the fields from the sheet "Edition" in excel "PaymentRequest_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	Given I navigate to "Financials" sub tab
	And I edit the following rows inline in flex table with id "flexGridReimbursementRequestEnhanced" by clicking "Edit" :
 	| Budget Category | Spent This Action | Program Income Spent | Cash Match | Non Cash Match |
 	| Construction 	  | 1000              | 500					 | 200		  | 200			   |
 	Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	| Step 3			 |
    | Attachment Navigation | Attachments | Add		| a150b000003epDJAAY |
    | Attachment Details    | Attachment  | Invoice |					 |
    And I click on "Submit to Grantor" in the page details
    Given I login and view the "Active" award "AD-AuGr--01" with name "Automation Announcement to be deleted Application" as User "FO"
	| Actions 	 | Step 1 	  	 | Step 2		 		   | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		 		   | Grants and Subawards  | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants			   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1		   | View				   |							 |
    When I navigate to "Requests" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "flexGridAwardPaymentRequest"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridPaymentFundingAccountsEnhanced" by clicking "Edit" :
 	| Funding Account | Net Spent This Action |
 	| FA--21 	  	  | 1000             	  |
 	Then I see that "1000" has been added in flextable with Id "flexGridPaymentFundingAccountsEnhanced"
    
    @approverSelectionPaymentRequest @reimbursementPaymentRequest @advancePaymentRequest @paymentRequest @all
    Scenario: Selection of approvers in Payment Request
    Given I create a adhoc "Reimbursement" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
	| Actions 	 | Step 1 	  							  | Step 2		 		    | Step 3  	 		   | 
	| Navigation | Requests								  | Reimbursement Request   | Advance			   |
	| FlexTable  | flexGridRecipientsAwardPaymentRequests | Save And Close			| Save				   |
	And I complete the fields from the sheet "Edition" in excel "PaymentRequest_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	Given I navigate to "Financials" sub tab
	And I edit the following rows inline in flex table with id "flexGridReimbursementRequestEnhanced" by clicking "Edit" :
 	| Budget Category | Spent This Action | Program Income Spent | Cash Match | Non Cash Match |
 	| Construction 	  | 1000              | 500					 | 200		  | 200			   |
 	Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	| Step 3			 |
    | Attachment Navigation | Attachments | Add		| a150b000003epDJAAY |
    | Attachment Details    | Attachment  | Invoice |					 |
    And I click on "Submit to Grantor" in the page details
    Given I login and view the "Active" award "AD-AuGr--01" with name "Automation Announcement to be deleted Application" as User "FO"
	| Actions 	 | Step 1 	  	 | Step 2		 		   | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		 		   | Grants and Subawards  | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants			   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1		   | View				   |							 |
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Submitted to Grantor" inside flex table with id "flexGridAwardPaymentRequest"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "flexGridPaymentFundingAccountsEnhanced" by clicking "Edit" :
 	| Funding Account | Net Spent This Action |
 	| FA--21 	  	  | 1000             	  |
    When I navigate to "Responsibilities" sub tab
    And I click on "Edit" icon for "Fiscal Approver" inside flex table with id "flexGridPaymentRequestRolesandResponsibilities"
    When I fill in the "Automation FO" for the Approver details
    And I close Modal
    Then I see that "Automation FO" has been added in flextable with Id "flexGridPaymentRequestRolesandResponsibilities"
    
    @submitPaymentRequestForApproval @reimbursementPaymentRequest @advancePaymentRequest @paymentRequest @all
    Scenario: Submitting Payment Request for approval
    Given I create a adhoc "Reimbursement" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
	| Actions 	 | Step 1 	  							  | Step 2		 		    | Step 3  	 		   | 
	| Navigation | Requests								  | Reimbursement Request   | Advance			   |
	| FlexTable  | flexGridRecipientsAwardPaymentRequests | Save And Close			| Save				   |
	And I complete the fields from the sheet "Edition" in excel "PaymentRequest_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	Given I navigate to "Financials" sub tab
	And I edit the following rows inline in flex table with id "flexGridReimbursementRequestEnhanced" by clicking "Edit" :
 	| Budget Category | Spent This Action | Program Income Spent | Cash Match | Non Cash Match |
 	| Construction 	  | 1000              | 500					 | 200		  | 200			   |
 	Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	| Step 3			 |
    | Attachment Navigation | Attachments | Add		| a150b000003epDJAAY |
    | Attachment Details    | Attachment  | Invoice |					 |
    And I click on "Submit to Grantor" in the page details
    Given I login and view the "Active" award "AD-AuGr--01" with name "Automation Announcement to be deleted Application" as User "FO"
	| Actions 	 | Step 1 	  	 | Step 2		 		   | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		 		   | Grants and Subawards  | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants			   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1		   | View				   |							 |
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Submitted to Grantor" inside flex table with id "flexGridAwardPaymentRequest"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "flexGridPaymentFundingAccountsEnhanced" by clicking "Edit" :
 	| Funding Account | Net Spent This Action |
 	| FA--21 	  	  | 1000             	  |
    And I select "1" approvers "Automation FO"
    | Actions 	 | Step 1   				    			  	  | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						  	  | 		|		    		  |
    | Approver 1 | flexGridPaymentRequestRolesandResponsibilities | Edit    | Fiscal Approver     |
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    
    @approversApprovePaymentRequest @reimbursementPaymentRequest @advancePaymentRequest @paymentRequest @all
    Scenario: Approval of Payment Request
    Given I create a adhoc "Reimbursement" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
	| Actions 	 | Step 1 	  							  | Step 2		 		    | Step 3  	 		   | 
	| Navigation | Requests								  | Reimbursement Request   | Advance			   |
	| FlexTable  | flexGridRecipientsAwardPaymentRequests | Save And Close			| Save				   |
	And I complete the fields from the sheet "Edition" in excel "PaymentRequest_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	Given I navigate to "Financials" sub tab
	And I edit the following rows inline in flex table with id "flexGridReimbursementRequestEnhanced" by clicking "Edit" :
 	| Budget Category | Spent This Action | Program Income Spent | Cash Match | Non Cash Match |
 	| Construction 	  | 1000              | 500					 | 200		  | 200			   |
 	Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	| Step 3			 |
    | Attachment Navigation | Attachments | Add		| a150b000003epDJAAY |
    | Attachment Details    | Attachment  | Invoice |					 |
    And I click on "Submit to Grantor" in the page details
    Given I login and view the "Active" award "AD-AuGr--01" with name "Automation Announcement to be deleted Application" as User "FO"
	| Actions 	 | Step 1 	  	 | Step 2		 		   | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		 		   | Grants and Subawards  | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants			   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1		   | View				   |							 |
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Submitted to Grantor" inside flex table with id "flexGridAwardPaymentRequest"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "flexGridPaymentFundingAccountsEnhanced" by clicking "Edit" :
 	| Funding Account | Net Spent This Action |
 	| FA--21 	  	  | 1000             	  |
    And I select "1" approvers "Automation FO"
    | Actions 	 | Step 1   				    			  	  | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						  	  | 		|		    		  |
    | Approver 1 | flexGridPaymentRequestRolesandResponsibilities | Edit    | Fiscal Approver     |
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user
	When I navigate to "Monitoring" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Payment Request" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Approve Payment Request" inside table
    When I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"
    
    @paidPaymentRequest @adhocReimbursementHappyPath @reimbursementPaymentRequest @paymentRequest @all
    Scenario: Paid Payment Request
    Given I create a adhoc "Reimbursement" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
	| Actions 	 | Step 1 	  							  | Step 2		 		    | Step 3  	 		   | 
	| Navigation | Requests								  | Reimbursement Request   | Advance			   |
	| FlexTable  | flexGridRecipientsAwardPaymentRequests | Save And Close			| Save				   |
	And I complete the fields from the sheet "Edition" in excel "PaymentRequest_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	Given I navigate to "Financials" sub tab
	And I edit the following rows inline in flex table with id "flexGridReimbursementRequestEnhanced" by clicking "Edit" :
 	| Budget Category | Spent This Action | Program Income Spent | Cash Match | Non Cash Match |
 	| Construction 	  | 1000              | 500					 | 200		  | 200			   |
 	Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	| Step 3			 |
    | Attachment Navigation | Attachments | Add		| a150b000003epDJAAY |
    | Attachment Details    | Attachment  | Invoice |					 |
    And I click on "Submit to Grantor" in the page details
    And I login and view the "Active" award "AD-AuGr--01" with name "Automation Announcement to be deleted Application" as User "FO"
	| Actions 	 | Step 1 	  	 | Step 2		 		   | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		 		   | Grants and Subawards  | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants			   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1		   | View				   |							 |
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Submitted to Grantor" inside flex table with id "flexGridAwardPaymentRequest"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "flexGridPaymentFundingAccountsEnhanced" by clicking "Edit" :
 	| Funding Account | Net Spent This Action |
 	| FA--21 	  	  | 1000             	  |
    And I select "1" approvers "Automation FO"
    | Actions 	 | Step 1   				    			  	  | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						  	  | 		|		    		  |
    | Approver 1 | flexGridPaymentRequestRolesandResponsibilities | Edit    | Fiscal Approver     |
    Given I click on "Submit for Approval" in the page details
    Given "1" Approvers "FO" approve the record "Approve Payment Request"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Monitoring	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
	Given I login and view the "Active" award "AD-AuGr--01" with name "Automation Announcement to be deleted Application" as User "FO"
	| Actions 	 | Step 1 	  	 | Step 2		 		   | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		 		   | Grants and Subawards  | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants			   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1		   | View				   |							 |
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Approved" inside flex table with id "flexGridAwardPaymentRequest"
	When I click on "Mark As Paid" in the page details
	And I enter "Paid Details" values from "PaymentRequest_Field_Values.xlsx" 
	When I click modal button "Save"
	And I close Modal
	Then I see status in Progress-bar is "Paid" and is "green"
    
    @adhocAdvanceHappyPath @advancePaymentRequest @paymentRequest @all
    Scenario: Advance Payment Request happy path
    Given I create a adhoc "Advance" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
	| Actions 	 | Step 1 	  							  | Step 2		 		    | Step 3  	 		   | 
	| Navigation | Requests								  | Reimbursement Request   | Advance			   |
	| FlexTable  | flexGridRecipientsAwardPaymentRequests | Save And Close			| Save				   |
	And I complete the fields from the sheet "Edition" in excel "PaymentRequest_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	Given I navigate to "Financials" sub tab
	And I edit the following rows inline in flex table with id "flexGridReimbursementRequestEnhanced" by clicking "Edit" :
 	| Budget Category | Advance Requested |
 	| Construction 	  | 500               |
 	Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	| Step 3			 |
    | Attachment Navigation | Attachments | Add		| a150b000003epDJAAY |
    | Attachment Details    | Attachment  | Invoice |					 |
    And I click on "Submit to Grantor" in the page details
    And I login and view the "Active" award "AD-AuGr--01" with name "Automation Announcement to be deleted Application" as User "FO"
	| Actions 	 | Step 1 	  	 | Step 2		 		   | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		 		   | Grants and Subawards  | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants			   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1		   | View				   |							 |
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Submitted to Grantor" inside flex table with id "flexGridAwardPaymentRequest"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "flexGridPaymentFundingAccountsEnhanced" by clicking "Edit" :
 	| Funding Account | Advance Requested This Action |
 	| FA--21 	  	  | 500			            	  |
    And I select "1" approvers "Automation FO"
    | Actions 	 | Step 1   				    			  	  | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						  	  | 		|		    		  |
    | Approver 1 | flexGridPaymentRequestRolesandResponsibilities | Edit    | Fiscal Approver     |
    Given I click on "Submit for Approval" in the page details
    Given "1" Approvers "FO" approve the record "Approve Payment Request"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Monitoring	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
	Given I login and view the "Active" award "AD-AuGr--01" with name "Automation Announcement to be deleted Application" as User "FO"
	| Actions 	 | Step 1 	  	 | Step 2		 		   | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		 		   | Grants and Subawards  | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants			   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1		   | View				   |							 |
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Approved" inside flex table with id "flexGridAwardPaymentRequest"
	When I click on "Mark As Paid" in the page details
	And I enter "Paid Details" values from "PaymentRequest_Field_Values.xlsx" 
	When I click modal button "Save"
	And I close Modal
	Then I see status in Progress-bar is "Paid" and is "green"
	
	@scheduledReimbursementHappyPath @reimbursementPaymentRequest @paymentRequest @all
    Scenario Outline: Scheduled Payment Request happy path
    Given User "SPI" receives the task for "<Award Name>"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | Grants Portal | SUBPORTAL |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	And I complete the fields from the sheet "Edition" in excel "PaymentRequest_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	Given I navigate to "Financials" sub tab
	And I edit the following rows inline in flex table with id "flexGridReimbursementRequestEnhanced" by clicking "Edit" :
 	| Budget Category | Advance Requested |
 	| Construction 	  | 500               |
 	Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	| Step 3			 |
    | Attachment Navigation | Attachments | Add		| a150b000003epDJAAY |
    | Attachment Details    | Attachment  | Invoice |					 |
    And I click on "Submit to Grantor" in the page details
    And I login and view the "Active" award "AD-AuGr--01" with name "Automation Announcement to be deleted Application" as User "FO"
	| Actions 	 | Step 1 	  	 | Step 2		 		   | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		 		   | Grants and Subawards  | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants			   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1		   | View				   |							 |
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Submitted to Grantor" inside flex table with id "flexGridAwardPaymentRequest"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "flexGridPaymentFundingAccountsEnhanced" by clicking "Edit" :
 	| Funding Account | Advance Requested This Action |
 	| FA--21 	  	  | 500			            	  |
    And I select "1" approvers "Automation FO"
    | Actions 	 | Step 1   				    			  	  | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						  	  | 		|		    		  |
    | Approver 1 | flexGridPaymentRequestRolesandResponsibilities | Edit    | Fiscal Approver     |
    Given I click on "Submit for Approval" in the page details
    Given "1" Approvers "FO" approve the record "Approve Payment Request"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Monitoring	 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
	Given I login and view the "Active" award "AD-AuGr--01" with name "Automation Announcement to be deleted Application" as User "FO"
	| Actions 	 | Step 1 	  	 | Step 2		 		   | Step 3  	 		   | Step 4						 |
    | Navigation | As a Grantor  | Grants		 		   | Grants and Subawards  | Grants, Awards & Amendments |
    | FlexTable  | Grants		 | ActiveGrants			   | View				   |							 |
    | Subaward   | Subawards	 | RelatedAwards1		   | View				   |							 |
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Approved" inside flex table with id "flexGridAwardPaymentRequest"
	When I click on "Mark As Paid" in the page details
	And I enter "Paid Details" values from "PaymentRequest_Field_Values.xlsx" 
	When I click modal button "Save"
	And I close Modal
	Then I see status in Progress-bar is "Paid" and is "green"
	
	Examples:
	| Award Name |
	| Automation Announcement to be deleted Application |