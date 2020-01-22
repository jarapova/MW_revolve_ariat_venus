Feature: This test suite declines header functionality for Venus

  Hamburger menu button opens hamburger menu ============================================================ Ready for dev
  Logo navigates to homepage ============================================================================ Ready for dev
  User can search items by clicking on search icon ====================================================== Ready for dev
  Favorite icon has correct count and opens favorite items list ========================================= Ready for dev
  Cart icon has correct count and opens cart page ======================================================= Ready for dev
  Navigation links are presented in main navigation carousel and redirects user to correct page ========= Ready for dev



  #  Click on logo to navigate homepage
  Scenario: As user I can select logo in header and be navigated to homepage
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "about_us_on_first_page" on hamburger_menu
    Then user can see "about_us_page_content" on about_us_page
    And user click logo_button on header
    Then user can see "home_page_content" on home_page

  #Hamburger menu button opens hamburger menu
  Scenario: As user I want to use Hamburger menu button to open hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_first_page_content" on hamburger_menu



  #User can search items by clicking on search icon
  Scenario: As user I want to click search_icon on header to search items on site
    Given user is on home_page
    When user click search_icon on header
    Then user can see "search_modal_content" on search_modal

#TODO continue this test case after pdp and plp features finished
  #Cart icon has correct count and opens cart page
#  Scenario: As user I want see that cart icon has correct count and opens cart page
#    Given user is on home_page
#    When user click cart_icon on header
#    And user is on cart_page
#    And user clear items in cart list
#    Then user visit clothing_pdp_link page
#    And user can see expected items count on cart icon
#    When user selects random item size
#    And user click add_to_bag_button on product_page
#    Then user click view_bag on popup
#    And user is on cart_page
#    And user can see expected item in cart
#    And user can see expected items count on cart icon
#    And user clear items in cart list
#    And user can see expected items count on cart icon

  #Navigation links are presented in main navigation carousel and redirects user to correct page
  Scenario: As user I want to see navigation links in header and navigate to expected category by click
    Given user is on home_page
    And user can see main_navigation_carousel on header
    And user click "Clothing" on main_navigation_carousel
    Then user can see "clothing_category_dropdown" on category_page
    Then user can see "clothing_shop_now_buttons" on category_page
    Then user can see "clothing_category_banners" on category_page
    And user click logo_button on header

    And user can see main_navigation_carousel on header
    And user click "Swimwear" on main_navigation_carousel
    Then user can see "swimwear_category_dropdown" on category_page
    Then user can see "swimwear_shop_now_buttons" on category_page
    Then user can see "swimwear_category_banners" on category_page
    And user click logo_button on header

    And user can see main_navigation_carousel on header
    And user click "Lingerie" on main_navigation_carousel
    Then user can see "lingerie_category_dropdown" on category_page
    Then user can see "lingerie_shop_now_buttons" on category_page
    Then user can see "Lingerie_category_banners" on category_page
    And user click logo_button on header

    And user can see main_navigation_carousel on header
    And user click "PlusSize" on main_navigation_carousel
    Then user can see "plus_size_category_dropdown" on category_page
    Then user can see "plus_size_shop_now_buttons" on category_page
    Then user can see "plus_size_category_banners" on category_page
    And user click logo_button on header

    And user can see main_navigation_carousel on header
    And user click "WhatsNew" on main_navigation_carousel
    Then user can see "whats_new_category_dropdown" on category_page
    Then user can see "whats_new_shop_now_buttons" on category_page
    Then user can see "whats_new_category_banners" on category_page
    And user click logo_button on header

    And user can see main_navigation_carousel on header
    And user click "Trends" on main_navigation_carousel
    Then user can see "trends_category_dropdown" on category_page
    Then user can see "trends_shop_now_buttons" on category_page
    Then user can see "trends_category_banners" on category_page
    And user click logo_button on header

    And user can see main_navigation_carousel on header
    And user click "PreOrder" on main_navigation_carousel
    Then user can see "pre_order_shop_now_buttons" on category_page
    Then user can see "sale_category_banners" on category_page
    And user click logo_button on header

    And user can see main_navigation_carousel on header
    And user click "Sale" on main_navigation_carousel
    Then user can see "sale_category_dropdown" on category_page
    Then user can see "sale_shop_now_buttons" on category_page
    Then user can see "sale_category_banners" on category_page
    And user click logo_button on header

