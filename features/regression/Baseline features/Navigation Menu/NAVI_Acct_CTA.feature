#Projects:
#@proj:shoecarnival
#@proj:stagestores
#@proj:revolve

Feature: As a customer, I can see a link to my account at the top of the navigation.
  Navigation - Account Link


#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] Logged in user can see a link to my account at the top of the navigation.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Guest user can make sign in from my account at the top of the navigation.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Guest user can make sign up from my account at the top of the navigation.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Logged in user can make sign out from my account at the top of the navigation.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] After Sign in/Sign up user stays on the same environment
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @tobeautomated
  Scenario:[Revolve] Logged in user can see a link to my account at the top of the navigation.
    Given test steps are under design

  @proj:revolve @automated
  Scenario:[Revolve] Guest user can make sign in from my account at the top of the navigation.
    Given user is on home_page
    When user click hamburger_menu_icon on header
    Then user click "sign_in_button" on hamburger_menu
    When user can see "sign_in_page_content" on sign_in_page
    Then user make login as "rev_test_user"

  @proj:revolve @manual
  Scenario:[Revolve] Guest user can make sign up from my account at the top of the navigation.
    Given test steps are under design

  @proj:revolve @tobeautomated
  Scenario:[Revolve] Logged in user can make sign out from my account at the top of the navigation.
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve][REV-364] When user make Sign In from proxied page in Hamburger he should stay in the same environment
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve][REV-381] User can see "Sign in" block in Hamburger menu during surfing on site, and it loads fast with all content
    Given test steps are under design


#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] Logged in user can see a link to my account at the top of the navigation.
      Account Link is visible for the customer to click
      Clicking on the link will take me to login / signup
      If I'm already logged in, it should appear as Hi, [first name]
    Given user is on home_page
    And user scroll page
    When user click "account_icon" on header
    And user make login as "user1"
    Then user is on home_page
    When user click hamburger_menu_icon on header
    Then user can see "welcome_text" on hamburger_menu

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] Guest user can make sign in from my account at the top of the navigation.
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] Guest user can make sign up from my account at the top of the navigation.
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] Logged in user can make sign out from my account at the top of the navigation.
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] After Sign in/Sign up user stays on the same environment
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] Logged in user can see a link to my account at the bottom of the navigation.
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] Guest user can make sign in from my account at the bottom of the navigation.
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] Guest user can make sign up from my account at the bottom of the navigation.
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] Logged in user can make sign out from my account at the bottom of the navigation.
    Given test steps are under design


