#Projects:
#@proj:revolve

Feature: As a customer, I should be able to adjust item size, selecting it from the list of available sizes.
  Shopping Cart - Adjust Product
#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios



  @proj:baseline
  Scenario:[Baseline] User can change item size by selecting it from available sizes list
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can't see size menu for items with one size
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can change item size by selecting it from available sizes list
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Dresses" on hamburger_menu
    And user click "Gowns" on hamburger_menu
    And user scroll page
    Then user click "random_item_name" on subcategory_page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    And user click view_bag_button on add_to_bag_popup
    When user can see "guest_cart_page_content" on cart_page
    And user scroll page
    And user set "1_item_size" with value "S" on cart_page
    Then user can see "1_item_size" with value "S" on cart_page

  @proj:revolve @automated @flaky
  Scenario:[Revolve] User can't see size menu for items with one size
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Bags" on hamburger_menu
    And user click "View All" on hamburger_menu
    And user scroll page
    Then user click "random_item_name" on subcategory_page
    And user click add_to_bag_button on product_page
    And user click view_bag_button on add_to_bag_popup
    And user scroll page
    Then user can not see "item_1_size_dropdown" on cart_page
