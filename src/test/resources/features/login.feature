@login
Feature: Test all login based scenarios

  @loginCreds @smoke
  Scenario Outline: User enters correct username and password to login and reaches homepage
    Given I enter my user "<username>"
    And I enter my password "<password>"
    When I login
    Then I see that i am on the homepage
    
  
    Examples:
    | username 		| password   |
    | hema@ggp.dev7 | Product@06 |
   