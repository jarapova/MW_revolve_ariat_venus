#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet

Feature: As a customer, I can see a total count of all products represented by this product listing page. This should read "## ITEMS" where "##" represents the total count.
  PLP - Total Results

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User see a total count of all products represented by this product listing page. This should read "## ITEMS" where "##" represents the total count.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User see a total count of all products represented by this product listing page. This should read "## TOTAL ITEMS" where "##" represents the total count.
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User see a total count of all products represented by this product listing page. This should read "## ITEMS" where "##" represents the total count.
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Clothing" on hamburger_menu
    And user click "Denim" on hamburger_menu
    And user click "View All" on hamburger_menu
    When user can see "product_list_page_content" on subcategory_page
    Then user can see "total_items_count" on subcategory_page

  @proj:revolve @manual
  Scenario:[Revolve] [REV-228] User see a total count of all products with a comma for any count past 999 for all numbers larger than 3 digits.
    Given test steps are under design


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User see a total count of all products represented by this product listing page. This should read "## TOTAL ITEMS" where "##" represents the total count.
    Given user is on home_page
    When user can see main_navigation_carousel on header
    And user click "Clothing" on main_navigation_carousel
    And user select "Dresses" from subcategory_filter on category_page
    Then user can see "correct_price" on subcategory_page


#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User see a total count of all products represented by this product listing page. This should read "## TOTAL ITEMS" where "##" represents the total count.
      The ability to see the total # of products in a category on the page
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User see a total count of all products represented by this product listing page. This should read "## TOTAL ITEMS" where "##" represents the total count.
    Given test steps are under design



#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User see a total count of all products represented by this product listing page. This should read "## TOTAL ITEMS" where "##" represents the total count.
    Given test steps are under design