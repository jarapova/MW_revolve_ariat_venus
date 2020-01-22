#Projects:
#@proj:revolve

Feature: As a customer, I can click on the "PayPal Checkout" button and be directed to the PayPal payment process.
  Shopping Cart - Checkout - Paypal
#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios



  @proj:baseline
  Scenario:[Baseline] User click on the "PayPal Checkout" button and directed to the PayPal payment process.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can navigate back to cart page from PayPal Checkout
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:revolve @manual
  Scenario:[Revolve] User click on the "PayPal Checkout" button and directed to the PayPal payment process.
    Given user is on "item_1" product_page
    And user scroll page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    Then user click cart_icon on header
    When user can see "guest_cart_page_content" on cart_page
    And user click "paypal_button" on cart_page
    And user can see "paypal_content" on cart_page


  @proj:revolve @manual
  Scenario:[Revolve] User can navigate back to cart page from PayPal Checkout
    Given test steps are under design
