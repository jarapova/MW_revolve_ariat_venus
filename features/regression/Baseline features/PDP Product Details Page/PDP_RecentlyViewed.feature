#Projects:
#@proj:revolve
#@proj:venus
#@proj:ariat

Feature: As a customer, I should be able to view "Recently Viewed" section of a product
  PDP - Recently Viewed

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see "Recently viewed" carousel with products recently viewed
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can swipe "Recently Viewed" product carousel and be navigated to related PDP by taping on product image
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can click "Recently Viewed" tab and navigate to product page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see "Recently Viewed" tab on PDP and navigate to product page
    Given test steps are under design


#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:revolve @automated
  Scenario:[Revolve] User can see "Recently viewed" carousel with products recently viewed
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    Then user make login as "rev_test_user"
    And user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    When user click "random_item_name" on subcategory_page
    And user can see "product_page_content" on product_page
    Then user remember "test_item_1" product parameters on product_page
    When user is on home_page
    And user scroll to the bottom of page
    Then user can see "recently_viewed_content" on home_page
    And user can see "test_item_1" on recently_viewed_section

  @proj:revolve @automated
  Scenario:[Revolve] User can swipe "Recently Viewed" product carousel and be navigated to related PDP by taping on product image
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    Then user make login as "rev_test_user"
    And user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    And user scroll page
    Then user click logo_button on header
    And user can see "recently_viewed_content" on home_page
    Then user click "random_recently_viewed_item" on home_page
    And user can see "product_page_content" on product_page

  @proj:revolve @automated
  Scenario:[Revolve] User can see "Recently Viewed" tab on PDP and navigate to product page
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    Then user make login as "rev_test_user"
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    And user scroll page
    Then user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Bags" on hamburger_menu
    And user click "View All" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    And user scroll page
    And user can see "recently_viewed_content" on product_page



#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:venus @automated
  Scenario:[Venus] User can see "Recently viewed" carousel with products recently viewed
    Given user is on "item_2" product_page
    And user scroll page
    When user can see "product_page_content" on product_page
    Then user remember "test_item_2" product parameters on product_page
    And user can see "product_page_content" on product_page
    When user is on "item_1" product_page
    And user scroll page
    And user click "recently_viewed_btn" on product_page
    Then user can see "recently_viewed_item_name" with value "test_item_2_name" on product_page

  @proj:venus @automated
  Scenario:[Venus] User can click "Recently Viewed" tab and navigate to product page
    Given user is on "item_2" product_page
    And user scroll page
    When user can see "product_page_content" on product_page
    Then user remember "test_item_2" product parameters on product_page
    And user can see "product_page_content" on product_page
    When user is on "item_1" product_page
    And user scroll page
    And user click "recently_viewed_btn" on product_page
    Then user can see "recently_viewed_item_name" with value "test_item_2_name" on product_page
    When user click "recently_viewed_item_image" on product_page
    And user scroll page
    Then user can see "product_page_content" on product_page

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @automated
  Scenario:[Ariat] User can see "Recently viewed" carousel with products recently viewed
    Given user is on "item_with_no_size" product_page
    And user scroll page
    And user remember "item_name_for_rv" on product_page
    And user is on "item_with_width_and_size" product_page
    And user scroll page
    And user remember "item_name_for_rv" on product_page
    When user is on "item_1" product_page
    Then user can see "recently_viewed_content" on product_page
    And user can see "remembered_items_names" on product_page

  @proj:ariat @manual
  Scenario:[Ariat] User can swipe "Recently Viewed" product carousel and be navigated to related PDP by taping on product image
    Given test steps are under design

  @proj:ariat @tobeautomated
  Scenario:[Ariat] User can click "Recently Viewed" tab and navigate to product page
    Given test steps are under design

  @proj:ariat @automated
  Scenario:[Ariat] User can see "Recently Viewed" tab on PDP and navigate to product page
    Given user is on "item_with_no_size" product_page
    And user scroll page
    And user remember "item_name_for_rv" on product_page
    And user is on "item_with_width_and_size" product_page
    And user scroll page
    And user remember "item_name_for_rv" on product_page
    When user is on "item_1" product_page
    Then user can see "recently_viewed_content" on product_page
    When user click "random_recently_viewed_item" on product_page
    Then user can see "product_page_content" on product_page