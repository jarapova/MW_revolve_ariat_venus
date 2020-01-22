Feature: This test suite declares the Annie Selke happy path.


  Happy path flow:

  Open hamburger menu and navigate to subcategory ============================================= Done
  User is able to reach Account page from hamburger menu ====================================== Done
  Navigate to PDP from "Press" catalog ======================================================== Done
  Navigate to PDP from "Collections" page ===================================================== Done
  Navigate to PDP from "No Results" page ====================================================== Done
  Navigate to PDP from search results ========================================================= Done
  Navigate to PDP from product suggestions (Complete the look) ================================ Done
  Navigate to PDP from product suggestions (Related products) ================================= Done
  Navigate to PDP from  "Ideas, Inspirations" page ============================================ Done
  Navigate to "Catalogs" page ================================================================= Done
  Find a store using "Store Finder" =========================================================== Done
  Apply filter to see filtered results ======================================================== Done
  Click on logo to navigate homepage ========================================================== Done
  Homepage contains expected content ========================================================== Done
  Use navigation from home page to go to carousel options ===================================== Done
  Navigate to subcategory page using main navigation carousel ================================= Done
  Navigate to PDP page ======================================================================== Done
  Add item to cart ============================================================================ Need help
  Use search term to see search results =======================================================
  Open cart page ==============================================================================
  Start checkout ==============================================================================
  User is able to visit "Shop Insta" page ===================================================== Blocked

#  Open hamburger menu and navigate to subcategory
  Scenario: As User and Guest I want to use the Hamburger menu to navigate to each appropriate page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_content" on hamburger_menu
    And user click on category "Bath"
    And user click on subcategory "Towels"
    Then user is on "Towels" subcategory page

 #  User is able to reach account page from hamburger menu
  Scenario: As user and guest I want to reach account page from hamburger menu
    Given user is on home_page
    And user make login as "user1"
    And user click hamburger_menu_icon on header
    Then user is able to see account tab
    Then user click on My Account in the bottom of hamburger menu
    And user on My account page
    Then user click logo_button on header
    And user click hamburger_menu_icon on header
    Then user is able to see account tab
    Then user click on Logout in the top of hamburger menu
    And  user click on Login in the top of hamburger menu
    Then user on sign_in_page


#   Apply filter to see filtered results
  Scenario: As user can sort items on items list page using "Size filter"
    Given user is on home_page
    And user can see main_navigation_carousel on header
    And user is able to navigate to the category page after clicking on "Bedding" from the main navigation carousel with listed categories
    And user select "Quilts" from subcategory_filter on category_page
    And user can see all items in subcategory
    Then user open size filter
    And user selects random filter option
    And user press 'View Results' button on filter pop up
    And user can see items list with applied filter
    And current items count become less or equal with filter applied
    Then user open size filter
    And user clears filter selection
    And user press 'View Results' button on filter pop up
    And user can see all items in subcategory
    And current items count is expected without filter applied
    Then user open size filter
    And user selects two random filter options
    And user press 'View Results' button on filter pop up
    And user can see items list with applied filter
    And current items count become less or equal with filter applied
    Then user open size filter
    And user clears filter selection
    And user press 'View Results' button on filter pop up
    And current items count is expected without filter applied

#  Click on logo to navigate homepage
  Scenario: As user I can press on logo in header and be navigated to homepage
    Given user is on home_page
    And user click hamburger_menu_icon on header

#  Homepage contains expected content
  Scenario: As Existing User I want to see content specified on Home page
    Given user is on home_page
    Then user able to see more Time Line content on home page by clicking “+” button
    And user able to see email subscription form
    Then User able to add "new_user" email to subscription form
    Then user able to navigate from homepage to the appropriate page "Meet The Artist"
    And user go back

#  Navigate to PDP from "Press" catalog
  Scenario: As user I want to navigate to PDP from "Press" catalog page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "The Company" category
    And user click "Press" subcategory
    Then user is on "Press" catalog page
    And user clicks on random Press catalog
    Then user is on PLP page
    Then user click "random_item_image" on category_page

#  Navigate to PDP from "Collections" page
  Scenario: As user I want to navigate to PDP from "Collections" catalog page
    Given user is on home_page
    And user needs to close email signup popup
    When user click hamburger_menu_icon on header
    And user click "Collections" category
    And user click "Featured Collections" category
    And user click "All Collections" category
    Then user is on "All Collections" page
    And user press on random collection
    Then user checks if they are on a PLP page or collection page
    Then user is on PLP page
    Then user click "random_item_image" on category_page

#  Navigate to PDP from "No Results" page
  Scenario: As user I want to navigate to PDP from "No Results" page
    Given user is on home_page
    And user click search_icon on header
    And user enters an invalid search request
    And user click on search_button on search_modal
    And user is on the No Results page
    Then user click "random_item_image" on category_page

#  Navigate to PDP from search results
  Scenario: As user I want to navigate to PDP from a search results page
    Given user is on home_page
    When user click search_icon on header
    And user fill search_field with value "Bath" on search_modal
    And user click on search_button on search_modal
    Then user is on search_result_page
    And user click "random_item_image" on subcategory_page

#  Navigate to PDP from product suggestions (Complete the look)
  Scenario: As user I want to navigate to PDP from the Complete the Look bar on PDP page
    Given user is on pdp_page
    When user is able to see "Complete the Look" bar
    And user clicks on a random product image in "Complete the Look" bar
    Then user verifies they are on PDP page

#  Navigate to PDP from product suggestions (Related products)
  Scenario: As user I want to navigate to PDP from the Related Products bar on PDP page
    Given user is on pdp_page
    When user is able to see "Related Products" bar
    And user clicks on a random product image in "Related Products" bar
    Then user verifies they are on PDP page

#  Navigate to "Catalogs" page
  Scenario: As user I want to navigate to "Catalogs" page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "The Company" category
    And user click "Catalog" subcategory
    Then user press on random catalog

#  Navigate to PDP from "Ideas, Inspirations" page
  Scenario: As user I want to navigate to PDP from  "Ideas, Inspirations" page
    Given user is on home_page
    And user needs to close email signup popup
    When user click hamburger_menu_icon on header
    And user clicks on "ideas and inspirations" link in the footer of the Hamburger menu
    And user click on random gallery category
    And user click on random gallery subcategory
    Then user check if they are on a Blog page

#  Find a store using "Store Finder"
  Scenario: As user I want to find a store using "Store Finder"
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Stores" category
    And user click "Find a Store" subcategory
    Then user appears on store finder page
    And user enter valid "City"
    And user chose random store brand
    And user press Search button
    Then user can see searched stores list
    And user enter valid "State"
    And user chose random store brand
    And user press Search button
    Then user can see an updated searched stores list
    And user enter valid "ZIP"
    And user chose random store brand
    And user press Search button
    Then user can see an updated searched stores list

#  Use navigation from home page to go to carousel options
  Scenario: As User and Guest I want to use main navigation carousel with Categories in header
    Given user is on home_page
    And user can see main_navigation_carousel on header
    Then user click "GIFTS" on main_navigation_carousel

#  Navigate to subcategory page using main navigation carousel
  Scenario: As User and Guest I want to navigate to subcategory page using main navigation carousel
    Given user is on home_page
    And user can see main_navigation_carousel on header
    And user click "GIFTS" on main_navigation_carousel
    And user select "random_subcategory"  from subcategory_filter on category_page

#  Navigate to PDP page
  Scenario: As user I want to Navigate to PDP page
    Given user is on home_page
    And user can see main_navigation_carousel on header
    And user click "GIFTS" on main_navigation_carousel
    And user select "random_subcategory"  from subcategory_filter on category_page
    Then user click "random_item_image" on category_page

##  Add item to cart
#  Scenario: As user I want add product to cart
#    Given user is on pdp_page
#    And user selects random item color
#    And user selects random item size
#    And user selects random item Qty
#    And user click add_to_bag_button on product_page
#
##  Use search term to see search results
#  Scenario: User navigates to PDP from search results
#    Given user is on home_page
#    And user click search_icon on header
#    And user type "Beds" in searching modal input
#    And user see suggested search in search modal
#    And user click on random suggested search line in search modal
#    Then user is on search result page
#    And user click "random_item_image" on subcategory_page
#    Then user is on pdp_page
#    And user click search_icon on header
#    And user type "Bath" in searching modal input
#    And user clicks search button in search modal
#    Then user is on search result page
#
##  Open cart page
#  Scenario: As a guest I want to go to cart page
#    Given user add item from TESTITEM_URL to cart
#    And user click cart_icon on header
#
##  Start checkout
#  Scenario: As a guest I want to go to the checkout page
#    Given user add item from TESTITEM_URL to cart
#    And user click cart_icon on header
#    And user clicks on checkout button on cart page

##  Shop Insta
#  Scenario:  As a guest I want to shop through the Instagram widget
#    Given user is on home_page
#    And user needs to close email signup popup
#    Then user sees Pixlee container
#    And user clicks on a random Instagram picture
#    Then user sees Instagram page
#    And user scrolls to the "next" picture
#    Then user sees a different Instagram page
#    And user scrolls to the "previous" picture
#    Then user sees Instagram page
#    Then user clicks Buy Now
#    Then user is on pdp_page
#
# TODO: Blocked by iframe issue