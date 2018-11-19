@applicationIntake
Feature: Validate all scenarios in the Application Review

	#Background: Have an application under review
		#Given an application "" is created by the user ""
		#Given An application "" is under review

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
	    And I click on "View" on the grid against "Pre-Screen Review" in the table "AnnouncementReviewStepsFlexToggle"
	    When I choose "Automation Announcement Application" in the flextable "Review Decisions"
	    When I click on "Promote to Next Step" button on "Review Decisions" flextable
	    And I click "Yes" on the confirmation dialog box
	    Then I see that "Review Step" is in "Completed" status
	    
	Examples:
	| User | Quick Search Text  	 |
	| EXE  | Automation Announcement |
	
	@SMEReviewEnterDueInDays @applicationReview
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
	
	@SMEReviewAddReviewer @applicationReview
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
	
	
	@SMEReviewAssignApplicationToReviewer @applicationReview
	Scenario Outline: Add a reviewer to each review step in SME Review
		#Given Pre-Screen Review is done for Application "Automation Announcement Application" as user "EXE" submitted for announcement "Automation Announcement"
		#When I click on "Next Review Step" button
		#Given I enter the Due In Days as "10" for all SME review steps
		#Given I assign Reviewers "Automation PM" for Program Review, "Automation FO" for Fiscal Review, "Automation EXE" for Compliance Review in SME Review
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
	    When I click "Assign" after selection of "Application Announcement Application" in the table "AssignPanelApplicationsTable"
	    
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