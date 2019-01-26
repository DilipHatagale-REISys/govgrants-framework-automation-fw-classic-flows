@applicationReview
Feature: Validate all scenarios in the Application Review

	@preScreenApplicationReview @applicationReview
  	Scenario Outline: Pre-Screen review for an application
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
	And I navigate to "Reviews" content inside "Application Review" subheader on left panel
	When I click toggle button to select "Applications Under Review"
    And I perform quick search for "<Announcement Name>" in "flexTableRandomID1" panel
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Related Logs" sub tab
    And I click on "View" icon for "<Review Step Name>" inside flex table with id "AnnouncementReviewStepsFlexToggle"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    When I click "Yes" on the confirmation dialog box
    Then I see that "Review Step" is in "Completed" status
	Examples:
	| User | Announcement Name  	 | Review Step Name  | Application Name 				   |
	| EXE  | Automation Announcement | Pre-Screen Review | Automation Announcement Application |
	
	@smeReviewEnterDueInDays @applicationReview
	Scenario Outline: Enter Due in Days for all review forms in SME-review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Next Review Step" in the page details
	When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  | 
	Then I see that "SME Review" is in "In Progress" status
	Examples: 
	| User | Announcement Name  				   | Application Name 	            	    			|
	| EXE  | Automation Announcement to be deleted | Automation Announcement to be deleted Application  |
	    
	@38463 @smeReviewAddReviewer @applicationReview
	Scenario Outline: Add a reviewer to each review step in SME Review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Next Review Step" in the page details
	Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  | 
    When I expand nested table containing column value "Program Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation PM  |
    When I collapse nested table containing column value "Program Review"
    And I expand nested table containing column value "Fiscal Review"
    When I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation FO	 |
    And I collapse nested table containing column value "Fiscal Review"
    When I expand nested table containing column value "Compliance Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation EXE |
    When I collapse nested table containing column value "Compliance Review"
    Then I see that "SME Review" is in "In Progress" status
    Examples: 
	| User | Announcement Name  				   | Application Name 	            	    			|
	| EXE  | Automation Announcement to be deleted | Automation Announcement to be deleted Application  |
	
	@38462 @smeReviewAssignApplicationToReviewer @applicationReview
	Scenario Outline: Add a reviewer to each review step in SME Review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Next Review Step" in the page details
	Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  | 
	Given I expand nested table containing column value "Program Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation PM  |
    Given I collapse nested table containing column value "Program Review"
    And I expand nested table containing column value "Fiscal Review"
    Given I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation FO	 |
    And I collapse nested table containing column value "Fiscal Review"
    Given I expand nested table containing column value "Compliance Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation EXE |
    Given I collapse nested table containing column value "Compliance Review"
    When I expand nested table containing column value "Program Review"
    And I click on "Assign" icon for "Automation PM" inside flex table with id "flexGridApplicationReviewTree"
    When I click "Assign" after selection of "<Application Name>" in the table "AssignPanelApplicationsTable"
    And I switch to Parent frame
    When I expand nested table containing column value "Fiscal Review"
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridApplicationReviewTree"
    When I click "Assign" after selection of "<Application Name>" in the table "AssignPanelApplicationsTable"
    And I switch to Parent frame
    When I expand nested table containing column value "Compliance Review"
    And I click on "Assign" icon for "Automation EXE" inside flex table with id "flexGridApplicationReviewTree"
    When I click "Assign" after selection of "<Application Name>" in the table "AssignPanelApplicationsTable"
    And I switch to Parent frame
	Then I see that "SME Review" is in "In Progress" status
	Examples: 
	| User | Announcement Name  				   | Application Name 	            	    			|
	| EXE  | Automation Announcement to be deleted | Automation Announcement to be deleted Application  |
	
	@38464 @smeReviewSendForReview @applicationReview
	Scenario Outline: Choose the reviews and send for review in SME Review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Next Review Step" in the page details
	Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  | 
	Given I expand nested table containing column value "Program Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation PM  |
    Given I collapse nested table containing column value "Program Review"
    And I expand nested table containing column value "Fiscal Review"
    Given I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation FO	 |
    And I collapse nested table containing column value "Fiscal Review"
    Given I expand nested table containing column value "Compliance Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation EXE |
    Given I collapse nested table containing column value "Compliance Review"
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
    | Actions 	  | Step 1 		   | Step 2			 			   | Step 3  		   |
    | Review	  | Program Review | Fiscal Review				   | Compliance Review |
    | FlexTable   | Assign		   | flexGridApplicationReviewTree |		 		   |			
    | Application | Assign 		   | AssignPanelApplicationsTable  |				   |
	When I check "Program Review,Fiscal Review,Compliance Review" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
	Then I see that "SME Review" is in "In Progress" status
	Examples: 
	| User | Announcement Name  				   | Application Name 	            	    			|
	| EXE  | Automation Announcement to be deleted | Automation Announcement to be deleted Application  |
	
	@smeReviewCompleteReviewForm @applicationReview
	Scenario Outline: Complete Review form as Various reviewers in SME Review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Next Review Step" in the page details
	Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  | 
	Given I expand nested table containing column value "Program Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation PM  |
    Given I collapse nested table containing column value "Program Review"
    And I expand nested table containing column value "Fiscal Review"
    Given I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation FO	 |
    And I collapse nested table containing column value "Fiscal Review"
    Given I expand nested table containing column value "Compliance Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation EXE |
    Given I collapse nested table containing column value "Compliance Review"
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
    | Actions 	  | Step 1 		   | Step 2			 			   | Step 3  		   |
    | Review	  | Program Review | Fiscal Review				   | Compliance Review |
    | FlexTable   | Assign		   | flexGridApplicationReviewTree |		 		   |			
    | Application | Assign 		   | AssignPanelApplicationsTable  |				   |
	And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
    Given I re-login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "SME Review" in "PhasePendingTasks" panel
    And I click on "Start" icon for "SME Review" inside table
    When I complete filling in the Review form
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I re-login to "As a Grantor" app as "FO" user
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "SME Review" in "PhasePendingTasks" panel
    And I click on "Start" icon for "SME Review" inside table
    When I complete filling in the Review form
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I re-login to "As a Grantor" app as "EXE" user
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "SME Review" in "PhasePendingTasks" panel
    And I click on "Start" icon for "SME Review" inside table
    When I complete filling in the Review form
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
	Then I see that "SME Review" is in "In Progress" status
	Examples: 
	| User | Announcement Name  				   | Application Name 	            	    			|
	| EXE  | Automation Announcement to be deleted | Automation Announcement to be deleted Application  |
	    
	@promoteToNextFromSMEReview @applicationReview
  	Scenario Outline:Promoting from Pre-Screen review to the next review step for an application
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Next Review Step" in the page details
	Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  | 
	Given I expand nested table containing column value "Program Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation PM  |
    Given I collapse nested table containing column value "Program Review"
    And I expand nested table containing column value "Fiscal Review"
    Given I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation FO	 |
    And I collapse nested table containing column value "Fiscal Review"
    Given I expand nested table containing column value "Compliance Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation EXE |
    Given I collapse nested table containing column value "Compliance Review"
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
    | Actions 	  | Step 1 		   | Step 2			 			   | Step 3  		   |
    | Review	  | Program Review | Fiscal Review				   | Compliance Review |
    | FlexTable   | Assign		   | flexGridApplicationReviewTree |		 		   |			
    | Application | Assign 		   | AssignPanelApplicationsTable  |				   |
	And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
	Given I complete "3" review form as "PM,FO,EXE"
	| Actions 	 | Step 1 		| Step 2			| Step 3  		| Step 4   |
	| Navigation | As a Grantor | Applications 		| Pending Tasks | My Tasks |
	| FlexTable  | SME Review   | PhasePendingTasks | Start 		| 		   |
	| Button	 | Save 		| Submit 			| 				| 		   |
    And I re-login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Applications Under Review"
    And I perform quick search for "<Announcement Name>" in "flexTableRandomID1" panel
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Related Logs" sub tab
    And I click on "View" icon for "<Review Step Name>" inside flex table with id "AnnouncementReviewStepsFlexToggle"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    When I click "Yes" on the confirmation dialog box
    Then I see that "Review Step" is in "Completed" status
	Examples:
	| User | Announcement Name  	 | Review Step Name | Application Name 				      |
	| EXE  | Automation Announcement | SME Review 		| Automation Announcement Application |
	
	@managementReviewEnterDueInDays @applicationReview
	Scenario Outline: Enter Due in Days for all review forms in Management review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Next Review Step" in the page details
	Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  | 
	Given I expand nested table containing column value "Program Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation PM  |
    Given I collapse nested table containing column value "Program Review"
    And I expand nested table containing column value "Fiscal Review"
    Given I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation FO	 |
    And I collapse nested table containing column value "Fiscal Review"
    Given I expand nested table containing column value "Compliance Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation EXE |
    Given I collapse nested table containing column value "Compliance Review"
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
    | Actions 	  | Step 1 		   | Step 2			 			   | Step 3  		   |
    | Review	  | Program Review | Fiscal Review				   | Compliance Review |
    | FlexTable   | Assign		   | flexGridApplicationReviewTree |		 		   |			
    | Application | Assign 		   | AssignPanelApplicationsTable  |				   |
	And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
	Given I complete "3" review form as "PM,FO,EXE"
	| Actions 	 | Step 1 		| Step 2			| Step 3  		| Step 4   |
	| Navigation | As a Grantor | Applications 		| Pending Tasks | My Tasks |
	| FlexTable  | SME Review   | PhasePendingTasks | Start 		| 		   |
	| Button	 | Save 		| Submit 			| 				| 		   |
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	When I click on "Next Review Step" in the page details
	When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name   		| Due in Days |
	| Management Review | 10     	  | 
	Then I see that "Management Review" is in "In Progress" status
	Examples: 
	| User | Announcement Name  				   | Application Name 	            	    			|
	| EXE  | Automation Announcement to be deleted | Automation Announcement to be deleted Application  |
		
	@managementReviewAddReviewer @applicationReview
	Scenario Outline: Add a reviewer to each review step in Management Review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Next Review Step" in the page details
	Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  | 
	Given I expand nested table containing column value "Program Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation PM  |
    Given I collapse nested table containing column value "Program Review"
    And I expand nested table containing column value "Fiscal Review"
    Given I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation FO	 |
    And I collapse nested table containing column value "Fiscal Review"
    Given I expand nested table containing column value "Compliance Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation EXE |
    Given I collapse nested table containing column value "Compliance Review"
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
    | Actions 	  | Step 1 		   | Step 2			 			   | Step 3  		   |
    | Review	  | Program Review | Fiscal Review				   | Compliance Review |
    | FlexTable   | Assign		   | flexGridApplicationReviewTree |		 		   |			
    | Application | Assign 		   | AssignPanelApplicationsTable  |				   |
	And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
	Given I complete "3" review form as "PM,FO,EXE"
	| Actions 	 | Step 1 		| Step 2			| Step 3  		| Step 4   |
	| Navigation | As a Grantor | Applications 		| Pending Tasks | My Tasks |
	| FlexTable  | SME Review   | PhasePendingTasks | Start 		| 		   |
	| Button	 | Save 		| Submit 			| 				| 		   |
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	Given I click on "Next Review Step" in the page details
	And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name    		| Due in Days |
	| Management Review | 10     	  | 
    When I expand nested table containing column value "Management Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		  |
    | Automation EXE  |
    When I collapse nested table containing column value "Management Review"
	Examples: 
	| User | Announcement Name  				   | Application Name 	            	    			|
	| EXE  | Automation Announcement to be deleted | Automation Announcement to be deleted Application  |
		
	@managementReviewAssignApplicationToReviewer @applicationReview
	Scenario Outline: Add a reviewer to each review step in management Review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Next Review Step" in the page details
	Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  | 
	Given I expand nested table containing column value "Program Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation PM  |
    Given I collapse nested table containing column value "Program Review"
    And I expand nested table containing column value "Fiscal Review"
    Given I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation FO	 |
    And I collapse nested table containing column value "Fiscal Review"
    Given I expand nested table containing column value "Compliance Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation EXE |
    Given I collapse nested table containing column value "Compliance Review"
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
    | Actions 	  | Step 1 		   | Step 2			 			   | Step 3  		   |
    | Review	  | Program Review | Fiscal Review				   | Compliance Review |
    | FlexTable   | Assign		   | flexGridApplicationReviewTree |		 		   |			
    | Application | Assign 		   | AssignPanelApplicationsTable  |				   |
	And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
	Given I complete "3" review form as "PM,FO,EXE"
	| Actions 	 | Step 1 		| Step 2			| Step 3  		| Step 4   |
	| Navigation | As a Grantor | Applications 		| Pending Tasks | My Tasks |
	| FlexTable  | SME Review   | PhasePendingTasks | Start 		| 		   |
	| Button	 | Save 		| Submit 			| 				| 		   |
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	Given I click on "Next Review Step" in the page details
	And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name    		| Due in Days |
	| Management Review | 10     	  | 
	Given I expand nested table containing column value "Management Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		  |
    | Automation EXE  |
    Given I collapse nested table containing column value "Management Review"
    When I expand nested table containing column value "Management Review"
    And I click on "Assign" icon for "Automation EXE" inside flex table with id "flexGridApplicationReviewTree"
    When I click "Assign" after selection of "<Application Name>" in the table "AssignPanelApplicationsTable"
    And I switch to Parent frame
	Examples: 
	| User | Announcement Name  				   | Application Name 	            	    			|
	| EXE  | Automation Announcement to be deleted | Automation Announcement to be deleted Application  |
		
	@managementReviewSendForReview @applicationReview
	Scenario Outline: Choose the reviews and send for review in Management Review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Next Review Step" in the page details
	Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  | 
 	Given I expand nested table containing column value "Program Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation PM  |
    Given I collapse nested table containing column value "Program Review"
    And I expand nested table containing column value "Fiscal Review"
    Given I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation FO	 |
    And I collapse nested table containing column value "Fiscal Review"
    Given I expand nested table containing column value "Compliance Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation EXE |
    Given I collapse nested table containing column value "Compliance Review"
    Given I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
    | Actions 	  | Step 1 		   | Step 2			 			   | Step 3  		   |
    | Review	  | Program Review | Fiscal Review				   | Compliance Review |
    | FlexTable   | Assign		   | flexGridApplicationReviewTree |		 		   |			
    | Application | Assign 		   | AssignPanelApplicationsTable  |				   |
	And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
	Given I complete "3" review form as "PM,FO,EXE"
	| Actions 	 | Step 1 		| Step 2			| Step 3  		| Step 4   |
	| Navigation | As a Grantor | Applications 		| Pending Tasks | My Tasks |
	| FlexTable  | SME Review   | PhasePendingTasks | Start 		| 		   |
	| Button	 | Save 		| Submit 			| 				| 		   |
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	Given I click on "Next Review Step" in the page details
	And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name    		| Due in Days |
	| Management Review | 10     	  | 
	Given I expand nested table containing column value "Management Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		  |
    | Automation EXE  |
    Given I collapse nested table containing column value "Management Review"
	And I assign application "<Application Name>" to the "1" Reviewers "Automation EXE" for each step
    | Actions 	  | Step 1 		   	  | Step 2			 			  |
    | Review	  | Management Review | 							  |
    | FlexTable   | Assign		  	  | flexGridApplicationReviewTree |
    | Application | Assign 		  	  | AssignPanelApplicationsTable  |
    When I check "Management Review" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
	Examples: 
	| User | Announcement Name  				   | Application Name 	            	    			|
	| EXE  | Automation Announcement to be deleted | Automation Announcement to be deleted Application  |
	
	@managementReviewCompleteReviewForm @applicationReview
	Scenario Outline: Complete Review form as Various reviewers in Management Review
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Next Review Step" in the page details
	Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  | 
	Given I expand nested table containing column value "Program Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation PM  |
    Given I collapse nested table containing column value "Program Review"
    And I expand nested table containing column value "Fiscal Review"
    Given I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation FO	 |
    And I collapse nested table containing column value "Fiscal Review"
    Given I expand nested table containing column value "Compliance Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation EXE |
    Given I collapse nested table containing column value "Compliance Review"
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
    | Actions 	  | Step 1 		   | Step 2			 			   | Step 3  		   |
    | Review	  | Program Review | Fiscal Review				   | Compliance Review |
    | FlexTable   | Assign		   | flexGridApplicationReviewTree |		 		   |			
    | Application | Assign 		   | AssignPanelApplicationsTable  |				   |
	And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
	Given I complete "3" review form as "PM,FO,EXE"
	| Actions 	 | Step 1 		| Step 2			| Step 3  		| Step 4   |
	| Navigation | As a Grantor | Applications 		| Pending Tasks | My Tasks |
	| FlexTable  | SME Review   | PhasePendingTasks | Start 		| 		   |
	| Button	 | Save 		| Submit 			| 				| 		   |
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	Given I click on "Next Review Step" in the page details
	And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name    		| Due in Days |
	| Management Review | 10     	  | 
	Given I expand nested table containing column value "Management Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		  |
    | Automation EXE  |
    Given I collapse nested table containing column value "Management Review"
	And I assign application "<Application Name>" to the "1" Reviewers "Automation EXE" for each step
    | Actions 	  | Step 1 		   	  | Step 2			 			  |
    | Review	  | Management Review | 							  |
    | FlexTable   | Assign		  	  | flexGridApplicationReviewTree |
    | Application | Assign 		  	  | AssignPanelApplicationsTable  |
	And I choose Reviews "Management review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
	Given I re-login to "As a Grantor" app as "EXE" user
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Management Review" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Management Review" inside table
    When I complete filling in the Review form
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
	Examples: 
	| User | Announcement Name  				   | Application Name 	            	    			|
	| EXE  | Automation Announcement to be deleted | Automation Announcement to be deleted Application  |
	    
	@promoteToFDMFromManagementReview @applicationReview
  	Scenario Outline:Promoting from Last review step review to the FDM step for an application
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Next Review Step" in the page details
	Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  | 
	Given I expand nested table containing column value "Program Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation PM  |
    Given I collapse nested table containing column value "Program Review"
    And I expand nested table containing column value "Fiscal Review"
    Given I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation FO	 |
    And I collapse nested table containing column value "Fiscal Review"
    Given I expand nested table containing column value "Compliance Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation EXE |
    Given I collapse nested table containing column value "Compliance Review"
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
    | Actions 	  | Step 1 		   | Step 2			 			   | Step 3  		   |
    | Review	  | Program Review | Fiscal Review				   | Compliance Review |
    | FlexTable   | Assign		   | flexGridApplicationReviewTree |		 		   |			
    | Application | Assign 		   | AssignPanelApplicationsTable  |				   |
	And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
	Given I complete "3" review form as "PM,FO,EXE"
	| Actions 	 | Step 1 		| Step 2			| Step 3  		| Step 4   |
	| Navigation | As a Grantor | Applications 		| Pending Tasks | My Tasks |
	| FlexTable  | SME Review   | PhasePendingTasks | Start 		| 		   |
	| Button	 | Save 		| Submit 			| 				| 		   |
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	Given I click on "Next Review Step" in the page details
	And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name    		| Due in Days |
	| Management Review | 10     	  | 
	Given I expand nested table containing column value "Management Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		  |
    | Automation EXE  |
    Given I collapse nested table containing column value "Management Review"
	And I assign application "<Application Name>" to the "1" Reviewers "Automation EXE" for each step
    | Actions 	  | Step 1 		   	  | Step 2			 			  |
    | Review	  | Management Review | 							  |
    | FlexTable   | Assign		  	  | flexGridApplicationReviewTree |
    | Application | Assign 		  	  | AssignPanelApplicationsTable  |
	And I choose Reviews "Management review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
	Given I complete "1" review form as "EXE"
	| Actions 	 | Step 1 		| Step 2			| Step 3  		| Step 4   |
	| Navigation | As a Grantor | Applications 		| Pending Tasks | My Tasks |
	| FlexTable  | SME Review   | PhasePendingTasks | Start 		| 		   |
	| Button	 | Save 		| Submit 			| 				| 		   |
	And I re-login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Applications Under Review"
    And I perform quick search for "<Announcement Name>" in "flexTableRandomID1" panel
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Related Logs" sub tab
    And I click on "View" icon for "<Review Step Name>" inside flex table with id "AnnouncementReviewStepsFlexToggle"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to FDM" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    When I click "Yes" on the confirmation dialog box
    Then I see that "Review Step" is in "Completed" status
	Examples: 
	| User | Announcement Name  	 | Review Step Name	  | Application Name 	           	    |
	| EXE  | Automation Announcement | Management Review  | Automation Announcement Application |
	
	@subAwardAbbreviationInFDM @applicationReview
  	Scenario Outline: Adding a sub-award abbreviation in FDM
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Next Review Step" in the page details
	Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  | 
	Given I expand nested table containing column value "Program Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation PM  |
    Given I collapse nested table containing column value "Program Review"
    And I expand nested table containing column value "Fiscal Review"
    Given I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation FO	 |
    And I collapse nested table containing column value "Fiscal Review"
    Given I expand nested table containing column value "Compliance Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation EXE |
    Given I collapse nested table containing column value "Compliance Review"
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
    | Actions 	  | Step 1 		   | Step 2			 			   | Step 3  		   |
    | Review	  | Program Review | Fiscal Review				   | Compliance Review |
    | FlexTable   | Assign		   | flexGridApplicationReviewTree |		 		   |			
    | Application | Assign 		   | AssignPanelApplicationsTable  |				   |
	And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
	Given I complete "3" review form as "PM,FO,EXE"
	| Actions 	 | Step 1 		| Step 2			| Step 3  		| Step 4   |
	| Navigation | As a Grantor | Applications 		| Pending Tasks | My Tasks |
	| FlexTable  | SME Review   | PhasePendingTasks | Start 		| 		   |
	| Button	 | Save 		| Submit 			| 				| 		   |
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	Given I click on "Next Review Step" in the page details
	And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name    		| Due in Days |
	| Management Review | 10     	  | 
	Given I expand nested table containing column value "Management Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		  |
    | Automation EXE  |
    Given I collapse nested table containing column value "Management Review"
	And I assign application "<Application Name>" to the "1" Reviewers "Automation EXE" for each step
    | Actions 	  | Step 1 		   	  | Step 2			 			  |
    | Review	  | Management Review | 							  |
    | FlexTable   | Assign		  	  | flexGridApplicationReviewTree |
    | Application | Assign 		  	  | AssignPanelApplicationsTable  |
	And I choose Reviews "Management review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
	Given I complete "1" review form as "EXE"
	| Actions 	 | Step 1 		| Step 2			| Step 3  		| Step 4   |
	| Navigation | As a Grantor | Applications 		| Pending Tasks | My Tasks |
	| FlexTable  | SME Review   | PhasePendingTasks | Start 		| 		   |
	| Button	 | Save 		| Submit 			| 				| 		   |
	And "Management Review" is completed by clicking "Promote to FDM" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	When I click on "Funding Decision Memo" in the page details
	And I click on "Edit" in the page details
	When I enter value "AuGr" into field "GrantCode__c"
	And I click on "Save" in the page details
	Then I see that "Funding Decision Memo" is in "Created" status
	Examples: 
	| User | Announcement Name  	 | Review Step Name	      | Application Name 	           	    |
	| EXE  | Automation Announcement | Funding Decision Memo  | Automation Announcement Application |
		
	@recommendationForApplicationInFDM @applicationReview
  	Scenario Outline: Adding a recommendation for an application in FDM
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Next Review Step" in the page details
	Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  | 
	Given I expand nested table containing column value "Program Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation PM  |
    Given I collapse nested table containing column value "Program Review"
    And I expand nested table containing column value "Fiscal Review"
    Given I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation FO	 |
    And I collapse nested table containing column value "Fiscal Review"
    Given I expand nested table containing column value "Compliance Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation EXE |
    Given I collapse nested table containing column value "Compliance Review"
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
    | Actions 	  | Step 1 		   | Step 2			 			   | Step 3  		   |
    | Review	  | Program Review | Fiscal Review				   | Compliance Review |
    | FlexTable   | Assign		   | flexGridApplicationReviewTree |		 		   |			
    | Application | Assign 		   | AssignPanelApplicationsTable  |				   |
	And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
	Given I complete "3" review form as "PM,FO,EXE"
	| Actions 	 | Step 1 		| Step 2			| Step 3  		| Step 4   |
	| Navigation | As a Grantor | Applications 		| Pending Tasks | My Tasks |
	| FlexTable  | SME Review   | PhasePendingTasks | Start 		| 		   |
	| Button	 | Save 		| Submit 			| 				| 		   |
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	Given I click on "Next Review Step" in the page details
	And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name    		| Due in Days |
	| Management Review | 10     	  | 
	Given I expand nested table containing column value "Management Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		  |
    | Automation EXE  |
    Given I collapse nested table containing column value "Management Review"
	And I assign application "<Application Name>" to the "1" Reviewers "Automation EXE" for each step
    | Actions 	  | Step 1 		   	  | Step 2			 			  |
    | Review	  | Management Review | 							  |
    | FlexTable   | Assign		  	  | flexGridApplicationReviewTree |
    | Application | Assign 		  	  | AssignPanelApplicationsTable  |
	And I choose Reviews "Management review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
	Given I complete "1" review form as "EXE"
	| Actions 	 | Step 1 		| Step 2			| Step 3  		| Step 4   |
	| Navigation | As a Grantor | Applications 		| Pending Tasks | My Tasks |
	| FlexTable  | SME Review   | PhasePendingTasks | Start 		| 		   |
	| Button	 | Save 		| Submit 			| 				| 		   |
	And "Management Review" is completed by clicking "Promote to FDM" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	Given I click on "Funding Decision Memo" in the page details
	And I enter Subaward Abbreviation as "AuGr"
	| Actions | Step 1 | Step 2		  | Step 3 |
	| Field   | Edit   | GrantCode__c | Save   |
	When I edit the following rows inline in flex table with id "inlineEditGridFundingDecisionMemoApplications" by clicking "Edit" :
	| Application Title 				  | Recommended Budget | Recommend for Funding | Comments 	  |
	| Automation Announcement Application | 100000 			   | Yes				   | Recommended  |
	Then I see that "Funding Decision Memo" is in "Created" status
	Examples: 
	| User | Announcement Name  	 | Review Step Name	      | Application Name 	           	    |
	| EXE  | Automation Announcement | Funding Decision Memo  | Automation Announcement Application |
		
	@approverAssignmentForApplicationInFDM @applicationReview
  	Scenario Outline: Assigning an approver in FDM
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Next Review Step" in the page details
	Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  | 
	Given I expand nested table containing column value "Program Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation PM  |
    Given I collapse nested table containing column value "Program Review"
    And I expand nested table containing column value "Fiscal Review"
    Given I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation FO	 |
    And I collapse nested table containing column value "Fiscal Review"
    Given I expand nested table containing column value "Compliance Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation EXE |
    Given I collapse nested table containing column value "Compliance Review"
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
    | Actions 	  | Step 1 		   | Step 2			 			   | Step 3  		   |
    | Review	  | Program Review | Fiscal Review				   | Compliance Review |
    | FlexTable   | Assign		   | flexGridApplicationReviewTree |		 		   |			
    | Application | Assign 		   | AssignPanelApplicationsTable  |				   |
	And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
	Given I complete "3" review form as "PM,FO,EXE"
	| Actions 	 | Step 1 		| Step 2			| Step 3  		| Step 4   |
	| Navigation | As a Grantor | Applications 		| Pending Tasks | My Tasks |
	| FlexTable  | SME Review   | PhasePendingTasks | Start 		| 		   |
	| Button	 | Save 		| Submit 			| 				| 		   |
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	Given I click on "Next Review Step" in the page details
	And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name    		| Due in Days |
	| Management Review | 10     	  | 
	Given I expand nested table containing column value "Management Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		  |
    | Automation EXE  |
    Given I collapse nested table containing column value "Management Review"
	And I assign application "<Application Name>" to the "1" Reviewers "Automation EXE" for each step
    | Actions 	  | Step 1 		   	  | Step 2			 			  |
    | Review	  | Management Review | 							  |
    | FlexTable   | Assign		  	  | flexGridApplicationReviewTree |
    | Application | Assign 		  	  | AssignPanelApplicationsTable  |
	Given I choose Reviews "Management review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
	And I complete "1" review form as "EXE"
	| Actions 	 | Step 1 		| Step 2			| Step 3  		| Step 4   |
	| Navigation | As a Grantor | Applications 		| Pending Tasks | My Tasks |
	| FlexTable  | SME Review   | PhasePendingTasks | Start 		| 		   |
	| Button	 | Save 		| Submit 			| 				| 		   |
	Given "Management Review" is completed by clicking "Promote to FDM" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Funding Decision Memo" in the page details
	Given I enter Subaward Abbreviation as "AuGr"
	| Actions | Step 1 | Step 2		  | Step 3 |
	| Field   | Edit   | GrantCode__c | Save   |
	And I enter the recommendation in FDM in flex table with id "inlineEditGridFundingDecisionMemoApplications" by clicking "Edit"
	| Application Title 				  | Recommended Budget | Recommend for Funding | Comments 	 |
	| Automation Announcement Application | 100000 		       | Yes				   | Recommended |
	When I navigate to "Responsibilities" sub tab
	And I click on "Edit" icon for "Executive Approver" inside flex table with id "GrantorReviewStepRolesandResponsibilities"
	When I fill in the "Automation EXE" for the Approver details
	And I switch to Parent frame
	Then I see that "Funding Decision Memo" is in "Created" status
	Examples: 
	| User | Announcement Name  	 | Review Step Name	      | Application Name 	           	    |
	| EXE  | Automation Announcement | Funding Decision Memo  | Automation Announcement Application |
		
	@submitForApprovalFDM @applicationReview
  	Scenario Outline: Submitting the FDM for approval
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Next Review Step" in the page details
	Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  | 
	Given I expand nested table containing column value "Program Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation PM  |
    Given I collapse nested table containing column value "Program Review"
    And I expand nested table containing column value "Fiscal Review"
    Given I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation FO	 |
    And I collapse nested table containing column value "Fiscal Review"
    Given I expand nested table containing column value "Compliance Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		 |
    | Automation EXE |
    Given I collapse nested table containing column value "Compliance Review"
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
	| Actions 	  | Step 1 		   | Step 2			 			   | Step 3  		   |
    | Review	  | Program Review | Fiscal Review				   | Compliance Review |
    | FlexTable   | Assign		   | flexGridApplicationReviewTree |		 		   |			
    | Application | Assign 		   | AssignPanelApplicationsTable  |				   |
	And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
	Given I complete "3" review form as "PM,FO,EXE"
	| Actions 	 | Step 1 		| Step 2			| Step 3  		| Step 4   |
	| Navigation | As a Grantor | Applications 		| Pending Tasks | My Tasks |
	| FlexTable  | SME Review   | PhasePendingTasks | Start 		| 		   |
	| Button	 | Save 		| Submit 			| 				| 		   |
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Next Review Step" in the page details
	Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name    		| Due in Days |
	| Management Review | 10     	  | 
	Given I expand nested table containing column value "Management Review"
    And I enter the following values into flex table with id "RelatedExternalReviewersGridresizable" by clicking "Add" :
    | Reviewer 		  |
    | Automation EXE  |
    Given I collapse nested table containing column value "Management Review"
	And I assign application "<Application Name>" to the "1" Reviewers "Automation EXE" for each step
    | Actions 	  | Step 1 		   	  | Step 2			 			  |
    | Review	  | Management Review | 							  |
    | FlexTable   | Assign		  	  | flexGridApplicationReviewTree |
    | Application | Assign 		  	  | AssignPanelApplicationsTable  |
	And I choose Reviews "Management review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
	Given I complete "1" review form as "EXE"
	| Actions 	 | Step 1 		| Step 2			| Step 3  		| Step 4   |
	| Navigation | As a Grantor | Applications 		| Pending Tasks | My Tasks |
	| FlexTable  | SME Review   | PhasePendingTasks | Start 		| 		   |
	| Button	 | Save 		| Submit 			| 				| 		   |
	And "Management Review" is completed by clicking "Promote to FDM" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Funding Decision Memo" in the page details
	Given I enter Subaward Abbreviation as "AuGr"
	| Actions | Step 1 | Step 2		  | Step 3 |
	| Field   | Edit   | GrantCode__c | Save   |
	And I enter the recommendation in FDM in flex table with id "inlineEditGridFundingDecisionMemoApplications" by clicking "Edit"
	| Application Title 				  | Recommended Budget | Recommend for Funding | Comments 	 |
	| Automation Announcement Application | 100000 		       | Yes				   | Recommended |
	Given I select "1" approvers "Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorReviewStepRolesandResponsibilities   | Edit   | Executive Approver  |
	When I click on "Submit for Approval" in the page details
	Then I see status in Progress-bar is "Submitted for Approval" and is "green"
	Examples: 
	| User | Announcement Name  	 | Review Step Name	      | Application Name 	           	    |
	| EXE  | Automation Announcement | Funding Decision Memo  | Automation Announcement Application |
		
	@approveFDM @applicationReviewAndFDMHappyPath @applicationReview
  	Scenario Outline: Approving FDM as the assigned user
	Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	And I click on "Next Review Step" in the page details
	Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name 	    | Due in Days |
	| Program Review    | 10   		  | 
	| Fiscal Review     | 10   		  | 
	| Compliance Review | 10   		  | 
	Given I expand nested table containing column value "Program Review"
    And I enter the following values into flex table with id "flexGridApplicationReviewTree" by clicking "Add" :
    | Reviewer 		 |
    | Automation PM  |
    Given I collapse nested table containing column value "Program Review"
    And I expand nested table containing column value "Fiscal Review"
    Given I enter the following values into flex table with id "flexGridApplicationReviewTree" by clicking "Add" :
    | Reviewer 		 |
    | Automation FO	 |
    And I collapse nested table containing column value "Fiscal Review"
    Given I expand nested table containing column value "Compliance Review"
    And I enter the following values into flex table with id "flexGridApplicationReviewTree" by clicking "Add" :
    | Reviewer 		 |
    | Automation EXE |
    Given I collapse nested table containing column value "Compliance Review"
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
    | Actions 	  | Step 1 		   | Step 2			 			   | Step 3  		   |
    | Review	  | Program Review | Fiscal Review				   | Compliance Review |
    | FlexTable   | Assign		   | flexGridApplicationReviewTree |		 		   |			
    | Application | Assign 		   | AssignPanelApplicationsTable  |				   |
	And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
	Given I complete "3" review form as "PM,FO,EXE"
	| Actions 	 | Step 1 			  | Step 2			  | Step 3  	  | Step 4   |
	| Navigation | As a Grantor 	  | Applications 	  | Pending Tasks | My Tasks |
	| FlexTable  | Application Review | PhasePendingTasks | Start 		  | 		 |
	| Button	 | Save 			  | Submit 			  | 			  | 		 |
	And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	Given I click on "Next Review Step" in the page details
	And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
	| Form Name   		| Due in Days |
	| Management Review | 10     	  | 
	Given I expand nested table containing column value "Management Review"
    And I enter the following values into flex table with id "flexGridApplicationReviewTree" by clicking "Add" :
    | Reviewer 		  |
    | Automation EXE  |
    Given I collapse nested table containing column value "Management Review"
	And I assign application "<Application Name>" to the "1" Reviewers "Automation EXE" for each step
    | Actions 	  | Step 1 		   	  | Step 2			 			  |
    | Review	  | Management Review | 							  |
    | FlexTable   | Assign		  	  | flexGridApplicationReviewTree |
    | Application | Assign 		  	  | AssignPanelApplicationsTable  |
	And I choose Reviews "Management Review" and Send for Review
	| Actions 	| Step 1 		  	  | Step 2			|
	| FlexTable | flexGridStepReviews | Send for Review |
	Given I complete "1" review form as "EXE"
	| Actions 	 | Step 1 			  | Step 2			  | Step 3  	  | Step 4   |
	| Navigation | As a Grantor 	  | Applications 	  | Pending Tasks | My Tasks |
	| FlexTable  | Application Review | PhasePendingTasks | Start 		  | 		 |
	| Button	 | Save 			  | Submit 			  | 			  | 		 |
	And "Management Review" is completed by clicking "Promote to FDM" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
	| Actions 	 | Step 1 										 | Step 2			  | Step 3  | Step 4			 |
	| Navigation | As a Grantor									 | Applications 	  | Reviews | Application Review |
	| FlexTable  | Applications Under Review					 | flexTableRandomID1 | View	| Related Logs		 |
	| Review 	 | AnnouncementReviewStepsFlexToggle 			 | Manage Reviews 	  | View 	| 					 |
	| Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes				  | 		|					 |
	Given I click on "Funding Decision Memo" in the page details
	Given I enter Subaward Abbreviation as "Gr19"
	| Actions | Step 1 | Step 2		  | Step 3 |
	| Field   | Edit   | GrantCode__c | Save   |
	And I enter the recommendation in FDM in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit"
	| Application Title 				  | Recommended Budget | Recommend for Funding | Comments 	 |
	| Automation App Jan25    			  | 10000 		       | Yes				   | Recommended |
	Given I select "1" approvers "Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorReviewStepRolesandResponsibilities   | Edit   | Executive Approver  |
	Given I click on "Submit for Approval" in the page details
	And I re-login to "As a Grantor" app as "EXE" user on "QA" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve FDM" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Approve FDM" inside table
	When I click on "Approve" on the approval decision box
	Then I see status in Progress-bar is "Approved" and is "green"
	Examples: 
	| User | Announcement Name  			   | Review Step Name	    | Application Name 	   |
	| EXE  | Automation Announcement Jan25	   | Funding Decision Memo  | Automation App Jan25 |