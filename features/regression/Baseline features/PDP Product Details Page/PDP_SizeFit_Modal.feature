#Projects:
#@proj:revolve

Feature: As a customer, I should be able to check the contents of "Size & Fit" modal.
  PDP - Size & Fit - iFrame

  BluePlanet: As a customer, I can click on "size guide" to see a popup window that explains all the product sizing information.

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see "Size Conversion" modal by taping related CTA
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see "Size Measurment" modal by taping related CTA
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see "Size Conversion" modal by taping related CTA
    Given user is on "item_with_size_conversion" product_page
    Then user can see "product_page_content" on product_page
    When user click "size_and_fit_tab" on product_page
    Then user can see "size_and_fit_description" on product_page
    When user click "size_and_fit_button" on product_page
    Then user can see "size_conversion_modal_content" on size_and_fit_modal

  @proj:revolve @automated
  Scenario:[Revolve] User can see "Size Measurement" modal by taping related CTA
    Given user is on "item_with_size_measurement" product_page
    Then user can see "product_page_content" on product_page
    When user click "size_and_fit_tab" on product_page
    Then user can see "size_and_fit_description" on product_page
    When user click "size_and_fit_button" on product_page
    Then user can see "measurement_guide_modal_content" on size_and_fit_modal


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see "size guide" modal by taping related CTA, and that modal explains all the product sizing information.
    Given test steps are under design