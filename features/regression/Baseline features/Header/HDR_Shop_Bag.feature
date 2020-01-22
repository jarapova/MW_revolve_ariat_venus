#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:ariat

Feature: As a customer, I can click on the shopping bag icon and be taken to the shopping bag page.
  HDR - Shopping Cart - Icon

  This redirection can be changed with mini-cart functionality:
  As a customer, I can click on the shopping bag icon and the mini-cart is displayed.

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Guest user navigated to cart page by clicking shopping bag icon on header
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Logged in user navigated to cart page by clicking shopping bag icon on header
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see number of added to cart items near shopping bag icon on header
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User navigating to empty cart page by taping empty shopping bag icon on header
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Logged in user can see the same number of added to cart items near shopping bag icon on header across all logged in devices
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] Guest user navigated to cart PWA page by clicking shopping bag icon on header and stays in the same environment
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Shoes" on hamburger_menu
    And user click "View All" on hamburger_menu
    Then user click "random_item_name" on subcategory_page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    When user click view_bag_button on add_to_bag_popup
    Then user can see "guest_cart_page_content" on cart_page

  @proj:revolve @automated
  Scenario:[Revolve] Logged in user navigated to PWA cart page by clicking shopping bag icon on header and stays in the same environment
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    And user make login as "rev_test_user"
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Dresses" on hamburger_menu
    And user click "Gowns" on hamburger_menu
    Then user click "random_item_name" on subcategory_page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    When user click view_bag_button on add_to_bag_popup
    Then user can see "logged_in_cart_page_content" on cart_page


  @proj:revolve @automated
  Scenario:[Revolve] User can see number of added to cart items near shopping bag icon on header
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Dresses" on hamburger_menu
    And user click "Gowns" on hamburger_menu
    And user scroll page
    Then user click "random_item_name" on subcategory_page
    And user scroll page
    And user click "available_size_button" on product_page
    When user click add_to_bag_button on product_page
    And user click "close_view_bag_modal_button" on product_page
    Then user can see "cart_icon_items_count" with value "1" on header
    Then user go back
    And user scroll page
    And user click "random_item_name" on subcategory_page
    And user scroll page
    And user click "available_size_button" on product_page
    When user click add_to_bag_button on product_page
    And user click "close_view_bag_modal_button" on product_page
    Then user can see "cart_icon_items_count" with value "2" on header


  @proj:revolve @automated
  Scenario:[Revolve] User navigating to empty cart page by taping empty shopping bag icon on header
    Given user is on home_page
    When user click cart_icon on header
    Then user can see "empty_cart_page_content" on cart_page

  @proj:revolve @manual
  Scenario:[Revolve] Logged in user can see the same number of added to cart items near shopping bag icon on header across all logged in devices
    Given test steps are under design


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User navigated to cart page by clicking shopping bag icon on header
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    And user click cart_icon on header
    Then user can see "cart_page_content" on cart_page

  @proj:venus @automated
  Scenario:[Venus] User can see number of added to cart items near shopping bag icon on header
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    And user can see "cart_icon_items_count" with value "1" on header

  @proj:venus @automated
  Scenario:[Venus] User navigating to empty cart page by taping empty shopping bag icon on header
    Given user is on home_page
    When user click cart_icon on header
    Then user can see "cart_page_content" on cart_page


  @proj:venus @manual
  Scenario:[Venus] Logged in user can see the same number of added to cart items near shopping bag icon on header across all logged in devices
    Given test steps are under design


#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival] User can see number of added to cart items near shopping bag icon on header
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    Then user can see "product_list_page_content" on subcategory_page
    When user click "random_item_name" on subcategory_page
    And user can see "product_page_content" on product_page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    Then user can see "cart_items_count" with value "1" on header

  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival] User navigating to empty cart page by taping empty shopping bag icon on header
    Given user is on home_page
    When user click "cart_icon" on header
    Then user can see "empty_cart_page_content" on cart_page


  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival] Logged in user can see the same number of added to cart items near shopping bag icon on header across all logged in devices
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] Guest user navigated to cart page by clicking shopping bag icon on header
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] Logged in user navigated to cart page by clicking shopping bag icon on header
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see number of added to cart items near shopping bag icon on header
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User navigating to empty cart page by taping empty shopping bag icon on header
    Given test steps are under design

  @proj:stagestores @manual
  Scenario:[Stagestores] Logged in user can see the same number of added to cart items near shopping bag icon on header across all logged in devices
    Given test steps are under design

#================================  [BluePlanet]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] Guest user see mini-cart by clicking shopping bag icon on header
    Given test steps are under design


#================================  [Ariat]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios
#Need to be automated if possible
#goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] Guest user navigated to cart page by clicking shopping bag icon on header
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Women" on hamburger_menu
    And user click "Clothing" on hamburger_menu
    And user click "Tops & Tees" on hamburger_menu
    Then user click "View all" on hamburger_menu
    And user scroll page
    When user click "random_item_name" on subcategory_page
    And user scroll page
    And user click "available_size_button" on product_page
    Then user click add_to_bag_button on product_page
    When user click cart_icon on header
    Then user can see "guest_cart_page_content" on cart_page
#goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] Logged in user navigated to cart page by clicking shopping bag icon on header
    Given user is on home_page
    And user click hamburger_menu_icon on header
    When user click "Sign in" on hamburger_menu
    Then user make login as "user1"
    Given user is on "item_1" product_page
    And user scroll page
    When user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    And user click cart_icon on header
    Then user can see "logged_in_cart_page_content" on cart_page
#goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] User can see number of added to cart items near shopping bag icon on header
    Given user is on "item_1" product_page
    And user scroll page
    When user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    Then user can see "cart_items_count" with value "1" on header
#goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] User navigating to empty cart page by taping empty shopping bag icon on header
    Given user is on home_page
    When user click cart_icon on header
    Then user can see "empty_cart_page_content" on cart_page

  @proj:ariat @manual
  Scenario:[Ariat] Logged in user can see the same number of added to cart items near shopping bag icon on header across all logged in devices
    Given test steps are under design