#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I can see all the standard product details:
  PDP - Product Details
  #Venus: Image/ Thumbnail, Name, Style, Price/ price with sale (if presented), Rating stars

  #Revolve:Image / Thumbnail, Name, Brand, Cost / price with sale (if presented), Rating stars

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see product details on PDP
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] As user I want see Product price with/without sale
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] The product selected on the PLP thumbnail should be the same color as the product on PDP.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see appropriate PDP after going back from PLP.
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see product details on PDP
    Given user is on "item_1" product_page
    Then user can see "product_page_content" on product_page
    And user can see "item_1_test_content" on product_page

  @proj:revolve @automated
  Scenario:[Revolve] As user I want see Product price with/without sale
    Given user is on "item_on_sale" product_page
    Then user can see "product_page_content" on product_page
    And user can see "price_with_sale" on product_page

  @proj:revolve @manual
  Scenario:[Revolve] [REV-328] Final sale defect message is displayed on mobile version of the PWA for related product
    Given test steps are under design

  @proj:revolve @automated
  Scenario:[Revolve][REV-330] Beauty message is displayed on mobile version of the PWA for related product
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Beauty" on hamburger_menu
    Then user click "New Arrivals" on hamburger_menu
    And user scroll page
    When user click "random_item_name" on subcategory_page
    And user scroll page
    Then user can see "beauty_message" on product_page

  @proj:revolve @manual
  Scenario:[Revolve][REV-331] Only 1 left message is displayed on mobile version of the PWA for related product
    Given test steps are under design


  @proj:revolve @manual
  Scenario:[Revolve][REV-492] Sold out message is displayed on mobile version of the PWA for related product
    Given test steps are under design

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can see product details on PDP
    Given user is on "item_2" product_page
    Then user can see "product_page_content" on home_page

  @proj:venus @automated
  Scenario:[Venus] As user I want see Product price with/without sale
    Given user is on home_page
    When user click "Sale" on main_navigation_carousel
    And user select "Jewelry" from subcategory_filter on category_page
    Then user click "random_item_name" on subcategory_page
    And user scroll page
    When user can see "product_page_content" on product_page
    Then user can see "price_with_sale" on product_page

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can see product details on PDP
      The Ability to view the cost of the product
      if cost of product is discounted, show the original cost crossed out and discount price in red.

      Query the OCAPI: Get Product - /products to get all the details, will need to use
      For Ratings - it is implemented with Power Reviews
      Content will be added after page load & require PR script
      Site has data on # of reviews, so display the data first & then wait for Power Review to load with functionality
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] As user I want see Product price with/without sale
    Given test steps are under design


  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-196] As user I want see Products with Price Range
        Show the price range above the color swatches regardless of what the user is choosing
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-230] The product selected on the PLP thumbnail should be the same color as the product on PDP.
    Given test steps are under design


  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-259] On PDP, width should not be defaulted to item which has more than 1 option of width
  The user should have to choose the width each time except if the item has more than 1 option of width
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-349] User can see appropriate PDP after going back from PLP.
    Given test steps are under design

#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see product details on PDP
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] As user I want see Product price with/without sale
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see product details on PDP
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] As user I want see Product price with/without sale
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @automated
  Scenario:[Ariat] User can see product details on PDP
    Given user is on "item_with_waist_and_length" product_page
    When user can see "product_page_content" on product_page
    And user can see "waist_selector" on product_page
    Then user can see "length_selector" on product_page
    And user can see "item_description_button" on product_page
    And user can see "item_description" on product_page
    And user can see "item_spec_button" on product_page
    When user click "item_spec_button" on product_page
    Then user can see "item_specifications" on product_page

  @proj:ariat @tobeautomated
  Scenario:[Ariat] As user I want see Product price with/without sale
  Waiting for finding items on sale algorithm
    Given user is on "item_on_sale" product_page
    And user scroll page
    When user can see "item_price" on product_page
    Then user can see "price_with_sale" on product_page

  @proj:ariat @manual
  Scenario:[Ariat] The product selected on the PLP thumbnail should be the same color as the product on PDP.
    Given test steps are under design