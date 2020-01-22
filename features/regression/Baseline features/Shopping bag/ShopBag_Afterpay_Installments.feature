#Projects:
#@proj:revolve

Feature: As a customer, I can see a message on how many installments I would have to pay via Afterpay.
  Shopping Cart - Checkout - Afterpay Installments

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see information about how many installments User would have to pay via Afterpay
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see information about how many installments User would have to pay via Afterpay
    Given user is on "test_item_2" product_page
    When user can see "product_page_content" on product_page
    And user click "available_size_button" on product_page
    And user click "add_to_bag_button" on product_page
    Then user click view_bag_button on add_to_bag_popup
    When user can see "guest_cart_page_content" on cart_page
    Then user can see "afterpay_content" on cart_page