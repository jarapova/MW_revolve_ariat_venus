Feature: This test suite declines STAGE Stores e2e scenarios to get known about user can add item to cart and go to checkout
  Happy path flow:
  Click on logo to navigate homepage
  Open search modal
  Navigate to PDP from search results
  Add item to cart
  Open cart
  Check items in cart



  Scenario: User 1 go to pdp, go to cart, get cart go to another pdp in loop
    Given user is on home_page
    And user is logged in as "user_stage_uat_1"
    Given user is on home_page
    And User makes test loop to check cart coockies merging 1


  Scenario: User 2 go to pdp, go to cart, get cart go to another pdp in loop
    Given user is on home_page
    And user is logged in as "user_stage_uat_2"
    Given user is on home_page
    And User makes test loop to check cart coockies merging 2



#
#  Scenario: User 2 go to pdp, go to cart, get cart go to another pdp in loop
#    Given user is on home_page
#    And user is logged in as "user_stage_uat_1"
#    Given user is on home_page
#    And user click search_icon on header
#    And user type "Coats" in searching modal input
#    And user clicks search button in search modal
#    And user is on search result page
#    And user click cart_icon on header
#    Then user is on cart_page