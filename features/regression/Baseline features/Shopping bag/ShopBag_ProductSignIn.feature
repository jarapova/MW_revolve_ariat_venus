#Projects:
#@proj:revolve

Feature: As a customer, I will see a sign-in modal window when I attempt to favorite a product without signing in.
  Shopping Cart - Sign In Prompt

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Guest user is suggested to sign-in if attempting to favorite a product without signing in.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Guest user make sign-in when attempting to favorite a product without signing in.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Guest user can close sign-in modal by click 'No, thanks' link if attempting to favorite a product without signing in.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Guest user can close sign-in modal by click on the greyed out area outside of the sign in / sign up modal
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @tobeautomated
  Scenario:[Revolve] Guest user is suggested to sign-in if attempting to favorite a product without signing in.
      No more move to favorites button for Guest
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Dresses" on hamburger_menu
    And user click "Gowns" on hamburger_menu
    Then user click "random_item_name" on subcategory_page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    And user click cart_icon on header
    And user can see "guest_cart_page_content" on cart_page
    When user click "item_1_move_to_favorites_button" on cart_page
    Then user can see "sign_in_modal_content" on cart_page

  @proj:revolve @tobeautomated
  Scenario:[Revolve] Guest user make sign-in when attempting to favorite a product without signing in.
      No more move to favorites button for Guest
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Dresses" on hamburger_menu
    And user click "Gowns" on hamburger_menu
    Then user click "random_item_name" on subcategory_page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    And user click cart_icon on header
    And user click "item_1_move_to_favorites_button" on cart_page
    When user can see "sign_in_modal_content" on cart_page
    Then user click "create_or_sign_in_button" on sign_in_modal
    And user can see "my_account_sign_in_content" on sign_in_page
    And user make login as "rev_test_user"
    Then user can see "logged_in_cart_page_content" on cart_page

  @proj:revolve @tobeautomated
  Scenario:[Revolve] Guest user can close sign-in modal by click 'No, thanks' link if attempting to favorite a product without signing in.
      No more move to favorites button for Guest
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Dresses" on hamburger_menu
    And user click "Gowns" on hamburger_menu
    Then user click "random_item_name" on subcategory_page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    And user click cart_icon on header
    And user click "item_1_move_to_favorites_button" on cart_page
    When user can see "sign_in_modal_content" on cart_page
    Then user click "refuse_button" on sign_in_modal
    And user can see "sign_in_modal_closed" on cart_page

  @proj:revolve @tobeautomated
  Scenario:[Revolve] Guest user can close sign-in modal by click on the greyed out area outside of the sign in / sign up modal
      No more move to favorites button for Guest
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Dresses" on hamburger_menu
    And user click "Gowns" on hamburger_menu
    Then user click "random_item_name" on subcategory_page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    And user click cart_icon on header
    And user click "item_1_move_to_favorites_button" on cart_page
    And user can see "sign_in_modal_content" on cart_page
    When user click "grey_aura_outside" on sign_in_modal
    Then user can see "sign_in_modal_closed" on cart_page
