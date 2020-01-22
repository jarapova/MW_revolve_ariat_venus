#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet

Feature: As a customer, I can see custom header or footer call to actions in the hamburger menu above the main menu items.
  Navigation - Custom Header/Footer Links
#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User can see custom header or footer call to actions in the hamburger menu above the main menu items
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can navigate to each appropriate page by clicking on custom header or footer call to actions in the hamburger menu above the main menu items
    Given test steps are under design


#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @manual
  Scenario:[Revolve] User can see custom header or footer call to actions in the hamburger menu above the main menu items
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] User can navigate to each appropriate page by clicking on custom header or footer call to actions in the hamburger menu above the main menu items
    Given test steps are under design

    #================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can see custom header or footer call to actions in the hamburger menu above the main menu items
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user can see "hamburger_first_page_content" on hamburger_menu
    And user click "request_a_catalog_on_first_page" on hamburger_menu
    Then user can see "request_a_catalog_page_content" on request_a_catalog_page
    When user is on home_page
    And user click hamburger_menu_icon on header
    When user click "gift_cards_on_first_page" on hamburger_menu
    Then user can see "gift_cards_page_content" on gift_cards_page

  @proj:venus @automated
  Scenario:[Venus] User can navigate to each appropriate page by clicking on custom header or footer call to actions in the hamburger menu above the main menu items
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "request_a_catalog_on_first_page" on hamburger_menu
    Then user can see "request_a_catalog_page_content" on request_a_catalog_page
    When user is on home_page
    And user click hamburger_menu_icon on header
    And user click "gift_cards_on_first_page" on hamburger_menu
    Then user can see "gift_cards_page_content" on gift_cards_page


    #================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can see custom header or footer call to actions in the hamburger menu above the main menu items
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can navigate to each appropriate page by clicking on custom header or footer call to actions in the hamburger menu above the main menu items
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see custom header or footer call to actions in the hamburger menu above the main menu items
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can navigate to each appropriate page by clicking on custom header or footer call to actions in the hamburger menu above the main menu items
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see custom header or footer call to actions in the hamburger menu above the main menu items
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can navigate to each appropriate page by clicking on custom header or footer call to actions in the hamburger menu above the main menu items
    Given test steps are under design