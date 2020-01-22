#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I should see a list of products that are recommended to me (ie. Best Sellers) and I may click the product to see the product details page.
  HP - Product Recommendations
  Homepage - New Arrivals
  PlanetBlue Homepage - New Arrivals - As a customer, I want to see new arrivals of products on the homepage.


#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see "Recommended for you" carousel and can swipe carousel.
    Given test steps are under design


  @proj:baseline
  Scenario:[Baseline] User can click each item in "Recommended for you" carousel and be navigated to appropriate page
    Given test steps are under design


#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see "Best Sellers" carousel and can swipe carousel.
    Given user is on home_page
    When user can see "home_page_content" on home_page
    Then user can see "best_sellers_content" on home_page
    Then user can see "home_page_content" on home_page

  @proj:revolve @manual
  Scenario:[Revolve] [REV-217] [REV-203] User can see Recommended For You products URL tracking
    Given user is on home_page
    Then  user can see the URL tracking for recommended for you products: &srcType=hp_recs_pers_m

  @proj:revolve @automated
  Scenario:[Revolve] User can click each item in "Best Sellers" carousel and be navigated to appropriate page
    Given user is on home_page
    When user can see "home_page_content" on home_page
    Then user click "random_best_sellers_product" on home_page
    And user can see "product_page_content" on product_page

  @proj:revolve @manual
  Scenario:[Revolve] User can see "Recommended for you" carousel and it shows two and half items
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    Then user make login as "rev_test_user"

  @proj:revolve @manual
  Scenario:[Revolve][REV-386] User can see "Recommended for you" carousel has loaded and it`s taking no long time to load
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] User can see "Recently view" carousel and it shows two and half items
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] [REV-183] User can NOT see "Recommended for you" product carousel in incognito mode
    Given user is on home_page
    And user scroll page
    Then user can not see "product_recommendations_content" on home_page

  @proj:revolve @manual
  Scenario:[Revolve] [REV-216] User can see "Best Sellers" product carousel in incognito mode and new visitors
    Given test steps are under design


  @proj:revolve @automated
  Scenario:[Revolve] User can see "Recommended for you" carousel after visiting three PDP's
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    Then user make login as "rev_test_user"
    Then user is on "item_1" product_page
    And user scroll page
    Then user is on "item_on_sale" product_page
    And user scroll page
    Then user is on "test_item_2" product_page
    And user scroll page
    Then user is on "test_item" product_page
    And user scroll page
    When user is on home_page
    And user can see "home_page_content" on home_page
    And user scroll to the bottom of page
    Then user can see "product_recommendations_content" on home_page

  @proj:revolve @automated
  Scenario:[Revolve] User can click each item in "Recommended for you" carousel and be navigated to appropriate page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    Then user make login as "rev_test_user"
    Then user is on "item_1" product_page
    And user scroll page
    Then user is on "item_on_sale" product_page
    And user scroll page
    Then user is on "test_item_2" product_page
    And user scroll page
    Then user is on "test_item" product_page
    And user scroll page
    When user is on home_page
    And user can see "home_page_content" on home_page
    And user scroll to the bottom of page
    And user can see "product_recommendations_content" on home_page
    And user click "random_recommended_product" on home_page
    Then user can see "product_page_content" on product_page


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @tobeautomated
  Scenario:[Venus] User can see "Recommended for you" carousel and can swipe carousel.
    Given test steps are under design

  @proj:venus @tobeautomated
  Scenario:[Venus] User can click each item in "Recommended for you" carousel and be navigated to appropriate page
    Given test steps are under design


#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can see "Recommended for you" carousel and can swipe carousel.
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can click each item in "Recommended for you" carousel and be navigated to appropriate page
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see "Recommended for you" carousel and can swipe carousel.
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can click each item in "Recommended for you" carousel and be navigated to appropriate page
    Given test steps are under design


#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible
#goodNoTA
  @proj:ariat @automated2
  Scenario:[Ariat] User can see "New Arrivals" section and can swipe carousel.
    Given user is on home_page
    When user scroll page
    Then user can see "new_arrivals_content" on home_page
#goodNoTA
  @proj:ariat @automated2
  Scenario:[Ariat] User can click each item in "New Arrivals" section and be navigated to appropriate page
    Given user is on home_page
    When user scroll page
    Then user can see "new_arrivals_content" on home_page
    When user click "random_new_arrival_item" on home_page
    Then user can see "product_page_content" on product_page


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see "New Arrivals" section and can swipe carousel.
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can click each item in "New Arrivals" section and be navigated to appropriate page
    Given test steps are under design


