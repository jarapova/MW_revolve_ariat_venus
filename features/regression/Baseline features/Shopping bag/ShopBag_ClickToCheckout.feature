#Projects:
#@proj:revolve
#@proj:venus
#@proj:stagestores
#@proj:ariat

Feature: As a customer, I can proceed to checkout by clicking an appropriate button.
  Shopping Cart - Checkout
#Venus: "Shipping" = "Delivery"

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can proceed to checkout with item in cart by taping appropriate CTA button
    Given test steps are under design


  @proj:baseline
  Scenario:[Baseline] User can navigate back to cart page from checkout
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Logged in user navigated to "Delivery" checkout page by taping appropriate CTA button on cart page
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated @flaky
  Scenario:[Revolve] Guest user can proceed to checkout with item in cart by taping appropriate CTA button
      checkout page still is not PWA page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Dresses" on hamburger_menu
    And user click "Gowns" on hamburger_menu
    And user click "random_item_name" on subcategory_page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    And user click view_bag_button on add_to_bag_popup
    When user can see "guest_cart_page_content" on cart_page
    And user click "checkout_button_1" on cart_page
    Then user can see "guest_checkout_page_content" on checkout_page

  @proj:revolve @automated @flaky
  Scenario:[Revolve] Logged-in user can proceed to checkout with item in cart by taping appropriate CTA button
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    When user can see "sign_in_page_content" on sign_in_page
    Then user make login as "rev_test_user"
    When user is on "item_1" product_page
    Then user can see "product_page_content" on product_page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    And user click view_bag_button on add_to_bag_popup
    When user can see "logged_in_cart_page_content" on cart_page
    And user click "checkout_button_2" on cart_page
    Then user can see "checkout_content" on checkout_page

  @proj:revolve @automated @flaky
  Scenario:[Revolve] User can navigate back to cart page from checkout
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Dresses" on hamburger_menu
    And user click "Gowns" on hamburger_menu
    And user scroll page
    Then user click "random_item_name" on subcategory_page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    And user click view_bag_button on add_to_bag_popup
    And user can see "guest_cart_page_content" on cart_page
    And user click "checkout_button_1" on cart_page
    And user can see "guest_checkout_page_content" on checkout_page
    When user go back
    Then user can see "guest_cart_page_content" on cart_page

  @proj:revolve @automated @flaky
  Scenario:[Revolve] Logged in user navigated to "Delivery" checkout page by taping appropriate CTA button on cart page without ask for sign in
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    When user can see "sign_in_page_content" on sign_in_page
    Then user make login as "rev_test_user"
    And user is on "test_item" product_page
    When user can see "product_page_content" on product_page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    And user click view_bag_button on add_to_bag_popup
    And user can see "logged_in_cart_page_content" on cart_page
    And user click "checkout_button_2" on cart_page
    And user can see "checkout_content" on checkout_page

  @proj:revolve @automated @flaky
  Scenario:[Revolve][REV-333] User should stay on same environment after Sign-in with "Sign-in for faster checkout" button
    Given user is on "item_1" product_page
    And user scroll page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    When user click view_bag_button on add_to_bag_popup
    And user can see "guest_cart_page_content" on cart_page
    And user remember page_url on page
    And user click "sign_in_button" on cart_page
    And user make login as "rev_test_user"
    And user can see "page_url" on page

  @proj:revolve @automated @flaky
  Scenario:[Revolve][REV-305] No "Proceed to checkout" button in the bottom of the "Shopping bag" page for Guest user
    Given user is on "test_item_2" product_page
    And user scroll page
    When user click "available_size_button" on product_page
    Then user click add_to_bag_button on product_page
    And user click view_bag_button on add_to_bag_popup
    When user can see "guest_cart_page_content" on cart_page
    Then user can not see "checkout_button_2" on cart_page

  @proj:revolve @automated @flaky
  Scenario:[Revolve][REV-278] User can proceed to checkout after sign in using using "Save your bag"
    Given user is on "item_1" product_page
    When user scroll page
    And user click "available_size_button" on product_page
    Then user click add_to_bag_button on product_page
    And user click view_bag_button on add_to_bag_popup
    When user can see "guest_cart_page_content" on cart_page
    Then user click "sign_in_link" on cart_page
    When user make login as "rev_test_user"
    Then user can see "logged_in_cart_page_content" on cart_page
    When user click "checkout_button_2" on cart_page
    Then user can see "checkout_content" on checkout_page

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can proceed to checkout with item in cart by taping appropriate CTA button
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user remember "test_item_1" product parameters on product_page
    And user click add_to_bag_button on product_page
    Then user click view_bag_button on add_to_bag_popup
    And user can see "cart_page_content" on cart_page
    And user can see "test_item_1_hash" on cart_page
    Then user click "checkout_btn_1" on cart_page
    And user can see "checkout_page_content" on checkout_page

  @proj:venus @automated
  Scenario:[Venus] User can navigate back to cart page from checkout
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user remember "test_item_1" product parameters on product_page
    And user click add_to_bag_button on product_page
    Then user click view_bag_button on add_to_bag_popup
    And user can see "cart_page_content" on cart_page
    And user can see "test_item_1_hash" on cart_page
    Then user click "checkout_btn_1" on cart_page
    And user can see "checkout_page_content" on checkout_page
    When user go back
    Then user can see "product_page_content" on cart_page

  @proj:venus @automated
  Scenario:[Venus] Logged in user navigated to "Delivery" checkout page by taping appropriate CTA button on cart page
    Given user make login as "user1"
    And user is on "Color_skinny_jeans" product_page
    And user scroll page
    When user click "available_waist_size_button" on product_page
    And user click "item_color_BLACK DENIM(BKDE)" on product_page
    And user click "inseam_size_button_regular" on product_page
    Then user can see "is_in_stock_text" on product_page
    And user click add_to_bag_button on product_page
    Then user click view_bag_button on add_to_bag_popup
    And user can see "checkout_page_content" on checkout_page
    And user can see "color_skinny_jeans" on checkout_page



#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can proceed to checkout with item in cart by taping appropriate CTA button
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can navigate back to cart page from checkout
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] Logged in user navigated to "Delivery" checkout page by taping appropriate CTA button on cart page
    Given test steps are under design


#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival]  User can proceed to checkout with item in cart by taping appropriate CTA button
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival]  There are different options for checkout. Apple Pay, Paypal and common Checkout button.
    Given test steps are under design


#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @automated
  Scenario:[Ariat] User can proceed to checkout with item in cart by taping appropriate CTA button
    Given user is on "item_with_no_size" product_page
    And user scroll page
    And user remember page_url on page
    When user click add_to_bag_button on product_page
    And user click view_bag_button on add_to_bag_popup
    Then user can see "guest_cart_page_content" on cart_page
    When user click "checkout_button" on cart_page
    Then user can see "checkout_content" on checkout_page
    And user can see "page_url" on page


  @proj:ariat @manual
  Scenario:[Ariat] There are different options for checkout. Apple Pay, Paypal and common Checkout button.
    Given test steps are under design