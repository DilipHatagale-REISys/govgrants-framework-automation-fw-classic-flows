@ReportAnalysis
Feature: Validate report analysis

  @copyfile
Scenario: Copy file
    When We copy data from "c:\Jenkins\workspace\product-automation-application\target\cucumber-report" and generate report to "c:\Jenkins\workspace\product-automation-application\target\ReportAnalysis"
#When We copy data from "D:\rei proj\product_automation\govgrants-product-automation\target\cucumber-report" and generate report to "D:\rei proj\product_automation"