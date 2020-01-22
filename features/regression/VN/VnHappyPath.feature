#Feature: This test suite declines Venus happy path.
#
#
#  Happy path flow:
#
#  Create account ============================================== Done
#  Go to account and edit some field============================ Done
#  Open hamburger menu and navigate to subcategory============== Done
#  Apply filter to see filtered results========================= Done
#  Click on logo to navigate homepage=========================== Done
#  Check + button on homepage=================================== Done
#  Homepage contains expected content=========================== Done
#  Check email subscription===================================== Done
#  Log out ===================================================== Done
#  Log in ====================================================== Done
#  Use navigation from home page to go to carousel options====== Done
#  Click on logo to navigate homepage=========================== Done
#  Navigate to subcategory page using main navigation carousel== Done
#  Navigate to PDP page========================================= Done
#  Add item to cart============================================= Done
#  Navigate back to home page using breadcrumbs================= Done
#  Use search term to see search results======================== Done
#  Navigate to PDP from search results========================== Done
#  Navigate to PDP from product suggestions===================== Done
#  Add item to wishlist========================================= Done
#  Go to account wish list====================================== Done
#  Add item to cart from wish list============================== Done
#  Open cart page=============================================== Done
#  Start checkout=============================================== Done
#
#
#
##  Create account ============================================== Done ===================================================
#  Scenario: As Guest user I want to create account using my email
#    Given user is on home_page
###TODO    refactor bellow user creation step after venus can approve temp email registration
#
##  Go to account and edit some field============================ Done ===================================================
#  Scenario: As Logged in user I can select account icon in header and can navigate to each option from popup
##TODO       Remove login step bellow after fixing account creation with temp email
#    And user click logo_button on header
#    #Navigating to each option
#    And user is on "Order History" page
#
###  Go to account and edit some field============================ Done ===================================================
#  Scenario: As User I want to edit "ACCOUNT INFO" data (Go to account and edit all field)
#
##  Go to account and edit some field============================ Done ===================================================
#  Scenario: As Existing User I want to add and change "MAILING OPTIONS"
#
##  Open hamburger menu and navigate to subcategory============== Done ===================================================
#  Scenario: As User and Guest I want to use Hamburger menu and be navigated to each appropriate page
#    Given user is on home_page
#    When user click hamburger_menu_icon on header
#    And user can see "hamburger_content" on hamburger_menu
#
#  Scenario: As user can sort items on items list page using "Size filter"
#    Given user is on home_page
#    And user can see main_navigation_carousel on header
#    And user click "Clothing" on main_navigation_carousel
#    And user select "Dresses" from subcategory_filter on category_page
#    Then user open size filter
#    Then user open size filter
#    Then user open size filter
#    Then user open size filter
#
##  Homepage contains expected content=========================== Done ===================================================
##  Check email subscription===================================== Done ===================================================
##  Homepage contains expected content=========================== Done ===================================================
#  Scenario: As Existing User I want to see content specified on Home page
#    Given user is on home_page
#
##  Log out ===================================================== Done ===================================================
#  Scenario: As logged in User I want to click "Log out" in account icon pupop and be logged out
#    Given user make login as "user1"
#
##  Log in ====================================================== Done ===================================================
#  Scenario: As user I can login to account using my credentials
#    Given user is on home_page
#
##  Use navigation from home page to go to carousel options====== Done
#  Scenario: As User and Guest I want to use main navigation carousel with Categories in header
#    Given user is on home_page
#    And user can see main_navigation_carousel on header
#    Then user click "What's new" on main_navigation_carousel
#
##  Click on logo to navigate homepage=========================== Done ===================================================
#  Scenario: As user I can select logo in header and be navigated to homepage
#    Given user is on home_page
#    And user click logo_button on header
#
##  Navigate to subcategory page using main navigation carousel== Done ===================================================
#  Scenario: As User and Guest I want to navigate to subcategory page using main navigation carousel
#    Given user is on home_page
#    And user can see main_navigation_carousel on header
#    And user click "Clothing" on main_navigation_carousel
#    And user select "random_subcategory" from subcategory_filter on category_page
#
##  Navigate to PDP page========================================= Done ===================================================
#  Scenario: As user I want to Navigate to PDP page
#    Given user is on home_page
#    And user can see main_navigation_carousel on header
#    And user click "Clothing" on main_navigation_carousel
#    And user select "random_subcategory" from subcategory_filter on category_page
#    Given user click "random_item_image" on category_page
#
##  Add item to cart============================================= Done ===================================================
#  Scenario: As user I want add product to cart
#    Given user is on home_page
#    And user can see main_navigation_carousel on header
#    And user click "Clothing" on main_navigation_carousel
#    And user select "random_subcategory" from subcategory_filter on category_page
#    And user click "random_item_image" on subcategory_page
#    And user is on pdp_page
#    And user click add_to_bag_button on product_page
#
##  Navigate back to home page using breadcrumbs================= Done ===================================================
#  Scenario: As user I want to use breadcrumbs to navigate back to homepage
#    Given user is on home_page
#    And user can see main_navigation_carousel on header
#    And user click "Clothing" on main_navigation_carousel
#    And user select "random_subcategory" from subcategory_filter on category_page
#    And user click "random_item_image" on subcategory_page
#    And user is on pdp_page
#    Then user is on pdp_page
#    And user click logo_button on header
#
##  Use search term to see search results======================== Done ===================================================
#  Scenario: User navigates to PDP from search results
#    Given user is on home_page
#    And user click search_icon on header
#    And user fill search_field with value "Coats" on search_modal
#    And user can see suggested_search on search_modal
#    And user click "random" suggested_search on search_modal
#    Then user is on search_result_page
#    And user click "random_item_image" on subcategory_page
#    Then user is on pdp_page
#    And user click search_icon on header
#    And user fill search_field with value "Bras" on search_modal
#    And user click search_button on search_modal
#    Then user is on search_result_page
#
##  Add item to wishlist========================================= Done ===================================================
##  Go to account wish list====================================== Done ===================================================
##  Add item to cart from wish list============================== Done ===================================================
#
#  Scenario: As user I want to add item to wish list. As user I want to move items to bag from wish list
#    And user can see main_navigation_carousel on header
#    And user click "Clothing" on main_navigation_carousel
#    And user select "random_subcategory" from subcategory_filter on category_page
#    And user click "random_item_image" on subcategory_page
#    And user is on pdp_page
#
##  Add all item to cart from wish list========================== Done ===================================================
#
#  Scenario: As user I want to move all wishlist items to bag
#
##  Open cart page================================================ Done ===================================================
##  Start checkout================================================ Done ===================================================
#  Scenario: As user I want to go to cart
#    And user click cart_icon on header