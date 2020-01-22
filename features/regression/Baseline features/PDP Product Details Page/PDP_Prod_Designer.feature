#Projects:
#@proj:revolve
#@proj:blueplanet

Feature: As a customer, I can view content about the designer of the product.
  PDP - About the Designer

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see "Designer" description tab of product related to one of Designers
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can click "About designer" button and be taken to Designers PLP
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User CAN'T see "Designer" description tab of product NOT related to any of Designers
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:revolve @automated
  Scenario:[Revolve] User can see "Designer" description tab of product related to one of Designers
    Given user is on "item_1" product_page
    Then user can see "product_page_content" on product_page
    When user can see "about_brand_tab" on product_page
    Then user click "about_brand_tab" on product_page
    And user can see "about_brand_description" on product_page

  @proj:revolve @automated
  Scenario:[Revolve] User CAN'T see "Designer" description tab of product NOT related to any of Designers
    Given user is on "item_without_brand" product_page
    When user scroll page
    Then user can see "no_about_brand_tab" on product_page

  @proj:revolve @automated
  Scenario:[Revolve] User can click "About designer" button and be taken to Designers PLP
    Given user is on "item_1" product_page
    When user can see "product_page_content" on product_page
    And user click "brand_name" on product_page
    Then user can see "product_list_page_content" on subcategory_page
    And user can see "main_text" with value "item_1_brand_name" on subcategory_page


#================================  [BluePlanet]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see "Designer" description tab of product related to one of Designers
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can click "About designer" button and be taken to Designers PLP
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User CAN'T see "Designer" description tab of product NOT related to any of Designers
    Given test steps are under design