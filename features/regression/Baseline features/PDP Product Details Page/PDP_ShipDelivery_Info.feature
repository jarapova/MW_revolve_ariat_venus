#Projects:
#@proj:revolve
#@proj:shoecarnival

Feature: As a customer, I should be able to check "Shipping & Delivery" section as a modal with static content structured as accordion
  PDP - Free Shipping & Returns

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see "Shipping&Delivery" information as a modal by taping "Shipping&Delivery" CTA on product page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can chose "Ship to..." or "Pick up in store" option according to product availability
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can change the store for pickup. Store will be updated on PDP
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can change the store for pickup two times on the same PDP
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see whether or not the product is available at the selected store
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see "Shipping&Delivery" information as a modal by taping "Shipping&Delivery" CTA on product page
    Given user is on "item_1" product_page
    When user can see "product_page_content" on product_page
    Then user click "free_shipping_and_returns_accordion" on product_page
    And user can see "shipping_content" on product_page
    When user click "view_full_shipping_details" on product_page
    Then user can see "shipping_delivery_content" on shipping_and_delivery_page


#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can chose "Ship to..." or "Pick up in store" option according to product availability
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-215][SCP-225] User can Select "Buy online, pick up in store"
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] On the PDP page ship it method should be select by default
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can change the store for pickup. Store will be updated on PDP
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can change the store for pickup two times on the same PDP
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can see whether or not the product is available at the selected store
    Given test steps are under design