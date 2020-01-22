#Projects:
#@proj:revolve

Feature: As a logged in user, I should be able to click on "Buy now" button and proceed to "Delivery Options" page
  PDP - Buy Now

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Logged-in User can navigate to "Delivery" checkout page by clicking on "By Now" button
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Guest User suggested to sign-in after clicking "Buy now" button
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Logged-in User shouldn't "Buy now" button for preorder items
    Given test steps are under design



#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:revolve @automated
  Scenario:[Revolve] Logged-in User can navigate to "Delivery" checkout page by clicking on "Buy Now" button
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    And user can see "sign_in_page_content" on sign_in_page
    Then user make login as "rev_test_user"
    When user is on "test_item_2" product_page
    And user can see "product_page_content" on product_page
    And user click "available_size_button" on product_page
    And user can see "buy_now_button" on product_page
    When user click "buy_now_button" on product_page
    Then user can see "checkout_content" on checkout_page

  @proj:revolve @automated
  Scenario:[Revolve] Guest User can't see "Buy now" button on PDPs
    Given user is on "test_item_2" product_page
    When user can see "product_page_content" on product_page
    Then user can not see "buy_now_button" on product_page

  @proj:revolve @manual
  Scenario:[Revolve] Logged-in User shouldn't see "Buy now" button for preorder items
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve][REV-269] Logged in user place successful buy now order then went back to browsing and goes to PDP and then user sees Buy Now button on PDP
    Given test steps are under design