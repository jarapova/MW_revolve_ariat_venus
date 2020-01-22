#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, clicking on any of the products should bring me to the destination screen extremely fast.
  PLP - Prefetching

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Clicking on any of the products should bring me to the destination screen extremely fast.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User choose new PLP and then navigates to PDP up to 10 times to check stability of PWA
    Given test steps are under design


#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] Clicking on any of the products should bring me to the destination screen extremely fast.
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Clothing" on hamburger_menu
    And user click "Denim" on hamburger_menu
    And user click "View All" on hamburger_menu
    When user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page

  @proj:revolve @automated
  Scenario:[Revolve] User choose new PLP and then navigates to PDP up to 10 times to check stability of PWA
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Clothing" on hamburger_menu
    And user click "Denim" on hamburger_menu
    And user click "View All" on hamburger_menu
    When user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page
    And user go back
    And user scroll page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page
    And user go back
    And user scroll page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page
    And user go back
    And user scroll page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page
    And user go back
    And user scroll page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page
    And user go back
    And user scroll page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page
    And user go back
    And user scroll page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page
    And user go back
    And user scroll page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page
    And user go back
    And user scroll page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page
    And user go back
    And user scroll page
    When user click logo_button on header
    And user click hamburger_menu_icon on header
    And user click hamburger_menu_icon on header
    Then user can see "home_page_content" on home_page


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] Clicking on any of the products should bring me to the destination screen extremely fast.
    Given user is on home_page
    When user can see main_navigation_carousel on header
    And user click "Clothing" on main_navigation_carousel
    And user select "Dresses" from subcategory_filter on category_page
    Then user can see "dress_items_content" on subcategory_page
    When user click "random_item_image" on subcategory_page
    And user scroll page
    Then user can see "product_page_content" on product_page

  @proj:venus @automated
  Scenario:[Venus] User choose new PLP and then navigates to PDP up to 10 times to check stability of PWA
    Given user is on home_page
    When user can see main_navigation_carousel on header
    And user click "Clothing" on main_navigation_carousel
    And user select "Dresses" from subcategory_filter on category_page
    Then user can see "dress_items_content" on subcategory_page
    When user click "random_item_image" on subcategory_page
    And user scroll page
    Then user can see "product_page_content" on product_page
    And user go back
    When user click "random_item_image" on subcategory_page
    And user scroll page
    Then user can see "product_page_content" on product_page
    And user go back
    When user click "random_item_image" on subcategory_page
    And user scroll page
    Then user can see "product_page_content" on product_page
    And user go back
    When user click "random_item_image" on subcategory_page
    And user scroll page
    Then user can see "product_page_content" on product_page
    And user go back
    When user click "random_item_image" on subcategory_page
    And user scroll page
    Then user can see "product_page_content" on product_page
    And user go back
    When user click "random_item_image" on subcategory_page
    And user scroll page
    Then user can see "product_page_content" on product_page
    And user go back
    When user click "random_item_image" on subcategory_page
    And user scroll page
    Then user can see "product_page_content" on product_page
    And user go back
    When user click "random_item_image" on subcategory_page
    And user scroll page
    Then user can see "product_page_content" on product_page
    And user go back
    When user click "random_item_image" on subcategory_page
    And user scroll page
    Then user can see "product_page_content" on product_page
    And user go back
    When user click "random_item_image" on subcategory_page
    And user scroll page
    Then user can see "product_page_content" on product_page
    And user go back
    When user click "random_item_image" on subcategory_page
    And user scroll page
    Then user can see "product_page_content" on product_page
    And user go back
    When user click "random_item_image" on subcategory_page
    And user scroll page
    Then user can see "product_page_content" on product_page
    And user go back
    When user click logo_button on header
    Then user can see "home_page_content" on home_page
    And user click hamburger_menu_icon on header
    And user click hamburger_menu_icon on header



#================================  [ShoeCarnival]   ========================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] Clicking on any of the products should bring me to the destination screen extremely fast.
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User choose new PLP and then navigates to PDP up to 10 times to check stability of PWA
    Given test steps are under design


#================================  [Stagestores]   ========================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] Clicking on any of the products should bring me to the destination screen extremely fast.
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User choose new PLP and then navigates to PDP up to 10 times to check stability of PWA
    Given test steps are under design


#================================  [BluePlanet]   ========================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] Clicking on any of the products should bring me to the destination screen extremely fast.
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User choose new PLP and then navigates to PDP up to 10 times to check stability of PWA
    Given test steps are under design

#================================  [Ariat]   ========================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @automated
  Scenario:[Ariat] Clicking on any of the products should bring me to the destination screen extremely fast.
    Given user is on home_page
    And user click "Women" on main_navigation_carousel
    When user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page

  @proj:ariat @automated
  Scenario:[Ariat] User choose new PLP and then navigates to PDP up to 10 times to check stability of PWA
    Given user is on home_page
    And user click "Women" on main_navigation_carousel
    When user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page

    And user click "Men" on main_navigation_carousel
    When user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page

    And user click "Kids" on main_navigation_carousel
    When user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page

    And user click "Clearance" on main_navigation_carousel
    When user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page

    When user click hamburger_menu_icon on header
    And user click "Men" on hamburger_menu
    And user click "Footwear" on hamburger_menu
    And user click "Western" on hamburger_menu
    Then user click "Exotics" on hamburger_menu
    When user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page

    When user click hamburger_menu_icon on header
    Then user click "Cowboy" on hamburger_menu
    When user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page

    When user click hamburger_menu_icon on header
    Then user click "Dress" on hamburger_menu
    When user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page

    When user click hamburger_menu_icon on header
    Then user click "Hunt" on hamburger_menu
    When user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page

    When user click hamburger_menu_icon on header
    Then user click "Casual" on hamburger_menu
    When user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page
    When user click logo_button on header
    Then user can see "home_page_content" on home_page
    And user click hamburger_menu_icon on header