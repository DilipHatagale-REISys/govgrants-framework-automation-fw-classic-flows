@closeout @grantor-regression @grantor-parallel-regression
Feature: Validate all scenarios in Closeout

  @87347 @87354 @ValidatingCloseoutRequestForEXEUser @meenakshi
  Scenario: To verify the PM user should be able to create the  Closeout Request
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "CREATE_AWARD_EXE"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    #87347
    Then I softly see "Create Closeout Request" opens in overLay window
    And I save the field labeled "Closeout" as "CloseoutName"
    And I save the field labeled "Closeout Effective Date" as "CloseoutEffectiveDate"
    Then I softly see field "Closeout" as "{SavedValue:CloseoutName}"
    Then I softly see field "Closeout Effective Date" as "{SavedValue:CloseoutEffectiveDate}"
    Then I softly see field "EGMS ID" as "{SavedValue:GrantID}"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Closeout Activities Due Date" as "CloseoutActivitiesDueDate"
    Then I softly see field "Closeout Activities Due Date" as "{SavedValue:CloseoutActivitiesDueDate}"
    Then I softly see field "Closeout Effective Date" as "{SavedValue:CloseoutEffectiveDate}"
