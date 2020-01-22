#Projects:
#@proj:revolve
#@proj:venus
#@proj:stagestores

Feature: As a customer, I want to see appropriate content on empty cart page
  Shopping Cart - Empty Cart
#Venus: "Continue shopping" button
#Revolve: "Shop mens" button, "Shop womens" button, "Recently viewed" carousel, "Sign in" link (for guest user)

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see appropriate content on empty cart page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] "Continue shopping" button navigates to home page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] "Shop mens" button navigates to home page with mens content
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] "Shop womens" button navigates to home page with womens content
    Given test steps are under design


  @proj:baseline
  Scenario:[Baseline] Guest user can navigate to sign in page using "Sign in" link
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Guest user can see "Best Sellers" carousel and navigate to expected PDP
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see appropriate content on empty cart page
    Given user is on home_page
    When user click cart_icon on header
    Then user can see "empty_cart_page_content" on cart_page

  @proj:revolve @manual
  Scenario:[Revolve] [REV-212] User can see "Continue shopping" button on empty cart page
    Given test steps are under design

  @proj:revolve @automated
  Scenario:[Revolve] "Shop mens" button navigates to home page with mens content
    Given user is on home_page
    And user click cart_icon on header
    When user click "shop_mens_button" on cart_page
    And user scroll page
    Then user can see "mens_home_page_content" on home_page
    And user can see "revolve_man_logo" on header


  @proj:revolve @automated
  Scenario:[Revolve] "Shop womens" button navigates to home page with womens content
    Given user is on home_page
    And user click cart_icon on header
    When user click "shop_womens_button" on cart_page
    Then user can see "home_page_content" on home_page

  @proj:revolve @automated
  Scenario:[Revolve] Guest user can navigate to sign in page using "Sign in" link
    Given user is on home_page
    And user click cart_icon on header
    And user scroll page
    When user click "sign_in_link" on cart_page
    Then user can see "my_account_sign_in_content" on sign_in_page

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can see appropriate content on empty cart page
    Given user is on home_page
    When user click cart_icon on header
    Then user can see "cart_page_content" on cart_page

  @proj:venus @automated
  Scenario:[Venus] "Continue shopping" button navigates to home page
    Given user is on home_page
    When user click cart_icon on header
    Then user can see "cart_page_content" on cart_page
    When user click "continue_shopping_button" on cart_page
    Then user can see "home_page_content" on home_page


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see appropriate content on empty cart page
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] Guest user can see "Best Sellers" carousel and navigate to expected PDP
    Given test steps are under design