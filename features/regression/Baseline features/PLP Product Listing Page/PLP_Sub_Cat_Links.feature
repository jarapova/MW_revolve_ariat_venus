#Projects:
#@proj:shoecarnival
#@proj:venus
#@proj:stagestores
#@proj:ariat

Feature: As a customer, I will need to select different sub-categories under a parent product listing page as applicable.
  PLP - Sub-category Links
#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User can see different sub-categories under a parent product listing page as applicable
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can click different sub-categories under a parent product listing page to navigate to expected PLP
    Given test steps are under design


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can see different sub-categories under a parent product listing page as applicable
    Given user is on home_page
    When user can see main_navigation_carousel on header
    And user click "Lingerie" on main_navigation_carousel
    And user select "Bras" from subcategory_filter on category_page
    Then user can see "bras_items_content" on subcategory_page
    When user click subcategory_filter on subcategory_page
    Then user can see "lingerie_subcategory_filter_content" on subcategory_page
    When user is on home_page
    And user can see main_navigation_carousel on header
    Then user click "Clothing" on main_navigation_carousel
    When user click subcategory_filter on category_page
    And user can see "subcategory_filter_content" on subcategory_page
    Then user can see "clothing_subcategory_filter_content" on subcategory_page

  @proj:venus @automated
  Scenario:[Venus] User can click different sub-categories under a parent product listing page to navigate to expected PLP
    Given user is on home_page
    When user can see main_navigation_carousel on header
    And user click "Clothing" on main_navigation_carousel
    And user select "Dresses" from subcategory_filter on category_page
    And user can see "dress_items_content" on subcategory_page
    And user click subcategory_filter on subcategory_page
    And user click "random_subcategory" from subcategory_filter on subcategory_page
    And user can see "random_subcategory_items_content" on subcategory_page


    #================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see different sub-categories under a parent product listing page as applicable
    Given user is on home_page
    And user can see "navigation_bar_content" on header
    When user click "categories_tab" on header
    And user click "Clothing" on dropdown_menu
    Then user can see "product_list_page_content" on subcategory_page
    When user click "Clothing_category_dropdown" on subcategory_page
    Then user can see "category_dropdown_content" on subcategory_page

  @proj:revolve @automated
  Scenario:[Revolve] User can click different sub-categories under a parent product listing page to navigate to expected PLP
    Given user is on home_page
    And user can see "navigation_bar_content" on header
    When user click "categories_tab" on header
    And user click "Clothing" on dropdown_menu
    Then user can see "product_list_page_content" on subcategory_page
    When user click "Clothing_category_dropdown" on subcategory_page
    And user click "random_dropdown_category" on subcategory_page
    Then user can see "product_list_page_content" on subcategory_page

  @proj:revolve @tobeautomated
  Scenario:[Revolve][REV-501] User can click different sub-categories under a parent product listing page on Lingerie&Sleepwear PLP
    Will be automated when the ticket would be done
  Womens>Clothing>Lingerie&Sleepwear>View all
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Clothing" on hamburger_menu
    And user click "Lingerie & Sleepwear" on hamburger_menu
    And user click "View All" on hamburger_menu
    Then user scroll page

#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see different sub-categories under a parent product listing page as applicable
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can click different sub-categories under a parent product listing page to navigate to expected PLP
    Given test steps are under design


#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @automated
  Scenario:[Ariat] User can see different sub-categories under a parent product listing page as applicable
    Given user is on home_page
    And user click "Women" on main_navigation_carousel
    When user can see "product_list_page_content" on subcategory_page
    Then user click "subcategory_filter" on subcategory_page
    And user can see "subcategory_filter_categories" on subcategory_page


  @proj:ariat @automated
  Scenario:[Ariat] User can click different sub-categories under a parent product listing page to navigate to expected PLP
    Given user is on home_page
    And user click "Women" on main_navigation_carousel
    And user can see "product_list_page_content" on subcategory_page
    When user click "subcategory_filter" on subcategory_page
    And user click "Clothing" from subcategory_filter on subcategory_page
    Then user can see "product_list_page_content" on subcategory_page

    When user click "subcategory_filter" on subcategory_page
    And user click "Denim" from subcategory_filter on subcategory_page
    Then user can see "product_list_page_content" on subcategory_page

    When user click "subcategory_filter" on subcategory_page
    And user click "Trouser" from subcategory_filter on subcategory_page
    Then user can see "product_list_page_content" on subcategory_page