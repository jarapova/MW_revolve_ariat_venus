#Projects:
#@proj:venus

Feature: As user I want shop items by color
  Specific Page - Shop By Color

#  Shop by color links:
#  venus.com/shopbyfabric.aspx
#  venus.com/clearance_swim_shopbyfabric.aspx


#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can open and close each accordion
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see correct visual swatches for each color
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] ’Show all...’ Button redirects to correct PLP
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can click on color image to navigate to expected PLP
    Given test steps are under design

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @manual
  Scenario:[Venus] User can open and close each accordion
    Given test steps are under design

  @proj:venus @manual
  Scenario:[Venus] User can see correct visual swatches for each color
    Given test steps are under design

  @proj:venus @automated
  Scenario:[Venus] ’Show all...’ Button redirects to correct PLP
    Given user is on "shop_by_color" page
    When user click "Solids_accordion" on shop_by_color_page
    Then user click "show_all_button" on shop_by_color_page
    And user can see "product_list_page_content" on subcategory_page

  @proj:venus @automated
  Scenario:[Venus] User can click on color image to navigate to expected PLP
    Given user is on "shop_by_color" page
    When user click "Solids_accordion" on shop_by_color_page
    And user scroll page
    And user click "random_color_link" on shop_by_color_page
    Then user can see "product_list_page_content" on subcategory_page