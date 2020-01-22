Feature: This test suite declines STAGE Stores happy path.


  Happy path flow:

  Open hamburger menu and navigate to subcategory
  User is able to reach Account page from hamburger menu
  Navigate to PDP from "todaysDeals" page
  Apply "Shop by Category" filter to see filtered results
  Apply filter to see filtered results
  Apply sort to see sorted results
  Click on logo to navigate homepage
  Homepage contains expected content
  Navigate to PDP page
  Navigate to PDP page from PLP top nav carousel
  Navigate to PDP from search results
  Navigate to PDP from product suggestions
  Add item to cart
  Use search term to see search results
  Navigate to subcategory page from home page
  "No Results" Search page




#  Open hamburger menu and navigate to subcategory
  Scenario: As User and Guest I want to use Hamburger menu and be navigated to each appropriate page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_content" on hamburger_menu
    And user able to use Hamburger menu to navigate to category "Juniors"
    And user able to use Hamburger menu to navigate to subcategory "Featured Brands"
    And user able to use Hamburger menu to navigate to subcategory "Nike"
    Then user is on "Nike" subcategory page



  # User is able to reach account page from hamburger menu
  Scenario: As user and guest I want to reach account page from hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click on My Account in the bottom of hamburger menu
    Then user on Login page
    And user is logged in as "user_stage_uat_1"
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click on My Account in the bottom of hamburger menu
    And user close all banners
    And user on My account page
    Then user click logo_button on header
    And user click hamburger_menu_icon on header
    Then user click on Sign Out in the top of hamburger menu
    Then user on Login page
    And user close all banners


 # Navigate to PDP from "todaysDeals" page
  Scenario: As user I want to navigate to PDP from "Press" catalog page
    Given user is on home_page
    When user click "Shop today's deals" link in the bottom of page
    And user click on random categorie's "Shop now" button
    Then user is on PLP page
    Then user click "random_item_image" on category_page

    # Apply "Shop by Category" filter to see filtered results
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_content" on hamburger_menu
    And user able to use Hamburger menu to navigate to appropriate "Shop all Women" subcategory page of category "Women"
    And user is on "Women's clothing" subcategory page
    Then user open "Shop by Category" filter
    And user open "Women's clothing" accordion
    And user chose random subcategory from accordion
    And user is on expected subcategory


     # Apply filter to see filtered results
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_content" on hamburger_menu
    And user able to use Hamburger menu to navigate to appropriate "Women Tops" subcategory page of "Woman clothing" subcategory page of category "Woman"
    Then user is on "Woman Tops" subcategory page
    And user can see all items in subcategory
    Then user open filter
    And user open random filter option accordion
    And user select random filter option from accordion
    And user press 'View Results' button on filter pop up
    And user can see items list with applied filter
    And current items count become less or equal with filter applyed
    Then user clears filter selection
    And user press 'View Results' button on filter pop up
    And user can see all items in subcategory
    And  current items count is expected without filter appllied


      # Apply sort to see sorted results
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_content" on hamburger_menu
    And user able to use Hamburger menu to navigate to appropriate "Women Tops" subcategory page of "Woman clothing" subcategory page of category "Woman"
    Then user is on "Woman Tops" subcategory page
    And user can see all items in subcategory
    Then user open sort dropdown
    And user select "A-Z" option
    And user can see that first by alphabet item name is first item in list
    Then user open sort dropdown
    And user select "Z-A" option
    And user can see that first alphabet item name is last item in list


  #  Click on logo to navigate homepage
  Scenario: As user I can press on logo in header and be navigated to homepage
    And user click on logo in header and then redirected to homepge

    #  Homepage contains expected content
  Scenario: As Existing User I want to see content specified on Home page
    Given user is on home_page
    Then user able to navigate from homepage to the appropriate page "Shop All"
    And user go back
    And user able to see Promoting banners
    Then User able to see categories
    And User able to see expected links in "Movers and shakers" block


#  Navigate to PDP page
  Scenario: As user I want to Navigate to PDP page
    Given user click "random_item_image" on category_page

 # Navigate to PDP page from PLP top nav carousel
  Scenario: As user I want to Navigate to PDP page from PLP carousel
    Given user is on home_page
    And user able to use Hamburger menu to navigate to appropriate "Women's Sunglasses" subcategory page of "Woman accessories" subcategory page of category "Woman"
    Then user is on "Women's Sunglasses" subcategory page
    And user click on random option in top nav carousel
    Then user is on subcategory page
    And user click on random item
    Then user is on PDP

  # Navigate to PDP from search results
  Scenario: As user I want to navigate to PDP from "No Results" page
    Given user is on home_page
    When user click search_icon on header header
    And user enter valid search request
    And press on "search" button
    And user is on Search results page
    Then user click "random_item_image" on category_page

  # Navigate to PDP from product suggestions
  Scenario: As user I want to navigate to PDP from "No Results" page
    Given user is on PDP
    When user is able to see suggestion bar
    And user press on random product image in any suggestion bar
    Then user is on suggested item PDP



#  Add item to cart
  Scenario: As user I want add product to cart
    Given user is on pdp_page
    And user selects random item color
    And user selects random item size
    And user select "random_item_qty" on pdp_page
    And user clicks add to cart button
    Then user press on "View bag" button
    And user on cart page
    And user can see added item in cart



#  Use search term to see search results
  Scenario: User navigates to PDP from search results
    Given user click search_icon on header
    And user type "skirt" in searching modal input
    And user see suggested search in search modal
    And user click on random suggested search line in search modal
    Then user is on search result page
    And user click "random_item_image" on subcategory_page
    Then user is on pdp_page
    And user click search_icon on header
    And user type "towels" in searching modal input
    And user clicks search button in search modal
    Then user is on search result page


 # Navigate to subcategory page from home page
    Given user is on home_page
    Then user press on random subcategory on homepage
    And user is on PLP page
    Then user click "random_item_image" on category_page
    And user is on pdp_page


  # "No Results" Search page
  Scenario: As user I want to navigate to PDP from "No Results" page
    Given user is on home_page
    When user click search_icon on header
    And user enter not valid search request
    And user click on search_button on search_modal
    And user is on "No Results" page
    Then user can see expected content on "No Results" page
    And user can make a new search request from "No Results" page