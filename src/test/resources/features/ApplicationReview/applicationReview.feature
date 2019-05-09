@applicationReview @regression
Feature: Validate all scenarios in the Application Review

  @51065 @preScreenApplicationReview 
 Scenario Outline: Pre-Screen review for an application
 Given I login to "As a Grantor" app as "<User>" user
  When I navigate to "Applications" tab
  And I navigate to "Reviews" content inside "Application Review" subheader on left panel
  And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
  When I click on "View" icon for "<Announcement Name>" inside table
  And I navigate to "Related Logs" sub tab
  And I click on "View" icon for "<Review Step Name>" inside flex table with id "flexGridAnnouncementReviewSteps"
  When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
 And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
  Then I see that "Review Step" is in "In progress" status
   Examples:
 | User | Announcement Name                | Review Step Name  | Application Name                |
 | EXE  | Automation Directed Announcement | Pre-Screen Review |Automation Directed Announcement |

  @51066 @smeReviewEnterDueInDays @smoke
  Scenario Outline: Enter Due in Days for all review forms in SME-review
    Given I login to "As a Grantor" app as "<User>" user
   When I navigate to "Applications" tab
   And I navigate to "Reviews" content inside "Application Review" subheader on left panel
   And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
   When I click on "View" icon for "<Announcement Name>" inside table
   And I navigate to "Related Logs" sub tab
   And I click on "View" icon for "<Review Step Name>" inside flex table with id "flexGridAnnouncementReviewSteps"
   When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
   When I click "Yes" on the confirmation dialog box
    And I click on "Next Review Step" in the page details
    Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 10          |
      | Fiscal Review     | 10          |
      | Compliance Review | 10          |
    Then I see that "SME Review" is in "In Progress" status
    Examples:
      | User | Announcement Name                              | Application Name                     | Review Step Name  |
      | EXE  |  Automation Directed Announcement | Automation Directed Announcement  | Pre-Screen Review |

  @38463 @smeReviewAddReviewer
  Scenario Outline: Add a reviewer to each review step in SME Review
    Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    And I click on "Next Review Step" in the page details
    Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 10          |
      | Fiscal Review     | 10          |
      | Compliance Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation PM  |
      | Automation FO  |
      | Automation EXE |
    Then I see that "SME Review" is in "In Progress" status
    Examples:
      | User | Announcement Name                         | Application Name                     |
      | EXE  | Permanent Announcement(Dr) for Automation | Execution Application for Automation |

  @38462 @smeReviewAssignApplicationToReviewer  @smoke
  Scenario Outline: Verify that user is able to assign applications of a particular announcement to its reviewers
    Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    And I click on "Next Review Step" in the page details
    Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 10          |
      | Fiscal Review     | 10          |
      | Compliance Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation PM  |
      | Automation FO  |
      | Automation EXE |
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
      | Actions     | Step 1         | Step 2                                        | Step 3            |
      | Review      | Program Review | Fiscal Review                                 | Compliance Review |
      | FlexTable   | Assign         | flexGridPreScreenRelatedStepApplicationsFinal |                   |
      | Application | Assign         | flexGridAssignPanelApplications               |                   |
    Then I see that "SME Review" is in "In Progress" status
    Examples:
       | User | Announcement Name                         | Application Name                     |
       | EXE  | Permanent Announcement(Dr) for Automation | Execution Application for Automation |

  @38464 @smeReviewSendForReview @smoke
  Scenario Outline: Choose the reviews and send for review in SME Review
    Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    And I click on "Next Review Step" in the page details
    Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 10          |
      | Fiscal Review     | 10          |
      | Compliance Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation PM  |
      | Automation FO  |
      | Automation EXE |
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
      | Actions     | Step 1         | Step 2                                        | Step 3            |
      | Review      | Program Review | Fiscal Review                                 | Compliance Review |
      | FlexTable   | Assign         | flexGridPreScreenRelatedStepApplicationsFinal |                   |
      | Application | Assign         | flexGridAssignPanelApplications               |                   |
    When I check "Program Review,Fiscal Review,Compliance Review" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    Then I see that "SME Review" is in "In Progress" status
    Examples:
      | User | Announcement Name                         | Application Name                     |
      | EXE  | Permanent Announcement(Dr) for Automation | Execution Application for Automation |

  @51062 @smeReviewCompleteReviewForm @smoke
  Scenario Outline: Complete Review form as Various reviewers in SME Review
    Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    And I click on "Next Review Step" in the page details
    Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 10          |
      | Fiscal Review     | 10          |
      | Compliance Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation PM  |
      | Automation FO  |
      | Automation EXE |
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
      | Actions     | Step 1         | Step 2                                        | Step 3            |
      | Review      | Program Review | Fiscal Review                                 | Compliance Review |
      | FlexTable   | Assign         | flexGridPreScreenRelatedStepApplicationsFinal |                   |
      | Application | Assign         | flexGridAssignPanelApplications               |                   |
    And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I re-login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "SME Review" in "PhasePendingTasks" panel
    And I click on "Start" icon for "SME Review" inside table
    When I complete filling in the Review form with recomendation "Recommended" under title "Summary"
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I re-login to "As a Grantor" app as "FO" user
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "SME Review" in "PhasePendingTasks" panel
    And I click on "Start" icon for "SME Review" inside table
    When I complete filling in the Review form with recomendation "Recommended" under title "Summary"
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I re-login to "As a Grantor" app as "EXE" user
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "SME Review" in "PhasePendingTasks" panel
    And I click on "Start" icon for "SME Review" inside table
    When I complete filling in the Review form with recomendation "Recommended" under title "Summary"
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    Then I see that "SME Review" is in "In Progress" status
    Examples:
      | User | Announcement Name                         | Application Name                     |
      | EXE  | Permanent Announcement(Dr) for Automation | Execution Application for Automation |
      
  @51063 @promoteToNextFromSMEReview @smoke
  Scenario Outline:Promoting from Pre-Screen review to the next review step for an application
    Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    And I click on "Next Review Step" in the page details
    Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 10          |
      | Fiscal Review     | 10          |
      | Compliance Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation PM  |
      | Automation FO  |
      | Automation EXE |
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
      | Actions     | Step 1         | Step 2                                        | Step 3            |
      | Review      | Program Review | Fiscal Review                                 | Compliance Review |
      | FlexTable   | Assign         | flexGridPreScreenRelatedStepApplicationsFinal |                   |
      | Application | Assign         | flexGridAssignPanelApplications               |                   |
    And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I complete "3" review form as "PM,FO,EXE"
      | Actions    | Step 1             | Step 2            | Step 3        | Step 4            |
      | Navigation | As a Grantor       | Applications      | Pending Tasks | Application Tasks |
      | FlexTable  | Application Review | PhasePendingTasks | Start         | Recommended       |
      | Button     | Save               | Submit            | Summary       |                   |
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
      | User | Announcement Name                         | Application Name                     |
      | EXE  | Permanent Announcement(Dr) for Automation | Execution Application for Automation |

  @51064 @managementReviewEnterDueInDays 
  Scenario Outline: Enter Due in Days for all review forms in Management review
    Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    And I click on "Next Review Step" in the page details
    Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 10          |
      | Fiscal Review     | 10          |
      | Compliance Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation PM  |
      | Automation FO  |
      | Automation EXE |
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
      | Actions     | Step 1         | Step 2                                        | Step 3            |
      | Review      | Program Review | Fiscal Review                                 | Compliance Review |
      | FlexTable   | Assign         | flexGridPreScreenRelatedStepApplicationsFinal |                   |
      | Application | Assign         | flexGridAssignPanelApplications               |                   |
    And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I complete "3" review form as "PM,FO,EXE"
      | Actions    | Step 1             | Step 2            | Step 3        | Step 4            |
      | Navigation | As a Grantor       | Applications      | Pending Tasks | Application Tasks |
      | FlexTable  | Application Review | PhasePendingTasks | Start         | Recommended       |
      | Button     | Save               | Submit            | Summary       |                   |
    And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    Given I click on "Next Review Step" in the page details
    And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 10          |
    Then I see that "Management Review" is in "In Progress" status
    Examples:
      | User | Announcement Name                         | Application Name                     |
      | EXE  | Permanent Announcement(Dr) for Automation | Execution Application for Automation |

  @51061 @managementReviewAddReviewer 
  Scenario Outline: Add a reviewer to each review step in Management Review
    Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    And I click on "Next Review Step" in the page details
    Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 10          |
      | Fiscal Review     | 10          |
      | Compliance Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation PM  |
      | Automation FO  |
      | Automation EXE |
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
      | Actions     | Step 1         | Step 2                                        | Step 3            |
      | Review      | Program Review | Fiscal Review                                 | Compliance Review |
      | FlexTable   | Assign         | flexGridPreScreenRelatedStepApplicationsFinal |                   |
      | Application | Assign         | flexGridAssignPanelApplications               |                   |
    And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I complete "3" review form as "PM,FO,EXE"
      | Actions    | Step 1             | Step 2            | Step 3        | Step 4            |
      | Navigation | As a Grantor       | Applications      | Pending Tasks | Application Tasks |
      | FlexTable  | Application Review | PhasePendingTasks | Start         | Recommended       |
      | Button     | Save               | Submit            | Summary       |                   |
    And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    Given I click on "Next Review Step" in the page details
    And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
    Examples:
      | User | Announcement Name                         | Application Name                     |
      | EXE  | Permanent Announcement(Dr) for Automation | Execution Application for Automation |

  @51060 @managementReviewAssignApplicationToReviewer  @smoke
  Scenario Outline: Assign Application to Reviewer in management Review
    Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    And I click on "Next Review Step" in the page details
    Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 10          |
      | Fiscal Review     | 10          |
      | Compliance Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation PM  |
      | Automation FO  |
      | Automation EXE |
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
      | Actions     | Step 1         | Step 2                                        | Step 3            |
      | Review      | Program Review | Fiscal Review                                 | Compliance Review |
      | FlexTable   | Assign         | flexGridPreScreenRelatedStepApplicationsFinal |                   |
      | Application | Assign         | flexGridAssignPanelApplications               |                   |
    And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I complete "3" review form as "PM,FO,EXE"
      | Actions    | Step 1             | Step 2            | Step 3        | Step 4            |
      | Navigation | As a Grantor       | Applications      | Pending Tasks | Application Tasks |
      | FlexTable  | Application Review | PhasePendingTasks | Start         | Recommended       |
      | Button     | Save               | Submit            | Summary       |                   |
    And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    Given I click on "Next Review Step" in the page details
    And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
    And I assign application "<Application Name>" to the "1" Reviewers "Automation EXE" for each step
      | Actions     | Step 1            | Step 2                                        |
      | Review      | Management Review |                                               |
      | FlexTable   | Assign            | flexGridPreScreenRelatedStepApplicationsFinal |
      | Application | Assign            | flexGridAssignPanelApplications               |
    Examples:
      | User | Announcement Name                         | Application Name                     |
      | EXE  | Permanent Announcement(Dr) for Automation | Execution Application for Automation |

  @51059 @managementReviewSendForReview @smoke
  Scenario Outline: Choose the reviews and send for review in Management Review
    Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    And I click on "Next Review Step" in the page details
    Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 10          |
      | Fiscal Review     | 10          |
      | Compliance Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation PM  |
      | Automation FO  |
      | Automation EXE |
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
      | Actions     | Step 1         | Step 2                                        | Step 3            |
      | Review      | Program Review | Fiscal Review                                 | Compliance Review |
      | FlexTable   | Assign         | flexGridPreScreenRelatedStepApplicationsFinal |                   |
      | Application | Assign         | flexGridAssignPanelApplications               |                   |
    And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I complete "3" review form as "PM,FO,EXE"
      | Actions    | Step 1             | Step 2            | Step 3        | Step 4            |
      | Navigation | As a Grantor       | Applications      | Pending Tasks | Application Tasks |
      | FlexTable  | Application Review | PhasePendingTasks | Start         | Recommended       |
      | Button     | Save               | Submit            | Summary       |                   |
    And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    Given I click on "Next Review Step" in the page details
    And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
    And I assign application "<Application Name>" to the "1" Reviewers "Automation EXE" for each step
      | Actions     | Step 1            | Step 2                                        |
      | Review      | Management Review |                                               |
      | FlexTable   | Assign            | flexGridPreScreenRelatedStepApplicationsFinal |
      | Application | Assign            | flexGridAssignPanelApplications               |
    When I check "Management Review" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    Examples:
     | User | Announcement Name                          | Application Name                     |
      | EXE  | Permanent Announcement(Dr) for Automation | Execution Application for Automation |
      
  @51058 @managementReviewCompleteReviewForm 
  Scenario Outline: Complete Review form as Various reviewers in Management Review
    Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    And I click on "Next Review Step" in the page details
    Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 10          |
      | Fiscal Review     | 10          |
      | Compliance Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation PM  |
      | Automation FO  |
      | Automation EXE |
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
      | Actions     | Step 1         | Step 2                                        | Step 3            |
      | Review      | Program Review | Fiscal Review                                 | Compliance Review |
      | FlexTable   | Assign         | flexGridPreScreenRelatedStepApplicationsFinal |                   |
      | Application | Assign         | flexGridAssignPanelApplications               |                   |
    And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I complete "3" review form as "PM,FO,EXE"
      | Actions    | Step 1             | Step 2            | Step 3        | Step 4            |
      | Navigation | As a Grantor       | Applications      | Pending Tasks | Application Tasks |
      | FlexTable  | Application Review | PhasePendingTasks | Start         | Recommended       |
      | Button     | Save               | Submit            | Summary       |                   |
    And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    Given I click on "Next Review Step" in the page details
    And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
    And I assign application "<Application Name>" to the "1" Reviewers "Automation EXE" for each step
      | Actions     | Step 1            | Step 2                                        |
      | Review      | Management Review |                                               |
      | FlexTable   | Assign            | flexGridPreScreenRelatedStepApplicationsFinal |
      | Application | Assign            | flexGridAssignPanelApplications               |
    And I choose Reviews "Management Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I re-login to "As a Grantor" app as "EXE" user
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Management Review" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Management Review" inside table
    When I complete filling in the Review form with recomendation "Recommended" under title "Summary"
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    Examples:
      | User | Announcement Name                         | Application Name                     |
      | EXE  | Permanent Announcement(Dr) for Automation | Execution Application for Automation |

  @51057 @promoteToFDMFromManagementReview @smoke
  Scenario Outline:Promoting from Last review step review to the FDM step for an application
    Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    And I click on "Next Review Step" in the page details
    Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 10          |
      | Fiscal Review     | 10          |
      | Compliance Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation PM  |
      | Automation FO  |
      | Automation EXE |
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
      | Actions     | Step 1         | Step 2                                        | Step 3            |
      | Review      | Program Review | Fiscal Review                                 | Compliance Review |
      | FlexTable   | Assign         | flexGridPreScreenRelatedStepApplicationsFinal |                   |
      | Application | Assign         | flexGridAssignPanelApplications               |                   |
    And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I complete "3" review form as "PM,FO,EXE"
      | Actions    | Step 1             | Step 2            | Step 3        | Step 4            |
      | Navigation | As a Grantor       | Applications      | Pending Tasks | Application Tasks |
      | FlexTable  | Application Review | PhasePendingTasks | Start         | Recommended       |
      | Button     | Save               | Submit            | Summary       |                   |
    And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    Given I click on "Next Review Step" in the page details
    And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
    And I assign application "<Application Name>" to the "1" Reviewers "Automation EXE" for each step
      | Actions     | Step 1            | Step 2                                        |
      | Review      | Management Review |                                               |
      | FlexTable   | Assign            | flexGridPreScreenRelatedStepApplicationsFinal |
      | Application | Assign            | flexGridAssignPanelApplications               |
    And I choose Reviews "Management Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I complete "1" review form as "EXE"
      | Actions    | Step 1             | Step 2            | Step 3        | Step 4            |
      | Navigation | As a Grantor       | Applications      | Pending Tasks | Application Tasks |
      | FlexTable  | Application Review | PhasePendingTasks | Start         | Recommended       |
      | Button     | Save               | Submit            | Summary       |                   |
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
      | User | Announcement Name                         | Review Step Name  | Application Name                     |
      | EXE  | Permanent Announcement(Dr) for Automation | Pre-Screen Review | Execution Application for Automation |

  @51056 @subAwardAbbreviationInFDM 
  Scenario Outline: Adding a sub-award abbreviation in FDM
    Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    And I click on "Next Review Step" in the page details
    Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 10          |
      | Fiscal Review     | 10          |
      | Compliance Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation PM  |
      | Automation FO  |
      | Automation EXE |
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
      | Actions     | Step 1         | Step 2                                        | Step 3            |
      | Review      | Program Review | Fiscal Review                                 | Compliance Review |
      | FlexTable   | Assign         | flexGridPreScreenRelatedStepApplicationsFinal |                   |
      | Application | Assign         | flexGridAssignPanelApplications               |                   |
    And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I complete "3" review form as "PM,FO,EXE"
      | Actions    | Step 1             | Step 2            | Step 3        | Step 4            |
      | Navigation | As a Grantor       | Applications      | Pending Tasks | Application Tasks |
      | FlexTable  | Application Review | PhasePendingTasks | Start         | Recommended       |
      | Button     | Save               | Submit            | Summary       |                   |
    And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    Given I click on "Next Review Step" in the page details
    And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
    And I assign application "<Application Name>" to the "1" Reviewers "Automation EXE" for each step
      | Actions     | Step 1            | Step 2                                        |
      | Review      | Management Review |                                               |
      | FlexTable   | Assign            | flexGridPreScreenRelatedStepApplicationsFinal |
      | Application | Assign            | flexGridAssignPanelApplications               |
    And I choose Reviews "Management Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I complete "1" review form as "EXE"
      | Actions    | Step 1             | Step 2            | Step 3        | Step 4            |
      | Navigation | As a Grantor       | Applications      | Pending Tasks | Application Tasks |
      | FlexTable  | Application Review | PhasePendingTasks | Start         | Recommended       |
      | Button     | Save               | Submit            | Summary       |                   |
    And "Management Review" is completed by clicking "Promote to FDM" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    Given I click on "Funding Decision Memo" in the page details
    And I click on "Edit" in the page details
    When I enter value "AuGr" into field "GrantCode__c"
    And I click on "Save" in the page details
    Then I see that "Funding Decision Memo" is in "Created" status
    Examples:
       | User | Announcement Name                         | Review Step Name  | Application Name                     |
      | EXE  | Permanent Announcement(Dr) for Automation | Pre-Screen Review | Execution Application for Automation |

  @51055 @recommendationForApplicationInFDM 
  Scenario Outline: Adding a recommendation for an application in FDM
    Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    And I click on "Next Review Step" in the page details
    Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 10          |
      | Fiscal Review     | 10          |
      | Compliance Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation PM  |
      | Automation FO  |
      | Automation EXE |
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
      | Actions     | Step 1         | Step 2                                        | Step 3            |
      | Review      | Program Review | Fiscal Review                                 | Compliance Review |
      | FlexTable   | Assign         | flexGridPreScreenRelatedStepApplicationsFinal |                   |
      | Application | Assign         | flexGridAssignPanelApplications               |                   |
    And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I complete "3" review form as "PM,FO,EXE"
      | Actions    | Step 1             | Step 2            | Step 3        | Step 4            |
      | Navigation | As a Grantor       | Applications      | Pending Tasks | Application Tasks |
      | FlexTable  | Application Review | PhasePendingTasks | Start         | Recommended       |
      | Button     | Save               | Submit            | Summary       |                   |
    And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    Given I click on "Next Review Step" in the page details
    And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
    And I assign application "<Application Name>" to the "1" Reviewers "Automation EXE" for each step
      | Actions     | Step 1            | Step 2                                        |
      | Review      | Management Review |                                               |
      | FlexTable   | Assign            | flexGridPreScreenRelatedStepApplicationsFinal |
      | Application | Assign            | flexGridAssignPanelApplications               |
    And I choose Reviews "Management Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I complete "1" review form as "EXE"
      | Actions    | Step 1             | Step 2            | Step 3        | Step 4            |
      | Navigation | As a Grantor       | Applications      | Pending Tasks | Application Tasks |
      | FlexTable  | Application Review | PhasePendingTasks | Start         | Recommended       |
      | Button     | Save               | Submit            | Summary       |                   |
    And "Management Review" is completed by clicking "Promote to FDM" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    Given I click on "Funding Decision Memo" in the page details
    Given I enter Subaward Abbreviation as "Gr19"
      | Actions | Step 1 | Step 2       | Step 3 |
      | Field   | Edit   | GrantCode__c | Save   |
    And I enter the recommendation in FDM in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit"
      | Application Title      | Recommended Budget | Recommend for Funding | Comments    |
      | Automation Application | 10000              | Yes                   | Recommended |
    Then I see that "Funding Decision Memo" is in "Created" status
    Examples:
      | User | Announcement Name                         | Review Step Name  | Application Name                     |
      | EXE  | Permanent Announcement(Dr) for Automation | Pre-Screen Review | Execution Application for Automation |

  @51054 @approverAssignmentForApplicationInFDM @smoke
  Scenario Outline: Assigning an approver in FDM
    Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    And I click on "Next Review Step" in the page details
    Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 10          |
      | Fiscal Review     | 10          |
      | Compliance Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation PM  |
      | Automation FO  |
      | Automation EXE |
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
      | Actions     | Step 1         | Step 2                                        | Step 3            |
      | Review      | Program Review | Fiscal Review                                 | Compliance Review |
      | FlexTable   | Assign         | flexGridPreScreenRelatedStepApplicationsFinal |                   |
      | Application | Assign         | flexGridAssignPanelApplications               |                   |
    And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I complete "3" review form as "PM,FO,EXE"
      | Actions    | Step 1             | Step 2            | Step 3        | Step 4            |
      | Navigation | As a Grantor       | Applications      | Pending Tasks | Application Tasks |
      | FlexTable  | Application Review | PhasePendingTasks | Start         | Recommended       |
      | Button     | Save               | Submit            | Summary       |                   |
    And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    Given I click on "Next Review Step" in the page details
    And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
    And I assign application "<Application Name>" to the "1" Reviewers "Automation EXE" for each step
      | Actions     | Step 1            | Step 2                                        |
      | Review      | Management Review |                                               |
      | FlexTable   | Assign            | flexGridPreScreenRelatedStepApplicationsFinal |
      | Application | Assign            | flexGridAssignPanelApplications               |
    And I choose Reviews "Management Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I complete "1" review form as "EXE"
      | Actions    | Step 1             | Step 2            | Step 3        | Step 4            |
      | Navigation | As a Grantor       | Applications      | Pending Tasks | Application Tasks |
      | FlexTable  | Application Review | PhasePendingTasks | Start         | Recommended       |
      | Button     | Save               | Submit            | Summary       |                   |
    And "Management Review" is completed by clicking "Promote to FDM" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    Given I click on "Funding Decision Memo" in the page details
    Given I enter Subaward Abbreviation as "Gr19"
      | Actions | Step 1 | Step 2       | Step 3 |
      | Field   | Edit   | GrantCode__c | Save   |
    And I enter the recommendation in FDM in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit"
      | Application Title      | Recommended Budget | Recommend for Funding | Comments    |
      | Automation Application | 10000              | Yes                   | Recommended |
    Given I select "1" approvers "Automation EXE"
      | Actions    | Step 1                                    | Step 2 | Step 3             |
      | Subtab     | Responsibilities                          |        |                    |
      | Approver 1 | GrantorReviewStepRolesandResponsibilities | Edit   | Executive Approver |
    Then I see that "Funding Decision Memo" is in "Created" status
    Examples:
      | User | Announcement Name                         | Review Step Name  | Application Name                     |
      | EXE  | Permanent Announcement(Dr) for Automation | Pre-Screen Review | Execution Application for Automation |

  @51053 @submitForApprovalFDM 
  Scenario Outline: Submitting the FDM for approval
    Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    And I click on "Next Review Step" in the page details
    Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 10          |
      | Fiscal Review     | 10          |
      | Compliance Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation PM  |
      | Automation FO  |
      | Automation EXE |
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
      | Actions     | Step 1         | Step 2                                        | Step 3            |
      | Review      | Program Review | Fiscal Review                                 | Compliance Review |
      | FlexTable   | Assign         | flexGridPreScreenRelatedStepApplicationsFinal |                   |
      | Application | Assign         | flexGridAssignPanelApplications               |                   |
    And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I complete "3" review form as "PM,FO,EXE"
      | Actions    | Step 1             | Step 2            | Step 3        | Step 4            |
      | Navigation | As a Grantor       | Applications      | Pending Tasks | Application Tasks |
      | FlexTable  | Application Review | PhasePendingTasks | Start         | Recommended       |
      | Button     | Save               | Submit            | Summary       |                   |
    And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    Given I click on "Next Review Step" in the page details
    And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
    And I assign application "<Application Name>" to the "1" Reviewers "Automation EXE" for each step
      | Actions     | Step 1            | Step 2                                        |
      | Review      | Management Review |                                               |
      | FlexTable   | Assign            | flexGridPreScreenRelatedStepApplicationsFinal |
      | Application | Assign            | flexGridAssignPanelApplications               |
    And I choose Reviews "Management Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I complete "1" review form as "EXE"
      | Actions    | Step 1             | Step 2            | Step 3        | Step 4            |
      | Navigation | As a Grantor       | Applications      | Pending Tasks | Application Tasks |
      | FlexTable  | Application Review | PhasePendingTasks | Start         | Recommended       |
      | Button     | Save               | Submit            | Summary       |                   |
    And "Management Review" is completed by clicking "Promote to FDM" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    Given I click on "Funding Decision Memo" in the page details
    Given I enter Subaward Abbreviation as "Gr19"
      | Actions | Step 1 | Step 2       | Step 3 |
      | Field   | Edit   | GrantCode__c | Save   |
    And I enter the recommendation in FDM in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit"
      | Application Title      | Recommended Budget | Recommend for Funding | Comments    |
      | Automation Application | 10000              | Yes                   | Recommended |
    Given I select "1" approvers "Automation EXE"
      | Actions    | Step 1                                    | Step 2 | Step 3             |
      | Subtab     | Responsibilities                          |        |                    |
      | Approver 1 | GrantorReviewStepRolesandResponsibilities | Edit   | Executive Approver |
    Given I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    Examples:
      | User | Announcement Name                         | Review Step Name  | Application Name                     |
      | EXE  | Permanent Announcement(Dr) for Automation | Pre-Screen Review | Execution Application for Automation |

    @51052 @approveFDM @applicationReviewAndFDMHappyPath @smoke
    Scenario Outline: Approving FDM as the assigned user
    Given "Pre-Screen Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - All                    | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    And I click on "Next Review Step" in the page details
    Given I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 10          |
      | Fiscal Review     | 10          |
      | Compliance Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation PM  |
      | Automation FO  |
      | Automation EXE |
    And I assign application "<Application Name>" to the "3" Reviewers "Automation PM,Automation FO,Automation EXE" for each step
      | Actions     | Step 1         | Step 2                                        | Step 3            |
      | Review      | Program Review | Fiscal Review                                 | Compliance Review |
      | FlexTable   | Assign         | flexGridPreScreenRelatedStepApplicationsFinal |                   |
      | Application | Assign         | flexGridAssignPanelApplications               |                   |
    And I choose Reviews "Program Review,Fiscal Review,Compliance Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I complete "3" review form as "PM,FO,EXE"
      | Actions    | Step 1             | Step 2            | Step 3        | Step 4            |
      | Navigation | As a Grantor       | Applications      | Pending Tasks | Application Tasks |
      | FlexTable  | Application Review | PhasePendingTasks | Start         | Recommended       |
      | Button     | Save               | Submit            | Summary       |                   |
    And "SME Review" is completed by clicking "Promote to Next Step" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    Given I click on "Next Review Step" in the page details
    And I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 10          |
    And I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
    And I assign application "<Application Name>" to the "1" Reviewers "Automation EXE" for each step
      | Actions     | Step 1            | Step 2                                        |
      | Review      | Management Review |                                               |
      | FlexTable   | Assign            | flexGridPreScreenRelatedStepApplicationsFinal |
      | Application | Assign            | flexGridAssignPanelApplications               |
    And I choose Reviews "Management Review" and Send for Review
      | Actions   | Step 1              | Step 2          |
      | FlexTable | flexGridStepReviews | Send for Review |
    Given I complete "1" review form as "EXE"
      | Actions    | Step 1             | Step 2            | Step 3        | Step 4            |
      | Navigation | As a Grantor       | Applications      | Pending Tasks | Application Tasks |
      | FlexTable  | Application Review | PhasePendingTasks | Start         | Recommended       |
      | Button     | Save               | Submit            | Summary       |                   |
    And "Management Review" is completed by clicking "Promote to FDM" for Application "<Application Name>" as user "<User>" submitted for announcement "<Announcement Name>"
      | Actions    | Step 1                                        | Step 2             | Step 3  | Step 4             |
      | Navigation | As a Grantor                                  | Applications       | Reviews | Application Review |
      | FlexTable  | Announcement Reviews - Under Review           | flexTableRandomID1 | View    | Related Logs       |
      | Review     | AnnouncementReviewStepsFlexToggle             | Manage Reviews     | View    |                    |
      | Promotion  | flexGridPreScreenRelatedStepApplicationsFinal | Yes                |         |                    |
    Given I click on "Funding Decision Memo" in the page details
    Given I enter Subaward Abbreviation as "Gr19"
      | Actions | Step 1 | Step 2       | Step 3 |
      | Field   | Edit   | GrantCode__c | Save   |
    And I enter the recommendation in FDM in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit"
      | Application Title      | Recommended Budget | Recommend for Funding | Comments    |
      | Automation Application | 10000              | Yes                   | Recommended |
    Given I select "1" approvers "Automation EXE"
      | Actions    | Step 1                                    | Step 2 | Step 3             |
      | Subtab     | Responsibilities                          |        |                    |
      | Approver 1 | GrantorReviewStepRolesandResponsibilities | Edit   | Executive Approver |
    Given I click on "Submit for Approval" in the page details
    And I re-login to "As a Grantor" app as "EXE" user
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left panel
    When I perform quick search for "Approve FDM" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Approve FDM" inside table
    When I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"
    Examples:
      | User | Announcement Name                         | Review Step Name  | Application Name                     |
      | EXE  | Permanent Announcement(Dr) for Automation | Pre-Screen Review | Execution Application for Automation |