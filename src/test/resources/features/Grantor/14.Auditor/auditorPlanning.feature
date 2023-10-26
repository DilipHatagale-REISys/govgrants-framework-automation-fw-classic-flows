@auditorPlanning @auditor @parallel-regression @regression
Feature: Validate all scenarios for Auditor Profile in Planning Module

  @67762 @auditorCannotCreateEditFocusArea @smoke
  Scenario Outline: Validate Auditor should not be able to  Create/Edit Focus area
    Given I login to "As a Grantor" app as "AUDITOR" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    When I perform quick search for "<FocusArea>" in "---focusarea:-:focusAreaTableId---" panel
    Then I softly cannot see row level action button "Edit" against "<FocusArea>" in flex table with id "---focusarea:-:focusAreaTableId---"
    And I click on "View" icon for "<FocusArea>" inside flex table with id "---focusarea:-:focusAreaTableId---"
    Then I softly cannot see top right button "Activate" in page detail
    Examples:
      | User    | FocusArea                       |
      | AUDITOR | Automation Permanent Focus Area |

  @67763 @otherUsersCanCreateFocusArea
  Scenario Outline: Verify that other than Auditor user all other users can create a Focus Area
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    Then I can see top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    Examples:
      | User  |
      | PM    |
      | EXE   |
      | ADMIN |

  @67761 @auditorCannotCreatefocusArea @deepika
  Scenario Outline: Verify that Auditor user cannot create a Focus Area
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    Then I cannot see top right button "New" for "---focusarea:-:focusAreaTableId---" flex table
    Examples:
      | User    |
      | AUDITOR |

  @67764 @auditorCannotCreateProgram @deepika
  Scenario Outline: Verify that Auditor user cannot create a new Program
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    Then I cannot see top right button "New" for "---program:-:programsTableId---" flex table
    Examples:
      | User    |
      | AUDITOR |

  @67765 @otherUsersCanCreateProgram
  Scenario Outline: Verify that other than Auditor user all other users can create a new Program
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    Then I can see top right button "New" in flex table with id "---program:-:programsTableId---"
    Examples:
      | User  |
      | PM    |
      | EXE   |
      | ADMIN |

  @67766 @auditorProfileCannotCReateEditReviewApproveProgram @smoke
  Scenario Outline: Validate Auditor user should not be able to Create/Edit/ Review/Approve internal program
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "<Program>" in "---program:-:programsTableId---" panel
    Then I softly cannot see row level action button "Edit" against "<Program>" in flex table with id "---program:-:programsTableId---"
    And I click on "View" icon for "<Program>" inside flex table with id "---program:-:programsTableId---"
    When I navigate to "Setup" sub tab
    Then I softly cannot see top right button "Associate" for "---program:-:focusAreaTableId---" flex table
    Then I softly cannot see top right button "Associate" for "---program:-:objectivesTableId---" flex table
    Then I softly cannot see top right button "Associate" for "---program:-:kpiTableId---" flex table
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "Add" for "---program:-:peerReviewTableId---" flex table
    Then I softly cannot see top right button "Add" for "---program:-:approverTableId---" flex table
    Then I softly cannot see top right button "Submit For Approval" in page detail
    Then I softly cannot see top right button "Activate" in page detail
    Examples:
      | User    | Program                               |
      | AUDITOR | Automation Permanent Internal Program |

  @67845 @69297 @auditorCannotCreateFundingSource @deepika
  Scenario Outline: Verify Auditor profile user cannot create a new external/ internal Funding Source
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    Then I softly cannot see top right button "New" for "---fundingsource:-:fundingSourceTableId---" flex table
    Then I softly cannot see top right button "New" for "---auditor:-:fundingSourceExternalTableId---" flex table
    Examples:
      | User    |
      | AUDITOR |

  @67846 @auditorProfileCannotCReateEditReviewFundingSource
  Scenario Outline: Validate Auditor user should not be able to Create/Edit Funding Source and Funding Account
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - Active"
    When I perform quick search for "<FundingSource>" in "---fundingsource:-:fundingSourceTableId---" panel
    Then I softly cannot see row level action button "Edit" against "<FundingSource>" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    And I click on "View" icon for "<FundingSource>" inside flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "New" for "---fundingsource:-:fundingAccountTableId---" flex table
    Then I softly cannot see top right button "Activate" in page detail
    Examples:
      | User    | FundingSource                       |
      | AUDITOR | Automation Permanent Funding Source |

  @67846 @auditorCanViewActiveFundingSource
  Scenario Outline: Validate Auditor should have view / read  only access to Active Funding Source
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - Active"
    When I perform quick search for "<FundingSource>" in "---fundingsource:-:fundingSourceTableId---" panel
    Then I softly can see row level action button "View" against "<FundingSource>" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    Examples:
      | User    | FundingSource                       |
      | AUDITOR | Automation Permanent Funding Source |


  @67847 @auditorCannotCreateKPI @deepika
  Scenario Outline: Verify Auditor profile user cannot create a new KPI
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    Then I cannot see top right button "New" for "---keyperformanceindicator:-:kpiTableId---" flex table
    Examples:
      | User    |
      | AUDITOR |

  @67848 @auditorProfileCannotCReateEditKPI
  Scenario Outline: Validate Auditor user should not be able to Create/Edit KPI's
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) -Active"
    When I perform quick search for "<KPI>" in "---keyperformanceindicator:-:kpiTableId---" panel
    Then I softly cannot see row level action button "Edit" against "<KPI>" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I click on "View" icon for "<KPI>" inside flex table with id "---keyperformanceindicator:-:kpiTableId---"
    Then I softly cannot see top right button "Activate" in page detail
    Examples:
      | User    | KPI                      |
      | AUDITOR | Automation Permanent KPI |

  @67849 @otherUsersCanCreateKPI
  Scenario Outline: Verify that other than Auditor user other users EXE and ADMIN can create a KPI's
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    Then I can see top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    Examples:
      | User  |
      | EXE   |
      | ADMIN |

  @67850 @auditorCannotCreateEditActivateOrDeactivateStrategicPlan
  Scenario Outline: Validate Auditor should not be  able to  Create/Edit/Activate/Deactivate Strategic plan
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    When I perform quick search for "<StrategicPlan>" in "---strategicplan:-:StrategicPlansTableId---" panel
    Then I softly cannot see row level action button "Edit" against "<StrategicPlan>" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I click on "View" icon for "<StrategicPlan>" inside flex table with id "---strategicplan:-:StrategicPlansTableId---"
    Then I softly cannot see top right button "New" for "---strategicplan:-:StrategicPlansTableId---" flex table
    And I click on "View" icon for "Automation Permanent Strategic Goal" inside flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    Then I softly cannot see top right button "New" for "---strategicplan:-:strategicGoalRelatedObjectivesTableId---" flex table
    And I click on "View" icon for "Automation Permanent Objective" inside flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"
    And I click on "Back To Strategic Goal" in the page details
    When I click on "Back To Strategic Plan" in the page details
    Then I softly cannot see top right button "Activate" in page detail
    Then I softly cannot see top right button "Deactivate" in page detail
    Examples:
      | User    | StrategicPlan                       |
      | Auditor | Automation Permanent Strategic Plan |

  @67851 @auditorCannotCreateStrategicPlan @deepika
  Scenario Outline: Verify Auditor profile user cannot create a new Strategic Plan
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    Then I cannot see top right button "New" for "---strategicplan:-:StrategicPlansTableId---" flex table
    Examples:
      | User    |
      | AUDITOR |

  @69149 @auditorCannotCreateTermsAndConditions @deepika
  Scenario Outline: Verify Auditor profile user cannot create a new Terms and Conditions
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    Then I cannot see top right button "New" for "---auditor:-:termsandconditionstableID---" flex table
    Examples:
      | User    |
      | AUDITOR |

  @69150 @auditorViewTermsAndConditions @deepika
  Scenario Outline: Auditor should have view / read  only access to Active Terms and Conditions
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    When I perform quick search for "Active" in "---auditor:-:termsandconditionstableID---" panel
    Then I softly can see row level action button "View" against "Active" in flex table with id "---auditor:-:termsandconditionstableID---"
    Then I softly cannot see row level action button "Edit" against "Active" in flex table with id "---auditor:-:termsandconditionstableID---"
    Examples:
      | User    |
      | AUDITOR |

  @69151 @69153 @auditorViewCannotCreateEditFormsandPackages  @deepika
  Scenario Outline: Verify Auditor profile user cannot create a new Forms and Packages |Validate Auditor should have view / read  only access to Forms and Packages|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    Then I softly cannot see top right button "New" for "---auditor:-:formsflextableID---" flex table
    Then I softly cannot see top right button "New" for "---auditor:-:packagesFlextableID---" flex table
    And I select value inside table "---auditor:-:formsflextableID---" is "All"
    Then I see the following rows under the following headers in table with id "---auditor:-:formsflextableID---" :
      | Form Number | Actions |
      | PSAF - 001  | Preview |
    Examples:
      | User    |
      | AUDITOR |

  @69154 @69156 @69298 @auditorCannotCreateFederalandNon-FederalPrograms @deepika
  Scenario Outline: Verify Auditor should not be  able to Create External federal or non-federal Programs and View any federal program
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    Then I softly cannot see top right button "New" for "---auditor:-:externalProgramTableID---" flex table
    When I perform quick search for "Wildlife Services" in "---auditor:-:federalProgramFlexTableId---" panel
    Then I softly can see row level action button "View" against "Wildlife Services" in flex table with id "---auditor:-:federalProgramFlexTableId---"
    When I perform quick search for "NGO Program 2" in "---auditor:-:nonfederaltableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---auditor:-:nonfederaltableId---"
    Examples:
      | User    |
      | AUDITOR |


