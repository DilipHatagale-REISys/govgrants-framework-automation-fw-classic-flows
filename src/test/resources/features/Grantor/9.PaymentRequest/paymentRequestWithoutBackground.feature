@grantor-regression @grantor-parallel-regression @paymentRequest
Feature: Payment Request scenarios without background

  @53910 @ValidateAdvancePaymentRequestButton @mahadev @smoke
  Scenario Outline: validate advance button not displayed to SPI user when Advance Payment Allowed selected as NO
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_ADVANCE_PERMISSION"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I cannot see top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @53966 @enterDetailedBudgetOnAdvPaymentRequest @mahadev
  Scenario Outline: Validate user can enter detailed budget for Advance Payment Request when Are Expense Details Required on Reimbursements? is Yes at Grant
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 500                           |
    Then I see value "$500.00" for title "Advance Requested This Action" against the value "Construction" inside table "---paymentRequest:-:budgetTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @53953 @validateProgramIncomeFieldIsDisplayedOnAdvancePaymentRequest @mahadev
  Scenario Outline: Validate user can enter Program Income at payment request when program Income Allowed is Yes at Grant
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see field "Program Income" as "$1,000.00"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @53912 @validateProgramIncomeTrackingNotDisplayedOnAdvPaymentRequest @mahadev
  Scenario Outline: Validate user can not see page block Program Income tracking not displayed on Advance payment request when program Income Allowed is No at Grant
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_PROGRAM_INCOME_ANTICIPATE"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    Then I cannot see page block "Program Income Tracking"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @53965 @validateProgramIncomeFieldIsDisplayedOnReimbursementPaymentRequest @mahadev @smoke
  Scenario Outline: Validate user can enter Program Income On Reimbursement Payment Request when program Income Allowed is Yes at Grant
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I navigate to "Financials" sub tab
    When I enter value "I Agree" into field "TermsAgreement__c"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see field "Program Income This action" as "$1,000.00"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @53964 @validateProgramIncomeTrackingNotDisplayedOnPaymentRequest @mahadev
  Scenario Outline: Validate user can not see page block Program Income tracking not displayed on Reimbursement payment request when program Income Allowed is No at Grant
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_PROGRAM_INCOME_ANTICIPATE"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    Then I cannot see page block "Program Income Tracking"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @54174 @ValidateAwardBudgetIsSameAsBalanceonAward @mahadev
  Scenario Outline: validate awarded budget is same as award balance on award activation
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_ADVANCE_PERMISSION"
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the field value "Total Subaward Amount this Budget Period" from sub tab "Budget"
    Then I compare field "Balance" from sub tab "Actuals" with expected field
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @54168 @ValidateAwardBudgetIsSameAsBalanceOnReimbursementPR @mahadev
  Scenario Outline: validate awarded budget is same as award balace on award activation
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_ADVANCE_PERMISSION"
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the field value "Awarded Budget" from sub tab "Actuals"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I compare field "Awarded Budget" from sub tab "Financials" with expected field
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @54496 @ValidateActiveSuppportingDocumentChecklistOnReimbursementPR @mahadev @bug-94779
  Scenario Outline: validate Suppporting Document Checklist is displayed on reimbursement payment request
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_PROGRAM_INCOME_ANTICIPATE"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "No Program Income_Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                |
    When I close "Add Line Items" modal by clicking the top right x button
    And I navigate to "Attachments" sub tab
    Then I see that "Automation" has been added in flextable with Id "---paymentRequest:-:checklistTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @54499 @ValidateInActiveSuppportingDocumentChecklistOnReimbursementPR @mahadev @bug-94779
  Scenario Outline: validate Suppporting Document Checklist is not displayed on reimbursement payment request if selected as Inactive on grant
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_PROGRAM_INCOME_ANTICIPATE"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "No Program Income_Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                |
    When I close "Add Line Items" modal by clicking the top right x button
    When I navigate to "Attachments" sub tab
    Then I see "No Records Found" inside flex table with id "---paymentRequest:-:checklistTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @54415 @ValidateUserCanAttachDocumentTypeInvoiceOnReimbursementPR @mahadev @bug-94779
  Scenario Outline: validate user can add active supporting document for Reimbursement payment request as type Invoice
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_PROGRAM_INCOME_ANTICIPATE"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "No Program Income_Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Invoice"
    Then I see "Announcement_Field_Values.xlsx" has been added in "Attachment" flex table
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @54498 @ValidateInActiveSuppportingDocumentChecklistOnAdvancePR @mahadev
  Scenario Outline: validate Suppporting Document Checklist is not displayed on advance payment request if selected as Inactive on grant
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I navigate to "Attachments" sub tab
    Then I see "No Records Found" inside flex table with id "---paymentRequest:-:checklistTableId---"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @54495 @ValidateActiveSuppportingDocumentChecklistOnAdvancePR @mahadev @bug-94779
  Scenario Outline: validate Suppporting Document Checklist is displayed on advance payment request
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Attachments" sub tab
    Then I see that "Automation" has been added in flextable with Id "---paymentRequest:-:checklistTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @54506 @ValidateOptionalSuppportingDocumentChecklistOnReimbursementPR @mahadev
  Scenario Outline: validate Optional Suppporting Document Checklist should not display any error message on reimbursement payment request
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_PROGRAM_INCOME_ANTICIPATE"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "No Program Income_Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @54507 @ValidateOptionalSuppportingDocumentChecklistOnAdvancePR @mahadev
  Scenario Outline: validate Optional Suppporting Document Checklist should not display any error message on advance payment request
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @54503 @ValidateMandatorySuppportingDocumentChecklistOnAdvancePR @mahadev @bug-94779
  Scenario Outline: validate mandatory Suppporting Document Checklist should  display error message on advance PR if attachment not added
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details contains:
      | Attachments Tab - Each mandatory item listed in the checklist must be completed before submitting this Payment Request. |
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @54167 @ValidateAwardBudgetIsSameAsBalanceOnAdvancePR @mahadev
  Scenario Outline: validate awarded budget is same as award balace on award activation
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the field value "Awarded Budget" from sub tab "Actuals"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I compare field "Awarded Budget" from sub tab "Financials" with expected field
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @54708 @ValidateAdvanceRequestedAmountFieldOnAwardAtSubPortalUpdatedAfterAdvancePRApproval @mahadev
  Scenario Outline: validate Advance Requested Amount field at sub portal gets updated after Advance payment request approval
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I pause execution for "1" seconds
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | {SavedValue:FO Username} | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I see field "Advance Balance" as "$10.00"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @54707 @ValidateAdvanceRequestedAmountFieldOnAwardAtInternalPortalUpdatedAfterAdvancePRApproval @mahadev @smoke
  Scenario Outline: validate Advance Requested Amount field at Internal portal gets updated after Advance payment request approval
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | {SavedValue:FO Username} | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I see field "Advance Balance" as "$10.00"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @54709 @ValidateReimbursementBalanceFieldOnAwardAtSubPortalUpdatedAfterReimbursementPRApproval @mahadev
  Scenario Outline: validate Advance Requested Amount field at sub portal gets updated after Advance payment request approval
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                | 0               | 20                       | 10         | 10             |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | {SavedValue:FO Username} | Automation Test Description |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I see field "Reimbursement Balance" as "$980.00"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @54712 @ValidateReimbursementApprovedAmountFieldOnPaymentRequestAfterReimbursementPRApproval @mahadev
  Scenario Outline: validate Reimbursement balance on payment request at sub portal gets updated after Reimbursement payment request approval
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                | 0               | 20                       | 10         | 10             |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | {SavedValue:FO Username} | Automation Test Description |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    Then I see value "$980.00" for title "Reimbursement Balance" against the value "Total" inside table "---paymentRequest:-:paymentRequestBudgetTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @54711 @ValidateTotalFieldGettingUpdatedOnAdvancePR @mahadev
  Scenario Outline: Validate total field is getting updated on advance payment request
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
      | Equipment       | 10                            |
    Then I see value "$20.00" for title "Advance Requested This Action" against the value "Total" inside table "---paymentRequest:-:budgetTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @54504 @ValidateOptionalSupportingDocumentChecklistOnReimbursementPR @mahadev
  Scenario Outline: validate optional supporting document checklist does not show any validation message for Reimbursement payment request
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "Green"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @55402 @ValidatedUserNotifiedFieldUpdatedInternalPortal @mahadev
  Scenario Outline: Verify when Batch is run then User Notified field gets Updated at Internal Portal
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I delete the record "{SavedValue:Automation Runtime Award}" from the object "Payment Request"
    And I navigate to "Terms" sub tab
    When I create a post award record "PaymentRequest" for the Award "<Award Name>" having object api name as "PaymentRequest__c"
    When I expand nested table containing column value "Payment Request"
    Then I can see "1" record value is checked for field name "TaskCreated__c"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @51067 @EditionOfReimbursementPaymentRequest @mahadev
  Scenario Outline: Edition of Reimbursement Payment Request
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<Login User>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I navigate to "Financials" sub tab
    When I enter value "I Agree" into field "TermsAgreement__c"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see field "Acknowledgement" as "I Agree"
    Examples:
      | Login User |
      | SPI        |
      | SPA        |

  @51068 @ReimbursementPaymentRequestAddAttachment @bug-94779
  Scenario Outline: Validate the attachment for Reimbursement Payment Request
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Invoice"
    And I pause execution for "2" seconds
    Then I see "Invoice" has been added in "Attachment" flex table
    Examples:
      | User |
      | SPI  |
      | SPA  |

  @55400 @EditActionNotDisplayedReimbursementPR @mahadev
  Scenario Outline: validate edit action should not be displayed for budget categories for Reimbursement Payment request
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I cannot see row level action button "Edit" against "Construction" in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    Examples:
      | User |
      | SPI  |
      | SPA  |

  @55401 @ValidatedUserNotifiedFieldUpdatedExternalPortal @mahadev
  Scenario Outline: Verify when Batch is run then User Notified field gets Updated at External Portal
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I create a post award record "PaymentRequest" for the Award "<Award Name>" having object api name as "PaymentRequest__c"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    When I expand nested table containing column value "Payment Request"
    Then I can see "1" record value is checked for field name "TaskCreated__c"
    Examples:
      | Award Name                            | Grant Name                            | User |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} | SPI  |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} | SPA  |

  @55809 @PRReimbursement2ndIsFinalPayment1stPRShouldShowValidMsg @jitendra @smoke
  Scenario Outline: Verify that once final payment request is approved then Created status Payment should show validation message on Submit to Grantor Button.
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_ADVANCE_PERMISSION"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request 3" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 30         | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request 4" into field "Title__c"
    And I enter value "Checked" into field "IsFinalPR__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 10         | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 10                    |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | {SavedValue:FO Username} | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "$30.00" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details contains:
      | Overview Tab - This Payment Request cannot be submitted to the Grantor because a payment request marked as the Final payment request has been approved |
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @55304 @validateProgressReportSchedulesOnActiveAwardAfterEditingSchedules @mahadev
  Scenario Outline: Validate progress report schedules getting updated on active award after editing schedule
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_ADVANCE_PERMISSION"
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Monthly" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I expand nested table containing column value "Progress Report"
    Then I see total records count "Total Records:12" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @55308 @validateProgressReportSchedulesAtGranteePortalOnActiveAwardAfterEditingSchedules @mahadev
  Scenario Outline: Validate progress report schedules getting updated on active award after editing schedule
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_ADVANCE_PERMISSION"
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Monthly" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    And I click on "View" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I save the field labeled "Schedule Title" as "AutomationRuntimeProgressReport"
    Then I see field "Schedule Title" as "{SavedValue:AutomationRuntimeProgressReport}"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @55305 @verifyUserIsNotAllowedToSelectProgressReportScheduleStartDateBeforeBudgetPeriodStartDateOnActiveAward @mahadev
  Scenario Outline: Verify While creating schedule user is not allowed to select the Schedule Start Date which is before Budget period start date on active award
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_ADVANCE_PERMISSION"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "Progress Report Error" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    Then I see the text containing :
      | Schedule Start date cannot be before Budget Period Start Date. |
    Examples:
      | Grant Name                            |
      | {SavedValue:Automation Runtime Award} |

  @55689 @canNotCreateAnotherPaymentRequestAfterFinalPaymentRequest @jitendra
  Scenario Outline: Verify that once User select Is final Payment request option then User cannot create New Payment request.
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_ADVANCE_PERMISSION"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request 3" into field "Title__c"
    And I enter value "Checked" into field "IsFinalPR__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 30         | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I pause execution for "1" seconds
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 30                    |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | {SavedValue:FO Username} | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    And I click on "Mark as Paid" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I cannot see top right button "Reimbursement Request" for "---paymentRequest:-:paymentRequestTableId---" flex table
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |
