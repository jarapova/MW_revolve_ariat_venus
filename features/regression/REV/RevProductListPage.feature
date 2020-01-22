Feature: This test suite declines Product list Page functionality for Revolve

  Items on PLP should have expected content ============================================================= Ready for dev
  Switch between subcategories using subcategory navigation filter ====================================== Ready for dev
  Sorting products ====================================================================================== Ready for dev
  Filtering products ==================================================================================== Ready for dev
  Add multiply items to favorites list ================================================================== Ready for dev
  Navigating from bottom to top of PLP using arrow button =============================================== Ready for dev
  Change item color on PLP ============================================================================== Ready for dev
  Navigation to random PDP from PLP ===================================================================== Ready for dev

  #Items on PLP should have expected content
  Scenario: As user I want see names, prices and images for items on PLP
  Given user is on product_list_page
  When user can see "product_list_page_content" on subcategory_page

  #Sorting products
  Scenario: As user I want sort products using sort functionality
  Given user is on product_list_page
  When user can see "product_list_page_content" on subcategory_page
  And user remember items_count on subcategory_page
  Then user click sort_button on subcategory_page
  And user select "Price: High to Low" from sort_dropdown on product_list_page
  And user click close_popup_button on sort_popup
  And user can see current_items_count become equal on subcategory_page
  And user can see "high_to_low_content" on subcategory_page
  Then user click sort_button on subcategory_page
  And user select "Price: Low to High" from sort_dropdown on product_list_page
  And user click close_popup_button on sort_popup
  And user can see current_items_count become equal on subcategory_page
  And user can see "low_to_high_content" on subcategory_page
  Then user click sort_button on subcategory_page
  And user click close_sort_button on filter_popup
  And user can see "product_list_page_content" on subcategory_page
  And user can see current_items_count become equal on subcategory_page

  #Filtering products
  Scenario: As user I want filter products using filter functionality
  Given user is on product_list_page
  When user can see "product_list_page_content" on subcategory_page
  And user remember items_count on subcategory_page
  Then user click filter_button on subcategory_page
  And user click "designer_filter" on filter_popup
  And user select "1. STATE" on filter_accordion
  And user click view_results_button on filter_popup
  And user click close_filter_button on filter_popup
  Then user can see current_items_count become less or equal on subcategory_page

  #Navigating to plp from home_page
  Scenario: As user I want to navigate to plp from home_page
  Given user is on home_page
  When user click hamburger_menu_icon on header
  And user click "Womens" on hamburger_menu
  And user click "New Arrivals" on hamburger_menu
  And user click "All New Items" on hamburger_menu
  Then user can see "product_list_page_content" on subcategory_page
  And user can see "main_text" with value "All New Items" on subcategory_page

  #Try to add item in wish list when you are not logged in
  Scenario:  As user I want to see account notification after clicking add to wish list
  Given user is on product_list_page
  When user can see "product_list_page_content" on subcategory_page
  And user click "random_item_favourites_button" on subcategory_page
  Then user can see "account_modal_content" on subcategory_page

  #Add multiply items to favorites list
#  Scenario: As user I want add multiply items to favorites list
#    Given user is on home_page
#    When user make login as "user1"
#    And user click on favorite icon in header
#    And user is on "favorite items" page
#    And user clear favorite items list
#    And there are no items in favorite list
#    Then user visit "clothing_plp_link" page
#    Then user click on add to favorite icon on two multiply items
#    And user click on favorite icon in header
#    And user is on "favorite items" page
#    Then user can see added product in favorite list
#    Then user click on favorite item icon on two added items
#    And there are no items in favorite list

  #Navigating from bottom to top of PLP using arrow button
  Scenario: As user I want navigate from bottom to top of PLP using arrow button
    Given user is on product_list_page
    When user scroll to the bottom of page
    And user can see arrow_button on page
    Then user click arrow_button on page

#Price with sale
  Scenario: As user I want to see price with sale for items with sale
  Given user is on home_page
  When user click hamburger_menu_icon on header
  And user click "Mens" on hamburger_menu
  And user click "Sale" on hamburger_menu
  And user click "All Sale Items" on hamburger_menu
  And user can see "sale_prices_content" on subcategory_page

#  #Navigation to random PDP from PLP
  Scenario: As user I want navigate to random PDP page from PLP
  Given user is on product_list_page
  When user can see "product_list_page_content" on subcategory_page
  And user click "random_item_name" on subcategory_page
  And user can see "product_page_content" on product_page