#Projects:
#@proj:revolve
#@proj:venus
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I will be suggested to sign-in when I attempt to favorite a product without signing in on PDP.
  PDP - Add to Favorites - Sign-in Modal
  #Revolve: I will be suggested to sign-in  in sign-in modal
  #Venus: I will be suggested to sign-in  on sign-in page

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Guest user is suggested to sign-in after taping on "favorites" button on PDP page
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] Guest user is suggested to sign-in after taping on "favorites" button on PDP page
    Given user is on "item_1" product_page
    When user can see "product_page_content" on product_page
    Then user click "favorites_button" on product_page
    And user can see "account_modal_content" on product_page

  @proj:revolve @automated
  Scenario:[Revolve][REV-237]Logged-in user signs out and then after trying to favorite product on PDP should be suggested to sign in
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    When user can see "sign_in_page_content" on sign_in_page
    Then user make login as "rev_test_user"
    When user is on "item_1" product_page
    And user can see "product_page_content" on product_page
    And user click hamburger_menu_icon on header
    And user click "My Revolve" on hamburger_menu
    And user click "Sign Out" on hamburger_menu
    When user can see "product_page_content" on product_page
    And user click "favorites_button" on product_page
    Then user can see "sign_in_modal_content" on cart_page


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] Guest user is suggested to sign-in after taping on "favorites" button on PDP page
    Given user is on "item_1" product_page
    And user scroll page
    When user can see "product_page_content" on product_page
    Then user click "available_size_button" on product_page
    When user click "wishlist_button" on product_page
    Then user can see "sign_in_page_content" on sign_in_page


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] Guest user is suggested to sign-in after taping on "favorites" button on PDP page
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] Guest user is suggested to sign-in after taping on "favorites" button on PDP page
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @automated
  Scenario:[Ariat] Guest user is suggested to sign-in after taping on "favorites" button on PDP page
    Given user is on "item_with_no_size" product_page
    When user scroll page
    Then user can see "favorite_button" on product_page
    And user remember page_url on page
    When user click "favorite_button" on product_page
    Then user can see "sign_in_page_content" on sign_in_page
    And user can see "page_url" on page