#Projects:
#@proj:revolve

Feature: As a customer, I can see a message on how many installments I would have to pay via Afterpay on PDP
  US and AU only
  User will see the afterpay logo next to all products that are eligible for Afterpay.
  On the PDP, all products $35.00 - $1,000.00 are eligible for Afterpay.
  Preorder items are not eligible.

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User can see information about how many installments User would have to pay via Afterpay on PDP
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User click on the Afterpay question mark on PDP to display a modal window with information about this payment option.
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see information about how many installments User would have to pay via Afterpay on PDP
    Given user is on "test_item_2" product_page
    When user can see "product_page_content" on product_page
    Then user can see "afterpay_content" on cart_page

  @proj:revolve @automated
  Scenario:[Revolve] User click on the Afterpay question mark on PDP to display a modal window with information about this payment option.
    Given user is on "test_item" product_page
    And user can see "product_page_content" on product_page
    When user can see "afterpay_content" on product_page
    And user click "afterpay_question_button" on product_page
    Then user can see "afterpay_modal_content" on product_page