#Projects:
#@proj:revolve
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet

Feature: As a customer, I can sort the product listing by all available options.
  PLP - Sorting

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can sort the product listing by all available options.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can open and close sort_popup
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Sorting does not cancel filtering on product list page
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @manual
  Scenario:[Revolve] [REV-234] Sort By should show the selected option while page is loading instead of default value
    Given test steps are under design

  @proj:revolve @automated
  Scenario:[Revolve] User can open and close sort_popup
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    When user remember items_count on subcategory_page
    And user click sort_button on subcategory_page
    Then user click close_sort_button on filter_popup
    And user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become equal on subcategory_page

  @proj:revolve @automated
  Scenario:[Revolve] User can sort the product listing by all available options.
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    When user remember items_count on subcategory_page
    Then user click sort_button on subcategory_page
    And user select "Price: High to Low" from sort_dropdown on product_list_page
    And user can see "high_to_low_content" on subcategory_page
    And user can see current_items_count become equal on subcategory_page
    When user remember items_count on subcategory_page
    Then user click sort_button on subcategory_page
    And user select "Price: Low to High" from sort_dropdown on product_list_page
    And user can see "low_to_high_content" on subcategory_page
    And user can see current_items_count become equal on subcategory_page
    When user remember items_count on subcategory_page
    Then user click sort_button on subcategory_page
    And user select "Newest" from sort_dropdown on product_list_page
    And user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become equal on subcategory_page
    When user remember items_count on subcategory_page
    Then user click sort_button on subcategory_page
    And user select "Most Popular" from sort_dropdown on product_list_page
    And user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become equal on subcategory_page
    When user remember items_count on subcategory_page
    Then user click sort_button on subcategory_page
    And user select "Designer" from sort_dropdown on product_list_page
    And user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become equal on subcategory_page
    When user remember items_count on subcategory_page
    Then user click sort_button on subcategory_page
    And user select "Category" from sort_dropdown on product_list_page
    And user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become equal on subcategory_page
    When user remember items_count on subcategory_page
    Then user click sort_button on subcategory_page
    And user select "Featured" from sort_dropdown on product_list_page
    And user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become equal on subcategory_page

  @proj:revolve @tobeautomated
  Scenario:[Revolve] [REV-427] User can see sort is retained after navigating to a different category
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    Then user can see "product_list_page_content" on subcategory_page
    When user click sort_button on subcategory_page
    And user select "Price: High to Low" from sort_dropdown on product_list_page
    Then user can see "high_to_low_content" on subcategory_page
    When user click "categories_tab" on header
    And user click "Clothing" on dropdown_menu
    Then user can see "product_list_page_content" on subcategory_page
    And user can see "high_to_low_content" on subcategory_page

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can sort the product listing by all available options.
      Sorting options:
      best_match
      price_down
      price_descending
      new-arrivals
      most-popular
      top-rated
    The ability to sort the list of products through the different options provided
  Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-195] User can see sorting names Capitalized
    Given test steps are under design

     @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-195] Sort option “price low-high” or “price high-low” have expected styling
    Given test steps are under design

     @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-304] No toggling between 'Shop my store' and 'All items' after user apply any option on 'Sort by' filter
    Given test steps are under design




#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can sort the product listing by all available options.
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can open and close sort_popup
    Given test steps are under design



#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can sort the product listing by all available options.
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can open and close sort_popup
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @automated
  Scenario Outline:[Ariat] User can sort the product listing by all available options.
    Given user is on home_page
    And user click "<navi_category>" on main_navigation_carousel
    When user can see "product_list_page_content" on subcategory_page
    Then user remember items_count on subcategory_page
    When user click "sort_button" on subcategory_page
    And user select "Price (High to Low)" from sort_dropdown on product_list_page
    And user can see "product_list_page_content" on subcategory_page
    Then user can see "high_to_low_sorted_content" on subcategory_page
    And user can see current_items_count become equal on subcategory_page

    When user click "sort_button" on subcategory_page
    And user select "Price (Low to High)" from sort_dropdown on product_list_page
    And user can see "product_list_page_content" on subcategory_page
    Then user can see "low_to_high_sorted_content" on subcategory_page
    And user can see current_items_count become equal on subcategory_page

    When user click "sort_button" on subcategory_page
    And user select "Recommended" from sort_dropdown on product_list_page
    And user can see "product_list_page_content" on subcategory_page
    Then user can see current_items_count become equal on subcategory_page

    When user click "sort_button" on subcategory_page
    And user select "Best Seller" from sort_dropdown on product_list_page
    And user can see "product_list_page_content" on subcategory_page
    Then user can see current_items_count become equal on subcategory_page

    When user click "sort_button" on subcategory_page
    And user select "New Arrivals" from sort_dropdown on product_list_page
    And user can see "product_list_page_content" on subcategory_page
    Then user can see current_items_count become equal on subcategory_page

    Examples:
      | navi_category |
#      |Men            |
#      |Women          |
      |Kids           |
#      |Clearance      |

  @proj:ariat @automated
  Scenario:[Ariat] User can open and close sort_popup
    Given user is on home_page
    And user click "Kids" on main_navigation_carousel
    When user scroll page
    And user click "sort_button" on subcategory_page
    And user click "close_sort_popup_button" on subcategory_page
    Then user can not see "sort_popup" on subcategory_page
    And user can see "product_list_page_content" on subcategory_page

  @proj:ariat @automated
  Scenario:[Ariat] Sorting does not cancel filtering on product list page
    Given user is on home_page
    When user click "Women" on main_navigation_carousel
    Then user can see "product_list_page_content" on subcategory_page
    When user click "filter_button" on subcategory_page
    And user click "Price_accordion" on filter_popup
    And user select "$100 - $199.99" on filter_accordion
    Then user click "apply_filter_button" on subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    When user click "sort_button" on subcategory_page
    And user select "Price (High to Low)" from sort_dropdown on product_list_page
    And user can see "product_list_page_content" on subcategory_page
    Then user can see "item_price" in range from "100" to "200" on subcategory_page