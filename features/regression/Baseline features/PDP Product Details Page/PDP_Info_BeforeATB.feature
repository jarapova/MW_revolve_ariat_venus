#Projects:
#@proj:shoecarnival
#@proj:revolve
#@proj:venus
#@proj:stagestores
#@proj:ariat

Feature: As a customer, I can see information to know that I need to select a size and color before adding the product to my shopping bag.
  PDP - Add to Cart - Prompt

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] user can see message to select a size before adding the product to my shopping bag
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] user can see message to select color before adding the product to my shopping bag
    Given test steps are under design


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @manual
  Scenario:[Venus] user can see message to select a size before adding the product to my shopping bag
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:revolve @automated
  Scenario:[Revolve] user can see message to select a size before adding the product to my shopping bag
    Given user is on "item_1" product_page
    And user scroll page
    When user click add_to_bag_button on product_page
    Then user can see "select_a_size_message" on product_page

  @proj:revolve @tobeautomated
  Scenario:[Revolve] user can see message to select color before adding the product to my shopping bag
    Given test steps are under design

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  #size and color selected by default


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] user can see message to select a size before adding the product to my shopping bag
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @automated
  Scenario:[Ariat] user can see message to select a size before adding the product to my shopping bag
    Given user is on "item_with_width_and_size" product_page
    When user scroll page
    Then user can see "select_width_message" on product_page
    When user click "available_width_button" on product_page
    And user scroll page
    Then user can see "select_size_message" on product_page
    When user is on "item_with_waist_and_length" product_page
    And user scroll page
    Then user can see "select_waist_message" on product_page
    When user click "available_waist_button" on product_page
    And user scroll page
    Then user can see "select_length_message" on product_page


  @proj:ariat @automated
  Scenario:[Ariat] user can see message to select color before adding the product to my shopping bag
    Given user is on "item_1_no_color" product_page
    When user scroll page
    Then user can see "select_color_message" on product_page
