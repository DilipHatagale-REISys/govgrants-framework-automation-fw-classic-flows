@fundingSource @grantor-regression @grantor-parallel-regression @planning @regression
Feature: Validate all scenarios in Funding Source

  @51034 @creationOfFundingSource
  Scenario: Creation of Funding Source
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @105208 @105224 @ValidateDatesOfFundingSourceAndFundingAccount @monu
  Scenario: verify start date and end date of funding account should be same or less than funding source date
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Start Date" as "SDATE"
    And I save the field labeled "End Date" as "EDATE"
    And I save the field labeled "Title" as "FundingSourceTitle"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I enter value "{SavedValue:SDATE}" into field "fieldStartDate__c"
    When I enter value "{SavedValue:EDATE}" into field "fieldEndDate__c"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    #105224 #monu
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    Then I see the header is "Internal Funding Source" in the page details
    Then I see the sub-header is "{SavedValue:FundingSourceTitle}" in the page details

  @51035 @editionOfFundingSource
  Scenario: Edition of Funding Source
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @51036 @addAttachmentToFundingSource
  Scenario: Addition of Attachment to Funding Source
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    Then I see "Other" has been added in "Funding Source Files" flex table

  @51037 @creationOfFundingAccount @smoke
  Scenario: Creation of Funding Account
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @105223 @ValidateErrorMessageForFundingAccountEndDate @smoke
  Scenario: Verify user is able to see error message for end date while entering end date greater than funding source end date
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "4650" into field "fieldEndDate__c"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Funding account dates should be within funding source dates. |

  @51038 @editionOfFundingAccount
  Scenario: Edition of Funding Account
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @51039 @activateFundingAccount @smoke
  Scenario: Activation of Funding Source
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"

  @52661 @creationFSFOUser
  Scenario Outline:Verify that users (other than Admin/PM/EXE)are not able to create funding account &  funding source
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    Then  I cannot see top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    Examples:
      | User |
      | PM   |

  @52662 @deactivateFundingSource
  Scenario: Verify that  user can  deactivate  Funding Source
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - Draft"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    When I click on "Deactivate" in the page details
    Then I see status in Progress-bar is "Closed" and is "Green"

  @52663 @deactivateFundingSourcePMUser
  Scenario: Verify that  PM user can  deactivate  Funding Source
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I enter value "0" into field "fieldStartDate__c"
    When I enter value "3650" into field "fieldEndDate__c"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Funding Source}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Funding Source}" inside table
    Then I cannot see top right button "Deactivate" in page detail

  @52666 @reactivateFundingSource @mahadev
  Scenario Outline: Verify that  user can  reactivate the deactivated  Funding Source
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - Draft"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I enter value "0" into field "fieldStartDate__c"
    When I enter value "3650" into field "fieldEndDate__c"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    When I click on "Deactivate" in the page details
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources -Closed"
    When I perform quick search for "<Funding Source>" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "<Funding Source>" inside table
    When I click on "View" icon for "Closed" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - Active"
    When I perform quick search for "<Funding Source>" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "<Funding Source>" inside table
    Then I see status in Progress-bar is "Active" and is "Green"
    Examples:
      | Funding Source                                 |
      | {SavedValue:Automation Runtime Funding Source} |

  @105225 @ValidateAppropriationAmountOnFundingSource @monu
  Scenario: verify appropriation amount on Active funding source is sum of all active funding accounts
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Start Date" as "SDATE"
    And I save the field labeled "End Date" as "EDATE"
    And I save the field labeled "Title" as "FundingSourceTitle"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter value "1000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    When I enter value "{SavedValue:SDATE}" into field "fieldStartDate__c"
    When I enter value "{SavedValue:EDATE}" into field "fieldEndDate__c"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    Then I see the header is "Internal Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter value "1500" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    When I enter value "{SavedValue:SDATE}" into field "fieldStartDate__c"
    When I enter value "{SavedValue:EDATE}" into field "fieldEndDate__c"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    Then I softly see field "Appropriation Amount" as "$2,500.00"

  @196552 @196555 @ValidatefilerelatedpermissionsforEXEprofileduringtheworkflowStatusCreatedActivatedClosedwhenInternalFundingSourceiscreatedbyEXE @Sprint-3-US-195048 @vaibhav
  Scenario: Validate file related permissions for EXE profile during the workflow Status (Created, Activated, Closed) when Internal Funding Source is created by EXE
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Start Date" as "SDATE"
    And I save the field labeled "End Date" as "EDATE"
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter value "1000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    When I enter value "{SavedValue:SDATE}" into field "fieldStartDate__c"
    When I enter value "{SavedValue:EDATE}" into field "fieldEndDate__c"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "EGMS ID" as "FundingAccId"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Deactivate" in the page details
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    #196555
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources -Closed"
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside table
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I click on "Download" icon for "Other" inside flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---" without waiting for record
    Then I softly verify that the file "Attachment.pdf" is downloaded

  @196553 @ValidatefilerelatedpermissionsforADMINprofileduringtheworkflowStatusCreatedActivatedClosedwhenInternalFundingSourceiscreatedbyEXE @Sprint-3-US-195048 @vaibhav
  Scenario: Validate file related permissions for ADMIN profile during the workflow Status (Created, Activated, Closed) when Internal Funding Source is created by EXE
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Start Date" as "SDATE"
    And I save the field labeled "End Date" as "EDATE"
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter value "1000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    When I enter value "{SavedValue:SDATE}" into field "fieldStartDate__c"
    When I enter value "{SavedValue:EDATE}" into field "fieldEndDate__c"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "EGMS ID" as "FundingAccId"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Deactivate" in the page details
    And I pause execution for "3" seconds
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"

  @196554 @196557 @ValidatefilerelatedpermissionsforFOprofileduringtheworkflowStatusCreatedActivatedClosedwhenInternalFundingSourceiscreatedbyEXE @Sprint-3-US-195048 @vaibhav
  Scenario: Validate file related permissions for FO profile during the workflow Status (Created, Activated, Closed) when Internal Funding Source is created by EXE
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Start Date" as "SDATE"
    And I save the field labeled "End Date" as "EDATE"
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter value "1000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    When I enter value "{SavedValue:SDATE}" into field "fieldStartDate__c"
    When I enter value "{SavedValue:EDATE}" into field "fieldEndDate__c"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "EGMS ID" as "FundingAccId"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Deactivate" in the page details
    And I pause execution for "3" seconds
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    #196557
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - All"
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside table
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I click on "Download" icon for "Other" inside flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---" without waiting for record
    Then I softly verify that the file "Attachment.pdf" is downloaded

  @196556 @ValidatefilerelatedpermissionsforPOprofileduringtheworkflowStatusCreatedActivatedActivewhenInternalFundingSourceiscreatedbyEXE @Sprint-3-US-195048 @vaibhav
  Scenario: Validate file related permissions for EXE profile during the workflow Status (Created, Activated, Closed) when Internal Funding Source is created by EXE
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Start Date" as "SDATE"
    And I save the field labeled "End Date" as "EDATE"
    And I save the field labeled "EGMS ID" as "FUNDINGSOURCE"
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter value "1000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    When I enter value "{SavedValue:SDATE}" into field "fieldStartDate__c"
    When I enter value "{SavedValue:EDATE}" into field "fieldEndDate__c"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - Active"
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside table
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I click on "Download" icon for "Other" inside flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---" without waiting for record
    Then I softly verify that the file "Attachment.pdf" is downloaded

  @196558 @196563 @ValidatefilerelatedpermissionsforEXEprofileduringtheworkflowStatusCreatedActivatedClosedwhenExternalFundingSourceiscreatedbyEXE @Sprint-3-US-195048 @vaibhav
  Scenario: Validate file related permissions for EXE profile during the workflow Status (Created, Activated, Closed) when External Funding Source is created by EXE
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Start Date" as "SDATE"
    And I save the field labeled "End Date" as "EDATE"
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I click on top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter value "1000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    When I enter value "{SavedValue:SDATE}" into field "fieldStartDate__c"
    When I enter value "{SavedValue:EDATE}" into field "fieldEndDate__c"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "EGMS ID" as "FundingAccId"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Deactivate" in the page details
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly cannot see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly cannot see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    #196563
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "All External Funding Sources"
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside table
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I click on "Download" icon for "Other" inside flex table with id "---fundingSource:-:externalFundingSourceTableId---" without waiting for record
    Then I softly verify that the file "Attachment.pdf" is downloaded

  @196559 @196561 @ValidatefilerelatedpermissionsforADMINprofileduringtheworkflowStatusCreatedActivatedClosedwhenExternalFundingSourceiscreatedbyEXE @Sprint-3-US-195048 @vaibhav
  Scenario: Validate file related permissions for ADMIN profile during the workflow Status (Created, Activated, Closed) when External Funding Source is created by ADMIN
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Start Date" as "SDATE"
    And I save the field labeled "End Date" as "EDATE"
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I click on top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter value "1000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    When I enter value "{SavedValue:SDATE}" into field "fieldStartDate__c"
    When I enter value "{SavedValue:EDATE}" into field "fieldEndDate__c"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "EGMS ID" as "FundingAccId"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Deactivate" in the page details
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly cannot see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly cannot see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    #196561
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "All External Funding Sources"
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside table
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I click on "Download" icon for "Other" inside flex table with id "---fundingSource:-:externalFundingSourceTableId---" without waiting for record
    Then I softly verify that the file "Attachment.pdf" is downloaded

  @196560 @196562 @ValidatefilerelatedpermissionsforFOprofileduringtheworkflowStatusCreatedActivatedClosedwhenExternalFundingSourceiscreatedbyFO @Sprint-3-US-195048 @vaibhav
  Scenario: Validate file related permissions for FO profile during the workflow Status (Created, Activated, Closed) when External Funding Source is created by FO
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Start Date" as "SDATE"
    And I save the field labeled "End Date" as "EDATE"
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I click on top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter value "1000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    When I enter value "{SavedValue:SDATE}" into field "fieldStartDate__c"
    When I enter value "{SavedValue:EDATE}" into field "fieldEndDate__c"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "EGMS ID" as "FundingAccId"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Deactivate" in the page details
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly cannot see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly cannot see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    #196561
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "All External Funding Sources"
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside table
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I click on "Download" icon for "Other" inside flex table with id "---fundingSource:-:externalFundingSourceTableId---" without waiting for record
    Then I softly verify that the file "Attachment.pdf" is downloaded