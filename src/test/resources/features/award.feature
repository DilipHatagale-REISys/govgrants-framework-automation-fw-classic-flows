@award
Feature: Validate all scenarios in the award tab

	#Background: Create award
	#Given Delete Everything down from Announcement ""
	#Given An application "" is in FDM approved
	#Given I create an award "Automation Award" as user "EXE" from FDM
	
	@38213 @awardCreation @award
	Scenario Outline: Creation of an award
	Given I login to "As a Grantor" app as "EXE" User
	When I navigate to "Applications" tab
	And I click "Funding Decision Memo (FDM)" inside side bar "Applications"
	And I perform quick search "<Announcement Name>" on table "FDMList1"
	When I click on the "View" icon for the "<Announcement Name>"
	And I click on the "Create Subaward" icon for the "<Application Name>" on the flextable "Recommended Applications"
	When I click "Yes" on the confirmation dialog box
	And I click on "Save" button
	
	Then I see that "Created" status is in "green" on progress bar
	Examples:
	| Announcement Name 	  | Application Name 					|
	| Automation Announcement | Automation Announcement Application |
	
	@38217 @awardEdition @award
	Scenario Outline: Edition of an award
	Given I login to "As a Grantor" app as "EXE" User
	When I navigate to "Grants" tab
	And I click "Grants and Subawards" inside side bar "Grants, Awards & Amendments"
	And I toggle to "Draft Grants"
	And I perform quick search "<Application Name>" on table "ActiveGrants"
	When I click on the "View" icon for the "<Application Name>"
	When I click on "Subawards" subtab
	When I click on the "View" icon for the "<Award EGMS Id>" on the flextable "Subawards"
	
	When I click on "Edit" button
	And I enter "Edition" values from "Award_Field_Values.xlsx"
	When I click on "Save" button
	Then I see that "Created" status is in "green" on progress bar
	Examples:
	| Application Name 				     	   			| Award EGMS Id |
	| Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardFundingAccount @award
 	Scenario Outline: Funding Account budget addition to Award
 	Given I login to "As a Grantor" app as "EXE" User
	When I navigate to "Grants" tab
	And I click "Grants and Subawards" inside side bar "Grants, Awards & Amendments"
	And I toggle to "Draft Grants"
	And I perform quick search "<Application Name>" on table "ActiveGrants"
	When I click on the "View" icon for the "<Application Name>"
	When I click on "Subawards" subtab
	When I click on the "View" icon for the "<Award EGMS Id>" on the flextable "Subawards"
	
	When I click on "Budget" subtab
    When I click on the "Edit" icon for the "<EGMS Id>" on the flextable "<Flextable Name>"
    And I fill the fields in the table "AwardFundingAccountsresizable":
    | tableColumnNumber | inputype | inputValue                 |
    | 5                 | text     | 100000                     |
    When I click on "Save" button on "<Flextable Name>" flextable with Id "flexGridAwardFundingAccounts"
    Then I see that "<EGMS Id>" has been added in flextable "<Flextable Name>" with Id "flexGridAwardFundingAccounts"
	Examples:
	| EGMS Id | Flextable Name 			    | Application Name 				     	   			| Award EGMS Id |
	| FA--21  | Funding Account Information | Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardBudgetAddition @award
  	Scenario Outline: Budget addition to Award
  	Given I login to "As a Grantor" app as "EXE" User
	When I navigate to "Grants" tab
	And I click "Grants and Subawards" inside side bar "Grants, Awards & Amendments"
	And I toggle to "Draft Grants"
	And I perform quick search "<Application Name>" on table "ActiveGrants"
	When I click on the "View" icon for the "<Application Name>"
	When I click on "Subawards" subtab
	When I click on the "View" icon for the "<Award EGMS Id>" on the flextable "Subawards"
	
	When I click on "Budget" subtab
    When I click on the "Add Line Items" icon for the "Construction" on the flextable "<Flextable Name>"
    When I click on the "Edit" icon for the "Construction" on the flextable "Line Items"
    And I fill the fields in the table "toggleFGridLineItem":
    | tableColumnNumber | inputype | inputValue |
    | 4                 | text     | 2000       |
    When I click on "Save" button on "Line Items" flextable with Id "inlineEditGridLineItem"
    And I close Modal "AwardBudgetCategoryFlexGridiframeContentIdButton"
    Then I see that "Construction" has been added in flextable "<Flextable Name>" with Id "inlineEditGridAwardBudgetCategoryFlexGrid"
	Examples:
	| Flextable Name	| Application Name 				     	   			| Award EGMS Id |
	| Award Budget   | Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardPaymentRequestSchedule @award
  	Scenario Outline: Payment Request Schedule in an award
  	Given I login to "As a Grantor" app as "EXE" User
	When I navigate to "Grants" tab
	And I click "Grants and Subawards" inside side bar "Grants, Awards & Amendments"
	And I toggle to "Draft Grants"
	And I perform quick search "<Application Name>" on table "ActiveGrants"
	When I click on the "View" icon for the "<Application Name>"
	When I click on "Subawards" subtab
	When I click on the "View" icon for the "<Award EGMS Id>" on the flextable "Subawards"
	
	When I click on "Management" subtab
   	And I click on "New" button on "<Flextable Name>" flextable with Id "flexGridPaymentSchedules"
    And I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    When I click on "Save" button in the modal
    And I close Modal "PaymentRequestSchedulemodalDivCloseIcon"
    Then I see that "Payment Request" has been added in flextable "<Flextable Name>" with Id "flexGridPaymentSchedules"
	Examples:
	| Flextable Name			| Application Name 				     	   			| Award EGMS Id |
	| Payment Request Schedules | Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardProgressReportSchedule @award
  	Scenario Outline: Progress Report Schedule in an award
  	Given I login to "As a Grantor" app as "EXE" User
	When I navigate to "Grants" tab
	And I click "Grants and Subawards" inside side bar "Grants, Awards & Amendments"
	And I toggle to "Draft Grants"
	And I perform quick search "<Application Name>" on table "ActiveGrants"
	When I click on the "View" icon for the "<Application Name>"
	When I click on "Subawards" subtab
	When I click on the "View" icon for the "<Award EGMS Id>" on the flextable "Subawards"
	
	When I click on "Management" subtab
   	And I click on "New" button on "<Flextable Name>" flextable with Id "flexGridTnCSchedules"
    And I enter "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    When I click on "Save" button in the modal
    And I close Modal "GranteeReportingRequirementsmodalDivCloseIcon"
    Then I see that "Progress Report" has been added in flextable "<Flextable Name>" with Id "flexGridTnCSchedules"
	Examples:
	| Flextable Name			| Application Name 				     	   			| Award EGMS Id |
	| Progress Report Schedule  | Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardRiskAssessmentCreation @award
  	Scenario Outline: Risk Assessment creation in an award
  	Given I login to "As a Grantor" app as "EXE" User
	When I navigate to "Grants" tab
	And I click "Grants and Subawards" inside side bar "Grants, Awards & Amendments"
	And I toggle to "Draft Grants"
	And I perform quick search "<Application Name>" on table "ActiveGrants"
	When I click on the "View" icon for the "<Application Name>"
	When I click on "Subawards" subtab
	When I click on the "View" icon for the "<Award EGMS Id>" on the flextable "Subawards"
	
	When I click on "Management" subtab
   	And I click on "New" button on "<Flextable Name>" flextable with Id "flexGridAwardRiskAssessmentView"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" button
    Then I see that "Created" status is in "green" on progress bar
	Examples:
	| Flextable Name	| Application Name 				     	   			| Award EGMS Id |
	| Risk Assessments  | Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardApproverSelection @award
  	Scenario Outline: Validate the assignment of Approvers for the award 
  	Given I login to "As a Grantor" app as "EXE" User
	When I navigate to "Grants" tab
	And I click "Grants and Subawards" inside side bar "Grants, Awards & Amendments"
	And I toggle to "Draft Grants"
	And I perform quick search "<Application Name>" on table "ActiveGrants"
	When I click on the "View" icon for the "<Application Name>"
	When I click on "Subawards" subtab
	When I click on the "View" icon for the "<Award EGMS Id>" on the flextable "Subawards"
	
    When I click on "Responsibilities" subtab
    And I click on the "Edit" icon for the "Program Approver" on the flextable "<Flextable Name>"
    When I fill in the "Automation PM" for the Approver details
    And I close Modal "GrantorAwardApprovermodalDivCloseIcon"
    When I click on the "Edit" icon for the "Fiscal Approver" on the flextable "<Flextable Name>"
    And I fill in the "Automation FO" for the Approver details
    And I close Modal "GrantorAwardApprovermodalDivCloseIcon"
    And I click on the "Edit" icon for the "Executive Approver" on the flextable "<Flextable Name>"
    When I fill in the "Automation EXE" for the Approver details
    And I close Modal "GrantorAwardApprovermodalDivCloseIcon"
    Then I see that "Automation EXE" has been added in flextable "Approvers" with Id "GrantorAwardApprover"
    Examples:
	| Flextable Name | Application Name 				     	   	     | Award EGMS Id |
	| Approvers		 | Automation Announcement to be deleted Application | AD-AuGr--01   |
	
	@awardSiteVisit @award
  	Scenario Outline: Site Visit initiation in an award
  	Given I login to "As a Grantor" app as "EXE" User
	When I navigate to "Grants" tab
	And I click "Grants and Subawards" inside side bar "Grants, Awards & Amendments"
	And I toggle to "Draft Grants"
	And I perform quick search "<Application Name>" on table "ActiveGrants"
	When I click on the "View" icon for the "<Application Name>"
	When I click on "Subawards" subtab
	When I click on the "View" icon for the "<Award EGMS Id>" on the flextable "Subawards"
	
	When I click on "Management" subtab
   	And I click on "Initiate Site Visit" button on "<Flextable Name>" flextable with Id "GrantorSiteVisitsAward"
    And I enter "Site Visit" values from "Award_Field_Values.xlsx"
    When I click on "Save" button in the modal
    And I close Modal "GrantorSiteVisitsAwardmodalDivCloseIcon"
    Then I see that "Program & Fiscal" has been added in flextable "<Flextable Name>" with Id "GrantorSiteVisitsAward"
	Examples:
	| Flextable Name	| Application Name 				     	   			| Award EGMS Id |
	| Site Visits	    | Automation Announcement to be deleted Application | AD-AuGr--01   |