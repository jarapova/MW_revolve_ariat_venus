Feature: This test suite defines the header functionality for StageStores

  Main logo navigates to home page ====================================================================== Ready for dev
  Hamburger menu - navigate to any subcategory ========================================================== Ready for dev
  Hamburger menu - account tab (for guest/logged user) ================================================== Ready for dev
  Hamburger menu - Additional page links (Each point should lead to correct page) ======================= Ready for dev
  Search icon open search =============================================================================== Ready for dev
  Cart icon should open cart ============================================================================ Ready for dev



  # Main logo navigates to home page
  Scenario: As user I can select the logo in the header and navigate to the homepage
    Given user is on home_page
    And user click logo_button on header
    Then user can see "home_page_content" on home_page

  # Hamburger menu - navigate to any subcategory
  Scenario As user I want to use the Hamburger menu to navigate to any subcategory
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_subcategory_page_content" on hamburger_menu
    And user click "women" on hamburger_menu
    And user click "womens_shoes" on hamburger_menu
    Then user can see "womens_shoes_page_content" on subcategory_page

  # Hamburger menu - account tab (for guest/logged user)
  Scenario: As user and guest I want to reach account page from hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user make login as "user1"
    And user click hamburger_menu_icon on header
    Then user can see "account_tab" on hamburger_menu
    And user click "my_account" on hamburger_menu
    And user can see "account_overview_page_content" on account_overview_page
    Then user click logo_button on header
    And user click hamburger_menu_icon on header
    Then user click "logout" on hamburger_menu
    Then user can see "sign_in_page_content" on sign_in_page

  # Hamburger menu - Additional page links (Each point should lead to correct page)
  Scenario: As user I want to reach additional page links from hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user make login as "user1"

    When user click hamburger_menu_icon on header
    And user click "rewards" on hamburger_menu
    And user can see "rewards_page_content" on rewards_page
    Then user click logo_button on header

    When user click hamburger_menu_icon on header
    And user click "find_a_store" on hamburger_menu
    And user can see "find_a_store_page_content" on find_a_store_page
    Then user click logo_button on header

    When user click hamburger_menu_icon on header
    And user click "track_order" on hamburger_menu
    And user can see "track_order_page_content" on track_order_page
    Then user click logo_button on header

    When user click hamburger_menu_icon on header
    And user click "wishlist" on hamburger_menu
    And user can see "wishlist_page_content" on wishlist_page

  # Search icon open search
  Scenario: As user and guest I want to reach search menu from search icon
    Given: user is on home_page
    And user click search_icon on header
    And user can see "search_modal_content" on search_modal
    And user close search_modal
    Then user can see "home_page_content" on home_page

  # Cart icon should open cart
  Scenario: As user and guest I want to reach cart page from cart icon
    Given: user is on home_page
    When user click cart_icon on header
    Then user can see "cart_page_content" on cart_page