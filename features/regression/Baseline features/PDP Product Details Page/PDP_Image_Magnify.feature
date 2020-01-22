#Projects:
#@proj:revolve
#@proj:venus
#@proj:stagestores
#@proj:blueplanet


Feature: As a customer, I can tap on a "+" icon on product image to see a larger view and allow for pinch/zoom/pan.
  PDP - Product Image Magnify

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User can see large image view by taping + icon on product image
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see large image view by taping + icon on product image
      No image zoom now
    Given user is on "item_1" product_page
    When user can see "product_page_content" on product_page
    Then user click image_zoom_button on product_page
    And user can see main_product_image_zoomed on product_page
    And user can see "zoom_image_content" on zoom_modal_window

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can see large image view by taping + icon on product image
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    Then user can see main_product_image on product_page
    Then user click image_zoom_button on product_page
    Then user can see main_product_image_zoomed on product_page
    When user click "all_images" from item_image_galary on product_page
    Then user can see main_product_image_zoomed on product_page
    And user click close_zoomed_image on product_page
    And user can see zoomed_image_closed on product_page


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see large image view by taping + icon on product image
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see large image view by taping + icon on product image
    Given test steps are under design