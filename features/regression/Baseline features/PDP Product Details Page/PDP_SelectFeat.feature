#Projects:
#@proj:shoecarnival
#@proj:revolve
#@proj:venus
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I can select the size and width of the product.
  PDP - Product Size/Width Selector
  #Venus:
  #Size (Waist Size, Inseam size, Band size, Cup Size)

  #Revolve:
  #Size, One Size

  #Stagestore:
  #Size
#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User can select product size on product page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can select size 1X and larger and see different product images
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can select Waist Size on special product page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can select Inseam size on special product page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can select Band size on special product page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] One size option should be selected by default on special product page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can select width on product page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Size selector shouldn't appears for items with one size
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can select the Calf size
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can select the Height size
    Given test steps are under design

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can select product size on product page
    Given user is on "item_1" product_page
    And user scroll page
    When user can see "product_page_content" on product_page
    Then user click "available_size_button" on product_page


  @proj:venus @manual
  Scenario:[Venus] User can select size 1X and larger and see different product images
    Given test steps are under design

  @proj:venus @automated
  Scenario:[Venus] User can select Waist Size on special product page
    Given user is on "Color_skinny_jeans" product_page
    And user scroll page
    When user click "available_waist_size_button" on product_page
    And user click "item_color_BLACK DENIM(BKDE)" on product_page
    And user click "inseam_size_button_regular" on product_page
    Then user can see "is_in_stock_text" on product_page

  @proj:venus @automated
  Scenario:[Venus] User can select Inseam size on special product page
    Given user is on "Color_skinny_jeans" product_page
    And user scroll page
    When user click "available_waist_size_button" on product_page
    And user click "item_color_BLACK DENIM(BKDE)" on product_page
    And user click "inseam_size_button_regular" on product_page
    Then user can see "is_in_stock_text" on product_page

  @proj:venus @automated
  Scenario:[Venus] User can select Band size on special product page
    Given user is on "item_with_band_size" product_page
    And user scroll page
    When user can see "product_page_content" on product_page
    Then user click "available_band_size_button" on product_page
    And user click "available_cup_size_button" on product_page
    Then user can see "is_in_stock_text" on product_page

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can select one of available product sizes on product page
    Given user is on "item_1" product_page
    When user can see "product_page_content" on product_page
    Then user click "available_size_button" on product_page

  @proj:revolve @automated
  Scenario:[Revolve] One size option should be selected by default on special product page
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Bags" on hamburger_menu
    And user click "View All" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    When user can see "product_page_content" on product_page
    Then user can see "one_size_button" on product_page

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can select product size on product page
      User to select the list of available sizes & width
      If a different product image is applicable when changing product color selector, change the product image
      Selected size & width should be reflected in shopping cart
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can select width on product page
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can select product size on product page
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] Size selector shouldn't appears for items with one size
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can select product size on product page
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @automated
  Scenario:[Ariat] User can select product size on product page
    Given user is on "item_with_size" product_page
    When user scroll page
    Then user click "available_size_button" on product_page

  @proj:ariat @automated
  Scenario:[Ariat] User can select width on product page
    Given user is on "item_with_width_and_size" product_page
    When user scroll page
    Then user click "available_width_button" on product_page

  @proj:ariat @tobeautomated
  Scenario:[Ariat] User can select the Calf size
  Need to find items with calf and ping Gleb
    Given test steps are under design

  @proj:ariat @tobeautomated
  Scenario:[Ariat] User can select the Height size
  Need to find items with Height and ping Gleb
    Given test steps are under design