#Projects:
#@proj:revolve
#@proj:venus
#@proj:stagestores

Feature: As a customer, I want to click on item and be taken to appropriate PDP
  Shopping Cart - PDP Selection

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User click on item image to navigate to item PDP
    Given test steps are under design
  @proj:baseline
  Scenario:[Baseline] User can see appropriate Shopping bag content after going back from PDP.
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User click on item image to navigate to item PDP
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Dresses" on hamburger_menu
    And user click "Gowns" on hamburger_menu
    Then user click "random_item_name" on subcategory_page
    And user scroll page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    When user click view_bag_button on add_to_bag_popup
    Then user can see "guest_cart_page_content" on cart_page
    When user click "item_1_image" on cart_page
    Then user can see "product_page_content" on product_page

  @proj:revolve @tobeautomated
  Scenario:[Revolve] [REV-435] User can see appropriate Shopping bag content after going back from PDP.
    Given test steps are under design

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User click on item image to navigate to item PDP
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    Then user click cart_icon on header
    When user can see "cart_page_content" on cart_page
    And user click "1_item_image" on cart_page
    And user scroll page
    Then user can see "product_page_content" on product_page



#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User click on item image to navigate to item PDP
    Given test steps are under design