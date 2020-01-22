#Projects:
#@proj:revolve

Feature: As a customer, if I'm logged in, I can click on the "favorite" button next to a product and add to my favorite's list.
  PLP - Favorite Product

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Logged in user can click on "favorite" button on item to add item to favorites
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] Logged in user can click on "favorite" button on item to add item to favorites
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    Then user make login as "rev_test_user"
    When user click "favorites_button" on header
    Then user clear wish_list_page
    When user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    Then user can see "product_list_page_content" on subcategory_page
    When user click "random_item_favorites_button" on subcategory_page
    Then user can see "favorites_icon_items_count" with value "1" on header

  @proj:revolve @tobeautomated
  Scenario:[Revolve] Logged in user can click on "favorite" button on item to add item to favorites from PLP
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve][REV-231] Guest user can add item to favorite from PLP
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    When user can see "product_list_page_content" on subcategory_page
    And user click "random_item_favourites_button" on subcategory_page
    Then user can see "account_modal_content" on subcategory_page
    And user click "Log in"
    Then user make login as "user1"
    And user appears on "All New Items" plp
    And user can see that expected item is hearted
    Then user go to favorites page
    And user can see previously hearted item on favorites page