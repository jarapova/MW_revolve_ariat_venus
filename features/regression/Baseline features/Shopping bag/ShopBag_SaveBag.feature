#Projects:
#@proj:revolve

Feature: As a customer, I can save my bag for later if I'm signed in by clicking on the appropriate link.
  Shopping Cart - Save Bag
#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios



  @proj:baseline
  Scenario:[Baseline] Logged in User can save his bag for later if I'm signed in by clicking on the appropriate link.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Guest user should to sign-in if attempting to save his bag
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User checks that cart merging is correct after adding same item before and after authorization
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User checks that cart merging is correct after adding items before and after authorization
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] Logged in User can save his bag for later if I'm signed in by clicking on the appropriate link.
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Clothing" on hamburger_menu
    And user click "Activewear" on hamburger_menu
    And user click "View All" on hamburger_menu
    Then user can see "product_list_page_content" on subcategory_page
    When user click "random_item_name" on subcategory_page
    And user can see "product_page_content" on product_page
    And user click "available_size_button" on product_page
    And user click "add_to_bag_button" on product_page
    Then user click view_bag_button on add_to_bag_popup
    When user can see "guest_cart_page_content" on cart_page
    And user remember "cart_items_names" on cart_page
    Then user click "sign_in_link" on cart_page
    When user make login as "rev_test_user"
    And user can see "review_bag_banner" on cart_page
    Then user can see "logged_in_cart_page_content" on cart_page
    And user can see "remembered_cart_items_names" on cart_page



  @proj:revolve @automated
  Scenario:[Revolve] Guest user should sign-in if attempting to save his bag
    Given user is on home_page
    When user click cart_icon on header
    And user can see "empty_cart_page_content" on cart_page
    Then user click "sign_in_link" on cart_page
    When user make login as "rev_user_with_items"
    Then user can see "logged_in_cart_page_content" on cart_page


  @proj:revolve @automated
  Scenario:[Revolve] User checks that cart merging is correct after adding items before and after authorization
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    Then user make login as "rev_test_user"
    And user click cart_icon on header
    Given user is on "item_1" product_page
    When user can see "product_page_content" on product_page
    And user click "available_size_button" on product_page
    And user remember "product_main_text" on product_page
    And user click "add_to_bag_button" on product_page
    And user click view_bag_button on add_to_bag_popup
    And user can see "remembered_product_main_text" on cart_page

  @proj:revolve @manual
  Scenario:[Revolve][REV-244] User makes login from Cart page and after that user should stay logged-in on another revolve pages
    Given test steps are under design