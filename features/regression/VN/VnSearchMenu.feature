Feature: This test suite defines the Search Menu functionality for Venus

  Open Search modal
  Close Search modal
  Navigate to search results from search suggestions
  Navigate to search results
  Filter by category for search results

  #Open Search modal
  Scenario: user can open search modal
    Given user is on home_page
    And user click search_icon on header
    Then user can see "search_modal_content" on search_modal

  #Close Search modal
  Scenario: user can close search modal
    Given user is on home_page
    And user click search_icon on header
    And user can see "search_modal_content" on search_modal
    Then user close search_modal
    And user can see "home_page_content" on home_page

  #Navigate to search results and pdp from search suggestions
  #Error bug still found in search ""
  Scenario: user can navigate to search results and pdp from search suggestions
    Given user is on home_page
    And user click search_icon on header
    And user fill search_field with value "Coats" on search_modal
    And user can see suggested_search on search_modal
    And user click "random_suggested_search" on search_modal
    Then user can see "search_results_content" on search_results_page
    And user click "random_item_image" on search_results_page
    And user scroll page
    And user can see "product_page_content" on product_page

  #Navigate to search results and pdp using search button
  Scenario: user can navigate to search results and pdp using search button
    Given user is on home_page
    And user click search_icon on header
    And user fill search_field with value "Bras" on search_modal
    And user click search_button on search_modal
    Then user can see "search_results_content" on search_results_page
    And user click "random_item_image" on search_results_page
    And user scroll page
    And user can see "product_page_content" on product_page

  #Filter by category for search results
  Scenario: User can filter search results by category
    Given user is on home_page
    And user click search_icon on header
    And user fill search_field with value "Coats" on search_modal
    And user click search_button on search_modal
    Then user can see "search_results_content" on search_results_page
    And user can see items count on search_result_page
    And user select "Coats" from subcategory_filter on search_result_page
    And user can see items count on search_result_page with applied filter
    And current items count become less or equal with filter applied on search_result_page
