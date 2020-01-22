#Projects:
#@proj:revolve

Feature: As a customer, I can click on the Afterpay question mark to display a modal window with information about this payment option.
  Shopping Cart - Checkout - Afterpay Info

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User click on the Afterpay question mark to display a modal window with information about this payment option.
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User click on the Afterpay question mark to display a modal window with information about this payment option.
    Given user is on "test_item" product_page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    And user click "add_to_bag_button" on product_page
    And user click view_bag_button on add_to_bag_popup
    Then user can see "guest_cart_page_content" on cart_page
    And user can see "afterpay_content" on cart_page
    And user click "afterpay_question_button" on cart_page
    Then user can see "afterpay_modal_content" on cart_page