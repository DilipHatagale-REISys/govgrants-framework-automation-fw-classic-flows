@preApplication
Feature: Validate all scenarios in the Pre-Application

    Background: Qualify Announcement and Create PreApplication
    Given I delete the record "Automation Announcement for Pre-Application" from the object "PreApplication"
	And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    Given I am on "SUBPORTAL" portal
    And I qualify the announcement "Automation Announcement for Pre-Application" as user "SPI"
      | Actions    | Step 1         | Step 2        | Step 3  | Step 4        |
      | Navigation | Grants Portal  | Opportunities | Active  | Opportunities |
      | FlexTable  | popupflextable | View          | Qualify |               |
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    
    @51292 @preApplicationCreation 
    Scenario: Creating a Pre Application
    Then I see status in Progress-bar is "Created" and is "green"

    @51293 @preApplicationEdition
    Scenario: Validate edition of pre-application
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

    @51295 @addBudgetDetailsToPreApplication
    Scenario: Addition of budget in the budget grid to an pre-application
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    When I edit the following rows inline in flex table with id "flexGridEnhancePreApplicationProjectsAndBudgetCategories" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 500   | 100      | 300           | 100            |
    Then I see the following messages in the page details contains:
         | Saved Successfully! |
	   
	@51296 @preApplicationAttachmentChecklistCA 
    Scenario: Validate the attachment checklist of the PreApplication
    When I navigate to "Attachments" sub tab
    When I click on "Attach" icon for "Not Applicable" inside flex table with id "flexGridPreAppRecipientChecklists"
    And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement"
    When I close Modal
    Then I see that "Active" has been added in flextable with Id "flexGridPreAppRecipientChecklists"

   @51297 @preApplicationAttachmentCA 
    Scenario: Validate the attachment of the PreApplication
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "a150b000003fLctAAE"
    When I choose the file "Announcement_Field_Values.xlsx" to upload for "Attachment" of type "Other"
    And I close Modal
    Then I see that "Other" has been added in flextable with Id "a150b000003fLctAAE"
    
    @51451 @blankEstimatedProgram
    Scenario: Submitting an pre application to Grantor with Blank Estimated Program Income
    Given I complete the fields from the sheet "Edition" in excel "Application_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "flexGridEnhancePreApplicationProjectsAndBudgetCategories" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 500   | 100      | 300           | 100          |
    When I navigate to "Attachments" sub tab
    When I click on "Attach" icon for "Not Applicable" inside flex table with id "flexGridPreAppRecipientChecklists"
    And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement"
    When I close Modal
	And I click on top right button "Add" in flex table with id "a150b000003fLctAAE"
    When I choose the file "Announcement_Field_Values.xlsx" to upload for "Attachment" of type "Other"
    And I close Modal
      And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I enter value "0" into field "PROGRAMINCOME__c"
      And I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details :
    |Budget - Requested Amount should be less than or equal to Subaward Ceiling Amount.|
	
	@51298 @submitPreApplication 
    Scenario: Submitting an pre application to Grantor
    Given I complete the fields from the sheet "Edition" in excel "Application_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "flexGridEnhancePreApplicationProjectsAndBudgetCategories" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 500    | 100        | 300            | 100            |
    When I navigate to "Attachments" sub tab
       When I click on "Attach" icon for "Not Applicable" inside flex table with id "flexGridPreAppRecipientChecklists"
    And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement"
    When I close Modal
	And I click on top right button "Add" in flex table with id "a150b000003fLctAAE"
    When I choose the file "Announcement_Field_Values.xlsx" to upload for "Attachment" of type "Other"
    And I close Modal
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted" and is "green"
	
	@51299 @preApplicationAcceptance
    Scenario: Validate Grantor accept the submitted pre-application
        Given I complete the fields from the sheet "Edition" in excel "Application_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "flexGridEnhancePreApplicationProjectsAndBudgetCategories" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 500    | 100        | 300            | 100            |
    When I navigate to "Attachments" sub tab
       When I click on "Attach" icon for "Not Applicable" inside flex table with id "flexGridPreAppRecipientChecklists"
    And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement"
    When I close Modal
	And I click on top right button "Add" in flex table with id "a150b000003fLctAAE"
    When I choose the file "Announcement_Field_Values.xlsx" to upload for "Attachment" of type "Other"
    And I close Modal
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Accept" in the page details
     And I enter "OK" for comments and click "OK" 
	Then I see status in Progress-bar is "Accepted" and is "green"
	  
    @51301 @preApplicationRejection
    Scenario: Validate Grantor rejects the submitted pre-application
        Given I complete the fields from the sheet "Edition" in excel "Application_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "flexGridEnhancePreApplicationProjectsAndBudgetCategories" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 500    | 100        | 300            | 100            |
    When I navigate to "Attachments" sub tab
       When I click on "Attach" icon for "Not Applicable" inside flex table with id "flexGridPreAppRecipientChecklists"
    And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement"
    When I close Modal
	And I click on top right button "Add" in flex table with id "a150b000003fLctAAE"
    When I choose the file "Announcement_Field_Values.xlsx" to upload for "Attachment" of type "Other"
    And I close Modal
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Reject" in the page details
     And I enter "OK" for comments and click "OK" 
	Then I see status in Progress-bar is "Rejected" and is "red"
	
	
	
	