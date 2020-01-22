#Projects:
#@proj:revolve

Feature: As a customer, I can click a link in the cost summary block that will take me to a shipping information page.
  Shopping Cart - Shipping Info
#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios



  @proj:baseline
  Scenario:[Baseline] User navigated to "Shipping information" page after taping appropriate CTA on cart page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can navigate back to cart from "Shipping information" page
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:revolve @automated
  Scenario:[Revolve] User navigated to "Shipping information" page after taping appropriate CTA on cart page
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
    And user can see "guest_cart_page_content" on cart_page
    When user click "shipping_options" on cart_page
    Then user can see "shipping_delivery_content" on shipping_and_delivery_page
    When user click returns_content on shipping_and_delivery_page
    Then user can see "returns_content" on returns_content_page

  @proj:revolve @automated
  Scenario:[Revolve] User can navigate back to cart from "Shipping information" page
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
    And user can see "guest_cart_page_content" on cart_page
    And user click "shipping_options" on cart_page
    And user can see "shipping_delivery_content" on shipping_and_delivery_page
    When user go back
    Then user can see "guest_cart_page_content" on cart_page
