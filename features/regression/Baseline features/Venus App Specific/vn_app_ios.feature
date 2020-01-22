#Projects:
#@proj:venus


Feature: As a customer, I need to see correct behaviour using Venus iOS App
  Venus App Specific - vn_app_ios


 #================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus
  Scenario:[Venus][Venus_app] Check Ability to install iOS app
    Given Install iOS Venus app

  @proj:venus
  Scenario:[Venus][Venus_app] After adding to wish list guest user should switch to "Account" tab
    Given "Shop" tab is selected
    When User navigate to random pdp_page
    And User click on "add_item_to_wishlist"
    And User appear on sign in page
    Then "Account" tab is selected

  @proj:venus
  Scenario:[Venus][Venus_app] After adding to wish list logged user should switch to "Account" tab
    Given User is on home_page
    When User make login
    Then User is on home_page
    And User can see "Shop" tab is selected
    And User navigate to random pdp_page
    And User click on "add_item_to_wishlist"
    Then User can see "wish_list_page_content" on wish_list_page
    And User can see "Account" tab is selected

  @proj:venus
  Scenario:[Venus][Venus_app] After click on "Continue shopping" from empty cart user should Switch to Account Tab
    Given User is on home_page
    When User can see  "Shop" tab is selected
    Then User switch to "Cart" tab
    And User can see  "Cart" tab is selected
    And User can see "empty_cart_page_content" on cart_page
    Then User click "Continue shopping"
    And User can see "home_page_content" on home_page
    And User can see "Shop" tab is selected


  @proj:venus
  Scenario:[Venus][Venus_app] When user navigates to pdp from cart "Shop" tab should be selected
    Given User is on home_page
    When User can see "Shop" tab is selected
    Then User navigate to random pdp_page
    And User click on "add_to_cart"
    And User can see "cart_page_content" on cart_page
    And User can see "Cart" tab is selected
    Then User click on "item_image" on cart_page
    And User can see "pdp_page_content" on pdp_page
    And User can see "Shop" tab is selected

  @proj:venus
  Scenario:[Venus][Venus_app] Check that top of the page is not hiding under header
    Given User is on home_page
    When User navigates between random PLP's and PDP's
    And Top of the page is not hiding under header
