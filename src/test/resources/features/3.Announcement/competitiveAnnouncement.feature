@competitiveAnnouncements @regression @announcement
Feature: Validate all scenarios in the Competitive Announcement tab

  Background: Create Announcement
    Given I delete the record "Automation Competitive Announcement" from the object "Announcement"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"

    @73959 @pdfDownloadContacts @jitendra
    Scenario: To verify system allow to download pdf for contact section in overview tab of announcement by PM user
      And I navigate to "Overview" sub tab
      When I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
      When I click "Add" after selection of "Automation PM" in the table "---announcement:-:annoucementContactTableId---"
      And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
      And I navigate to "Announcements" tab
      When I navigate to "Competitive" content inside "Announcements" subheader on left panel
      And I click toggle button to select "Draft Competitive Announcements"
      And I click on "View" icon for "Automation Competitive Announcement" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
      And I navigate to "Overview" sub tab
      And I select "Download as PDF" from parallel lines dropdown of "Contacts"
      And I download the file
      Then I verify that "pdf" file is downloaded
      And I see "Contacts" on page "1" of "govgrants" pdf file

  @73958 @pdfDownloadRelatedFederal @jitendra
  Scenario: To verify system allow to download PDF for Related Federal/NGO program in overview tab of announcement
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:relatedAnnouncementTableId---"
    And I click "Associate" after selection of "Wildlife Services" in the table "---announcement:-:associateForRelated---"
    And I close modal by clicking the top right x button
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on "View" icon for "Automation Competitive Announcement" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Overview" sub tab
    And I select "Download as PDF" from parallel lines dropdown of "Related Federal/NGO Program"
    And I download the file
    Then I verify that "pdf" file is downloaded
    And I see "Related Federal/NGO Program" on page "1" of "govgrants" pdf file

  @74105 @pdfDownloadBudgetCategory @jitendra
  Scenario: To verify system allow to download PDF for Budget Categories section in financial tab of announcement
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on "View" icon for "Automation Competitive Announcement" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Financials" sub tab
    And I select "Download as PDF" from parallel lines dropdown of "Budget Categories"
    And I download the file
    Then I verify that "pdf" file is downloaded
    And I see "Budget Categories" on page "1" of "govgrants" pdf file

  @74107 @pdfDownloadBusinessForm @jitendra
  Scenario: To verify system allow to download PDF for Business Forms section in setup tab of announcement
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on "View" icon for "Automation Competitive Announcement" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    And I select "Download as PDF" from parallel lines dropdown of "Business Forms"
    And I download the file
    Then I verify that "pdf" file is downloaded
    And I see "Business Forms" on page "1" of "govgrants" pdf file

  @74108 @pdfDownloadSuppDocChekLst @jitendra
  Scenario: To verify system allow to download PDF for Supporting Documents Checklist section in setup tab of announcement
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description | Required  | Applies To  | Status |
      | Test1       | Mandatory | Application | Active |
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on "View" icon for "Automation Competitive Announcement" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    And I select "Download as PDF" from parallel lines dropdown of "Supporting Documents Checklist"
    And I download the file
    Then I verify that "pdf" file is downloaded
    And I see "Supporting Documents Checklist" on page "1" of "govgrants" pdf file

  @75616 @74118 @pdfDownloadApprover @jitendra
  Scenario: To verify system allow to download PDF for Peer Reviewers section in Responsibility tab of announcement
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Owner" for title "Responsibility" against the value "Automation PM" inside table "---announcement:-:announcementOwner---"
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on "View" icon for "Automation Competitive Announcement" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    And I select "Download as PDF" from parallel lines dropdown of "Approvers"
    And I download the file
    Then I verify that "pdf" file is downloaded
    And I see "Approvers" on page "1" of "govgrants" pdf file

  @74117 @pdfDownloadReviewSteps @jitendra
  Scenario: To verify system allow to download pdf for Review Steps section in setup tab of announcement
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name          | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
      | Automation PM | Program Reviewer | Review Financial details | 10       | No                   |
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on "View" icon for "Automation Competitive Announcement" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    And I select "Download as PDF" from parallel lines dropdown of "Peer Reviewers"
    And I download the file
    Then I verify that "pdf" file is downloaded
    And I see "Peer Reviewers" on page "1" of "govgrants" pdf file

  @74124 @pdfDownloadFocusArea @jitendra
  Scenario: To verify system allow to download PDF for Related Focus Area section in setup tab of announcement
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Add" after selection of "Automation Permanent Focus Area2" in the table "---announcement:-:selectAnnouncementServiceArea1TableId---"
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on "View" icon for "Automation Competitive Announcement" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    And I select "Download as PDF" from parallel lines dropdown of "Related Focus Areas"
    And I download the file
    Then I verify that "pdf" file is downloaded
    And I see "Related Focus Areas" on page "1" of "govgrants" pdf file

  @70551 @70552 @73405 @73389 @73406 @73387 @70800 @70885 @71595 @72646 @72641 @73537 @userCanViewAddAndDeleteFocusArea @aashish
  Scenario: To Verify that user is able to remove associated focus areas While creating the Announcement | To verify PM can remove non relevant Budget categories from specific Budget Type in Announcement based on the need.
    When I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - Published"
    Then I softly see value "Published" for title "Status" inside table "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    And I save the value from row "1" for column name "Name" as "searchedItem" from flex table "---announcement:-:businessFormlistTableId---"
    And I perform quick search for "{SavedValue:searchedItem}" in "---announcement:-:businessFormlistTableId---" panel
    Then I softly see value "{SavedValue:searchedItem}" for title "Name" inside table "---announcement:-:businessFormlistTableId---"
    And I refresh the page
    When I click on advance filter "#advfAnnoucementPackagesGrantor" of table id "---announcement:-:businessFormlistTableId---"
    When I enter advance filter values inside id "advfAnnoucementPackagesGrantor"
      | Package Name | Contains | Grantor Site Visit Forms |
    Then I softly see value "Grantor Site Visit Forms" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"
    Then I softly see value "Site Visit" for title "Package Type" inside table "---announcement:-:businessFormlistTableId---"
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Add" after selection of "Automation Permanent Focus Area2" in the table "---announcement:-:selectAnnouncementServiceArea1TableId---"
    Then I softly see that "Automation Permanent Focus Area2" has been added in flextable with Id "---announcement:-:AnnouncementServiceArea1TableId---"
    And I click on "View" icon for "Automation Permanent Focus Area2" inside flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    Then I softly see field "GAT Title" as "Automation Permanent Focus Area2"
    And I click on "Delete" icon for "Automation Permanent Focus Area2" inside flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    Then I softly see confirmation box with body "Record deleted successfully." is displayed
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    Then I softly see the following messages in the page details :
      | Budget period added successfully. |
    And I save the value from row "2" for column name "Start Date" as "startDate" from flex table "---announcement:-:budgetPeriodTableId---"
    And I save the value from row "2" for column name "End Date" as "endDate" from flex table "---announcement:-:budgetPeriodTableId---"
    Then I softly do not see value "{SavedValue:startDate}" for title "Start Date" inside table "---announcement:-:budgetPeriodTableId---"
    Then I softly do not see value "{SavedValue:endDate}" for title "End Date" inside table "---announcement:-:budgetPeriodTableId---"
    And I click on "Remove" icon for "BP02" inside flex table with id "---announcement:-:budgetPeriodTableId---"
    And I click on "Remove" icon for "BP01" inside flex table with id "---announcement:-:budgetPeriodTableId---"
    Then I softly do not see value "BP01" for title "Budget Period Name" inside table "---announcement:-:budgetPeriodTableId---"
    And I click on "Remove" icon for "Administrative and legal expenses" inside flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly see the following messages in the page details :
      | Record deleted successfully. |
    Then I softly do not see value "Administrative and legal expenses" for title "Name" inside table "---announcement:-:announcementBudgetCategory---"
    And I enter value "2000" into field "---announcement:-:subawardfloor---"
    And I enter value "3000" into field "---announcement:-:subawardceiling---"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "4000" into field "---announcement:-:subawardfloor---"
    And I enter value "6000" into field "---announcement:-:subawardceiling---"
    And I click on "Save" in the page details
    And I navigate to "History" sub tab
    Then I softly see value "$4,000.00" for title "New Value" inside table "History"
    Then I softly see value "$2,000.00" for title "Old Value" inside table "History"
    Then I softly see value "$6,000.00" for title "New Value" inside table "History"
    Then I softly see value "$3,000.00" for title "Old Value" inside table "History"
    And I navigate to "Financials" sub tab
    And I perform quick search for "Site work" in "---announcement:-:announcementBudgetCategory---" panel
    Then I softly see value "Site work" for title "Name" inside table "---announcement:-:announcementBudgetCategory---"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I enter value "www.google.com" into field "LinkforAdditionalInformation__c"
    And I click on "Save" in the page details
    Then I softly see field "Link For Additional Information" as "www.google.com"
    When I click on top right button "Associate" in flex table with id "---announcment:-:relatedAnnouncementTableId---"
    And I check "All" boxes in flex table with id "---announcement:-:associateForRelated---"
    And I click on top right button "Associate" in flex table with id "---announcement:-:associateForRelated---"
    And I close "Associate" modal by clicking the top right x button
    And I save the value from row "1" for column name "Program Number" as "prNum" from flex table "---announcment:-:relatedAnnouncementTableId---"
    And I click on advance filter "#advfRelatedAnnouncementCFDANumbersGrantor" of table id "---announcment:-:relatedAnnouncementTableId---"
    And I enter advance filter values inside id "advfRelatedAnnouncementCFDANumbersGrantor"
      | Program Number | Contains | {SavedValue:prNum} |
    Then I softly see value "{SavedValue:prNum}" for title "Program Number" inside table "---announcment:-:relatedAnnouncementTableId---"

  @70290 @70298 @70302 @70799 @73227 @userAllowToEnterDataInQualityAndAvailibility @aashish @smoke
  Scenario: To Verify that user able to see Text fields after select Q&A Availability  as "Yes"  And  user can enter and save all required fields while creating Announcement
  | To Validate system generated validation message for  Q&A Availability section when "Question Deadline Date",and "Response Deadline date" is greater then Application Due Date.
    When I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - Draft"
    Then I softly see value "Created" for title "Status" inside table "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly see value "Reviewed" for title "Status" inside table "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly see value "Submitted for Review" for title "Status" inside table "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly see value "Submitted for Approval" for title "Status" inside table "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When  I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter value "Yes" into field "fieldQAAvailability__c"
    Then I softly see the text containing "Question Deadline"
    Then I softly see the text containing "Response Deadline"
    Then I softly see the text containing "Submit questions to:"
    And I enter value "20" into field "fieldApplicationDueDate__c"
    And I enter value "3" into field "QSubmissionDeadline__c"
    And I enter value "3" into field "AResponseDeadline__c"
    And I enter value "reisystemsqa@yopmail.com" into field "fieldQAContactEmailAddress__c"
    And I enter value "Test Eligibility Information" into field "---announcement:-:eligibilityInformation---"
    And I click on "Save" in the page details
    And I save the field labeled "Application Due Date" as "ADD"
    And I save the field labeled "Question Deadline" as "QDD"
    And I save the field labeled "Response Deadline" as "RDD"
    Then I softly see field "Application Due Date" as "{SavedValue:ADD}"
    Then I softly see field "Question Deadline" as "{SavedValue:QDD}"
    Then I softly see field "Response Deadline" as "{SavedValue:RDD}"
    Then I softly see field "Submit questions to:" as "reisystemsqa@yopmail.com"
    Then I softly see field "Eligibility Information" as "Test Eligibility Information"
    And I click on "Edit" in the page details
    And I enter value "2" into field "fieldApplicationDueDate__c"
    And I enter value "5" into field "QSubmissionDeadline__c"
    And I enter value "5" into field "AResponseDeadline__c"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Overview Tab: The Question submission deadline cannot be greater than Application due date. |
      | Overview Tab: The Answer submission deadline cannot be greater than Application due date.   |
    And I click on "Edit" in the page details
    And I enter value "20" into field "fieldApplicationDueDate__c"
    And I enter value "15" into field "QSubmissionDeadline__c"
    And I enter value "10" into field "AResponseDeadline__c"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Overview Tab: The Answer submission deadline cannot be earlier than Question submission deadline. |

  @70479 @70481 @70503 @70422 @70507 @70542 @70543 @70425 @70424 @70426 @70419 @70417 @70418 @70506 @71951 @73408 @userDeleteSupportingDocument @aashish
  Scenario: To Verify that user can delete supporting document checklist While creating the Announcement |
  To Verify that user can Edit fields in supporting document checklist While creating the Announcement |
  To Verify that user can preview business forms while creating Announcement|
  To Verify that user can Edit buisness forms while ctreating Announcement
    When I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - Closed and Archived"
    And I perform quick search for "Automation Competitive Past Announcement" in "---announcement:-:competitiveAnnouncementTableId---" panel
    Then I softly see value "Closed" for title "Status" inside table "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I click on "View" icon for "Automation Competitive Past Announcement" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly see status in Progress-bar is "Closed" and is "green"
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    Then I softly see value "Automation" for title "Description" inside table "---announcement:-:annChecklist---"
    Then I softly see value "Grantor Application Forms" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"
    Then I softly see value "Organization Desk Review" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"
    Then I softly see value "Grantor Progress Report Forms" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"
    And I click on "Edit" icon for "Grantor Application Forms" inside flex table with id "---announcement:-:businessFormlistTableId---"
    And I enter value "Grantor Application Forms" into field "fieldPackageConfig__c"
    And I click modal button "Save"
    And I close "Edit Package" modal by clicking the top right x button
    Then I softly see value "Grantor Application Forms" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description                 | Required  | Applies To | Status |
      | Automation test description | Mandatory | Award      | Active |
    When I click on "Upload Template" icon for " Automation test description" inside flex table with id "---announcement:-:annChecklist---"
    And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement"
    Then I softly see the following messages in the page details :
      | Attachement saved successfully. |
    When I close "Upload Template" modal by clicking the top right x button
    And I perform quick search for "Automation test description" in "---announcement:-:annChecklist---" panel
    Then I softly see value "Mandatory" for title "Required" inside table "---announcement:-:annChecklist---"
    Then I softly see value "Award" for title "Applies To" inside table "---announcement:-:annChecklist---"
    Then I softly see value "Active" for title "Status" inside table "---announcement:-:annChecklist---"
    Given I edit the following rows inline in flex table with id "---announcement:-:annChecklist---" by clicking "Edit" :
      | Required  | Description                   | Applies To | Status |
      | Mandatory | Automation test description02 | Award      | Active |
    Then I softly see value "Automation test description02" for title "Description" inside table "---announcement:-:annChecklist---"
    When I click on "Delete" icon for "Automation test description02" inside flex table with id "---announcement:-:annChecklist---"
    And I softly do not see "Automation test description02" inside flex table with id "---announcement:-:annChecklist---"
    And I navigate to "Setup" sub tab
    When I click on "Preview" icon for "Organization Desk Review" inside flex table with id "---announcement:-:businessFormlistTableId---"
    Then I softly see field "Package Name" as "Organization Desk Review"
    And I close "Preview Package" modal by clicking the top right x button
    And I navigate to "Attachments" sub tab
    When I add notes records
    And I close "Add Notes" modal by clicking the top right x button
    Then I softly see table with header "Notes" contains records "Notes Record"
    And I edit the notes
    And I click modal button "Save"
    And I close "Edit Notes" modal by clicking the top right x button
    Then I softly see table with header "Notes" contains records "Updated Notes Record"
    Then I softly see table with header "Notes" contains records "Updated Automation Notes"
    And I click on top right button "Add" in notes flex table having header "Notes"
    And I enter title in Notes
    And I click modal button "Save"
    Then I softly see the following messages in the page details :
      | Please enter Required fields |
    When I upload attachment "Announcement_Field_Values.xlsx" from workspace
    Then I softly see "Announcement_Field_Values.xlsx" has been added in "Attachments" flex table
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Funding Opportunity Announcement"
    Then I softly see "Funding Opportunity Announcement" has been added in "Attachments" flex table
    When I click on "Download" icon under attachment flex table
    Then I softly verify that the file "InternalOrganization_Field_Values.xlsx" is downloaded
    And I click on "Delete" icon under attachment flex table
    Then I softly do not see "InternalOrganization_Field_Values.xlsx" has been added in "Attachments" flex table

  @70483 @userDeleteSupportingDocumentViewHyperlink @aashish @wip
  Scenario: To Verify that user can view Template Link in supporting document checklist While creating the Announcement
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description                 | Required  | Applies To | Status |
      | Automation test description | Mandatory | Award      | Active |
    When I click on "Upload Template" icon for " Automation test description" inside flex table with id "---announcement:-:annChecklist---"
    And I choose the file "sample.pdf" to upload for "Checklist" of type "Announcement"
    When I close "Upload Template" modal by clicking the top right x button
    And I refresh the page
    And I click on hyperlink containing value "View"
    Then I see "A Simple PDF File" on page "1" of "govgrants" pdf file

  @72323 @71972 @jitendra @applicationDueDataOfAnnInHistory
  Scenario: To verify field history update with respect to modification in Application Due Dates of Announcement|
  To verify that estimated period start date & end date is displayed according to the entered budget period dates in announcemnt
    And I click on "Edit" in the page details
    And I enter value "1/25/2030" into field "fieldApplicationDueDate__c"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "1/26/2030" into field "fieldApplicationDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "History" sub tab
    Then I softly see value "2030-01-25" for title "Old Value" inside table "History"
    Then I softly see value "2030-01-26" for title "New Value" inside table "History"
    And I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date   |
      | BP01               | 03/13/2030 | 04/13/2030 |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    Then I softly see value "4/14/2030" for title "Start Date" against the value "BP02" inside table "---announcement:-:budgetPeriodTableId---"
    Then I softly see value "4/13/2031" for title "End Date" against the value "BP02" inside table "---announcement:-:budgetPeriodTableId---"

  @70563 @70556 @70554 @70606 @70718 @73545 @73547 @73564 @73566 @userCanViewAndDeleteKPI @aashish
  Scenario: To  Verify that after associating objectives, related KPIs should be automatically populate while  creating the Announcement
  | To Verify that user is able to view Objective While creating the Announcement | Verify KPIs search and filter fuctionality
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    And I perform quick search for "Automation Permanent KPI for Regression" in "---announcement:-:kpiflextableid---" panel
    Then I softly see value "Automation Permanent KPI for Regression" for title "Title" inside table "---announcement:-:kpiflextableid---"
    When I click on advance filter "#advfAnnouncementKeyOutcomes" of table id "---announcement:-:kpiflextableid---"
    When I enter advance filter values inside id "advfAnnouncementKeyOutcomes"
      | Title | Contains | Automation Permanent KPI for Regression |
    Then I softly see value "Automation Permanent KPI for Regression" for title "Title" inside table "---announcement:-:kpiflextableid---"
    Then I softly see value "KPI-0043" for title "EGMS ID" inside table "---announcement:-:kpiflextableid---"
    When I click on "View" icon for "Automation Permanent KPI for Regression" inside flex table with id "---announcement:-:kpiflextableid---"
    Then I softly see field "Key Performance Indicator" as "Automation Permanent KPI for Regression"
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    When I click on "Remove" icon for "Automation Permanent KPI for Regression" inside flex table with id "---announcement:-:kpiflextableid---"
    Then I softly see the following messages in the page details :
      | Record deleted successfully. |
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Setup" sub tab
    And I perform quick search for "Automation Permanent Objective" in "---announcement:-:objectivesTableId---" panel
    Then I softly see value "Automation Permanent Objective" for title "Title" inside table "---announcement:-:objectivesTableId---"
    When I click on advance filter "#advfAnnouncementGranteeStrategicGoalsObjectives" of table id "---announcement:-:objectivesTableId---"
    When I enter advance filter values inside id "advfAnnouncementGranteeStrategicGoalsObjectives"
      | Title | Contains | Automation Permanent Objective |
    Then I softly see value "SPO-0025" for title "EGMS ID" inside table "---announcement:-:objectivesTableId---"
    Then I softly see value "Automation Permanent Objective" for title "Title" inside table "---announcement:-:objectivesTableId---"
    When I click on "View" icon for "Automation Permanent Objective" inside flex table with id "---announcement:-:objectivesTableId---"
    Then I softly see field "Objective" as "Automation Permanent Objective"

  @70163 @70166 @70197 @userAllowToSelectEligibilityDetails @aashish
  Scenario: To Verify that user is  allowed  to select the Eligibility Details while creating Announcement
  | To verify that  without selecting "Eligibility Details" user is able to see the validation message by clicking on "Submit for approval" button.
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When  I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter value "State governments" into field "fieldEligibleApplicantTypes__c"
    Then I softly see multiple selected options in "multiSelectPicklistCell":
      | options           |
      | State governments |
    And I enter value "Unrestricted" into field "fieldEligibleApplicantTypes__c"
    And I enter value "County governments" into field "fieldEligibleApplicantTypes__c"
    And I clear the value from field "fieldEligibleApplicantTypes__c"
    And I enter value "State governments" into field "fieldEligibleApplicantTypes__c"
    Then I softly see multiple selected options in "---announcement:-:multiselectCellId---":
      | options           |
      | State governments |
    And I clear the value from field "fieldEligibleApplicantTypes__c"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Overview Tab - Select applicant types. |

  @70211 @70216 @70217 @73388 @73535 @73620 @userAbletoAssociateActiveRelatedProgram @aashish
  Scenario: To Verify that user is able to associate active Related Federal/NGO Program | To Verify that user is able to view active Related Federal/NGO Program
  |To Verify that user is able to remove active Related Federal/NGO Program while creating Announcement.
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on top right button "Associate" in flex table with id "---announcement:-:relatedAnnouncementTableId---"
    And I click "Associate" after selection of "Wildlife Services" in the table "---announcement:-:associateForRelated---"
    And I close modal by clicking the top right x button
    And I perform quick search for "Wildlife Services" in "---announcement:-:relatedAnnouncementTableId---" panel
    Then I softly see value "Wildlife Services" for title "Program Title" inside table "---announcement:-:relatedAnnouncementTableId---"
    Then I softly see value "Federal" for title "Type" inside table "---announcement:-:relatedAnnouncementTableId---"
    Then I softly see value "Animal And Plant Health Inspection Service" for title "Organization Name" inside table "---announcement:-:relatedAnnouncementTableId---"
    Then I softly can see row level action button "Remove" against "10.028" in flex table with id "---announcement:-:relatedAnnouncementTableId---"
    Then I softly can see row level action button "View" against "10.028" in flex table with id "---announcement:-:relatedAnnouncementTableId---"
    When I click on advance filter "#advfRelatedAnnouncementCFDANumbersGrantor" of table id "---announcement:-:relatedAnnouncementTableId---"
    When I enter advance filter values inside id "advfRelatedAnnouncementCFDANumbersGrantor"
      | Program Title | Contains | Calfire |
    Then I see "No Records Found" inside flex table with id "---progressReport:-:relatedAnnouncementTableId---"
    And I perform quick search for "Wildlife Services" in "---announcement:-:relatedAnnouncementTableId---" panel
    And I click on "View" icon for "Wildlife Services" inside flex table with id "---announcement:-:relatedAnnouncementTableId---"
    Then I softly see field "Non-Federal Program" as "Wildlife Services"
    And I pause execution for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "green"
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When  I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "Remove" icon for "Wildlife Services" inside flex table with id "---announcement:-:relatedAnnouncementTableId---"
    Then I softly do not see value "Wildlife Services" for title "Program Title" inside table "---announcement:-:relatedAnnouncementTableId---"

  @75617 @70727 @73624 @70723 @73621 @72482 @73536 @announcementForPastApplicationDueDateCA @announcementWithBlankBudgetPeriodCA @submittedAnnouncementDeletionCA
  Scenario Outline: Validate that user can not enter application due date as past date | Validate that user should not submit announcement with blank budget period dates|To Verify that user can view contact while creating Announcement
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    And I refresh the page
    Then I softly see value "{SavedValue:fundingAccount}" for title "Funding Account" inside table "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 1000            |
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 2000            |
    When I click on advance filter "#advfAnnouncementFundingAccountGrantor" of table id "---announcement:-:fundingAccountsTableId---"
    When I enter advance filter values inside id "#advfAnnouncementFundingAccountGrantor"
      | Pre-Encumbrance | equals to | 2000 |
    Then I softly see value "$2,000.00" for title "Pre-Encumbrance" inside table "---announcement:-:fundingAccountsTableId---"
    When I enter advance filter values inside id "#advfAnnouncementFundingAccountGrantor"
      | Pre-Encumbrance | equals to | 3000 |
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    And I click on "Save" in the page details
    When I navigate to "History" sub tab
    And I select "Related Funding Account" from dropdown present on top right of flex table id "History"
    Then I softly see value "Pre-Encumbrance" for title "Changed Field" inside table "History"
    Then I softly see value "$2,000.00" for title "New Value" inside table "History"
    Then I softly see value "$1,000.00" for title "Old Value" inside table "History"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---announcement:-:contactTableId---"
    And I enter values into fields
      | Value         | Fields           |
      | xy            | fieldTitle       |
      | TestFirst     | fieldFirstName   |
      | TestLast      | fieldLastName    |
      | abc@test.mail | fieldEmail       |
      | Primary       | fieldUserRole__c |
    And I click on "Save" in the page details
    And I refresh the page
    Then I softly see value "TestFirst TestLast" for title "Name" inside table "---announcement:-:contactTableId---"
    And I click on "View" icon for "TestFirst TestLast" inside flex table with id "---announcement:-:contactTableId---"
    Then I softly see field "Contact" as "TestFirst TestLast"
    And I click on top right button "New" in flex table with id "---announcement:-:contactTableId---"
    And I enter values into fields
      | Value         | Fields           |
      | ab            | fieldTitle       |
      | SecondTest    | fieldFirstName   |
      | SecondLast    | fieldLastName    |
      | xyz@test.mail | fieldEmail       |
      | Secondary     | fieldUserRole__c |
    And I click on "Save" in the page details
    And I click on advance filter "#advfAnnouncementContacts" of table id "---announcement:-:contactTableId---"
    When I enter advance filter values inside id "advfAnnouncementContacts"
      | Title | Contains | ab |
    Then I softly see value "ab" for title "Title" inside table "---announcement:-:contactTableId---"
    When I enter advance filter values inside id "advfAnnouncementContacts"
      | Title | Contains | who am i |
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:contactTableId---"
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Overview" sub tab
    And I click on "Remove" icon for "TestFirst TestLast" inside flex table with id "---announcement:-:contactTableId---"
    And I refresh the page
    Then I softly do not see value "TestFirst TestLast" for title "Name" inside table "---announcement:-:contactTableId---"
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I click on advance filter "#advfAnnouncementBudgetCategory" of table id "---announcement:-:approversTableId---"
    When I enter advance filter values inside id "advfAnnouncementBudgetCategory"
      | Responsibility | equals to | Program Approver |
    Then I softly see value "Program Approver" for title "Responsibility" inside table "---announcement:-:approversTableId---"
    When I enter the following values into flex table with id "---announcement:-:ApproverRolesGrantorgridTableId---" by clicking "New" :
      | Name          | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "<Announcement Type>" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type `   | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Financial Tab - Correct Budget Periods Start Date and End Dates. Budget Periods should be continuous and together should form a Project Period. |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I enter value "-1" into field "ApplicationDueDate__c"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Overview Tab - Application Due Date cannot be in the past. |
    And I click on "Edit" in the page details
    And I enter value "0" into field "ApplicationDueDate__c"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    And I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    When I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    Then I softly cannot see row level action button "Delete" against "Record id" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Examples:
      | Announcement Type |
      | Competitive       |

  @75618 @74799 @74801 @74368 @74369 @70894 @71722 @72471 @72324 @72548 @73858 @verifyReviseUnderRevision @aashish @smoke
  Scenario Outline: To Verify that after clicking on revise button, status changes to created.
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    And I refresh the page
    And I click on "Remove" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---" with wait for record
    Then I softly see the following messages in the page details :
      | Record removed successfully.|
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name          | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    # This is bug. @74799
    #When I navigate to "Attachments" sub tab
    #When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Funding Opportunity Announcement"
    #Then I softly see "Funding Opportunity Announcement" has been added in "Attachments" flex table
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    Then I softly see value "submitted" for title "Status" inside table "---announcement:-:flexGridApproverRolesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "<Announcement Type>" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I softly see value "submitted" for title "Status" inside table "---announcement:-:flexGridApproverRolesTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "<Announcement Type>" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Snapshot_Announcement_Submission" as name
    And I click on hyperlink containing value "Snapshot_Announcement_Submission"
    When I download the file
    Then I softly see "Announcement information" on page "1" of "govgrants" pdf file
    And I see "Automation PM" against "Initial Submitter" in approval history
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Reassign" to user "Automation PM" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I navigate to "History" sub tab
    Then I see "Automation PM" against "Program Office Approval" in approval history
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly can see top right button "Revise" in page detail
    And I click on "Revise" in the page details
    Then I softly see status in Progress-bar is "Created" and is "green"
    Then I softly see field "Status" as "Under Revision"
    Then I softly cannot see top right button "Extend Dates" in page detail

    Examples:
      | Announcement Type |
      | Competitive       |

  @70803 @73849 @73774 @73773 @70817 @70893 @73775 @34768 @70898 @72490 @announcementApprovalCA @verifyApproverCanNotEdit @aashish
  Scenario Outline: Validate the approval of an Announcement | To verify that after unpublished announcement , user can not create application from that announcement
  | To Verify that after submitting for approval, approver can not edit anything on announcement
  |To verify field history update with respect to modification in Pre-Encumbrance field of Announcement
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I navigate to "History" sub tab
    And I select "Related Funding Account" from dropdown present on top right of flex table id "History"
    Then I softly see value "$100.00" for title "New Value" against the value "Pre-Encumbrance" inside table "History"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name          | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "<Announcement Type>" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I navigate to "History" sub tab
    Then I softly see value "Submitted for Approval" for title "New Value" inside table "History"
    Then I softly see value "Created" for title "Old Value" inside table "History"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly cannot see row level action button "Edit" against "Record id" in flex table with id "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    Then I softly can see top right button "Revise" in page detail
    When I navigate to "History" sub tab
    Then I softly see value "Approved" for title "New Value" inside table "History"
    Then I softly see value "Submitted for Approval" for title "Old Value" inside table "History"
    Then I softly can see top right button "Extend Dates" in page detail
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I click on "Publish" in the page details
    When I navigate to "History" sub tab
    Then I softly see value "Published" for title "New Value" inside table "History"
    Then I softly see value "Approved" for title "Old Value" inside table "History"
    And I click on "Unpublish" in the page details
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I pause execution for "2" seconds
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Record Id" in "---announcement:-:opportunityNotQtableId---" panel
    Then I softly do not see value "Record Id" for title "Announcement ID" inside table "---announcement:-:opportunityNotQtableId---"
    Examples:
      | Announcement Type |
      | Competitive       |

  @72328 @72326 @72025 @71974 @announcementDisApprovalbyEXE @aashish
  Scenario Outline: To verify Approval history of announcement when announcement rejected by Executive Office Approval: Victor EXE
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name          | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "<Announcement Type>" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | End Date |
      | BP03               | 550      |
    And I click on "Save" in the page details
    And I save the value from row "3" for column name "Start Date" as "startDate" from flex table "---announcement:-:budgetPeriodTableId---"
    And I save the value from row "3" for column name "End Date" as "endDate" from flex table "---announcement:-:budgetPeriodTableId---"
    Then I softly see field "Estimated Project Period Start Date" as "{SavedValue:startDate}"
    Then I softly see field "Estimated Project Period End Date" as "{SavedValue:endDate}"
    And I click on "Remove" icon for "BP03" inside flex table with id "---announcement:-:budgetPeriodTableId---"
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date |
      | BP03               | 250        |
    And I click on top right button "Save" in flex table with id "---announcement:-:budgetPeriodTableId---"
    Then I softly see the following messages in the page details :
      | Budget Period dates should not overlap. Adjust the end date ofBP02 and start date ofBP03 to proceed further. |
    And I click on "Remove" icon for "BP02" inside flex table with id "---announcement:-:budgetPeriodTableId---"
    And I click on "Remove" icon for "BP03" inside flex table with id "---announcement:-:budgetPeriodTableId---"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I navigate to "History" sub tab
    Then I softly see value "Approved" for title "Status" inside table "History"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Disapprove" in the approval decision
    When I navigate to "History" sub tab
    Then I softly see value "Rejected" for title "Status" inside table "History"
    Then I softly see status in Progress-bar is "Rejected" and is "red"
    Examples:
      | Announcement Type |
      | Competitive       |


  @announcementPendingTaskPostApprovalCA @announcementCompletedTaskPostApprovalCA
  Scenario Outline: Validate that after approval of an Announcement task get deleted from pending task table | Validate that after approval of an Announcement task get added to its completed task table ||
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name          | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "<Announcement Type>" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Given "1" Approvers "PM" approve the record "Record Id"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Announcements |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Approve       |                   |
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly do not see values "Record Id" and "Automation Competitive Announcement" inside table
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhaseCompletedTasks" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "PhaseCompletedTasks"
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly do not see values "Record Id" and "Automation Competitive Announcement" inside table
    Examples:
      | Announcement Type |
      | Competitive       |

  @announcementPostSendBackCheckFieldHistoryCA @announcementSendBackPendingTaskToOwnerCA @announcementSendBackToOwnerCA @smoke
  Scenario Outline: Validate the send back functionality of an Announcement || Validate the field history after send back of an announcement || Validate that after send back from approvers owner should not get pending task
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name          | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "<Announcement Type>" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Send to Owner" in the approval decision
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I navigate to "History" sub tab
    Then I softly see that "Announcement" is in "Created" status
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly do not see values "Record Id" and "Automation Competitive Announcement" inside table
    Examples:
      | Announcement Type |
      | Competitive       |

  @65080 @VerifyDraftAnnouncementIsNotDisplayedForSRUer @keerti
  Scenario Outline: Verify Draft announcement is not displayed at SR user end.
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name          | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "<Announcement Type>" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    And I perform quick search for "Record Id" in "popupflextable" panel
    Then I do not see value "Record Id" for title "Announcement ID" inside table "popupflextable"
    Examples:
      | Announcement Type |
      | Competitive       |

  @announcementRejectPendingTaskForNextApproverCA @announcementPostRejectionCheckInListViewCA @announcementPostRejectCompletedTaskForUserCA @announcementPostRejectPendingTaskForUserCA
  Scenario Outline: Validate that after rejection of an Announcement task get added to it's completed task table. || Validate that after rejection from 1st approver, 2nd user should not get pending task || Validate that after rejection of an Announcement task get deleted from pending task table.
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name          | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    Given I am on "INTERNAL" portal
    When I login as "EXE" user
    And I navigate to "Announcements" tab
    And I navigate to "<Announcement Type>" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    When I perform quick search for "Record Id" in "<Active Funding Opportunities id>" panel
    When I click on "View" icon for "Record Id" inside flex table with id "<Active Funding Opportunities id>"
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Disapprove" in the approval decision
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly do not see values "Record Id" and "Automation Competitive Announcement" inside table
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhaseCompletedTasks" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "PhaseCompletedTasks"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly do not see value "Record Id" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Rejected Competitive Announcements"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---announcement:-:competitiveAnnouncementTableId---"
    Examples:
      | Announcement Type | Active Funding Opportunities id                     |
      | Competitive       | ---announcement:-:competitiveAnnouncementTableId--- |

  @65077 @publishingCompetitiveAnnouncementCA @productBusinessFlowSanity
  Scenario: Validate the activation of Competitive Announcement
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 20000           |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I navigate to "Overview" sub tab
    When I pause execution for "1" seconds
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---announcement:-:reviewersTableId---"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click on modal button Submit Review
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    When I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record Id" inside table
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "green"

  @73616 @73962 @userAllowToEnterDataInQualityAndAvailibility @aashish
  Scenario: To verify user allow to remove budget category when Budget type is Non functional in financial tab for announcement
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When  I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on "Remove" icon for "Personnel" inside flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly see the following messages in the page details :
      | Record deleted successfully. |
    And I perform quick search for "Personnel" in "---announcement:-:announcementBudgetCategory---" panel
    Then I softly do not see value "Personnel" for title "Name" inside table "---announcement:-:announcementBudgetCategory---"
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I refresh the page
    And I select "Download as PDF" from parallel lines dropdown of "Budget Period Details"
    When I download the file
    Then I softly see "Budget Period Details" on page "1" of "govgrants" pdf file

  @73960 @userAllowToDownloadPDFFundingAccount @aashish
  Scenario: To verify user allow to download PDF for Funding Accounts section in financial tab of announcement
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When  I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    And I refresh the page
    And I select "Download as PDF" from parallel lines dropdown of "Funding Accounts"
    When I download the file
    Then I see "Funding Accounts" on page "1" of "govgrants" pdf file

  @74120 @userAllowToDownloadPDFResponsibility @aashish
  Scenario: To verify system allow to download PDF for Approvers section in Responsibility tab of announcement
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When  I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    And I refresh the page
    And I select "Download as PDF" from parallel lines dropdown of "Approvers"
    When I download the file
    Then I see "Approvers" on page "1" of "govgrants" pdf file

  @74121 @userAllowToDownloadPDFOwner @aashish
  Scenario: To verify system allow to download PDF for Owner section in Responsibility tab of announcement
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When  I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Responsibilities" sub tab
    And I select "Download as PDF" from parallel lines dropdown of "Owner"
    When I download the file
    Then I see "Owner" on page "1" of "govgrants" pdf file

  @74126 @userAllowToDownloadPDFObjective @aashish
  Scenario: To verify system allow to download PDF for objectives section in setup tab of announcement.
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When  I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Setup" sub tab
    And I select "Download as PDF" from parallel lines dropdown of "Objectives"
    When I download the file
    Then I see "Objectives" on page "1" of "govgrants" pdf file

  @74129 @userAllowToDownloadPDFKPI @aashish
  Scenario: To verify system allow to download PDF for Key performance Indicator(KPIs) section in setup tab of announcement
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When  I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Setup" sub tab
    And I select "Download as PDF" from parallel lines dropdown of "Key Performance Indicators (KPIs)"
    When I download the file
    Then I see "Key Performance Indicators (KPIs)" on page "1" of "govgrants" pdf file

  @74131 @userAllowToDownloadPDFHistory @aashish
  Scenario: To verify system allow to download PDF for Field history section in history tab of announcement
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When  I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "History" sub tab
    And I select "Download as PDF" from parallel lines dropdown of "Field History"
    When I download the file
    Then I see "Field History" on page "1" of "govgrants" pdf file

  @73857 @publishingExtendDatedButtonDisplay
  Scenario: To Verify that Extend Dates(Revise) button will be shown when Announcement status is Published  for announcement
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 20000           |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I navigate to "Overview" sub tab
    When I pause execution for "1" seconds
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---announcement:-:reviewersTableId---"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click modal button "Submit Review"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    When I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record Id" inside table
    And I click on "Publish" in the page details
    Then I softly can see top right button "Extend Dates" in page detail

  @75524 @publishedAllowToDownloadPDF
  Scenario: To verify system allow to download PDF for Announcement after publishing it
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 20000           |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I navigate to "Overview" sub tab
    When I pause execution for "1" seconds
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---announcement:-:reviewersTableId---"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click modal button "Submit Review"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    When I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record Id" inside table
    And I click on "Publish" in the page details
    And I click on "Menu" in the page details
    And I select "Download As PDF" from dropdown
    And I download the file
    And I see "Automation Competitive Announcement" on page "1" of "govgrants" pdf file
