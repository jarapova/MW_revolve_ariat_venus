#Projects:
#@proj:revolve

Feature: As a customer, I will be suggested to sign-in when I attempt to favorite a product without signing in on PLP.
  PLP - Add to Favorites - Sign-in Modal

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User will see a sign-in modal window when  attempt to favorite a product from PLP without signing in from PLP
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User will see a sign-in modal window when  attempt to favorite a product without signing in from PLP
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    When user can see "product_list_page_content" on subcategory_page
    And user click "random_item_favourites_button" on subcategory_page
    Then user can see "account_modal_content" on subcategory_page