Feature: This test suite declines header functionality for Revolve

  Hamburger menu button opens hamburger menu  =========================================================== Ready for dev
  Logo navigates to homepage ============================================================================ Ready for dev
  User can search items by clicking on search icon ====================================================== Ready for dev
  Favorite icon has correct count and opens favorite items list ========================================= Ready for dev
  Cart icon has correct count and opens cart page ======================================================= Ready for dev
  Navigation links are presented and redirects user to correct page ===================================== Ready for dev


  #Hamburger menu button opens hamburger menu
  Scenario: As user I want to use Hamburger menu button to open hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    Then user can see "hamburger_first_page_content" on hamburger_menu

  #Logo navigates to homepage
  Scenario: As user I want to click on logo to navigate on homepage
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_first_page_content" on hamburger_menu
    And user click "Womens" on hamburger_menu
    And user click "Dresses" on hamburger_menu
    And user click "Gowns" on hamburger_menu
    Then user click logo_button on header
    And user is on home_page

  #User can search items by clicking on search icon
  Scenario: As user I want to click search_icon on header to search items on site
    Given user is on home_page
    When user click search_icon on header
    Then user can see "search_modal_content" on search_modal

  #Favorite icon has correct count and opens favorite items list
  #Not done
  #Feature is not working
  Scenario: As user I want see that favorite icon has correct count and opens and opens favorite items page
    Given user is on home_page
    When user is logged in as "user1"
    And user click on favorite icon in header
    And user is on "favorite items" page
    And user clear favorite items list
    And there are no items in favorite list
    Then user visit clothing_pdp_link page
    And user can see expected items count on favorite icon
    Then user click on add to favorite icon
    And user click on favorite icon in header
    And user is on "favorite items" page
    Then user can see added product in favorite list
    And user can see expected items count on favorite icon
    Then user click on favorite item icon on added item
    And user can’t see added product in favorite list
    And there are no items in favorite list



  #Cart icon has correct count and opens cart page
  #Not done
  #Feature is not working
  Scenario: As user I want see that cart icon has correct count and opens cart page
    Given user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user visit clothing_pdp_link page
    And user can see expected items count on cart icon
    When user selects random item size
    And user click add_to_bag_button on product_page
    Then user click view_bag on popup
    And user is on cart_page
    And user can see expected item in cart
    And user can see expected items count on cart icon
    And user clear items in cart list
    And user can see expected items count on cart icon

  #Navigation links are presented and redirects user to correct page
  #Not done
  #Feature is not working
  #There is no carousel on header
  Scenario: As user I want to see navigation links in header and navigate to expected category by click
    Given user is on home_page
    When user can see navigation links in header
    And user click "New" on main_navigation_carousel
    Then user is on "New arrivals" subcategory page
    And user click logo_button on header
    And user click "Categories" on main_navigation_carousel
    Then user can see categories dropdown
    And user click logo_button on header
    And user click "Designers" on main_navigation_carousel
    Then user is on "designers list" page
    And user click logo_button on header
    And user click "Sale" on main_navigation_carousel
    Then user is on "sale" subcategory page
