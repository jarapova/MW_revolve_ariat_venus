#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I can swipe the product image carousel to see more product images.
  PDP - Image Carousel

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User can see product images carousel and can swipe images
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see product images carousel and can swipe images
    Given user is on "item_1" product_page
    When user can see "product_page_content" on product_page
    Then user can see "product_images_content" on product_page

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can see product images carousel and can swipe images
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user can see main_product_image on product_page
    Then user click "all_images" from item_image_galary on product_page

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can see product images carousel and can swipe images
    The ability to view the product image carousel and click through the different images
  Given test steps are under design

      @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-184] PDP Image Carousel NOT extends the page during page load
  Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-223] Remove the image thumbnails and only display the dots below the main product image.
    Given test steps are under design


  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-230] The product selected on the PLP thumbnail should be the same color as the product on PDP.
  The color is selected on the screen, and the main image reflect it.
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see product images carousel and can swipe images
    Given test steps are under design

#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see product images carousel and can swipe images
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @automated
  Scenario:[Ariat] User can see product images carousel and can swipe images
    Given user is on "item_with_width_and_size" product_page
    When user can see "product_page_content" on product_page
    Then user can see "product_images_content" on product_page