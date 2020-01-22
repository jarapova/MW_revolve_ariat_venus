#Projects:
#@proj:revolve
#@proj:venus
#@proj:ariat
#@proj:blueplanet

Feature: As a customer, I can view a "Size Guide/Size Chart" page
  PDP - Sizing Guide - Information

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see "Size Guide/Size Chart" CTA on PDP page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can tap on "Size Guide/Size Chart" CTA and be navigated to "Size Guide/Size Chart" spreadsheet
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can navigate back to product from "Size Guide/Size Chart" spreadsheets
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @tobeautomated
  Scenario:[Revolve] User can see "Size Guide/Size Chart" CTA on PDP page
    Given test steps are under design

  @proj:revolve @tobeautomated
  Scenario:[Revolve] User can tap on "Size Guide/Size Chart" CTA and be navigated to "Size Guide/Size Chart" spreadsheet
    Given test steps are under design

  @proj:revolve @tobeautomated
  Scenario:[Revolve] User can navigate back to product from "Size Guide/Size Chart" spreadsheets
    Given test steps are under design

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can see "Size Guide/Size Chart" CTA on PDP page
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    Then user can see "size_chart_link" on product_page

  @proj:venus @automated
  Scenario:[Venus] User can tap on "Size Guide/Size Chart" CTA and be navigated to "Size Guide/Size Chart" spreadsheet
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    Then user click "size_chart_link" on product_page
    And user can see "size_chart_page_content" on size_chart_page


  @proj:venus @automated
  Scenario:[Venus] User can navigate back to product from "Size Guide/Size Chart" spreadsheets
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    Then user click "size_chart_link" on product_page
    And user can see "size_chart_page_content" on size_chart_page
    When user click "size_chart_back_button" on size_chart_page
    And user scroll page
    Then user can see "product_page_content" on product_page

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @automated
  Scenario:[Ariat] User can see "Size Guide/Size Chart" CTA on PDP page
    Given user is on "item_with_size_guide" product_page
    When user scroll page
    Then user can see "size_guide_link" on product_page

  @proj:ariat @automated
  Scenario:[Ariat] User can tap on "Size Guide/Size Chart" CTA and be navigated to "Size Guide/Size Chart" spreadsheet
    Given user is on "item_with_size_guide" product_page
    And user scroll page
    When user can see "size_guide_link" on product_page
    And user click "size_guide_link" on product_page
    Then user can see "size_guide_modal_content" on product_page

  @proj:ariat @automated
  Scenario:[Ariat] User can navigate back to product from "Size Guide/Size Chart" spreadsheets
    Given user is on "item_with_size_guide" product_page
    And user scroll page
    When user can see "size_guide_link" on product_page
    Then user click "size_guide_link" on product_page
    And user scroll page
    When user click "close_size_guide_modal_button" on product_page
    Then user can not see "size_guide_modal" on product_page

#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see "Size Guide/Size Chart" CTA on PDP page
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can tap on "Size Guide/Size Chart" CTA and be navigated to "Size Guide/Size Chart" spreadsheet
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can navigate back to product from "Size Guide/Size Chart" spreadsheets
    Given test steps are under design
