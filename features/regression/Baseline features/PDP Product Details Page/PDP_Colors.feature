#Projects:
#@proj:shoecarnival
#@proj:revolve
#@proj:venus
#@proj:stagestores
#@proj:ariat

Feature: As a customer, I can select the available colors for the product.
  PDP - Select Colors

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User select color on product page
    Given test steps are under design

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User select color on product page
    Given user is on "item_1" product_page
    And user scroll page
    When user can see "product_page_content" on product_page
    And user can see "product_сolors" on product_page
    Then user can see "available_product_сolors" on product_page
    When user click "color_button_black" on product_page
    Then user can see "item_color" with value "BLACK(BK)" on product_page
    When user click "color_button_dark_wash" on product_page
    Then user can see "item_color" with value "DARK WASH(DW)" on product_page
    When user click "color_button_light_wash" on product_page
    Then user can see "item_color" with value "LIGHT WASH(LW)" on product_page
    When user click "color_button_medium_wash" on product_page
    Then user can see "item_color" with value "MEDIUM WASH(MW)" on product_page
    When user click "color_button_white" on product_page
    Then user can see "item_color" with value "WHITE(WH)" on product_page
    When user click "color_button_olmu" on product_page
    Then user can see "item_color" with value "OLIVE MULTI(OLMU)" on product_page
    When user click "color_button_black" on product_page
    Then user can see "item_color" with value "BLACK(BK)" on product_page

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User select color on product page
    Given user is on "item_1" product_page
    And user can see "product_page_content" on product_page
    When user click "White Multi_item_color" on product_page
    Then user can see "item_color" with value "White Multi" on product_page

  @proj:revolve @manual
  Scenario:[Revolve] [REV-335] User select color on product page and the name of color is present in product name
    Given test steps are under design
#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User select color on product page
      Clicking on the different color swatch, it should change the main product image to the new color
      Colors should match what is selected on the color swatch & product image
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User select color on product page
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @automated
  Scenario:[Ariat] User select color on product page
    Given user is on "item_1" product_page
    And user scroll page
    When user click "2_color_button" on product_page
    Then user can see "color_text" with value "ROSE VIOLET" on product_page