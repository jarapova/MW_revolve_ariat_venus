#Projects:
#@proj:revolve
#@proj:stagestores

Feature: As a customer, if I'm logged in, I can click on the "Move to Favorites" link for a product and add to my favorites list.
  Shopping Cart - Favorites

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Logged in user click on the "Move to Favorites" CTA for a product and add to favorites list.
    #we should check that after adding item to favorites from cart, this item should be removed from cart
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Guest user is suggested to sign in after clicking on "Move to Favorites" CTA
    Given test steps are under design


#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] Logged in user click on the "Move to Favorites" CTA for a product and add to favorites list.
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    And user make login as "rev_test_user"
    Then user click "favorites_button" on header
    And user clear wish_list_page
    When user is on home_page
    When user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Shoes" on hamburger_menu
    And user click "View All" on hamburger_menu
    Then user click "random_item_name" on subcategory_page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    And user click "add_to_bag_button" on product_page
    And user click view_bag_button on add_to_bag_popup
    Then user can see "logged_in_cart_page_content" on cart_page
    And user remember "1_item_name" on cart_page
    When user click "item_1_move_to_favorites_button" on cart_page
    Then user can see "no_1_item_name" on cart_page
    And user can see "favorites_icon_items_count" with value "1" on header

#    Scenario below is commented as functionality removed for revolve(no move to favorites button for guest)
#  @proj:revolve @tobeautomated
#  Scenario:[Revolve][REV-206] Guest user can make sign in after clicking on "Move to Favorites" CTA
#    Given guest user have items in shopping bag
#    When guest user press "Move to Favorites" CTA
#    Then guest user is suggested to sign in
#    And user can make sign
#    Then user was signed in

  @proj:revolve @manual
  Scenario:[Revolve] [REV-265] Items are removed from shopping bag after user press "Move to Favorites" CTA
    Given Guest user have items in shopping bag
    When guest user press "Move to Favorites" CTA
    Then Guest user is suggested to sign in
    Then item moved to Favorites, and no longer in shopping bag
    Then shopping bag have expected styling. Shopping bag is PWA

#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] Logged in user click on the "Move to Favorites" CTA for a product and add to favorites list.
    Given test steps are under design