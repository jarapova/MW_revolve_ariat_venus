#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet

Feature: As a customer, I can see my login status at the top of the navigation.
  Navigation - Login Status

BluePlanet: As a customer, if I am logged into the site, I need to see “My Account” instead of “Log In” on the navigation menu link.

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see login status on header
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see login status on the top of hamburger menu
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Logged in user can see correct log in status during browsing mobile site
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Logged in user stays logged in if returns within 14 days
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see login status on the top of hamburger menu
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    When user can see "sign_in_page_content" on sign_in_page
    Then user make login as "rev_test_user"
    And user click hamburger_menu_icon on header
    Then user can see "first_page_header" with value "Hey, leeroyglebchik" on hamburger_menu

  @proj:revolve @automated
  Scenario:[Revolve] Logged in user can see correct log in status during browsing mobile site
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    When user can see "sign_in_page_content" on sign_in_page
    Then user make login as "rev_test_user"
    And user click hamburger_menu_icon on header
    Then user can see "first_page_header" with value "Hey, leeroyglebchik" on hamburger_menu
    And user click "Womens" on hamburger_menu
    And user click "Clothing" on hamburger_menu
    And user click "Activewear" on hamburger_menu
    And user click "View All" on hamburger_menu
    When user click hamburger_menu_icon on header
    And user click "3_back_button" on hamburger_menu
    And user click "2_back_button" on hamburger_menu
    And user click "1_back_button" on hamburger_menu
    Then user can see "first_page_header" with value "Hey, leeroyglebchik" on hamburger_menu

  @proj:revolve @manual
  Scenario:[Revolve] [REV-171] Guest user can see "Hey, sign in…" sign, and logged in user can see "Hey, {username}" sign on hamburger menu
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] [REV-268] After sign in user can see log out link can click every My Revolve menu item on hamburger menu and they lead to correct pages
    Given test steps are under design


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can see login status on header
    Given user make login as "user1"
    When user is on home_page
    And user click my_account_icon on header
    Then user can see "header_account_modal_content" on header

  @proj:venus @manual
  Scenario:[Venus] Logged in user can see correct log in status during browsing mobile site
    Given test steps are under design

  @proj:venus @manual
  Scenario:[Venus] Logged in user stays logged in if returns within 14 days
    Given test steps are under design

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can see login status on the top of hamburger menu
    Given test steps are under design


  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] Logged in user can see correct log in status during browsing mobile site
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] [SCP-85] If user makes login and navigating between PWA and non-PWA pages, user stays logged in.
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see login status on the top of hamburger menu
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] Logged in user can see correct log in status during browsing mobile site
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see login status on the top of hamburger menu
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] Logged in user can see correct log in status during browsing mobile site
    Given test steps are under design