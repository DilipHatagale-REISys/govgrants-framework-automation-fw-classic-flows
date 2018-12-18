@applicationReview
Feature: Validate all scenarios in the Application Review

	@preScreenApplicationReview @applicationReview
  	Scenario Outline: Pre-Screen review for an application
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Applications" tab
    And I click "Reviews" inside side bar "Application Review"
    When I toggle to "Applications Under Review"
    And I perform quick search "<Announcement Name>" on table "flexTableRandomID1"
    When I click on the "View" icon for the "<Announcement Name>"
    And I click on "Related Logs" subtab
    When I scroll to "Manage Reviews" section
    And I click on "View" on the grid against "<Review Step Name>" in the table "AnnouncementReviewStepsFlexToggle"
    When I choose "<Application Name>" in the flextable "Review Decisions"
    And I click on "Promote to Next Step" button on "Review Decisions" flextable with Id "flexGridPreScreenRelatedStepApplicationsFinal"
    When I click "Yes" on the confirmation dialog box
    Then I see that "Review Step" is in "Completed" status
	Examples:
	| User | Announcement Name  	 | Review Step Name  | Application Name 				   |
	| EXE  | Automation Announcement | Pre-Screen Review | Automation Announcement Application |
	
	@smeReviewEnterDueInDays @applicationReview
	Scenario: Enter Due in Days for all review forms in SME-review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
	And I click on "Next Review Step" button
	 When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  | 
	Then I see that "SME Review" is in "In Progress" status
	    
	@38463 @smeReviewAddReviewer @applicationReview
	Scenario: Add a reviewer to each review step in SME Review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
	And I click on "Next Review Step" button
	Given I enter the Due In Days for all SME review steps
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  | 
    When I expand the "Program Review" on grid "Review Forms"
    And I click on "Add" button on "Reviewers" flextable with Id "flexGridApplicationReviewTree"
    When I add "Automation PM" as reviewer in the table "RelatedExternalReviewersGridresizable"
    And I click on "Save" button on "Review Forms" flextable with Id "flexGridApplicationReviewTree"
    When I collapse the "Program Review" on grid "Review Forms"
    And I expand the "Fiscal Review" on grid "Review Forms"
    When I click on "Add" button on "Reviewers" flextable with Id "flexGridApplicationReviewTree"
    And I add "Automation FO" as reviewer in the table "RelatedExternalReviewersGridresizable"
    When I click on "Save" button on "Review Forms" flextable with Id "flexGridApplicationReviewTree"
    And I collapse the "Fiscal Review" on grid "Review Forms"
    When I expand the "Compliance Review" on grid "Review Forms"
    And I click on "Add" button on "Reviewers" flextable with Id "flexGridApplicationReviewTree"
    When I add "Automation EXE" as reviewer in the table "RelatedExternalReviewersGridresizable"
    And I click on "Save" button on "Review Forms" flextable with Id "flexGridApplicationReviewTree"
    When I collapse the "Compliance Review" on grid "Review Forms"
	Then I see that "SME Review" is in "In Progress" status
	
	@38462 @smeReviewAssignApplicationToReviewer @applicationReview
	Scenario: Add a reviewer to each review step in SME Review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
	And I click on "Next Review Step" button
	Given I enter the Due In Days for all SME review steps
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  |
	And I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
	When I expand the "Program Review" on grid "Review Forms"
    And I click on the "Assign" icon for the "Automation PM" on the flextable "Reviewers"
    When I click "Assign" after selection of "Automation Announcement Application" in the table "AssignPanelApplicationsTable"
    And I switch to Parent frame
    When I expand the "Fiscal Review" on grid "Review Forms"
    And I click on the "Assign" icon for the "Automation FO" on the flextable "Reviewers"
    When I click "Assign" after selection of "Automation Announcement Application" in the table "AssignPanelApplicationsTable"
    And I switch to Parent frame
    When I expand the "Compliance Review" on grid "Review Forms"
    And I click on the "Assign" icon for the "Automation EXE" on the flextable "Reviewers"
    When I click "Assign" after selection of "Automation Announcement Application" in the table "AssignPanelApplicationsTable"
    And I switch to Parent frame
	Then I see that "SME Review" is in "In Progress" status
	
	@38464 @smeReviewSendForReview @applicationReview
	Scenario: Choose the reviews and send for review in SME Review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
	And I click on "Next Review Step" button
	Given I enter the Due In Days for all SME review steps
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  |
	And I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
	Given I assign application "Automation Announcement Application" to the Reviewers for SME Review
	When I choose "Program Review" in the flextable "<Flextable Name>"
    And I choose "Fiscal Review" in the flextable "<Flextable Name>"
    When I choose "Compliance Review" in the flextable "<Flextable Name>"
    And I click on "Send for Review" button on "<Flextable Name>" flextable with Id "flexGridStepReviews"
	Then I see that "SME Review" is in "In Progress" status
	
	@smeReviewCompleteReviewForm @applicationReview
	Scenario: Complete Review form as Various reviewers in SME Review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
	And I click on "Next Review Step" button
	Given I enter the Due In Days for all SME review steps
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  |
	And I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
	Given I assign application "Automation Announcement Application" to the Reviewers for SME Review
	And I choose Reviews for SME review and Send for Review
    Given I re-login to "As a Grantor" app as "PM" User
    When I navigate to "Applications" tab
    And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "SME Review" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "SME Review"
    When I complete filling in the Review form
    And I click on "Save" button
    When I click on "Submit" button
    And I re-login to "As a Grantor" app as "FO" User
    When I navigate to "Applications" tab
    And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "SME Review" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "SME Review"
    When I complete filling in the Review form
    And I click on "Save" button
    When I click on "Submit" button
    And I re-login to "As a Grantor" app as "EXE" User
    When I navigate to "Applications" tab
    And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "SME Review" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "SME Review"
    When I complete filling in the Review form
    And I click on "Save" button
    When I click on "Submit" button
	Then I see that "SME Review" is in "In Progress" status
	    
	@promoteToNextFromSMEReview @applicationReview
  	Scenario Outline:Promoting from Pre-Screen review to the next review step for an application
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
	And I click on "Next Review Step" button
	Given I enter the Due In Days for all SME review steps
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  |
	And I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
	Given I assign application "Automation Announcement Application" to the Reviewers for SME Review
	And I choose Reviews for SME review and Send for Review
	Given I complete review form as assigned reviewers for SME review
    And I re-login to "As a Grantor" app as "<User>" User
    When I navigate to "Applications" tab
    And I click "Reviews" inside side bar "Application Review"
    When I toggle to "Applications Under Review"
    And I perform quick search "<Announcement Name>" on table "flexTableRandomID1"
    When I click on the "View" icon for the "<Announcement Name>"
    And I click on "Related Logs" subtab
    When I scroll to "Manage Reviews" section
    And I click on "View" on the grid against "<Review Step Name>" in the table "AnnouncementReviewStepsFlexToggle"
    When I choose "<Application Name>" in the flextable "Review Decisions"
    And I click on "Promote to Next Step" button on "Review Decisions" flextable with Id "flexGridPreScreenRelatedStepApplicationsFinal"
    When I click "Yes" on the confirmation dialog box
    Then I see that "Review Step" is in "Completed" status
	Examples:
	| User | Announcement Name  	 | Review Step Name | Application Name 				      |
	| EXE  | Automation Announcement | SME Review 		| Automation Announcement Application |
	
	
	@managementReviewEnterDueInDays @applicationReview
	Scenario: Enter Due in Days for all review forms in Management review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
	And I click on "Next Review Step" button
	Given I enter the Due In Days for all SME review steps
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  |
	And I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
	Given I assign application "Automation Announcement Application" to the Reviewers for SME Review
	And I choose Reviews for SME review and Send for Review
	Given I complete review form as assigned reviewers for SME review
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
	When I click on "Next Review Step" button
	When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name   		| Due in Days |
	| Management Review | 10     	  | 
	Then I see that "Management Review" is in "In Progress" status
		
	@managementReviewAddReviewer @applicationReview
	Scenario: Add a reviewer to each review step in Management Review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
	And I click on "Next Review Step" button
	Given I enter the Due In Days for all SME review steps
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  |
	And I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
	Given I assign application "Automation Announcement Application" to the Reviewers for SME Review
	And I choose Reviews for SME review and Send for Review
	Given I complete review form as assigned reviewers for SME review
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
	Given I click on "Next Review Step" button
	And I enter the Due In Days for all Management review steps
	| Form Name    		| Due in Days |
	| Management Review | 10     	  | 
    When I expand the "Management Review" on grid "Review Forms"
    And I click on "Add" button on "Reviewers" flextable with Id "flexGridApplicationReviewTree"
    When I add "Automation EXE" as reviewer in the table "RelatedExternalReviewersGridresizable"
    And I click on "Save" button on "Review Forms" flextable with Id "flexGridApplicationReviewTree"
		
	@managementReviewAssignApplicationToReviewer @applicationReview
	Scenario: Add a reviewer to each review step in management Review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
	And I click on "Next Review Step" button
	Given I enter the Due In Days for all SME review steps
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  |
	And I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
	Given I assign application "Automation Announcement Application" to the Reviewers for SME Review
	And I choose Reviews for SME review and Send for Review
	Given I complete review form as assigned reviewers for SME review
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
	Given I click on "Next Review Step" button
	And I enter the Due In Days for all Management review steps
	| Form Name    		| Due in Days |
	| Management Review | 10     	  | 
	Given I add Reviewers "Automation EXE" for Management Review
    When I expand the "Management Review" on grid "Review Forms"
    And I click on the "Assign" icon for the "Automation EXE" on the flextable "Reviewers"
    When I click "Assign" after selection of "Automation Announcement Application" in the table "AssignPanelApplicationsTable"
    And I switch to Parent frame
		
	@managementReviewSendForReview @applicationReview
	Scenario: Choose the reviews and send for review in Management Review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
	And I click on "Next Review Step" button
	Given I enter the Due In Days for all SME review steps
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  |
	And I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
	Given I assign application "Automation Announcement Application" to the Reviewers for SME Review
	And I choose Reviews for SME review and Send for Review
	Given I complete review form as assigned reviewers for SME review
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
	Given I click on "Next Review Step" button
	And I enter the Due In Days for all Management review steps
	| Form Name    		| Due in Days |
	| Management Review | 10     	  | 
	And I add Reviewers "Automation EXE" for Management Review
	Given I assign application "Automation Announcement Application" to the Reviewers for Management Review
    When I choose "Management Review" in the flextable "<Flextable Name>"
    And I click on "Send for Review" button on "<Flextable Name>" flextable with Id "flexGridStepReviews"

	@managementReviewCompleteReviewForm @applicationReview
	Scenario: Complete Review form as Various reviewers in Management Review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
	And I click on "Next Review Step" button
	Given I enter the Due In Days for all SME review steps
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  |
	And I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
	Given I assign application "Automation Announcement Application" to the Reviewers for SME Review
	And I choose Reviews for SME review and Send for Review
	Given I complete review form as assigned reviewers for SME review
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
	Given I click on "Next Review Step" button
	And I enter the Due In Days for all Management review steps
	| Form Name    		| Due in Days |
	| Management Review | 10     	  | 
	And I add Reviewers "Automation EXE" for Management Review
	Given I assign application "Automation Announcement Application" to the Reviewers for Management Review
	And I choose Reviews for Management review and Send for Review
	Given I re-login to "As a Grantor" app as "EXE" User
    When I navigate to "Applications" tab
    And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "Management Review" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "Management Review"
    When I complete filling in the Review form
    And I click on "Save" button
    When I click on "Submit" button
	    
	@promoteToFDMFromManagementReview @applicationReview
  	Scenario Outline:Promoting from Last review step review to the FDM step for an application
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "EXE" submitted for announcement "<Announcement Name>"
	And I click on "Next Review Step" button
	Given I enter the Due In Days for all SME review steps
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  |
	And I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
	Given I assign application "<Application Name>" to the Reviewers for SME Review
	And I choose Reviews for SME review and Send for Review
	Given I complete review form as assigned reviewers for SME review
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "EXE" submitted for announcement "<Announcement Name>"
	Given I click on "Next Review Step" button
	And I enter the Due In Days for all Management review steps
	| Form Name    		| Due in Days |
	| Management Review | 10     	  | 
	And I add Reviewers "Automation EXE" for Management Review
	Given I assign application "<Application Name>" to the Reviewers for Management Review
	And I choose Reviews for Management review and Send for Review
	Given I complete review form as assigned reviewers for Management review
	And I re-login to "As a Grantor" app as "<User>" User
    When I navigate to "Applications" tab
    And I click "Reviews" inside side bar "Application Review"
    When I toggle to "Applications Under Review"
    And I perform quick search "<Announcement Name>" on table "flexTableRandomID1"
    When I click on the "View" icon for the "<Announcement Name>"
    And I click on "Related Logs" subtab
    When I scroll to "Manage Reviews" section
    And I click on "View" on the grid against "<Review Step Name>" in the table "AnnouncementReviewStepsFlexToggle"
    When I choose "<Application Name>" in the flextable "Review Decisions"
    And I click on "Promote to FDM" button on "Review Decisions" flextable with Id "flexGridPreScreenRelatedStepApplicationsFinal"
    When I click "Yes" on the confirmation dialog box
    Then I see that "Review Step" is in "Completed" status
	Examples: 
	| User | Announcement Name  	 | Review Step Name	  | Application Name 	           	    |
	| EXE  | Automation Announcement | Management Review  | Automation Announcement Application |
	
	@subAwardAbbreviationInFDM @applicationReview
  	Scenario Outline: Adding a sub-award abbreviation in FDM
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "EXE" submitted for announcement "<Announcement Name>"
	And I click on "Next Review Step" button
	Given I enter the Due In Days for all SME review steps
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  |
	And I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
	Given I assign application "<Application Name>" to the Reviewers for SME Review
	And I choose Reviews for SME review and Send for Review
	Given I complete review form as assigned reviewers for SME review
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "EXE" submitted for announcement "<Announcement Name>"
	Given I click on "Next Review Step" button
	And I enter the Due In Days for all Management review steps
	| Form Name    		| Due in Days |
	| Management Review | 10     	  | 
	And I add Reviewers "Automation EXE" for Management Review
	Given I assign application "<Application Name>" to the Reviewers for Management Review
	And I choose Reviews for Management review and Send for Review
	Given I complete review form as assigned reviewers for Management review
	And "Management Review" is completed by clicking "Promote to FDM" for Application "<Application Name>" as user "EXE" submitted for announcement "<Announcement Name>"
	When I click on "Funding Decision Memo" button
	And I click on "Edit" button
	When I enter "GrantCode__c" as "AuGr"
	And I click on "Save" button
	Then I see that "Funding Decision Memo" is in "Created" status
	Examples: 
	| User | Announcement Name  	 | Review Step Name	      | Application Name 	           	    |
	| EXE  | Automation Announcement | Funding Decision Memo  | Automation Announcement Application |
		
	@recommendationForApplicationInFDM @applicationReview
  	Scenario Outline: Adding a recommendation for an application in FDM
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "EXE" submitted for announcement "<Announcement Name>"
	And I click on "Next Review Step" button
	Given I enter the Due In Days for all SME review steps
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  |
	And I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
	Given I assign application "<Application Name>" to the Reviewers for SME Review
	And I choose Reviews for SME review and Send for Review
	Given I complete review form as assigned reviewers for SME review
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "EXE" submitted for announcement "<Announcement Name>"
	Given I click on "Next Review Step" button
	And I enter the Due In Days for all Management review steps
	| Form Name    		| Due in Days |
	| Management Review | 10     	  | 
	And I add Reviewers "Automation EXE" for Management Review
	Given I assign application "<Application Name>" to the Reviewers for Management Review
	And I choose Reviews for Management review and Send for Review
	Given I complete review form as assigned reviewers for Management review
	And "Management Review" is completed by clicking "Promote to FDM" for Application "<Application Name>" as user "EXE" submitted for announcement "<Announcement Name>"
	Given I click on "Funding Decision Memo" button
	And I enter Subaward Abbreviation as "AuGr"
	When I edit the following rows inline in flex table with id "inlineEditGridFundingDecisionMemoApplications" by clicking "Edit" :
	| Application Title 				  | Recommended Budget | Recommend for Funding | Comments 	  |
	| Automation Announcement Application | 100000 			   | Yes				   | Recommended  |
	Then I see that "Funding Decision Memo" is in "Created" status
	
	Examples: 
	| User | Announcement Name  	 | Review Step Name	      | Application Name 	           	    |
	| EXE  | Automation Announcement | Funding Decision Memo  | Automation Announcement Application |
		
	@approverAssignmentForApplicationInFDM @applicationReview
  	Scenario Outline: Assigning an approver in FDM
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "EXE" submitted for announcement "<Announcement Name>"
	And I click on "Next Review Step" button
	Given I enter the Due In Days for all SME review steps
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  |
	And I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
	Given I assign application "<Application Name>" to the Reviewers for SME Review
	And I choose Reviews for SME review and Send for Review
	Given I complete review form as assigned reviewers for SME review
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "EXE" submitted for announcement "<Announcement Name>"
	Given I click on "Next Review Step" button
	And I enter the Due In Days for all Management review steps
	| Form Name    		| Due in Days |
	| Management Review | 10     	  | 
	Given I add Reviewers "Automation EXE" for Management Review
	And I assign application "<Application Name>" to the Reviewers for Management Review
	Given I choose Reviews for Management review and Send for Review
	And I complete review form as assigned reviewers for Management review
	Given "Management Review" is completed by clicking "Promote to FDM" for Application "<Application Name>" as user "EXE" submitted for announcement "<Announcement Name>"
	And I click on "Funding Decision Memo" button
	Given I enter Subaward Abbreviation as "AuGr"
	And I enter the recommendation in FDM
	| Application Title 				  | Recommended Budget | Recommend for Funding | Comments 	 |
	| Automation Announcement Application | 100000 		       | Yes				   | Recommended |
	When I click on "Responsibilities" subtab
	And I click on the "Edit" icon for the "Executive Approver" on the flextable "Responsibilities"
	When I fill in the "Automation EXE" for the Approver details
	And I switch to Parent frame
	Then I see that "Funding Decision Memo" is in "Created" status
	Examples: 
	| User | Announcement Name  	 | Review Step Name	      | Application Name 	           	    |
	| EXE  | Automation Announcement | Funding Decision Memo  | Automation Announcement Application |
		
	@submitForApprovalFDM @applicationReview
  	Scenario Outline: Submitting the FDM for approval
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "EXE" submitted for announcement "<Announcement Name>"
	And I click on "Next Review Step" button
	Given I enter the Due In Days for all SME review steps
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  |
	And I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
	Given I assign application "<Application Name>" to the Reviewers for SME Review
	And I choose Reviews for SME review and Send for Review
	Given I complete review form as assigned reviewers for SME review
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "EXE" submitted for announcement "<Announcement Name>"
	And I click on "Next Review Step" button
	When I enter the Due In Days for all Management review steps
	| Form Name    		| Due in Days |
	| Management Review | 10     	  | 
	And I add Reviewers "Automation EXE" for Management Review
	Given I assign application "<Application Name>" to the Reviewers for Management Review
	And I choose Reviews for Management review and Send for Review
	Given I complete review form as assigned reviewers for Management review
	And "Management Review" is completed by clicking "Promote to FDM" for Application "<Application Name>" as user "EXE" submitted for announcement "<Announcement Name>"
	And I click on "Funding Decision Memo" button
	Given I enter Subaward Abbreviation as "AuGr"
	And I enter the recommendation in FDM
	| Application Title 				  | Recommended Budget | Recommend for Funding | Comments 	 |
	| Automation Announcement Application | 100000 		       | Yes				   | Recommended |
	Given I select "Automation EXE" as "Executive Approver" for Approver details
	When I click on "Submit for Approval" button
	Then I see that "Submitted for Approval" status is in "green" on progress bar
	Examples: 
	| User | Announcement Name  	 | Review Step Name	      | Application Name 	           	    |
	| EXE  | Automation Announcement | Funding Decision Memo  | Automation Announcement Application |
		
	@approveFDM @applicationReview
  	Scenario Outline: Approving FDM as the assigned user
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "EXE" submitted for announcement "<Announcement Name>"
	And I click on "Next Review Step" button
	Given I enter the Due In Days for all SME review steps
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  |
	And I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
	Given I assign application "<Application Name>" to the Reviewers for SME Review
	And I choose Reviews for SME review and Send for Review
	Given I complete review form as assigned reviewers for SME review
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "EXE" submitted for announcement "<Announcement Name>"
	Given I click on "Next Review Step" button
	And I enter the Due In Days for all Management review steps
	| Form Name   		| Due in Days |
	| Management Review | 10     	  | 
	And I add Reviewers "Automation EXE" for Management Review
	Given I assign application "<Application Name>" to the Reviewers for Management Review
	And I choose Reviews for Management review and Send for Review
	Given I complete review form as assigned reviewers for Management review
	And "Management Review" is completed by clicking "Promote to FDM" for Application "<Application Name>" as user "EXE" submitted for announcement "<Announcement Name>"
	Given I click on "Funding Decision Memo" button
	And I enter Subaward Abbreviation as "AuGr"
	And I enter the recommendation in FDM
	| Application Title 				  | Recommended Budget | Recommend for Funding | Comments 	 |
	| Automation Announcement Application | 100000 		       | Yes				   | Recommended |
	And I select "Automation EXE" as "Executive Approver" for Approver details
	Given I click on "Submit for Approval" button
	And I re-login to "As a Grantor" app as "EXE" User
    When I navigate to "Applications" tab
    And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "Approve FDM" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "Approve FDM"
	When I click on "Approve" on the approval decision box
	Then I see that "Approved" status is in "green" on progress bar
	Examples: 
	| User | Announcement Name  				   | Review Step Name	    | Application Name 	            	    			  |
	| EXE  | Automation Announcement to be deleted | Funding Decision Memo  | Automation Announcement to be deleted Application |