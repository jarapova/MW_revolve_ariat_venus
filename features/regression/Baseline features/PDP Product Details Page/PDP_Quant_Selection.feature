#Projects:
#@proj:revolve
#@proj:venus
#@proj:stagestores
#@proj:ariat

Feature: As a customer, I can select qty of the product.
  PDP - Product Quantity Selector
#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can select select qty of the product
    Given test steps are under design


#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


#                 This Scenario is commented temproary as functionality removed from Revolve project
#
#  @proj:revolve @automated
#  Scenario:[Revolve] User can select select qty of the product
#    Given user is on home_page
#    When user click hamburger_menu_icon on header
#    And user click "Womens" on hamburger_menu
#    And user click "Clothing" on hamburger_menu
#    And user click "Denim" on hamburger_menu
#    And user click "View All" on hamburger_menu
#    Then user can see "product_list_page_content" on subcategory_page
#    And user click "random_item_name" on subcategory_page
#    When user can see "product_page_content" on product_page
#    Then user click "qty_plus_button" on product_page
#    And user click "qty_plus_button" on product_page
#    And user click "qty_plus_button" on product_page
#    And user click "qty_plus_button" on product_page
#    And user click "available_size_button" on product_page
#    When user click add_to_bag_button on product_page
#    Then user can see "qty_current_value" with value "5" on product_page
#    When user click logo_button on header
#    Then user can see "cart_icon_items_count" with value "5" on header
#

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can select select qty of the product
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user click add_to_bag_button on product_page
    Then user click view_bag_button on add_to_bag_popup
    And user can see "cart_page_content" on cart_page
    Then user can see "item_1_size" on cart_page
    Then user can see "item_1_qty" with value "2" on cart_page


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can select select qty of the product
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @automated
  Scenario:[Ariat] User can select select qty of the product
    Given user is on "item_with_no_size" product_page
    When user can see "product_page_content" on product_page
    Then user can see "current_item_qty" with value "1" on product_page
    When user click "qty_add_button" on product_page
    Then user can see "current_item_qty" with value "2" on product_page
    When user click "qty_add_button" on product_page
    And user click "qty_add_button" on product_page
    Then user can see "current_item_qty" with value "4" on product_page
    When user click "qty_subtract_button" on product_page
    Then user can see "current_item_qty" with value "3" on product_page
    When user click "qty_subtract_button" on product_page
    Then user can see "current_item_qty" with value "2" on product_page