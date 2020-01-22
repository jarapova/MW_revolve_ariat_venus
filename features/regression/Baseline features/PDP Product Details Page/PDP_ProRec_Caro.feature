#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I should be able to view "Recommended For You" section of a product as a carousel
  PDP - Recommendations
  #Venus: Named as "You'll also love"
  #Revolve: Named as "Similar Items"

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see "Recommended for you" product carousel
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can swipe "Recommended for you" product carousel and be navigated to related PDP by taping on product image
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User navigates to PDP from "Recommended for you" section up to 10 times to check stability of PWA
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see "Recommended for you" product carousel
    Given user is on "item_1" product_page
    When user can see "product_page_content" on product_page
    Then user can see "similar_items_content" on product_page

  @proj:revolve @automated
  Scenario:[Revolve] [REV-173] User can see "Similar Items" product carousel on PDP
    Given user is on "item_1" product_page
    And user scroll to the bottom of page
    And user can see "similar_items_content" on product_page


  @proj:revolve @automated
  Scenario:[Revolve] User can swipe "Recommended for you" product carousel and be navigated to related PDP by taping on product image
    Given user is on "item_1" product_page
    And user can see "similar_items_content" on product_page
    When user click "random_similar_item" on product_page
    Then user can see "product_page_content" on product_page

  @proj:revolve @automated
  Scenario:[Revolve] User navigates to PDP from "Recommended for you" section up to 10 times to check stability of PWA
    Given user is on "item_1" product_page
    And user can see "similar_items_content" on product_page
    When user click "random_similar_item" on product_page
    Then user can see "product_page_content" on product_page
    When user click "random_similar_item" on product_page
    Then user can see "product_page_content" on product_page
    When user click "random_similar_item" on product_page
    Then user can see "product_page_content" on product_page
    When user click "random_similar_item" on product_page
    Then user can see "product_page_content" on product_page
    When user click "random_similar_item" on product_page
    Then user can see "product_page_content" on product_page
    When user click "random_similar_item" on product_page
    Then user can see "product_page_content" on product_page
    When user click "random_similar_item" on product_page
    And user scroll page
    Then user can see "product_page_content" on product_page
    When user click "random_similar_item" on product_page
    Then user can see "product_page_content" on product_page
    And user scroll page
    When user click "random_similar_item" on product_page
    Then user can see "product_page_content" on product_page
    When user click "random_similar_item" on product_page
    Then user can see "product_page_content" on product_page
    And user click logo_button on header
    And user click search_icon on header
    And user can see "search_modal_content" on search_modal


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can see "Recommended for you" product carousel
    Given user is on "item_2" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    And user can see "you_also_like_btn" on product_page
    Then user can see "you_also_like_content" on product_page

  @proj:venus @automated
  Scenario:[Venus] User can swipe "Recommended for you" product carousel and be navigated to related PDP by taping on product image
    Given user is on "item_2" product_page
    And user scroll page
    When user can see "product_page_content" on product_page
    And user can see "you_also_like_btn" on product_page
    And user click "random_you_also_like_item" on product_page
    And user scroll page
    Then user can see "product_page_content" on product_page

  @proj:venus @automated
  Scenario:[Venus] User navigates to PDP from "Recommended for you" section up to 10 times to check stability of PWA
    Given user is on "item_2" product_page
    And user scroll page
    When user can see "product_page_content" on product_page
    And user can see "you_also_like_btn" on product_page
    Then user click "random_you_also_like_item" on product_page
    And user scroll page
    When user can see "product_page_content" on product_page
    And user can see "you_also_like_btn" on product_page
    And user scroll page
    Then user click "random_you_also_like_item" on product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "random_you_also_like_item" on product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    Then user click "random_you_also_like_item" on product_page
    And user scroll page
    When user can see "product_page_content" on product_page
    And user click "random_you_also_like_item" on product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    And user click "random_you_also_like_item" on product_page
    When user click logo_button on header
    Then user click hamburger_menu_icon on header


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see "Recommended for you" product carousel
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can swipe "Recommended for you" product carousel and be navigated to related PDP by taping on product image
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User navigates to PDP from "Recommended for you" section up to 10 times to check stability of PWA
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see "Recommended for you" product carousel
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can swipe "Recommended for you" product carousel and be navigated to related PDP by taping on product image
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User navigates to PDP from "Recommended for you" section up to 10 times to check stability of PWA
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @tobeautomated
  Scenario:[Ariat] User can see "Recommended for you" product carousel
    Given test steps are under design

  @proj:ariat @tobeautomated
  Scenario:[Ariat] User can swipe "Recommended for you" product carousel and be navigated to related PDP by taping on product image
    Given test steps are under design

  @proj:ariat @tobeautomated
  Scenario:[Ariat] User navigates to PDP from "Recommended for you" section up to 10 times to check stability of PWA
    Given test steps are under design