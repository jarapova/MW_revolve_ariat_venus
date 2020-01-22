#Projects:
#@proj:revolve
#@proj:blueplanet

Feature: As a customer, I can click on the favorites icon (heart) and be taken to the favorites landing page. The destination page is different depending on the website being accessed:
  HDR - Favorites

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Signed in user can click on the favorites icon (heart) and be taken to the favorites landing page.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Guest user suggested to sign-in after taping favorites (heart) icon in header
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see number of added to favorites items
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Logged in user can see the same number of favorites item across all logged in devices
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] Signed in user can click on the favorites icon (heart) and be taken to the favorites landing page.
    Given user is on home_page
    When user click "favorites_button" on header
    Then user can see "favorites_landing_page_content" on wish_list_page

  @proj:revolve @manual
  Scenario:[Revolve] [REV-250] Transitions between Sign In and Favorites pages should take less 5s
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] [REV-266] Transitions between Favorites and PDP pages should take less 5s
    Given test steps are under design


  @proj:revolve @automated
  Scenario:[Revolve] Guest user suggested to sign-in after taping favorites (heart) icon in header
    Given user is on home_page
    And user click "favorites_button" on header
    And user can see "favorites_landing_page_content" on wish_list_page
    When user click sign_in_button on wish_list_page
    Then user can see "sign_in_page_content" on sign_in_page

  @proj:revolve @automated
  Scenario:[Revolve] User can see number of added to favorites items
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    When user can see "sign_in_page_content" on sign_in_page
    Then user make login as "rev_test_user"
    And user click "favorites_button" on header
    And user clear wish_list_page
    And user is on home_page
    And user is on "item_1" product_page
    And user scroll page
    And user click "favorites_button" on product_page
    And user scroll page
    And user can see "favorites_icon_items_count" with value "1" on header
    And user click "favorites_button" on product_page
    And user scroll page
    And user can see "favorites_icon_items_count" with value "0" on header


  @proj:revolve @manual
  Scenario:[Revolve] Logged in user can see the same number of favorites item across all logged in devices
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] Signed in user can click on the favorites icon (heart) and be taken to the favorites landing page.
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] Guest user suggested to sign-in after taping favorites (heart) icon in header
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see number of added to favorites items
    Given test steps are under design

  @proj:blueplanet @manual
  Scenario:[BluePlanet] Logged in user can see the same number of favorites item across all logged in devices
    Given test steps are under design