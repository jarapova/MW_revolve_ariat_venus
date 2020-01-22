#Projects:
#@proj:shoecarnival
#@proj:venus
#@proj:stagestores


Feature: As a customer, I need to see my current page location based on the navigation hierarchy so I can quickly go back to the previous page sections using breadcrumbs.
  Navigation - Breadcrumbs

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User can see current page location based on the navigation hierarchy
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can quickly go back to the previous page sections using breadcrumbs
    Given test steps are under design


 #================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can see current page location based on the navigation hierarchy
    Given user is on home_page
    And user can see main_navigation_carousel on header
    And user click "Clothing" on main_navigation_carousel
    And user select "Dresses" from subcategory_filter on category_page
    When user click "random_item_image" on category_page
    And user scroll page
    And user can see "product_page_content" on product_page
    Then user can see "bread_crumb" with value "Clothing" on product_page
    And user can see "bread_crumb" with value "Dresses" on product_page

  @proj:venus @automated
  Scenario:[Venus] User can quickly go back to the previous page sections using breadcrumbs
    Given user is on home_page
    And user can see main_navigation_carousel on header
    And user click "Clothing" on main_navigation_carousel
    And user select "Dresses" from subcategory_filter on category_page
    And user click "random_item_image" on category_page
    And user scroll page
    Then user can see "product_page_content" on product_page
    And user click "Dresses" on breadcrumb
    And user go back
    And user can see "product_page_content" on product_page
    And user click logo_button on header



 #================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can see current page location based on the navigation hierarchy. This includes both PLP & PDP breadcrumbs.
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can quickly go back to the previous page sections using breadcrumbs
    Given test steps are under design


  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] Remove the actual Product Title on the PDP breadcrumbs
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see current page location based on the navigation hierarchy
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can quickly go back to the previous page sections using breadcrumbs
    Given test steps are under design