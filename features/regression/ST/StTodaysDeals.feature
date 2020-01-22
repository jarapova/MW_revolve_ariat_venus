Feature: This test suite defines the "Today's Deals" page functionality for StageStores

  Print this page ======================================================================================= Ready for dev
  Each offer should have expected info ================================================================== Ready for dev
  “Shop now” btn leads to correct page ================================================================== Ready for dev


  # Print this page
  Scenario: As user and guest I can print the coupons on the "Today's Deals" page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_subcategory_page_content" on hamburger_menu
    And user click "todays_deals" on hamburger_menu
    And user can see "todays_deals_page_content" on todays_deals_page
    Then user click "print_this_page_link" on todays_deals_page
    And user can see print_page_menu on todays_deals_page


  # Each offer should have expected info
  Scenario As user and guest I want to see expected offer info on "Today's Deals" page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_subcategory_page_content" on hamburger_menu
    And user click "todays_deals" on hamburger_menu
    And user can see "todays_deals_page_offer_content" on todays_deals_page

  # “Shop now” btn leads to correct page
  Scenario: As user and guest I see expected page using "Shop Now" button on "Today's Deals" page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_subcategory_page_content" on hamburger_menu
    And user click "todays_deals" on hamburger_menu
    And user can see "offer_content_1" on todays_deals_page
    Then user click shop_now_button on offer_content_1
    And user can see "all_products_page_content" on category_page