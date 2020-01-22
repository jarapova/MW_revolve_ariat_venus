#Projects:
#@proj:shoecarnival
#@proj:revolve
#@proj:venus
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature:  As a customer, I can navigate through the total product results through pagination links
  PLP - Pagination
  PLP - Infinite Scroll

  Venus: "Show more" button
  Revolve: "Show more" button
  Ariat: As a customer, I can navigate through the total product results with an infinite scroll using the show more button.

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User can navigate through the total product results through pagination links
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User see additional list of unique items after tapping pagination link. Items are different then in previous list
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User see additional list of unique items after tapping pagination link on search result PLP. Items are different then in previous list
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User see additional list of unique items after scrolling on search result PLP if user APPLIED sort before. Items are different then in previous list
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User see additional list of unique items after scrolling on search result PLP if user APPLIED filter before. Items are different then in previous list
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User see additional list of unique items after scrolling if user APPLIED sort before. Items are different then in previous list
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User see additional list of unique items after scrolling if user APPLIED filter before. Items are different then in previous list
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can navigate through the total product results through pagination links
    Each time user can see 50 items more on plp
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    When user can see "product_list_page_content" on subcategory_page
    Then user can see "show_more_pagination_button" on subcategory_page
    And user click "show_more_pagination_button" on subcategory_page
    And user can see "extended_product_list_page_content" on subcategory_page

  @proj:revolve @automated
  Scenario:[Revolve] User see additional list of unique items after tapping pagination link. Items are different then in previous list
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    When user can see "product_list_page_content" on subcategory_page
    Then user can see "show_more_pagination_button" on subcategory_page
    And user remember plp_items_names on subcategory_page
    And user click "show_more_pagination_button" on subcategory_page
    And user can see "different_plp_items" on subcategory_page

  @proj:revolve @automated
  Scenario:[Revolve] User see additional list of unique items after tapping pagination link on search result PLP. Items are different then in previous list
    Given user is on home_page
    And user click search_icon on header
    And user can see "search_modal_content" on search_modal
    When user fill search_field with value "Coats" on search_modal
    And user can see "suggested_search_results_content" on search_modal
    Then user click search_button on search_modal
    And user can see "product_list_page_content" on subcategory_page
    When user can see "show_more_pagination_button" on subcategory_page
    And user remember plp_items_names on subcategory_page
    And user click "show_more_pagination_button" on subcategory_page
    Then user can see "different_plp_items" on subcategory_page


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can navigate through the total product results through pagination links
    Given user is on home_page
    When user can see main_navigation_carousel on header
    And user click "Clothing" on main_navigation_carousel
    And user select "Dresses" from subcategory_filter on category_page
    Then user can see "dress_items_content" on subcategory_page
    And user can see current_items_count on subcategory_page
    And user click "show_more_button" on subcategory_page
    Then user can see "dress_items_content" on subcategory_page
    And user can see current_items_count become equal on subcategory_page

  @proj:venus @automated
  Scenario:[Venus] User see additional list of unique items after tapping pagination link. Items are different then in previous list
    Given user is on home_page
    When user can see main_navigation_carousel on header
    And user click "Clothing" on main_navigation_carousel
    And user select "Dresses" from subcategory_filter on category_page
    Then user can see "product_list_page_content" on subcategory_page
    And user remember plp_items_names on subcategory_page
    When user click "show_more_button" on subcategory_page
    Then user can see "product_list_page_content" on subcategory_page
    And user can see "different_plp_items" on subcategory_page

  @proj:venus @automated
  Scenario:[Venus] User see additional list of unique items after tapping pagination link on search result PLP. Items are different then in previous list
    Given user is on home_page
    When user click search_icon on header
    And user fill search_field with value "Bras" on search_modal
    And user can see suggested_search on search_modal
    And user click "random_suggested_search" on search_modal
    Then user can see "product_list_page_content" on subcategory_page
    And user remember plp_items_names on subcategory_page
    When user click "show_more_button" on subcategory_page
    And user can see "extended_product_list_page_content" on subcategory_page
    Then user can see "different_plp_items" on subcategory_page



#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can navigate through the total product results through pagination links. "Show more" button
      Load more link on the bottom of the product listing section allowing the customer to continue loading more products
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User see additional list of unique items after tapping pagination link. Items are different then in previous list
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User see additional list of unique items after tapping pagination link on SEARCH RESULT PLP. Items are different then in previous list
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-260] On PLP "Show more" button should not switch between Shop My Store and All Items tab
    Given test steps are under design

     @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-240] Display XX out of XXX at the End of Product Tiles.
     After a user land on a PLP and scrolls down to the "Show More" button, the number of results should display
     as 24 out of 489 Results. After they tap the "Show More" button and scroll through the next 24 product the
     results should display as "48 out of 489"
    Given test steps are under design


  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival][SCP-212] Load more on search result page should work correct.
  The issue was: After searching for "Boots" and scrolling down far enough to see the Load More button - tapping on the button does the following:
  no additional results display
  the qty shown next to “Results” goes away
  refinements are removed from the top of the page
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can navigate through the total product results through pagination links
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User see additional list of unique items after tapping pagination link. Items are different then in previous list
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User see additional list of unique items after tapping pagination link on search result PLP. Items are different then in previous list
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can navigate through the total product results through pagination links
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User see additional list of unique items after tapping pagination link. Items are different then in previous list
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User see additional list of unique items after tapping pagination link on search result PLP. Items are different then in previous list
    Given test steps are under design


#================================  [Ariat]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:ariat @automated
  Scenario:[Ariat] User can navigate through the total product results using infinite scroll on PLP
    Given user is on home_page
    And user click "Women" on main_navigation_carousel
    Then user can see "product_list_page_content" on subcategory_page
    When user scroll to the bottom of page
    Then user can see "show_more_button" on subcategory_page
    When user click "show_more_button" on subcategory_page
    Then user can see "extended_product_list_page_content" on subcategory_page
#goodNoTa
  @proj:ariat @automated
  Scenario:[Ariat] User see additional list of unique items after scrolling. Items are different then in previous list
    Given user is on home_page
    And user click "Men" on main_navigation_carousel
    Then user can see "product_list_page_content" on subcategory_page
    And user remember plp_items_names on subcategory_page
    When user scroll to the bottom of page
    Then user can see "show_more_button" on subcategory_page
    When user click "show_more_button" on subcategory_page
    Then user can see "extended_product_list_page_content" on subcategory_page
    And user can see "different_plp_items_names" on subcategory_page

  @proj:ariat @automated
  Scenario:[Ariat] User see additional list of unique items after scrolling if user APPLIED sort before. Items are different then in previous list
    Given user is on home_page
    When user click "Men" on main_navigation_carousel
    Then user can see "product_list_page_content" on subcategory_page
    When user click "sort_button" on subcategory_page
    And user select "Price (High to Low)" from sort_dropdown on product_list_page
    Then user can see "product_list_page_content" on subcategory_page
    And user remember plp_items_names on subcategory_page
    When user scroll to the bottom of page
    Then user can see "show_more_button" on subcategory_page
    When user click "show_more_button" on subcategory_page
    Then user can see "extended_product_list_page_content" on subcategory_page
    And user can see "different_plp_items_names" on subcategory_page

  @proj:ariat @automated
  Scenario:[Ariat] User see additional list of unique items after scrolling if user APPLIED filter before. Items are different then in previous list
    Given user is on home_page
    When user click "Men" on main_navigation_carousel
    Then user can see "product_list_page_content" on subcategory_page
    When user click "filter_button" on subcategory_page
    And user click "Price_accordion" on filter_popup
    And user select "$100 - $199.99" on filter_accordion
    And user click "apply_filter_button" on subcategory_page
    Then user can see "product_list_page_content" on subcategory_page
    And user remember plp_items_names on subcategory_page
    When user scroll to the bottom of page
    Then user can see "show_more_button" on subcategory_page
    When user click "show_more_button" on subcategory_page
    Then user can see "extended_product_list_page_content" on subcategory_page
    And user can see "different_plp_items_names" on subcategory_page

  @proj:ariat @automated
  Scenario:[Ariat] User see additional list of unique items after scrolling on search result PLP. Items are different then in previous list
    Given user is on home_page
    And user click search_icon on header
    When user fill search_field with value "Shirts" on search_modal
    And user click "search_button" on search_modal
    Then user can see "product_list_page_content" on subcategory_page
    When user click "filter_button" on subcategory_page
    And user click "Size_accordion" on filter_popup
    And user select "Medium" on filter_accordion
    Then user click "apply_filter_button" on subcategory_page
    When user can see "product_list_page_content" on subcategory_page
    And user remember plp_items_names on subcategory_page
    When user scroll to the bottom of page
    Then user can see "show_more_button" on subcategory_page
    When user click "show_more_button" on subcategory_page
    Then user can see "extended_product_list_page_content" on subcategory_page
    And user can see "different_plp_items_names" on subcategory_page

  @proj:ariat @automated
  Scenario:[Ariat] User see additional list of unique items after scrolling on search result PLP if user APPLIED sort before. Items are different then in previous list
    Given user is on home_page
    And user click search_icon on header
    When user fill search_field with value "Shirts" on search_modal
    And user click "search_button" on search_modal
    Then user can see "product_list_page_content" on subcategory_page
    When user click "sort_button" on subcategory_page
    And user select "Price (High to Low)" from sort_dropdown on product_list_page
    Then user can see "product_list_page_content" on subcategory_page
    And user remember plp_items_names on subcategory_page
    When user scroll to the bottom of page
    Then user can see "show_more_button" on subcategory_page
    When user click "show_more_button" on subcategory_page
    Then user can see "extended_product_list_page_content" on subcategory_page
    And user can see "different_plp_items_names" on subcategory_page

  @proj:ariat @automated
  Scenario:[Ariat] User see additional list of unique items after scrolling on search result PLP if user APPLIED filter before. Items are different then in previous list
    Given user is on home_page
    And user click search_icon on header
    When user fill search_field with value "Shirts" on search_modal
    And user click "search_button" on search_modal
    Then user can see "product_list_page_content" on subcategory_page
    When user click "filter_button" on subcategory_page
    And user click "Size_accordion" on filter_popup
    And user select "Medium" on filter_accordion
    And user click "apply_filter_button" on subcategory_page
    Then user can see "product_list_page_content" on subcategory_page
    And user remember plp_items_names on subcategory_page
    When user scroll to the bottom of page
    Then user can see "show_more_button" on subcategory_page
    When user click "show_more_button" on subcategory_page
    Then user can see "extended_product_list_page_content" on subcategory_page
    And user can see "different_plp_items_names" on subcategory_page