#Projects:
#@proj:revolve
#@proj:venus
#@proj:stagestores


Feature: As a customer, I should be able to see the cost summary on the page with the following info:
  Shopping Cart - Cost Summary

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see cost summary of added to cart items
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see Separate Preorder item count and $ onto a separate line under Subtotal both at top and bottom
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see summary cost is changing if user change items quantity or removing items from cart
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see cost summary of added to cart items
    Given user is on "item_1" product_page
    When user can see "product_page_content" on product_page
    And user click "available_size_button" on product_page
    Then user click "add_to_bag_button" on product_page
    When user is on "test_item_2" product_page
    And user can see "product_page_content" on product_page
    And user click "available_size_button" on product_page
    And user click "add_to_bag_button" on product_page
    Then user click view_bag_button on add_to_bag_popup
    And user can see "guest_cart_page_content" on cart_page
    Then user can see "correct_pricing_content" on cart_page

  @proj:revolve @automated
  Scenario:[Revolve] User can see summary cost is changing if user change items quantity or removing items from cart
    Given user is on "item_1" product_page
    When user can see "product_page_content" on product_page
    And user click "available_size_button" on product_page
    Then user click "add_to_bag_button" on product_page
    When user is on "test_item_2" product_page
    And user can see "product_page_content" on product_page
    And user click "available_size_button" on product_page
    And user click "add_to_bag_button" on product_page
    Then user click view_bag_button on add_to_bag_popup
    And user can see "guest_cart_page_content" on cart_page
    Then user can see "correct_pricing_content" on cart_page
    When user set "1_item_qty" with value "5" on cart_page
    Then user can see "1_item_qty" with value "5" on cart_page
    And user can see "correct_pricing_content" on cart_page
    And user click "item_1_remove_button" on cart_page
    And user scroll page
    Then user can see "correct_pricing_content" on cart_page

  @proj:revolve @manual
  Scenario:[Revolve] [REV-258] User can see Separate Preorder item count and $ onto a separate line under Subtotal both at top and bottom
    Given user added preorder and common items to bag
    Then user can see  "Preorder: Estimated Delivery: MMM DD" at item level
    Then user can see "Your preorder item(s) will be charged when shipped."
    Then User can see Separate Preorder item count and $ onto a separate line under Subtotal both at top and bottom


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can see cost summary of added to cart items
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user remember "test_item_1" product parameters on product_page
    And user click add_to_bag_button on product_page
    Then user click cart_icon on header
    And user can see "cart_page_content" on cart_page
    And user can see "test_item_1_hash" on cart_page
    And user can see order_total_value on cart_page

  @proj:venus @automated
  Scenario:[Venus] User can see summary cost is changing if user change items quantity or removing items from cart
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user remember "test_item_1" product parameters on product_page
    And user click add_to_bag_button on product_page
    Then user click cart_icon on header
    And user can see "cart_page_content" on cart_page
    And user can see "test_item_1_hash" on cart_page
    And user can see order_total_value on cart_page
    Then user set "1_item_qty" with value "3" on cart_page
    And user can see order_total_value on cart_page
    When user is on "item_2" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    Then user click cart_icon on header
    And user can see "cart_page_content" on cart_page
    And user can see order_total_value on cart_page
    And user click "1_item_remove_button" on cart_page
    And user can see order_total_value on cart_page
    And user clear cart_page


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see cost summary of added to cart items
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see summary cost is changing if user change items quantity or removing items from cart
    Given test steps are under design