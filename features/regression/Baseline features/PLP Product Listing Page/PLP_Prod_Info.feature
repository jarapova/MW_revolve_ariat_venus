#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:ariat
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I can see a list of products containing the following information:
  PLP - Product Information
  PLP - Stars Rating
  PLP - Product Listing
  PLP - Stars Rating

  Revolve:
    Image / Thumbnail
    Badge - Best Seller, New Arrival, etc.
    Name
    Price
    Discount price
    Brand
    Cost - if there is a sale display sale cost and crossed-out original cost
    Color swatches for items with multiple colorways (if that's in case)
    "View details" link
  Venus:
    Image / Thumbnail
    Name
    Price
    Discount price
    Cost - if there is a sale display sale cost and crossed-out original cost
    "View details" link
     "More colors available" tag if item has multiple color options
  Shoe Carnival:
    Image / Thumbnail
    Title
    Description
    Price Information
    Colors
    Discount
    Indicator of "View All Colors (xx)" if more than 5 color
  Stagestore:
    Image / Thumbnail
    Title
    Price Information
    Rating stars
    Discount
    Indicator of "View All Colors (xx)" if item has several color options
  Ariat:
    As a customer, I need to be able to see star ratings for each product listed.
    Image
    Color
    Product Title
    Product Price
    Discount - with original price crossed out


#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User can see a list of product with related information
    Given test steps are under design


  @proj:baseline
  Scenario:[Baseline] User can see a list of product with related information
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see a list of product with related information
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Clothing" on hamburger_menu
    And user click "Denim" on hamburger_menu
    When user click "View All" on hamburger_menu
    Then user can see "product_list_page_content" on subcategory_page
    And user can see "main_text" with value "Denim" on subcategory_page

  @proj:revolve @automated
  Scenario:[Revolve] User can see a list of product on sale with related information
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Mens" on hamburger_menu
    And user click "Sale" on hamburger_menu
    And user click "All Sale Items" on hamburger_menu
    And user can see "sale_prices_content" on subcategory_page

  @proj:revolve @manual
  Scenario:[Revolve][REV-378]PLP Deodorant&Antiperspirant should look as expected
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Beauty" on hamburger_menu
    And user click "Bath&Body" on hamburger_menu
    And user click "Body care" on hamburger_menu
    And user click "Deodorant&Antiperspirant" on hamburger_menu
    And user can see correct displaying of PLP

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can see a list of product with related information
    Given user is on home_page
    When user can see main_navigation_carousel on header
    And user click "Clothing" on main_navigation_carousel
    And user select "Dresses" from subcategory_filter on category_page
    Then user can see "correct_price" on subcategory_page

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can see a list of product with related information
    Given test steps are under design


     @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-194] User able to see some items in which there might be additional BOGO or offers available for certain products that is shown under the Product Title
     As a customer, there are some items in which there might be additional BOGO or offers available for
     certain products that is shown under the Product Title.
     To test this, search for slippers (pormotion) and Fireside (bogo).
       Given test steps are under design




#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see a list of product with related information
    Given test steps are under design

    #================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @automated
  Scenario:[Ariat] User can see a list of product with related information
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Women" on hamburger_menu
    And user click "View all" on hamburger_menu
    Then user can see "product_list_page_content" on subcategory_page

  @proj:ariat @manual
  Scenario:[Ariat][ARI-205] User can see # color(s) info for each product to see how many colors available for this product
    Given test steps are under design


  @proj:ariat @manual
  Scenario:[Ariat] User can see star ratings for each product listed.
    Given test steps are under design


    #================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see a list of product with related information
    Given test steps are under design