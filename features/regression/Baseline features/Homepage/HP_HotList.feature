#Projects:
#@proj:revolve
#@proj:baseline

Feature: As a customer, I want to see Hot list items on home page
  Homepage - Hot List

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User can see hot list items on home page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Hot list image leads to correct page
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated @flaky
  Scenario:[Revolve] User can see hot list items on home page
    Given user is on home_page
    When user can see "home_page_content" on home_page

  @proj:revolve @automated @flaky
  Scenario:[Revolve] Hot list image leads to correct page
    Given user is on home_page
    And user can see "home_page_content" on home_page
    When user click "random_hot_list_image" on home_page
    Then user can see "min_product_list_page_content" on subcategory_page
    And user can see "main_text" with value "Shop this look" on subcategory_page
    When user click "random_item_name" on subcategory_page
    Then user can see "product_page_content" on product_page

  @proj:revolve @manual
  Scenario:[Revolve] [REV-200] Hot list CTA should say "View the Hot List" and link to mobile page
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] [REV-201] Hot List subhead should display "The most wanted essentials. Curated by us, inspired by you"
    Given test steps are under design

  @proj:revolve @automated
  Scenario:[Revolve] [REV-504] Hot List button leads to Hot list page on the same environment
    Given user is on home_page
    And user can see "home_page_content" on home_page
    When user click "view_hot_list_button" on home_page
    And user remember page_url on page
    Then user can see "hot_list_content" on hot_list_page
    And user can see "page_url" on page