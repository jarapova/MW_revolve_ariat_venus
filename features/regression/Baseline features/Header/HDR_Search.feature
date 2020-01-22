#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I can click on the search icon to display the search input field.
  HDR - Search - Icon

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User opening search modal by taping search icon on header
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can close search modal
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Search button on Perfect proxy pages should work
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User opening search modal by taping search icon on header
    Given user is on home_page
    When user click search_icon on header
    Then user can see "search_modal_content" on search_modal

  @proj:revolve @automated
  Scenario:[Revolve] User can close search modal
    Given user is on home_page
    When user click search_icon on header
    Then user can see "search_modal_content" on search_modal
    When user close search_modal
    Then user can see "home_page_content" on home_page

  @proj:revolve @manual
  Scenario:[Revolve][REV-406] When user click on search icon, it shouldn't animate the search field to fly from bottom of the page to the top
    Given test steps are under design


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:venus @automated
  Scenario:[Venus] User opening search modal by taping search icon on header
    Given user is on home_page
    And user click search_icon on header
    Then user can see "search_modal_content" on search_modal

  @proj:venus @automated
  Scenario:[Venus] User can close search modal
    Given user is on home_page
    And user click search_icon on header
    And user can see "search_modal_content" on search_modal
    Then user close search_modal
    And user can see "home_page_content" on home_page

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival] User opening search modal by taping search icon on header
    Given user is on home_page
    When user click search_icon on header
    And user fill search_field with value "Pri" on search_modal
    Then user can see "search_modal" on header

  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival] User can close search modal
    Given user is on home_page
    And user click "search_icon" on header
    When user close search_modal
    Then user can not see "search_modal" on header

  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival][SCP-139] Search button on Perfect proxy pages should work
    Given test steps are under design

     @proj:shoecarnival @manual
  Scenario:[ShoeCarnival][SCP-160] On "No Results" page - new crazy search should update page. Due to it, user cant suggest that search is working.
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User opening search modal by taping search icon on header
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can close search modal
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User opening search modal by taping search icon on header
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can close search modal
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible
#good
  @proj:ariat @automated
  Scenario:[Ariat] User opening search modal by taping search icon on header
    Given user is on home_page
    And user scroll page
    When user click search_icon on header
    And user can see "empty_search_modal_content" on search_modal
    Then user fill search_field with value "Hello" on search_modal
#good
  @proj:ariat @automated1
  Scenario:[Ariat] User can close search modal
    Given user is on home_page
    When user click search_icon on header
    And user click "clear_button" on search_modal
    Then user can not see "search_modal" on page
    And user click hamburger_menu_icon on header

  @proj:ariat @manual
  Scenario:[Ariat] Search button on Perfect proxy pages should work
    Given test steps are under design
