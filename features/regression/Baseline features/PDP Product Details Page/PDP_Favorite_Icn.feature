#Projects:
#@proj:revolve
#@proj:venus
#@proj:stagestores
#@proj:blueplanet

Feature: As a customer, if I'm logged in, I can click on the "favorite" button and add to my favorite's list.
  PDP - Favorite Product
  #On venus "favorites" named as "Wish List"
  #On stagestore "favorites" named as "Wish List"

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Logged-in user can add item to favorites by taping "favorites" button on PDP
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] Logged-in user can add item to favorites by taping "favorites" button on PDP
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    Then user make login as "rev_test_user"
    And user click "favorites_button" on header
    And user clear wish_list_page
    And user is on home_page
    And user is on home_page
    And user click hamburger_menu_icon on header
    When user click "Womens" on hamburger_menu
    And user click "Clothing" on hamburger_menu
    And user click "Activewear" on hamburger_menu
    And user click "View All" on hamburger_menu
    And user click "random_item_name" on subcategory_page
    When user click "favorites_button" on product_page
    Then user can see "favorites_icon_items_count" with value "1" on header
    When user remember "favorite_item" product parameters on product_page
    And user click "favorites_button" on header
    Then user can see "remembered_favorite_item" on wish_list_page

  @proj:revolve @manual
  Scenario:[Revolve][REV-375] 'Favorite' icon on favorite item should be highlighted on PDP
    Given test steps are under design


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] Logged-in user can add item to favorites by taping "favorites" button on PDP
    Given user make login as "user1"
    And user click "wish_list" on account_navigation_tab
    And user can see "wish_list_page_content" on wish_list_page
    And user clear wish_list_page
    When user is on "Color_skinny_jeans" product_page
    And user scroll page
    And user click "available_waist_size_button" on product_page
    And user click "item_color_BLACK DENIM(BKDE)" on product_page
    And user click "inseam_size_button_regular" on product_page
    And user can see "is_in_stock_text" on product_page
    Then user remember "test_item_1" product parameters on product_page
    When user click "add_to_wish_list" on product_page
    And user can see "test_item_1_hash" on wish_list_page
    Then user can see "test_item_1_in_stock_text" on wish_list_page


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] Logged-in user can add item to favorites by taping "favorites" button on PDP
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] Logged-in user can add item to favorites by taping "favorites" button on PDP
    Given test steps are under design
