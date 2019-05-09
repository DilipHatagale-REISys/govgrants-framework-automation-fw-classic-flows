@preApplication @regression
Feature: Validate all scenarios in the Pre-Application

  Background: Qualify Announcement and Create PreApplication
    Given I delete the record "Automation Announcement Mar Test" from the object "PreApplication"
	And I delete the record "Health Camp" from the object "Application"
    Given I am on "SUBPORTAL" portal
    And I qualify the announcement "Automation Announcement Regression" as user "SPI"
      | Actions    | Step 1         | Step 2        | Step 3  | Step 4        |
      | Navigation | Grants Portal  | Opportunities | Active  | Opportunities |
      | FlexTable  | popupflextable | View          | Qualify |               |
    Given I create an  Pre-Application from sheet "Creation" in excel "PreApplication_Field_Values.xlsx"
      | Actions  | Step 1                 | Step 2            | Step 3 |
      | Creation | Create Pre-Application | Save and Continue | Save   |

  @46799 @preApplicationCreation @preApplication @all
  Scenario: Creating an Pre Application
    Then I see status in Progress-bar is "Created" and is "green"

  @46800 @preApplicationEdition @preApplication @all
  Scenario: Validate edition of pre-application
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @addFocusAreaToPreApplication @preApplication @all
  Scenario Outline: Addition of Focus area to an pre-application
      When I navigate to "Budget" sub tab
      And I click on top right button "Add Focus Area" in flex table with id "FocusAreaPreApp"
      When I click "Add" after selection of "<EGMS Id>" in the table "AddPreAppProjects"
      And I switch to Parent frame
      Then I see that "<EGMS Id>" has been added in flextable with Id "FocusAreaPreApp"
      Examples:
        | EGMS Id |
        | 00001   |

#  @addBudgetDetailsToPreApplication @preApplication @all
#  Scenario: Addition of budget in the budget grid to an pre-application
#    Given I associate "1" records "02493"
#      | Actions 	  | Step 1 | Step 2	   	    | Step 3  	      | Step 4  | Step 5  		    |
#      | Associate 1   | Budget | Add Focus Area | FocusAreaPreApp | Add	    | AddPreAppProjects |
#    When I navigate to "Budget" sub tab
#    And I expand nested table containing column value "Proposed Budget" inside nested table containing "BP01"
#    When I edit the following rows inline in flex table with id "EnhancePreApplicationBudgetPeriodsFlexToggle" by clicking "Edit" :
#      | Category Name   | Budget | Cash Match | Non-Cash Match |
#      | Construction	| 5000 	 | 1000   	  | 3000 		   |


  @46801 @submitPreApplicationToGrantor @preApplication @all
  Scenario: Validate submission of pre-application to Grantor by External User
       When I click on "Submit to Grantor " in the page details
       Then I see status in Progress-bar is "Submitted" and is "green"






