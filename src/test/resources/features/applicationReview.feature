@applicationIntake
Feature: Validate all scenarios in the Application Review

	#Background: Have an application under review
		#Delete the application "" and related reviews
		#Given an application "" is created by the user ""
		#Given an application "" is under review

	@preScreenApplicationReview @applicationReview
  	Scenario Outline: Pre-Screen review for an application
	    Given I login to "As a Grantor" app as "<User>" User
	    When I navigate to "Applications" tab
	    And I click "Reviews" inside side bar "Application Review"
	    When I toggle to "Applications Under Review"
	    And I perform quick search "<Quick Search Text>" on table "flexTableRandomID1"
	    When I click on the "View" icon for the "<Quick Search Text>"
	    And I click on "Related Logs" subtab
	    When I scroll to "Manage Reviews" section
	    And I click on "View" on the grid against "<Review Step Name>" in the table "AnnouncementReviewStepsFlexToggle"
	    When I choose "<Application Name>" in the flextable "Review Decisions"
	    When I click on "Promote to Next Step" button on "Review Decisions" flextable
	    And I click "Yes" on the confirmation dialog box
	    Then I see that "Review Step" is in "Completed" status
	    
	Examples:
	| User | Quick Search Text  	 | Review Step Name  | Application Name 				   |
	| EXE  | Automation Announcement | Pre-Screen Review | Automation Announcement Application |
	
	@smeReviewEnterDueInDays @applicationReview
	Scenario Outline: Enter Due in Days for all review forms in SME-review
		#Given Pre-Screen Review is done for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
		#When I click on "Next Review Step" button
		Given I login to "As a Grantor" app as "<User>" User
	    When I navigate to "Applications" tab
	    And I click "Reviews" inside side bar "Application Review"
	    When I toggle to "Applications Under Review"
	    And I perform quick search "<Quick Search Text>" on table "flexTableRandomID1"
	    When I click on the "View" icon for the "<Quick Search Text>"
	    And I click on "Related Logs" subtab
	    When I scroll to "Manage Reviews" section
	    And I click on "View" on the grid against "SME Review" in the table "AnnouncementReviewStepsFlexToggle"
	  	And I click on the "Edit" icon for the "Program Review" on the flextable "Review Forms"
	  	When I fill the fields in the table "RelatedReviewPanelGridresizable":
	    | tableColumnNumber | inputype | inputValue                 |
	    | 8                 | text     | 10                         |
	    When I click on "Save" button on "Review Forms" flextable
	    And I click on the "Edit" icon for the "Fiscal Review" on the flextable "Review Forms"
	  	When I fill the fields in the table "RelatedReviewPanelGridresizable":
	    | tableColumnNumber | inputype | inputValue                 |
	    | 8                 | text     | 10                         |
	    When I click on "Save" button on "Review Forms" flextable
	    And I click on the "Edit" icon for the "Compliance Review" on the flextable "Review Forms"
	  	When I fill the fields in the table "RelatedReviewPanelGridresizable":
	    | tableColumnNumber | inputype | inputValue                 |
	    | 8                 | text     | 10                         |
	    When I click on "Save" button on "Review Forms" flextable
	    
	Examples:
	| User | Quick Search Text  	 |
	| EXE  | Automation Announcement |
	
	@smeReviewAddReviewer @applicationReview
	Scenario Outline: Add a reviewer to each review step in SME Review
		#Given Pre-Screen Review is done for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
		#When I click on "Next Review Step" button
		#Given I enter the Due In Days as "10" for all SME review steps
		Given I login to "As a Grantor" app as "<User>" User
	    When I navigate to "Applications" tab
	    And I click "Reviews" inside side bar "Application Review"
	    When I toggle to "Applications Under Review"
	    And I perform quick search "<Quick Search Text>" on table "flexTableRandomID1"
	    When I click on the "View" icon for the "<Quick Search Text>"
	    And I click on "Related Logs" subtab
	    When I scroll to "Manage Reviews" section
	    And I click on "View" on the grid against "SME Review" in the table "AnnouncementReviewStepsFlexToggle"
	    And I expand the "Program Review" on grid "Review Forms"
	    When I click on "Add" button on "Reviewers" flextable
	    And I add "Automation PM" as reviewer in the table "RelatedExternalReviewersGridresizable"
	    When I click on "Save" button on "Review Forms" flextable
	    And I collapse the "Program Review" on grid "Review Forms"
	    And I expand the "Fiscal Review" on grid "Review Forms"
	    When I click on "Add" button on "Reviewers" flextable
	    And I add "Automation FO" as reviewer in the table "RelatedExternalReviewersGridresizable"
	    When I click on "Save" button on "Review Forms" flextable
	    And I collapse the "Fiscal Review" on grid "Review Forms"
	    And I expand the "Compliance Review" on grid "Review Forms"
	    When I click on "Add" button on "Reviewers" flextable
	    And I add "Automation EXE" as reviewer in the table "RelatedExternalReviewersGridresizable"
	    When I click on "Save" button on "Review Forms" flextable
	    And I collapse the "Compliance Review" on grid "Review Forms"
	  	
	Examples:
	| User | Quick Search Text  	 |
	| EXE  | Automation Announcement |
	
	
	@smeReviewAssignApplicationToReviewer @applicationReview
	Scenario Outline: Add a reviewer to each review step in SME Review
		#Given Pre-Screen Review is done for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
		#When I click on "Next Review Step" button
		#Given I enter the Due In Days as "10" for all SME review steps
		#Given I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
		Given I login to "As a Grantor" app as "<User>" User
	    When I navigate to "Applications" tab
	    And I click "Reviews" inside side bar "Application Review"
	    When I toggle to "Applications Under Review"
	    And I perform quick search "<Quick Search Text>" on table "flexTableRandomID1"
	    When I click on the "View" icon for the "<Quick Search Text>"
	    And I click on "Related Logs" subtab
	    When I scroll to "Manage Reviews" section
	    And I click on "View" on the grid against "SME Review" in the table "AnnouncementReviewStepsFlexToggle"
	    And I expand the "Program Review" on grid "Review Forms"
	    When I click on the "Assign" icon for the "Automation PM" on the flextable "Reviewers" to switch to frame "RelatedExternalReviewersGridiframeContentId"
	    When I click "Assign" after selection of "Automation Announcement Application" in the table "AssignPanelApplicationsTable"
	    And I switch to Parent frame
	    And I expand the "Fiscal Review" on grid "Review Forms"
	    When I click on the "Assign" icon for the "Automation FO" on the flextable "Reviewers" to switch to frame "RelatedExternalReviewersGridiframeContentId"
	    When I click "Assign" after selection of "Automation Announcement Application" in the table "AssignPanelApplicationsTable"
	    And I switch to Parent frame
	    And I expand the "Compliance Review" on grid "Review Forms"
	    When I click on the "Assign" icon for the "Automation EXE" on the flextable "Reviewers" to switch to frame "RelatedExternalReviewersGridiframeContentId"
	    When I click "Assign" after selection of "Automation Announcement Application" in the table "AssignPanelApplicationsTable"
	    And I switch to Parent frame
	  	
	Examples:
	| User | Quick Search Text  	 |
	| EXE  | Automation Announcement |
	
	@smeReviewSendForReview @applicationReview
	Scenario Outline: Choose the reviews and send for review in SME Review
		#Given Pre-Screen Review is done for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
		#When I click on "Next Review Step" button
		#Given I enter the Due In Days as "10" for all SME review steps
		#Given I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
		#Given I assign application "Automation Announcement Application" to the Reviewers for SME Review
		Given I login to "As a Grantor" app as "<User>" User
	    When I navigate to "Applications" tab
	    And I click "Reviews" inside side bar "Application Review"
	    When I toggle to "Applications Under Review"
	    And I perform quick search "<Quick Search Text>" on table "flexTableRandomID1"
	    When I click on the "View" icon for the "<Quick Search Text>"
	    And I click on "Related Logs" subtab
	    When I scroll to "Manage Reviews" section
	    And I click on "View" on the grid against "SME Review" in the table "AnnouncementReviewStepsFlexToggle"
	    When I choose "Program Review" in the flextable "<Flextable Name>"
	    When I choose "Fiscal Review" in the flextable "<Flextable Name>"
	    When I choose "Compliance Review" in the flextable "<Flextable Name>"
	    When I click on "Send for Review" button on "<Flextable Name>" flextable
	    
	Examples:
	| User | Quick Search Text  	 | Flextable Name |
	| EXE  | Automation Announcement | Reviews		  |
	
	@smeReviewCompleteReviewForm @applicationReview
	Scenario: Complete Review form as Various reviewers in SME Review
		#Given Pre-Screen Review is done for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
		#When I click on "Next Review Step" button
		#Given I enter the Due In Days as "10" for all SME review steps
		#Given I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
		#Given I assign application "Automation Announcement Application" to the Reviewers for SME Review
		#Given I choose Reviews and Send for Review
	    Given I re-login to "As a Grantor" app as "PM" User
	    When I navigate to "Applications" tab
	    And I click "Pending Tasks" inside side bar "My Tasks"
	    When I perform quick search "SME Review" on table "PhasePendingTasks"
	    And I click on the "Start" icon for the "SME Review"
	    When I fill in the Review form
	    And I click on "Save" button
	    When I click on "Submit" button
	    Given I re-login to "As a Grantor" app as "FO" User
	    When I navigate to "Applications" tab
	    And I click "Pending Tasks" inside side bar "My Tasks"
	    When I perform quick search "SME Review" on table "PhasePendingTasks"
	    And I click on the "Start" icon for the "SME Review"
	    When I fill in the Review form
	    And I click on "Save" button
	    When I click on "Submit" button
	    Given I re-login to "As a Grantor" app as "EXE" User
	    When I navigate to "Applications" tab
	    And I click "Pending Tasks" inside side bar "My Tasks"
	    When I perform quick search "SME Review" on table "PhasePendingTasks"
	    And I click on the "Start" icon for the "SME Review"
	    When I fill in the Review form
	    And I click on "Save" button
	    When I click on "Submit" button
	    
	@promoteToNextFromSMEReview @applicationReview
  	Scenario Outline: Pre-Screen review for an application
  		#Given "Pre-Screen Review" is done for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
		#When I click on "Next Review Step" button
		#Given I enter the Due In Days as "10" for all SME review steps
		#Given I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
		#Given I assign application "Automation Announcement Application" to the Reviewers for SME Review
		#Given I choose Reviews and Send for Review
		#Given I complete review form as assigned reviewers for SME review
	    Given I re-login to "As a Grantor" app as "<User>" User
	    When I navigate to "Applications" tab
	    And I click "Reviews" inside side bar "Application Review"
	    When I toggle to "Applications Under Review"
	    And I perform quick search "<Quick Search Text>" on table "flexTableRandomID1"
	    When I click on the "View" icon for the "<Quick Search Text>"
	    And I click on "Related Logs" subtab
	    When I scroll to "Manage Reviews" section
	    And I click on "View" on the grid against "<Review Step Name>" in the table "AnnouncementReviewStepsFlexToggle"
	    When I choose "<Application Name>" in the flextable "Review Decisions"
	    When I click on "Promote to Next Step" button on "Review Decisions" flextable
	    And I click "Yes" on the confirmation dialog box
	    Then I see that "Review Step" is in "Completed" status
	    
	Examples:
	| User | Quick Search Text  	 | Review Step Name  | Application Name 				   |
	| EXE  | Automation Announcement | SME Review 		 | Automation Announcement Application |
	
	
	@managementReviewEnterDueInDays @applicationReview
	Scenario Outline: Enter Due in Days for all review forms in Management review
		#Given "Pre-Screen Review" is done for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
		#When I click on "Next Review Step" button
		#Given I enter the Due In Days as "10" for all SME review steps
		#Given I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
		#Given I assign application "Automation Announcement Application" to the Reviewers for SME Review
		#Given I choose Reviews and Send for Review
		#Given I complete review form as assigned reviewers for SME review
		#Given "SME Review" is done for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
		Given I login to "As a Grantor" app as "<User>" User
	    When I navigate to "Applications" tab
	    And I click "Reviews" inside side bar "Application Review"
	    When I toggle to "Applications Under Review"
	    And I perform quick search "<Quick Search Text>" on table "flexTableRandomID1"
	    When I click on the "View" icon for the "<Quick Search Text>"
	    And I click on "Related Logs" subtab
	    When I scroll to "Manage Reviews" section
	    And I click on "View" on the grid against "Management Review" in the table "AnnouncementReviewStepsFlexToggle"
	  	And I click on the "Edit" icon for the "Management Review" on the flextable "Review Forms"
	  	When I fill the fields in the table "RelatedReviewPanelGridresizable":
	    | tableColumnNumber | inputype | inputValue                 |
	    | 8                 | text     | 10                         |
	    When I click on "Save" button on "Review Forms" flextable
	    
    Examples:
	| User | Quick Search Text  	 |
	| EXE  | Automation Announcement |
		
	@managementReviewAddReviewer @applicationReview
	Scenario Outline: Add a reviewer to each review step in Management Review
		#Given "Pre-Screen Review" is done for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
		#When I click on "Next Review Step" button
		#Given I enter the Due In Days as "10" for all SME review steps
		#Given I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
		#Given I assign application "Automation Announcement Application" to the Reviewers for SME Review
		#Given I choose Reviews and Send for Review
		#Given I complete review form as assigned reviewers for SME review
		#Given "SME Review" is done for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
		#Given I enter the Due In Days as "10" for all Management review steps
		Given I login to "As a Grantor" app as "<User>" User
	    When I navigate to "Applications" tab
	    And I click "Reviews" inside side bar "Application Review"
	    When I toggle to "Applications Under Review"
	    And I perform quick search "<Quick Search Text>" on table "flexTableRandomID1"
	    When I click on the "View" icon for the "<Quick Search Text>"
	    And I click on "Related Logs" subtab
	    When I scroll to "Manage Reviews" section
	    And I click on "View" on the grid against "Management Review" in the table "AnnouncementReviewStepsFlexToggle"
	    And I expand the "Management Review" on grid "Review Forms"
	    When I click on "Add" button on "Reviewers" flextable
	    And I add "Automation EXE" as reviewer in the table "RelatedExternalReviewersGridresizable"
	    When I click on "Save" button on "Review Forms" flextable		
		
	Examples:
	| User | Quick Search Text  	 |
	| EXE  | Automation Announcement |
		
	@managementReviewAssignApplicationToReviewer @applicationReview
	Scenario Outline: Add a reviewer to each review step in management Review
		#Given "Pre-Screen Review" is done for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
		#When I click on "Next Review Step" button
		#Given I enter the Due In Days as "10" for all SME review steps
		#Given I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
		#Given I assign application "Automation Announcement Application" to the Reviewers for SME Review
		#Given I choose Reviews and Send for Review
		#Given I complete review form as assigned reviewers for SME review
		#Given "SME Review" is done for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
		#Given I enter the Due In Days as "10" for all Management review steps
		#Given I add Reviewers "Automation EXE" for Management Review
		Given I login to "As a Grantor" app as "<User>" User
	    When I navigate to "Applications" tab
	    And I click "Reviews" inside side bar "Application Review"
	    When I toggle to "Applications Under Review"
	    And I perform quick search "<Quick Search Text>" on table "flexTableRandomID1"
	    When I click on the "View" icon for the "<Quick Search Text>"
	    And I click on "Related Logs" subtab
	    When I scroll to "Manage Reviews" section
	    And I click on "View" on the grid against "Management Review" in the table "AnnouncementReviewStepsFlexToggle"
	    And I expand the "Management Review" on grid "Review Forms"
	    When I click on the "Assign" icon for the "Automation EXE" on the flextable "Reviewers" to switch to frame "RelatedExternalReviewersGridiframeContentId"
	    When I click "Assign" after selection of "Automation Announcement Application" in the table "AssignPanelApplicationsTable"
	    And I switch to Parent frame
	    
	Examples:
	| User | Quick Search Text  	 |
	| EXE  | Automation Announcement |
		
	@managementReviewSendForReview @applicationReview
	Scenario Outline: Choose the reviews and send for review in Management Review
		#Given "Pre-Screen Review" is done for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
		#When I click on "Next Review Step" button
		#Given I enter the Due In Days as "10" for all SME review steps
		#Given I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
		#Given I assign application "Automation Announcement Application" to the Reviewers for SME Review
		#Given I choose Reviews and Send for Review
		#Given I complete review form as assigned reviewers for SME review
		#Given "SME Review" is done for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
		#Given I enter the Due In Days as "10" for all Management review steps
		#Given I add Reviewers "Automation EXE" for Management Review
		#Given I assign application "Automation Announcement Application" to the Reviewers for Management Review
		Given I login to "As a Grantor" app as "<User>" User
	    When I navigate to "Applications" tab
	    And I click "Reviews" inside side bar "Application Review"
	    When I toggle to "Applications Under Review"
	    And I perform quick search "<Quick Search Text>" on table "flexTableRandomID1"
	    When I click on the "View" icon for the "<Quick Search Text>"
	    And I click on "Related Logs" subtab
	    When I scroll to "Manage Reviews" section
	    And I click on "View" on the grid against "SME Review" in the table "AnnouncementReviewStepsFlexToggle"
	    When I choose "Management Review" in the flextable "<Flextable Name>"
	    When I click on "Send for Review" button on "<Flextable Name>" flextable
	    
	Examples:
	| User | Quick Search Text  	 | Flextable Name |
	| EXE  | Automation Announcement | Reviews		  |

	@managementReviewCompleteReviewForm @applicationReview
	Scenario: Complete Review form as Various reviewers in Management Review
		#Given "Pre-Screen Review" is done for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
		#When I click on "Next Review Step" button
		#Given I enter the Due In Days as "10" for all SME review steps
		#Given I add Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
		#Given I assign application "Automation Announcement Application" to the Reviewers for SME Review
		#Given I choose Reviews for SME review and Send for Review
		#Given I complete review form as assigned reviewers for SME review
		#Given "SME Review" is done for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
		#Given I enter the Due In Days as "10" for all Management review steps
		#Given I add Reviewers "Automation EXE" for Management Review
		#Given I assign application "Automation Announcement Application" to the Reviewers for Management Review
		#Given I choose Reviews for Management review and Send for Review
		Given I login to "As a Grantor" app as "PM" User
	    When I navigate to "Applications" tab
	    And I click "Pending Tasks" inside side bar "My Tasks"
	    When I perform quick search "SME Review" on table "PhasePendingTasks"
	    And I click on the "Start" icon for the "SME Review"
	    When I fill in the Review form
	    And I click on "Save" button
	    When I click on "Submit" button