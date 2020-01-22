Feature: This test suite declines Product list Page functionality for Venus

  PLP page should have expected content - Ready for dev
  Category nav filter - Ready for dev
  Size filter - Ready for dev
  Navigate to PDP - Ready for dev
  Navigate to top of PLP page  - Ready for dev
  Price with sale

  Scenario: Category filter on PLP should have expected content
    Given user is on home_page
    And user can see main_navigation_carousel on header
    And user click "Lingerie" on main_navigation_carousel
    And user select "Panties" from subcategory_filter on category_page
    And user can see subcategory_filter_button with value "Panties" on subcategory_page


 #PLP page should have expected content
  Scenario: PLP page should have expected content
    Given user is on home_page
    And user can see main_navigation_carousel on header
    And user click "Lingerie" on main_navigation_carousel
    And user select "Bras" from subcategory_filter on category_page
    And user can see "bras_items_content" on subcategory_page
    And user click subcategory_filter on subcategory_page
    And user can see "lingerie_subcategory_filter_content" on subcategory_page
    And user click "Bras" from subcategory_filter on subcategory_page
    And user click item_parameters_filter on subcategory_page
    And user expand parameters on item_parameters_filter_popup
    And user can see "lingerie_item_parameters_filter_content" on subcategory_page
    And user click close_item_parameters_filter on subcategory_page



  #Category nav filter
  Scenario:  As user I want switch between subcategories using subcategory navigation filter
    Given user is on home_page
    And user can see main_navigation_carousel on header
    And user click "Clothing" on main_navigation_carousel
    And user select "Dresses" from subcategory_filter on category_page
    And user can see "dress_items_content" on subcategory_page
    And user click subcategory_filter on subcategory_page
    And user click "random_subcategory" from subcategory_filter on subcategory_page
    And user can see "random_subcategory_items_content" on subcategory_page

  #Size filter
  Scenario: User can sort items on items list page using "Size filter"
    Given user is on home_page
    And user can see main_navigation_carousel on header
    And user click "Clothing" on main_navigation_carousel
    And user select "Dresses" from subcategory_filter on category_page
    And user can see "dress_items_content" on subcategory_page
    And user can see current_items_count on subcategory_page
    Then user click size_filter_button on subcategory_page
    And user select "random_size_filter" from filter_popup on subcategory_page
    And user click view_results_button on filter_popup
    And user can see current_items_count become less or equal on subcategory_page
    Then user click size_filter_button on subcategory_page
    And user click clear_filter_button on filter_popup
    And user click view_results_button on filter_popup
    And user can see current_items_count become equal on subcategory_page
    Then user click size_filter_button on subcategory_page
    And user select "random_size_filter" from filter_popup on subcategory_page
    And user select "random_size_filter" from filter_popup on subcategory_page
    And user click view_results_button on filter_popup
    And user can see current_items_count become less or equal on subcategory_page
    Then user click size_filter_button on subcategory_page
    And user click clear_filter_button on filter_popup
    And user click view_results_button on filter_popup
    And user can see current_items_count become equal on subcategory_page

  #Navigate to PDP
  Scenario: As user I want to  Navigate to PDP
    Given user is on home_page
    And user can see main_navigation_carousel on header
    And user click "Clothing" on main_navigation_carousel
    And user select "Dresses" from subcategory_filter on category_page
    And user can see "dress_items_content" on subcategory_page
    And user click "random_item_image" on subcategory_page
    And user scroll page
    And user can see "product_page_content" on product_page

  #Price with sale
  Scenario: As user I want to see price with sale for items with sale
    Given user is on home_page
    And user can see main_navigation_carousel on header
    And user click "Sale" on main_navigation_carousel
    And user select "Jewelry" from subcategory_filter on category_page
    And user can see "jewelry_items_content" on subcategory_page
    And user can see price_with_sale on subcategory_page
