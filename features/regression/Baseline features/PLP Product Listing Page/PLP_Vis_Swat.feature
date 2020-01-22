#Projects:
#@proj:revolve
#@shoecarnival

Feature: As a customer, I can see visual swatches for certain filter values.
  PLP - Filters - Visual Swatch

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see visual swatches for certain filter values
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see visual swatches for certain filter values
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    When user click filter_button on subcategory_page
    And user click "color_filter" on filter_popup
    Then user can see "swatches_content" on filter_popup

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can see visual swatches for certain filter values
    Given test steps are under design


  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] [SCP-161] "White" swatch should have grey border on PLP filter and on PDP
    Given test steps are under design