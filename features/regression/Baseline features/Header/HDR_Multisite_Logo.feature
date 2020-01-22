#Projects:
#@proj:revolve
#@proj:ariat

Feature: The PWA will show the correct logo depending on the website being accessed:
  HDR - Multisite Logos

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see the correct logo depending on the website being accessed:
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see the REVOLVEman logo on men's pages.
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @manual
  Scenario:[Revolve] User can see the correct logo depending on the website being accessed:
    Given test steps are under design

  @proj:revolve @automated
  Scenario:[Revolve] User can see the REVOLVEman logo on men's pages.
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Mens" on hamburger_menu
    And user click "Shoes" on hamburger_menu
    And user click "View All" on hamburger_menu
    Then user can see "revolve_man_logo" on header

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @manual
  Scenario:[Ariat] User can see the correct logo depending on the website being accessed:
    Given test steps are under design