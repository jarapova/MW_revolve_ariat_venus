#Projects:
#@proj:revolve

Feature: As a customer, I can read the estimated delivery date message.
  PDP - Estimated Delivery

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see estimated delivery date information on PDP
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see estimated delivery date information on PDP
    Given user is on "item_1" product_page
    When user can see "product_page_content" on product_page
    Then user can see "estimated_delivery_text" on product_page
