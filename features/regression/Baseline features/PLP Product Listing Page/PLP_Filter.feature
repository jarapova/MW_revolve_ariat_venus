#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I can filter search result product listing by all available options.
  As a customer, I can filter either the search result product listing or PLP by all available options.
  PLP - Filters

    Filtering options.
    "*===================================="
    Venus:
    By Size
    By Band
    By Cup
    "*===================================="
    Revolve:
    Designer
    Price
    Size
    Color
  "*======================================="
   Shoe Carnival
   Refine By
 Sub-categories
 Brand
 Color (https://moovweb.atlassian.net/browse/SCP-50)
 Size
 Width
 Heel Height  if applicable
 feature
 Price
 Customer Rating

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can filter search result product listing by multiple available options.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can filter search result product listing by size option
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can filter the product listing by size option
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can filter the product listing by multiple available options.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Brandpages should show relevant option for size
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Filters should show the range available on the given PLP page.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Filter options should update after each options selection
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] If user chose any option and closing filter modal without results applying - user should see "Filter" without not applied filter option
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Filtering does not cancel sorting on product list page
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:revolve @automated
  Scenario:[Revolve] User can filter search result product listing by multiple available options.
    Given user is on home_page
    And user click search_icon on header
    And user fill search_field with value "Coats" on search_modal
    Then user click search_button on search_modal
    And user can see "product_list_page_content" on subcategory_page
    And user remember items_count on subcategory_page
    When user click filter_button on subcategory_page
    And user click "size_filter" on filter_popup
    And user select "S" on filter_accordion
    And user click "designer_filter" on filter_popup
    And user select "7 For All Mankind" on filter_accordion
    And user select "A.L.C." on filter_accordion
    And user click "color_filter" on filter_popup
#    And user select "Gray" on filter_accordion
    Then user click view_results_button on filter_popup
    And user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page


  @proj:revolve @automated
  Scenario:[Revolve] User can filter search result product listing by size option
    Given user is on home_page
    And user click search_icon on header
    And user fill search_field with value "Coats" on search_modal
    Then user click search_button on search_modal
    And user can see "product_list_page_content" on subcategory_page
    And user remember items_count on subcategory_page
    When user click filter_button on subcategory_page
    And user click "size_filter" on filter_popup
    And user select "M" on filter_accordion
    Then user click view_results_button on filter_popup
    And user can see "filter_text" with value "M" on subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page
    And user click "random_item_name" on subcategory_page
    And user can see "product_size" with value "M" on product_page

  @proj:revolve @automated
  Scenario:[Revolve] User can filter search result product listing by designer option
    Given user is on home_page
    And user click search_icon on header
    And user fill search_field with value "Coats" on search_modal
    Then user click search_button on search_modal
    And user can see "product_list_page_content" on subcategory_page
    And user remember items_count on subcategory_page
    When user click filter_button on subcategory_page
    And user click "designer_filter" on filter_popup
    And user select "BB Dakota" on filter_accordion
    Then user click view_results_button on filter_popup
    And user can see "filter_text" with value "BB Dakota" on subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page
    And user can see "item_brand" with value "BB Dakota" on subcategory_page

  @proj:revolve @automated
  Scenario:[Revolve] User can filter search result product listing by price option
    Given user is on home_page
    And user click search_icon on header
    And user fill search_field with value "Coats" on search_modal
    Then user click search_button on search_modal
    And user can see "product_list_page_content" on subcategory_page
    And user remember items_count on subcategory_page
    When user click filter_button on subcategory_page
    And user click "price_filter" on filter_popup
    And user select "$60 - $80" on filter_accordion
    Then user click view_results_button on filter_popup
    And user can see "filter_text" with value "$60 - $80" on subcategory_page
    When user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page
    Then user can see "item_price" in range from "60" to "80" on subcategory_page

  @proj:revolve @automated
  Scenario:[Revolve] User can filter search result product listing by color option
    Given user is on home_page
    And user click search_icon on header
    And user fill search_field with value "Coats" on search_modal
    Then user click search_button on search_modal
    And user can see "product_list_page_content" on subcategory_page
    And user remember items_count on subcategory_page
    When user click filter_button on subcategory_page
    And user click "color_filter" on filter_popup
    And user select "Gray" on filter_accordion
    Then user click view_results_button on filter_popup
    And user can see "filter_text" with value "Gray" on subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page


  @proj:revolve @automated
  Scenario:[Revolve] User can filter the product listing by multiple available options.
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    And user remember items_count on subcategory_page
    When user click filter_button on subcategory_page
    And user click "size_filter" on filter_popup
    And user select "S" on filter_accordion
    And user click "designer_filter" on filter_popup
    And user select "360CASHMERE" on filter_accordion
    And user select "111Skin" on filter_accordion
    And user click "color_filter" on filter_popup
    And user select "Gray" on filter_accordion
    Then user click view_results_button on filter_popup
    And user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page

  @proj:revolve @automated
  Scenario:[Revolve] User can filter the product listing by size option
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    And user remember items_count on subcategory_page
    When user click filter_button on subcategory_page
    And user click "size_filter" on filter_popup
    And user select "M" on filter_accordion
    Then user click view_results_button on filter_popup
    And user can see "filter_text" with value "M" on subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page
    And user click "random_item_name" on subcategory_page
    And user can see "product_size" with value "M" on product_page


  @proj:revolve @automated
  Scenario:[Revolve] User can filter the product listing by designer option
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    And user remember items_count on subcategory_page
    When user click filter_button on subcategory_page
    And user click "designer_filter" on filter_popup
    And user select "111Skin" on filter_accordion
    Then user click view_results_button on filter_popup
    And user can see "filter_text" with value "111Skin" on subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page
    And user can see "item_brand" with value "111Skin" on subcategory_page

  @proj:revolve @automated
  Scenario:[Revolve] User can filter the product listing by price option
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    And user remember items_count on subcategory_page
    When user click filter_button on subcategory_page
    And user click "price_filter" on filter_popup
    And user select "Under $10" on filter_accordion
    Then user click view_results_button on filter_popup
    And user can see "filter_text" with value "Under $10" on subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page
    And user can see "item_price" with value "less_10" on subcategory_page

  @proj:revolve @automated
  Scenario:[Revolve] User can filter the product listing by color option
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    And user remember items_count on subcategory_page
    When user click filter_button on subcategory_page
    And user click "color_filter" on filter_popup
    And user select "Gray" on filter_accordion
    Then user click view_results_button on filter_popup
    And user can see "filter_text" with value "Gray" on subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page

  @proj:revolve @automated
  Scenario:[Revolve] [REV-277] [REV-189] Brandpages should show relevant option for size
    # REV-277 ticket
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    When user click filter_button on subcategory_page
    And user click "size_filter" on filter_popup
    Then user can see "size_tab" on filter_popup
    And user can see "bottoms_tab" on filter_popup


  @proj:revolve @automated
  Scenario:[Revolve] [REV-276] [REV-188] Filters should show the price range available on the given PLP page.
     # REV-276 ticket
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    And user remember items_count on subcategory_page
    When user click filter_button on subcategory_page
    And user click "price_filter" on filter_popup
    And user select "$200 - $300" on filter_accordion
    Then user click view_results_button on filter_popup
    And user can see "filter_text" with value "$200 - $300" on subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page
    And user can see "item_price" in range from "200" to "300" on subcategory_page

  @proj:revolve @manual
  Scenario:[Revolve] Filter options should update after each options selection
    Given test steps are under design

  @proj:revolve @automated
  Scenario:[Revolve] [REV-220] Clear filter function enabled only when the user has selected more than 1 filter item
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Clothing" on hamburger_menu
    And user click "Activewear" on hamburger_menu
    Then user click "View All" on hamburger_menu
    When user can see "product_list_page_content" on subcategory_page
    Then user click filter_button on subcategory_page
    When user click "designer_filter" on filter_popup
    And user select "adidas by Stella McCartney" on filter_accordion
    And user select "alo" on filter_accordion
    Then user can see "clear_button" on filter_popup

  @proj:revolve @automated
  Scenario:[Revolve] [REV-209] Sort modal should close after apply any options selection
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    Then user click "All New Items" on hamburger_menu
    When user can see "product_list_page_content" on subcategory_page
    Then user click sort_button on subcategory_page
    When user select "Price: Low to High" from sort_dropdown on product_list_page
    Then user can not see "sort_modal" on subcategory_page
    And user can see "product_list_page_content" on subcategory_page


  @proj:revolve @manual
  Scenario:[Revolve] [REV-204] Filter modal should correspond to design
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] [REV-191] [REV-210] Filter modal should close by taping outside modal
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] [REV-186] If a filter option only contains a single option, hide that filter option entirely.
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] [REV-181] PLP - Hide Filter and Sort if Nothing Available. If there are no filtering or sorting options, hide those UI elements.
    Given test steps are under design


  @proj:revolve @automated
  Scenario:[Revolve][REV-218] If user chose any option and closing filter modal without results applying - user should see "Filter" without not applied filter option
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Clothing" on hamburger_menu
    And user click "Activewear" on hamburger_menu
    Then user click "View All" on hamburger_menu
    Then user scroll page
    And user click filter_button on subcategory_page
    When user click "designer_filter" on filter_popup
    And user select "alo" on filter_accordion
    And user click close_filter_button on filter_popup
    Then user can not see "filter_text" on subcategory_page




#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can filter search result product listing by multiple available options.
    Given user is on home_page
    When user click search_icon on header
    And user fill search_field with value "Tops" on search_modal
    And user click search_button on search_modal
    Then user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count on subcategory_page
    When user click size_filter_button on subcategory_page
    And user select "random_size_filter" from filter_popup on subcategory_page
    And user select "random_size_filter" from filter_popup on subcategory_page
    And user select "random_size_filter" from filter_popup on subcategory_page
    And user click view_results_button on filter_popup
    Then user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page
    When user click size_filter_button on subcategory_page
    And user click clear_filter_button on filter_popup
    And user click view_results_button on filter_popup
    Then user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become equal on subcategory_page

  @proj:venus @automated
  Scenario:[Venus] User can filter search result product listing by size option
    Given user is on home_page
    When user click search_icon on header
    And user fill search_field with value "Tops" on search_modal
    And user click search_button on search_modal
    Then user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count on subcategory_page
    When user click size_filter_button on subcategory_page
    And user select "random_size_filter" from filter_popup on subcategory_page
    And user click view_results_button on filter_popup
    Then user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page
    When user click size_filter_button on subcategory_page
    And user click clear_filter_button on filter_popup
    And user click view_results_button on filter_popup
    Then user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become equal on subcategory_page

  @proj:venus @automated
  Scenario:[Venus] User can filter the product listing by multiple available options.
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

  @proj:venus @automated
  Scenario:[Venus] User can filter the product listing by size option
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


#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] [SCP-49] User can filter search result product listing by multiple available options.
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can filter search result product listing by size option
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] [SCP-49] User can filter the product listing by multiple available options.
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can filter the product listing by size option
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can switch from "All items" to "Shop my store" tab and back
    Given test steps are under design

  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival] Items count on "Shop my store" tab on PWA PLP should be equal with legacy PLP  "Shop my store" tab
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-216] Filtered search results shows correct items list
        After searching for "boots" and then refining by color white, the products displayed are not corrected.
        It looks to have just pulled any white shoes, but the results only should have been white boots.
    Given test steps are under design

  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival] [SCP-344] User can see 'Multicolor' visual swatch rainbow colored
    Given test steps are under design




#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can filter the product listing by multiple available options.
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can filter the product listing by size option
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] Filters should show the range available on the given PLP page.
    Given test steps are under design

  @proj:stagestores @manual
  Scenario:[Stagestores] Filter options should update after each options selection
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can filter search result product listing by multiple available options.
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can filter search result product listing by size option
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can filter search result product listing by multiple available options.
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can filter search result product listing by size option
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can filter the product listing by size option
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can filter the product listing by multiple available options.
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:ariat @automated
  Scenario:[Ariat] User can filter search result product listing by multiple available options.
    Given user is on home_page
    And user click search_icon on header
    When user fill search_field with value "Shirts" on search_modal
    And user click "search_button" on search_modal
    Then user can see "product_list_page_content" on subcategory_page
    And user remember items_count on subcategory_page
    When user click "filter_button" on subcategory_page
    And user click "Price_accordion" on filter_popup
    Then user select "$100 - $199.99" on filter_accordion
    When user click "Size_accordion" on filter_popup
    And user select "Medium" on filter_accordion
    Then user click "apply_filter_button" on subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    And user can see "item_price" in range from "100" to "200" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page
    And user click "random_item_name" on subcategory_page
    And user scroll page
    And user click "size_selector" on product_page
    And user can see "size_selector" with value "Medium" on product_page

  @proj:ariat @automated
  Scenario:[Ariat] User can filter the product listing by multiple available options.
    Given user is on home_page
    When user click "Women" on main_navigation_carousel
    Then user can see "product_list_page_content" on subcategory_page
    And user remember items_count on subcategory_page
    When user click "filter_button" on subcategory_page
    And user click "Price_accordion" on filter_popup
    Then user select "$100 - $199.99" on filter_accordion
    When user click "Length_accordion" on filter_popup
    And user select "Regular" on filter_accordion
    Then user click "apply_filter_button" on subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    And user can see "item_price" in range from "100" to "200" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page
#good
  @proj:ariat @automated1
  Scenario:[Ariat] User can filter search result product listing by size option
    Given user is on home_page
    And user click search_icon on header
    When user fill search_field with value "Coats" on search_modal
    And user click "search_button" on search_modal
    Then user can see "product_list_page_content" on subcategory_page
    And user remember items_count on subcategory_page
    When user click "filter_button" on subcategory_page
    And user click "Size_accordion" on filter_popup
    And user select "Medium" on filter_accordion
    Then user click "apply_filter_button" on subcategory_page
    When user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page
    And user click "random_item_name" on subcategory_page
    And user scroll page
    And user click "size_selector" on product_page
    And user can see "size_selector" with value "Medium" on product_page

  @proj:ariat @automated
  Scenario:[Ariat] User can filter the product listing by size option
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Women" on hamburger_menu
    And user click "Clothing" on hamburger_menu
    And user click "Tops & Tees" on hamburger_menu
    Then user click "View all" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    And user remember items_count on subcategory_page
    When user click "filter_button" on subcategory_page
    And user click "Size_accordion" on filter_popup
    And user select "Large" on filter_accordion
    Then user click "apply_filter_button" on subcategory_page
    When user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page
    And user click "random_item_name" on subcategory_page
    And user scroll page
    And user click "size_selector" on product_page
    And user can see "size_selector" with value "Large" on product_page

  @proj:ariat @automated
  Scenario:[Ariat] User can filter search result product listing by price option
    Given user is on home_page
    And user click search_icon on header
    When user fill search_field with value "Coats" on search_modal
    And user click "search_button" on search_modal
    Then user can see "product_list_page_content" on subcategory_page
    And user remember items_count on subcategory_page
    When user click "filter_button" on subcategory_page
    And user click "Price_accordion" on filter_popup
    And user select "$100 - $199.99" on filter_accordion
    Then user click "apply_filter_button" on subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    And user can see "item_price" in range from "100" to "200" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page
#fail
  @proj:ariat @automated
  Scenario:[Ariat] User can filter the product listing by price option
    Given user is on home_page
    When user click "Women" on main_navigation_carousel
    Then user can see "product_list_page_content" on subcategory_page
    And user remember items_count on subcategory_page
    When user click "filter_button" on subcategory_page
    And user click "Price_accordion" on filter_popup
    And user select "$100 - $199.99" on filter_accordion
    Then user click "apply_filter_button" on subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    And user can see "item_price" in range from "100" to "200" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page

  @proj:ariat @automated
  Scenario:[Ariat] Filtering does not cancel sorting on product list page
    Given user is on home_page
    And user click "Women" on main_navigation_carousel
    When user can see "product_list_page_content" on subcategory_page
    When user click "sort_button" on subcategory_page
    And user select "Price (High to Low)" from sort_dropdown on product_list_page
    And user can see "product_list_page_content" on subcategory_page
    When user click "filter_button" on subcategory_page
    And user click "Price_accordion" on filter_popup
    And user select "$100 - $199.99" on filter_accordion
    Then user click "apply_filter_button" on subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    And user can see "item_price" in range from "100" to "200" on subcategory_page
    Then user can see "high_to_low_sorted_content" on subcategory_page
