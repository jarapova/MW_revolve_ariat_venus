Feature: This test suite defines the Search Menu functionality for StageStores


  Search Menu Flow:

  Open/close search ====================================================== Ready for dev
  Search - “No Results” page ============================================= Ready for dev
  Navigate to search results using search suggestions ==================== Ready for dev
  Navigate to search results using search button ========================= Ready for dev

# User can open and close Search Menu
  Scenario: User opens search menu from homepage
    Given user is on home_page
    And user click search_icon on header
    And user can see search_modal_content on search_modal
    And user close search_modal
    Then user can see "home_page_content" on home_page

# User can access "No Results" page through search
  Scenario: User sees "0 Product Results" page if invalid search term submitted on search menu
    Given user is on home_page
    And user click search_icon on header
    And user fill search_field with value "fasdfasdfasd" on search_modal
    And user click search_button on search_modal
    And user can see "no_products_found_content" on no_products_found_page

# Navigate to search results using search suggestions
  Scenario: User navigates to PDP from search results using search suggestion
    Given user is on home_page
    And user click search_icon on header
    And user fill search_field with value "Bags" on search_modal
    And user can see "search_suggestion_content" on search_suggestion_modal
    And user click "search_suggestion_1_name" on search_modal
    Then user can see "search_results_content" on search_result_page
    And user click random_item_image on search_result_page
    Then user can see "pdp_page_content" on pdp_page

# Navigate to search results using search button
  Scenario: User navigates to PDP from search results
    Given user is on home_page
    And user click search_icon on header
    And user fill search_field with value "Bags" on search_modal
    And user click search_button on search_modal
    Then user can see "search_results_content" on search_result_page
    And user click random_item_image on plp_page
    Then user can see "pdp_page_content" on pdp_page