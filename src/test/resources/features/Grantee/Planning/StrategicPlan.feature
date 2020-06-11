@Grantee-Planning @StrategicPlan @grantee-regression @grantee-parallel-regression
Feature: Strategic Plan related scenarios
  Test all scenarios related to Strategic Plan

  @61948 @validateStrategicPlan @validateStrategicPlanQuickSearch @smoke @positive
  Scenario Outline: Verify User can do quick search using <ColumnName>
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "<value>" in "{grantee_tableId:StrategicPlans}" panel
    Then I softly see value "<value>" for title "<ColumnName>" inside table "{grantee_tableId:StrategicPlans}"
    Examples:
      | ColumnName            | value                               |
      | EGMS ID               | SPN-0030                            |
      | Internal Organization | Department of Health                |
      | Title                 | Automation Permanent Strategic Plan |

  @61948 @validateStrategicPlan @validateStrategicPlanAdvanceSearch @positive
  Scenario Outline: Verify User can advance search using <ColumnName>
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    When I click on advance filter "#advfStrategicPlansParent" of table id "{grantee_tableId:StrategicPlans}"
    When I enter advance filter values inside id "advfStrategicPlansParent"
      | <ColumnName> | <operator> | <value> |
    Then I softly see value "<value>" for title "<ColumnName>" inside table "{grantee_tableId:StrategicPlans}"
    Examples:
      | ColumnName | value                               | operator |
      | EGMS ID    | SPN-0030                            | contains |
      | Title      | Automation Permanent Strategic Plan | contains |

  @61948 @validateStrategicPlan @validateStrategicPlanSortAllColumns @positive
  Scenario Outline: Verify User can see sort as per column
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    When I click on "<ColumnName>" column header inside table with id "{grantee_tableId:StrategicPlans}"
    Then I softly see content of expected column "<ColumnName>" is in "Descending" order of table id "{grantee_tableId:StrategicPlans}"
    When I click on "<ColumnName>" column header inside table with id "{grantee_tableId:StrategicPlans}"
    Then I softly see content of expected column "<ColumnName>" is in "Ascending" order of table id "{grantee_tableId:StrategicPlans}"
    Examples:
      | ColumnName            |
      | Internal Organization |
      | Title                 |
      | Status                |
      | Month-Year Created    |
      | EGMS ID               |
      | Created By            |

  @61948 @validateStrategicPlan @validateStrategicPlanValidation @smoke
  Scenario: Verify validation while create new Strategic Plan
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I click modal button "Save and Continue"
    Then  I see the following messages in the page details :
      | Title is Required to save. |

  @61948 @validateStrategicPlan @validateStrategicPlanCreateNewStrategicPlan @smoke @positive
  Scenario Outline: Verify User can create new Strategic Plan
    When I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE EXE   |

  @61948 @validateStrategicPlan @validateStrategicPlanEditAndDelete1
  Scenario Outline: Verify except owner no one can edit and delete strategic plan
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I re-login to "As a Grantee" app as "<user>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Strategic}" in flex table with id "{grantee_tableId:StrategicPlans}"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:Automation Runtime Strategic}" in flex table with id "{grantee_tableId:StrategicPlans}"
    Examples:
      | user       |
      | GRANTEE FO |

  @61987 @validateStrategicPlan @validateAllColumnsOfStrategicPlan @smoke @positive
  Scenario Outline: Verify Strategic Plan should have all columns
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    Then I see "<ColumnName>" in flex table header "{grantee_tableId:StrategicPlans}"
    Examples:
      | ColumnName            |
      | Internal Organization |
      | Title                 |
      | Status                |
      | Month-Year Created    |
      | EGMS ID               |
      | Created By            |

  @61987 @validateStrategicPlan @ValidateEmbeddedTableObjectivesShouldHaveAllTheRequiredColumns @positive
  Scenario Outline: Verify Embedded table objectives should have all the required columns
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I expand nested table containing column value "{SavedValue:Automation Runtime Strategic}"
    And I expand nested table containing column value "{SavedValue:EGID}"
    Then I see "<ColumnName>" in flex table header "{grantee_tableId:StrategicObjectivesChild}"
    Examples:
      | ColumnName         |
      | EGMS ID            |
      | Objective          |
      | Month-Year Created |

  @61987 @validateStrategicPlan @validateRecordOwnerCanViewEditAndDeleteActionIcons
  Scenario Outline: Verify Record owner can only edit and delete.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    And I click on top right button "New" in flex table with id "{grantee_tableId:Objectives}"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I click on "Save and Continue" in the page details
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    When I re-login to "As a Grantee" app as "<user>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I expand nested table containing column value "{SavedValue:Automation Runtime Strategic}"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGID}" in flex table with id "{grantee_tableId:StrategicGoalsChild}"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:EGID}" in flex table with id "{grantee_tableId:StrategicGoalsChild}"
    And I expand nested table containing column value "{SavedValue:EGID}"
    Then I softly cannot see row level action button "Edit" against "Automation Objective" in flex table with id "{grantee_tableId:StrategicObjectivesChild}"
    Then I softly cannot see row level action button "Delete" against "Automation Objective" in flex table with id "{grantee_tableId:StrategicObjectivesChild}"
    Examples:
      | user       |
      | GRANTEE FO |
      | GRANTEE FD |
      | GRANTEE PO |

  @61987 @validateStrategicPlan @validateTotalNumberOfRecords @positive
  Scenario: Verify Total number of records as per different status
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    Then I see total records count in flex table "{grantee_tableId:StrategicPlans}"

  @62001 @validateStrategicPlan @validateHeaderOverview @positive
  Scenario: Verify Header overview have all required fields in ReadOnly / View mode
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EID"
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    Then I see the header is "Strategic Plan" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Strategic}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:EID}"
    Then I softly see field "Status" as "Draft"
    Then I softly see field "Internal Organization" as "Department of Health"

  @62001 @validateStrategicPlan @validateInternalOrganizationShouldBeAHyperlink @positive
  Scenario: Verify Internal organization should be a hyperlink
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    When I click "Department of Health" lookup link
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Department of Health" in the page details

  @62001 @validateStrategicPlan @validateAttachmentsAddDocument @smoke @positive
  Scenario: Verify Attachments add document
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I navigate to "Attachments" sub tab
    And I upload attachment "AttachmentTesting.pdf" of type "Strategic Plan"
    And I refresh the page
    Then I see table with header "Attachments" contains records "AttachmentTesting.pdf"

  @62001 @validateStrategicPlan @validateUserCanDeleteAttachedDocument @smoke @positive
  Scenario: Verify User can delete Attached document
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I navigate to "Attachments" sub tab
    And I upload attachment "AttachmentTesting.pdf" of type "Strategic Plan"
    And I pause execution for "2" seconds
    And I click on "Delete" icon for "GRANTEE PM Username" inside table
    Then I see confirmation box with body "Record deleted successfully." is displayed

  @62001 @validateStrategicPlan @validateUserCanEditAttachedDocument @positive
  Scenario: Verify User can edit Attached document
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I navigate to "Attachments" sub tab
    And I upload attachment "AttachmentTesting.pdf" of type "Strategic Plan"
    And I refresh the page
    And I click on "Edit" icon for "Automation PM Grantee" inside table
    And I close modal by clicking the top right x button
    Then I softly see table with header "Attachments" contains records "AttachmentTesting.pdf"

  @62190 @validateStrategicPlan @CanNotCreateNewStrategicPlanUsingInvalidUser
  Scenario Outline: Verify User <user> can not create new Strategic Plan OR Verify URL Tampering is blocked
    When I login to "As a Grantee" app as "<user>" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    Then I cannot see top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    Examples:
      | user       |
      | GRANTEE PO |
      | GRANTEE FD |
      | GRANTEE FO |

  @62190 @validateStrategicPlan @PreInternalOrganization @positive
  Scenario: Verify User can see field Internal Organization preset
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I see field "Internal Organization" as "Department of Health"

  @62190 @validateStrategicPlan @goalsOpenNewWindow @smoke @positive
  Scenario: Verify new goal window open
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    Then  I see the text "Create Strategic Goal"

  @62196 @validateStrategicPlan @EditNewStrategicPlan @positive
  Scenario: Verify User edit and save Strategic Plan
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Edit Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    Then I see field "Description" as "Edit Description"

  @62199 @validateStrategicPlan @DeleteCreatedStrategicPlan @positive
  Scenario Outline: Verify User <user> can delete Strategic Plan
    When I login to "As a Grantee" app as "<user>" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I click on "Delete" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    Then I see the following messages in the page details :
      | Record deleted successfully. |
    Examples:
      | user          |
      | GRANTEE PM    |
      | GRANTEE Admin |
      | GRANTEE EXE   |

  @62318 @validateStrategicPlan @ViewStrategicPlan @smoke @positive
  Scenario: Verify User should navigate to view page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EID"
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    Then I see the header is "Strategic Plan" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Strategic}" in the page details

  @62318 @validateStrategicPlan @validateGoalTitle
  Scenario: Verify Goal title field
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I click on "Save and Continue" in the page details
    Then I see the following messages in the page details :
      | Title is Required to save. |

  @62318 @validateStrategicPlan @validateEGMSID @positive
  Scenario: Verify strategic plan id on goal page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EID"
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    Then I see field "EGMS ID" as "{SavedValue:EID}"

  @62318 @validateStrategicPlan @validatecreatGoal @smoke @positive
  Scenario: Verify user can create new goal
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I see the header is "Strategic Goal" in the page details
    Then I see the sub-header is "Automation St Goal" in the page details

  @62318 @validateStrategicPlan @validateCratedYearAndMonthRO @positive
  Scenario: Verify Created Month and Year always Read Only in edit mode
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click on "Save and Continue" in the page details
    Then I softly see that "fieldMonthCreated__c" rendered in view mode only
    Then I softly see that "fieldYearCreated__c" rendered in view mode only

  @62318 @validateStrategicPlan @validatecancleButton @smoke @positive
  Scenario: Verify user can navigate to stratigic plan detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I close modal by clicking the top right x button
    And I pause execution for "4" seconds
    Then I can see top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"

  @62318 @validateStrategicPlan @validateGoalTitleCharacter @positive
  Scenario Outline: Verify Goal title not accept more than 255 character
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "<enterValue>" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I see the sub-header is "<requiredValue>" in the page details
    Examples:
      | enterValue                                                                                                                                                                                                                                                           | requiredValue                                                                                                                                                                                                                                                   |
      | titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitleti255title | titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitleti255 |

  @62324 @validateStrategicPlan @validateStrategicGoalEditButton @smoke @positive
  Scenario Outline: Verify record owner can see edit button for created goal list
    When I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I expand nested table containing column value "{SavedValue:Automation Runtime Strategic}"
    Then I can see row level action button "Edit" against "{SavedValue:EGID}" in flex table with id "{grantee_tableId:StrategicGoalsChild}"
    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE EXE   |

  @62324 @validateStrategicPlan @validateStrategicGoalEditButtonNotVisible
  Scenario: Verify user cannot see edit button for created goal by another user
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "3" seconds
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I expand nested table containing column value "{SavedValue:Automation Runtime Strategic}"
    Then I cannot see row level action button "Edit" against "{SavedValue:EGID}" in flex table with id "{grantee_tableId:StrategicGoalsChild}"

  @62324 @validateStrategicPlan @validateStrategicGoalEditandCancleButton @smoke @positive
  Scenario: Verify user navigate to goal view if click on cancel button
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I expand nested table containing column value "{SavedValue:Automation Runtime Strategic}"
    And I click on "Edit" icon for "{SavedValue:EGID}" inside table
    And I click on "Cancel" in the page details
    Then I see the header is "Strategic Goal" in the page details
    Then I see the sub-header is "Automation St Goal" in the page details

  @62324 @validateStrategicPlan @validateStrategicGoalEditandSaveAndContinueButton @smoke @positive
  Scenario: Verify user navigate to goal view if click on Save And Continue button
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I expand nested table containing column value "{SavedValue:Automation Runtime Strategic}"
    And I click on "Edit" icon for "{SavedValue:EGID}" inside table
    And I enter value "Automation Goal Edit" into field "StrategyTitle__c"
    And I click on "Save" in the page details
    Then I see the header is "Strategic Goal" in the page details
    Then I see the sub-header is "Automation Goal Edit" in the page details

  @62324 @validateStrategicPlan @validateStrategicGoalTitleInEditMode
  Scenario: Verify system should display warning message if title is blank
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I expand nested table containing column value "{SavedValue:Automation Runtime Strategic}"
    And I click on "Edit" icon for "{SavedValue:EGID}" inside table
    And I clear the value from field "StrategyTitle__c"
    And I click on "Save" in the page details
    Then  I see the following messages in the page details :
      | Title is Required to save under Overview. |

  @62324 @validateStrategicPlan @validateStrategicGoalEditDescriptionandSave @positive
  Scenario: Verify user can edit and save goal description
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I expand nested table containing column value "{SavedValue:Automation Runtime Strategic}"
    And I click on "Edit" icon for "{SavedValue:EGID}" inside table
    And I enter value "Automation Goal Description Edit" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    Then I see field "Description" as "Automation Goal Description Edit"

  @62324 @validateStrategicPlan @validateStrategicGoalEditAddAttachment @smoke @positive
  Scenario: Verify user can add attachments
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I navigate to "Attachments" sub tab
    And I upload attachment "AttachmentTesting.pdf" of type "Strategic Plan"
    And I refresh the page
    Then I see table with header "Attachments" contains records "AttachmentTesting.pdf"

  @62324 @validateStrategicPlan @validateStrategicGoalEditAddNote @smoke @positive
  Scenario: Verify user can add Note
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I navigate to "Attachments" sub tab
    And I add notes records
    And I close "Add Notes" modal by clicking the top right x button
    Then I see table with header "Notes" contains records "Notes Record"

  @62324 @validateStrategicPlan @validateStrategicGoalEditModifiedBy @positive
  Scenario: Verify last modify field showing correct name
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "3" seconds
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I expand nested table containing column value "{SavedValue:Automation Runtime Strategic}"
    And I click on "View" icon for "{SavedValue:EGID}" inside table
    Then I see field "Last Modified by" as "{SavedValue:GRANTEE PM Username}"

  @62324 @validateStrategicPlan @validateStrategicGoalEditButtonMiss
  Scenario: Verify edit button not available on view page if login user is not owner
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I expand nested table containing column value "{SavedValue:Automation Runtime Strategic}"
    And I click on "View" icon for "{SavedValue:EGID}" inside table
    Then I cannot see top right button "Edit" in page detail

  @62324 @validateStrategicPlan @validateStrategicPlanGoalEditObjective @positive
  Scenario: Verify create objective in edit mode of goal and lost unsaved data
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I expand nested table containing column value "{SavedValue:Automation Runtime Strategic}"
    And I click on "Edit" icon for "{SavedValue:EGID}" inside table
    And I enter value "Automation Goal Description Edit" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:Objectives}"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I click on "Save and Continue" in the page details
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I expand nested table containing column value "{SavedValue:Automation Runtime Strategic}"
    And I click on "View" icon for "{SavedValue:EGID}" inside table
    Then I see field "Description" as "Automation Goal Description Edit"

  @62327 @validateStrategicPlan @validateStrategicGoalDelete @smoke @positive
  Scenario: Verify record owner can see delete button for created goal in list view
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I expand nested table containing column value "{SavedValue:Automation Runtime Strategic}"
    Then I can see row level action button "Delete" against "{SavedValue:EGID}" in flex table with id "{grantee_tableId:StrategicGoalsChild}"

  @62327 @validateStrategicPlan @validateStrategicGoalDeleteByNonOwner
  Scenario: Verify record non-owner can not see delete button for created goal in list view
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    When I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I expand nested table containing column value "{SavedValue:Automation Runtime Strategic}"
    Then I cannot see row level action button "Delete" against "{SavedValue:EGID}" in flex table with id "{grantee_tableId:StrategicGoalsChild}"

  @62327 @validateStrategicPlan @validateStrategicGoalDeleteOnViewPage @smoke @positive
  Scenario: Verify record owner can delete created goal from Strategic plan view page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "Delete" icon for "{SavedValue:EGID}" inside table
    Then I see the following messages in the page details :
      | Record deleted successfully. |

  @62327 @validateStrategicPlan @validateStrategicGoalDeleteOnViewPageOfActivatedSP @smoke @positive
  Scenario: Verify record owner can see delete button created goal of Activated Strategic plan
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "Activate" in the page details
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I expand nested table containing column value "{SavedValue:Automation Runtime Strategic}"
    Then I can see row level action button "Delete" against "{SavedValue:EGID}" in flex table with id "{grantee_tableId:StrategicGoalsChild}"

  @62327 @validateStrategicPlan @validateStrategicGoalDeleteOnViewPageofActivatedSP @positive
  Scenario: Verify record owner can delete created goal of Activated Strategic plan
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "Activate" in the page details
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I expand nested table containing column value "{SavedValue:Automation Runtime Strategic}"
    And I click on "Delete" icon for "{SavedValue:EGID}" inside table
    Then I see the following messages in the page details :
      | Record deleted successfully. |

  @62854 @validateStrategicPlan @validateCreateObjective @positive
  Scenario Outline: Verify User can create objective with <user> user
    When I login to "As a Grantee" app as "<user>" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    And I click on top right button "New" in flex table with id "{grantee_tableId:Objectives}"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I click on "Save and Continue" in the page details
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    Then I see the header is "Objective" in the page details
    Then I see the sub-header is "Automation Objective" in the page details
    Examples:
      | user          |
      | GRANTEE PM    |
      | GRANTEE EXE   |
      | GRANTEE Admin |

  @62854 @validateStrategicPlan @validateObjectiveDisplayInGoal @positive
  Scenario: Verify created objective display in specific goal
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    And I click on top right button "New" in flex table with id "{grantee_tableId:Objectives}"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I click on "Save and Continue" in the page details
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I expand nested table containing column value "{SavedValue:Automation Runtime Strategic}"
    And I expand nested table containing column value "{SavedValue:EGID}"
    Then I see value "Automation Objective" for title "Objective" inside table "{grantee_tableId:StrategicObjectivesChild}"

  @62854 @validateStrategicPlan @validateOwnerCanCreateObject
  Scenario: Verify created objective not display in specific goal
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I expand nested table containing column value "{SavedValue:Automation Runtime Strategic}"
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    Then I cannot see top right button "New" in flex table with id "{grantee_tableId:Objectives}"

  @62854 @validateStrategicPlan @validateObjectiveTitleRequired
  Scenario: Verify Title required for objective
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    And I click on top right button "New" in flex table with id "{grantee_tableId:Objectives}"
    And I click modal button "Save and Continue"
    Then I see the following messages in the page details :
      | Title is Required to save. |