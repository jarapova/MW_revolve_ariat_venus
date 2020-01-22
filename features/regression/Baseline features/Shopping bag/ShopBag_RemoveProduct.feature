#Projects:
#@proj:revolve
#@proj:venus
#@proj:stagestores

Feature: As a customer, I can click on the "remove" link next to a product and remove it from my cart.
  Shopping Cart - Product Remove

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can remove any products from cart by taping "remove" CTA
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can remove any products from cart by taping "remove" CTA
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
    When user can see "guest_cart_page_content" on cart_page
    And user click "item_1_remove_button" on cart_page
    Then user can see "empty_cart_page_content" on cart_page


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can remove any products from cart by taping "remove" CTA
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user remember "test_item_1" product parameters on product_page
    And user click add_to_bag_button on product_page
    Then user click view_bag_button on add_to_bag_popup
    And user can see "cart_page_content" on cart_page
    And user can see "test_item_1_hash" on cart_page
    And user clear cart_page
    And user can see "cart_page_content" on cart_page


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can remove any products from cart by taping "remove" CTA
    Given test steps are under design