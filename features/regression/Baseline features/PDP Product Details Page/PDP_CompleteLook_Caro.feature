#Projects:
#@proj:revolve
#@proj:venus
#@proj:stagestores

Feature: As a customer, I should be able to view "Complete The Look" section of a product as a carousel
  PDP - Complete The Look

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see "Complete The Look" section with list of related products
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can navigate to related PDP by taping on product image from "Complete The Look" section
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can swipe "Complete The Look" carousel
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can change complete the look product`s color
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can change complete the look product`s size
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can change complete the look product`s qty
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see "Complete The Look" section with list of related products
    Given user is on "item_with_complete_the_look" product_page
    When user can see "product_page_content" on product_page
    Then user can see "complete_the_look_section_content" on product_page

  @proj:revolve @automated
  Scenario:[Revolve] User can navigate to related PDP by taping on product image from "Complete The Look" section
    Given user is on "item_with_complete_the_look" product_page
    And user can see "complete_the_look_section_content" on product_page
    When user click "random_complete_the_look_item" on product_page
    Then user can see "product_page_content" on product_page

  @proj:revolve @manual
  Scenario:[Revolve] User can swipe "Complete The Look" carousel
    Given test steps are under design

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can see "Complete The Look" section with list of related products
    Given user is on "item_2" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    And user can see "complete_the_look_div" on product_page
    Then user can see "complete_the_look_product_name" on product_page

  @proj:venus @automated
  Scenario:[Venus] User can change complete the look product`s color
    Given user is on "item_2" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    And user can see "complete_the_look_div" on product_page
    Then user can see "complete_the_look_product_name" on product_page
    When user click "complete_the_look_color_RED(PPRD)" on product_page
    Then user can see "complete_the_look_color" with value "RED(PPRD)" on product_page

  @proj:venus @automated
  Scenario:[Venus] User can change complete the look product`s size
    Given user is on "item_2" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    And user can see "complete_the_look_div" on product_page
    When user can see "complete_the_look_product_name" on product_page
    Then user click "complete_the_look_size_button" on product_page

  @proj:venus @automated
  Scenario:[Venus] User can change complete the look product`s qty
    Given user is on "item_2" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    And user can see "complete_the_look_div" on product_page
    Then user can see "complete_the_look_product_name" on product_page
    When user click "complete_the_look_size_button" on product_page
    And user set "complete_the_look_product_qty" with value "2" on product_page
    Then user can see "complete_the_look_product_qty" with value "2" on product_page


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see "Complete The Look" section with list of related products
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can navigate to related PDP by taping on product image from "Complete The Look" section
    Given test steps are under design

  @proj:stagestores @manual
  Scenario:[Stagestores] User can swipe "Complete The Look" carousel
    Given test steps are under design