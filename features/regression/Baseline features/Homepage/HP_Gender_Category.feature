#Projects:
#@proj:revolve

Feature: As a customer, I should be able to view the "Mens" and "Womens" versions of the home page content.
  HP - Categories

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see "Mens" version of the home page content
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see "Womens" version of the home page content
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:revolve @automated
  Scenario:[Revolve] User can see "Mens" version of the home page content
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Mens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    Then user click logo_button on header
    When user can see "revolve_man_logo" on header
    Then user can see "mens_home_page_content" on home_page


  @proj:revolve @automated
  Scenario:[Revolve] User can see "Womens" version of the home page content
    Given user is on home_page
    Then user can see "home_page_content" on home_page
