#Projects:
#@proj:ariat

Feature: As a customer, I can see other site brands available to navigate through the navigation menu.
  Navigation - Site Selector


#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can switch between other site brands from hamburger menu
    Given test steps are under design



 #================================  [Ariat]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios
#Need to be automated if possible
#goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] User can switch between other site brands from hamburger menu
    Given user is on home_page
    And user click hamburger_menu_icon on header
    When user click "two_24_button" on hamburger_menu
    Then user can see "two_24_home_page_content" on home_page