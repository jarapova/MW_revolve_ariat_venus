#Projects:
#@proj:revolve
#@proj:venus
#@proj:stagestores

Feature: As a customer, I can adjust the quantity of a product from 0 to 10 from a dropdown list. Item quantity will be updated right after selection has been made.
  Shopping Cart - Quantity
  #Revolve: selecting "remove" value removes item from cart.


#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can change quantity of a product from 1 to 10
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can remove product from cart by changing it quantity to "remove" value
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:revolve @automated
  Scenario:[Revolve] User can change quantity of a product from 1 to 10
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Dresses" on hamburger_menu
    And user click "Gowns" on hamburger_menu
    Then user click "random_item_name" on subcategory_page
    And user scroll page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    And user click view_bag_button on add_to_bag_popup
    And user can see "guest_cart_page_content" on cart_page
    When user set "1_item_qty" with value "5" on cart_page
    Then user can see "1_item_qty" with value "5" on cart_page
    When user set "1_item_qty" with value "10" on cart_page
    Then user can see "1_item_qty" with value "10" on cart_page
    When user set "1_item_qty" with value "1" on cart_page
    Then user can see "1_item_qty" with value "1" on cart_page
    When user set "1_item_qty" with value "3" on cart_page
    Then user can see "1_item_qty" with value "3" on cart_page

  @proj:revolve @automated
  Scenario:[Revolve] User can remove product from cart by changing it quantity to "remove" value
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Dresses" on hamburger_menu
    And user click "Gowns" on hamburger_menu
    Then user click "random_item_name" on subcategory_page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    And user click view_bag_button on add_to_bag_popup
    And user can see "guest_cart_page_content" on cart_page
    When user set "1_item_qty" with value "Remove" on cart_page
    Then user can see "empty_cart_page_content" on cart_page

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can change quantity of a product from 1 to 10
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    And user set "product_qty" with value "2" on product_page
    And user click add_to_bag_button on product_page
    Then user click cart_icon on header
    When user can see "cart_page_content" on cart_page
    Then user can see "item_1_qty" with value "2" on cart_page
    When user set "1_item_qty" with value "3" on cart_page
    Then user can see "item_1_qty" with value "3" on cart_page
    When user set "1_item_qty" with value "10" on cart_page
    Then user can see "item_1_qty" with value "10" on cart_page
    When user set "1_item_qty" with value "1" on cart_page
    Then user can see "item_1_qty" with value "1" on cart_page


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can change quantity of a product from 1 to 10
    Given test steps are under design