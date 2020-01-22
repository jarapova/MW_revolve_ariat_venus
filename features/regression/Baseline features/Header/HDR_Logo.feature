#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I can click on the logo to be taken to the home page.
  HDR - Logo

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User navigated to homepage by clicking logo in header
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User navigated to homepage by clicking logo in header
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    When user click logo_button on header
    Then user can see "home_page_content" on home_page

  @proj:revolve @manual
  Scenario:[Revolve] [REV-247] logo to display REVOLVEman logo on men's pages.
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] [REV-353] Click on logo should close Hamburger menu and Categories drop down
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] [REV-353] Click on Hamburger icon should close categories drop-down menu
    Given test steps are under design

  @proj:revolve @automated
  Scenario:[Revolve][REV-251] User navigated to homepage by clicking logo in header and stays in the same environment
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    And user remember page_url on page
    When user click logo_button on header
    Then user can see "home_page_content" on home_page
    And user can see "page_url" on page

  @proj:revolve @automated
  Scenario:[Revolve][REV-472] When user navigates back from legacy pages he should see correct logo
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Mens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    Then user scroll page
    When user can see "revolve_man_logo" on header
    And user click "favorites_button" on header
    And user go back
    And user scroll page
    Then user can see "revolve_man_logo" on header

  #================================  [Venus]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:venus @automated
  Scenario:[Venus] User navigated to homepage by clicking logo in header
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "about_us_on_first_page" on hamburger_menu
    Then user can see "about_us_page_content" on about_us_page
    And user click logo_button on header
    Then user can see "home_page_content" on home_page

#================================  [ShoeCarnival]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival] User navigated to homepage by clicking logo in header
    Given user is on home_page
    And user can see "home_page_content" on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    Then user click "New Arrivals" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    When user click logo_button on header
    Then user can see "home_page_content" on home_page


#================================  [Stagestores]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User navigated to homepage by clicking logo in header
    Given test steps are under design

#================================  [BluePlanet]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User navigated to homepage by clicking logo in header
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios
#goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] User navigated to homepage by clicking logo in header
    Given user is on home_page
    And user can see "home_page_content" on home_page
    And user remember page_url on page
    When user click hamburger_menu_icon on header
    And user click "Men" on hamburger_menu
    And user click "View all" on hamburger_menu
    Then user can see "product_list_page_content" on subcategory_page
    When user click logo_button on header
    Then user can see "home_page_content" on home_page
    And user can see "page_url" on page

  @proj:ariat @manual
  Scenario:[Ariat] Click on logo should close Hamburger menu and Categories drop down
    Given test steps are under design