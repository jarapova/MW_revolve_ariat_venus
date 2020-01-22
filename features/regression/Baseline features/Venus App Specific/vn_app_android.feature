#Projects:
#@proj:venus


Feature: As a customer, I need to see correct behaviour using Venus Android App
  Venus App Specific - vn_app_android


 #================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus
  Scenario:[Venus][Venus_app] Check Ability to install Android app
    Given Install Android Venus app

  @proj:venus
  Scenario:[Venus][Venus_app] PWA header shouldn't appears when user open item PDP from cart
    Given User is on home_page
    When User navigate to random pdp_page
    And User click on "add_to_cart"
    Then User can see "cart_page_content" on cart_page
    Then User click on "item_image" on cart_page
    And User can see "pdp_page_content" on pdp_page
    And User can't see PWA Header

  @proj:venus
  Scenario:[Venus][Venus_app] PWA Header shouldn't appear after updating Mail Options
    Given User is on home_page
    When User make login
    Then User can see "account_page_content" on account_page
    And User click on mail options tab
    Then User change random mail options
    Then User click "Update" button
    And User can't see PWA Header


  @proj:venus
  Scenario:[Venus][Venus_app] After updating mail options user should appear on account info page
    Given User is on home_page
    When User make login
    Then User can see "account_page_content" on account_page
    And User click on mail options tab
    Then User change random mail options
    Then User click "Update" button
    # User stays logged in
    And User can see "account_page_content" on account_page