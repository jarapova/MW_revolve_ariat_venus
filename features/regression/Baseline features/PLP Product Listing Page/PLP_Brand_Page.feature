#Projects:
#@proj:revolve
#@proj:shoecarnival

Feature: As a customer, I can see a separate brand page with list of all brand items
  PLP - Brand Pages

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see a separate brand page with list of all brand items
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can apply filtering on Brand page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can apply sorting on brand page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see swatches for color filters on brand page
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see a separate brand page with list of all brand items
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Designers" on hamburger_menu
    And user click "525 america" on brand_page
    Then user can see "product_list_page_content" on subcategory_page
    And user can see "main_text" with value "525 america" on subcategory_page


  @proj:revolve @automated
  Scenario:[Revolve] User can apply filtering on Brand page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Designers" on hamburger_menu
    And user click "525 america" on brand_page
    Then user can see "product_list_page_content" on subcategory_page
    When user remember items_count on subcategory_page
    And user click filter_button on subcategory_page
    And user click "color_filter" on filter_popup
    And user select "Gray" on filter_accordion
    Then user click view_results_button on filter_popup
    And user can see "filter_text" with value "Gray" on subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become less or equal on subcategory_page

  @proj:revolve @automated
  Scenario:[Revolve] User can apply sorting on brand page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Designers" on hamburger_menu
    And user click "525 america" on brand_page
    Then user can see "product_list_page_content" on subcategory_page
    When user remember items_count on subcategory_page
    And user click sort_button on subcategory_page
    And user select "Price: High to Low" from sort_dropdown on product_list_page
    Then user can see "high_to_low_content" on subcategory_page
    And user can see current_items_count become equal on subcategory_page
    When user remember items_count on subcategory_page
    And user click sort_button on subcategory_page
    And user select "Price: Low to High" from sort_dropdown on product_list_page
    Then user can see "low_to_high_content" on subcategory_page
    And user can see current_items_count become equal on subcategory_page
    When user remember items_count on subcategory_page
    And user click sort_button on subcategory_page
    And user select "Newest" from sort_dropdown on product_list_page
    Then user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become equal on subcategory_page
    When user remember items_count on subcategory_page
    And user click sort_button on subcategory_page
    And user select "Most Popular" from sort_dropdown on product_list_page
    Then user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become equal on subcategory_page
    When user remember items_count on subcategory_page
    And user click sort_button on subcategory_page
    And user select "Category" from sort_dropdown on product_list_page
    Then user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become equal on subcategory_page
    When user remember items_count on subcategory_page
    And user click sort_button on subcategory_page
    And user select "Featured" from sort_dropdown on product_list_page
    Then user can see "product_list_page_content" on subcategory_page
    And user can see current_items_count become equal on subcategory_page

  @proj:revolve @automated
  Scenario:[Revolve] User can see swatches for color filters on brand page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Designers" on hamburger_menu
    And user click "525 america" on brand_page
    Then user can see "product_list_page_content" on subcategory_page
    And user click filter_button on subcategory_page
    And user click "color_filter" on filter_popup
    Then user can see "swatches_content" on filter_popup

 #================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can see a separate brand page with list of all brand items
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can apply filtering on Brand page
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can apply sorting on brand page
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can see swatches for color filters on brand page
    Given test steps are under design