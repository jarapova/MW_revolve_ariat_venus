#Projects:
#@proj:venus

Feature: As a customer, I can add product to cart with various parameters from "Complete the look" section
  PDP - Add to Bag

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can add item to cart from "Complete the look" section on PDP after selecting required product options
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see error notifications when adding item to cart from "Complete the look" section on PDP without selecting required product options
    Given test steps are under design

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can add item to cart from "Complete the look" section on PDP after selecting required product options
    Given user is on "item_2" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    And user can see "complete_the_look_div" on product_page
    Then user can see "complete_the_look_product_name" on product_page
    When user click "complete_the_look_size_button" on product_page
    And user remember "test_item_2" complete the look parameters on product_page
    And user click "complete_the_look_add_to_bag_button" on product_page
    Then user click cart_icon on header
    And user can see "cart_page_content" on cart_page
    And user can see "test_item_2_hash" on cart_page

  @proj:venus @manual
  Scenario:[Venus] User can see error notifications when adding item to cart from "Complete the look" section on PDP without selecting required product options
    Given test steps are under design
