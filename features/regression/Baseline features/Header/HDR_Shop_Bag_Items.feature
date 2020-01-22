#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I can see the number of cart items currently in my shopping cart.
  HDR - Shopping Cart - Item Count

  Shoe: As a customer, I need the shopping cart to update the number of cart items when item has been added in cart.
  Shoe: As a customer, I need to see how many items are in my shopping cart within the cart icon

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User does not see number of items near shopping cart in header if cart is empty
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see number of items currently in his shopping cart
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see update the number of cart items when item has been added in cart.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Logged in User can see number of items currently in his shopping cart across all devices he logged in
    Given test steps are under design



#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @tobeautomated
  Scenario:[Revolve] User does not see number of items near shopping cart in header if cart is empty
    Given test steps are under design

  @proj:revolve @automated
  Scenario:[Revolve] User can see number of items currently in his shopping cart
    Given user is on home_page
    Then user can see "cart_icon_items_count" with value "0" on header
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    Then user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    When user can see "product_page_content" on product_page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    And user click "close_view_bag_modal_button" on product_page
    Then user can see "cart_icon_items_count" with value "1" on header

  @proj:revolve @manual
  Scenario:[Revolve] Logged in User can see number of items currently in his shopping cart across all devices he logged in
    Given test steps are under design

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User does not see number of items near shopping cart in header if cart is empty
    Given user is on home_page
    Then user can see "no_items_in_cart" on header

  @proj:venus @automated
  Scenario:[Venus] User can see number of items currently in his shopping cart
    Given user is on "item_1" product_page
    And user scroll page
    When user can see "product_page_content" on product_page
    And user click "available_size_button" on product_page
    Then user click add_to_bag_button on product_page
    When user is on "item_2" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    And user click "available_size_button" on product_page
    Then user click add_to_bag_button on product_page
    And user can see "cart_icon_items_count" with value "2" on header

  @proj:venus @manual
  Scenario:[Venus] Logged in User can see number of items currently in his shopping cart across all devices he logged in
    Given test steps are under design


#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival] User does not see number of items near shopping cart in header if cart is empty
    Given user is on home_page
    And user scroll page
    Then user can not see "cart_items_count" on header

  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival] User can see number of items currently in his shopping cart
    Given user is on "item_1" product_page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    Then user can see "cart_items_count" with value "1" on header
    When user is on "item_2" product_page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    Then user can see "cart_items_count" with value "2" on header

  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival] Logged in User can see number of items currently in his shopping cart across all devices he logged in
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User does not see number of items near shopping cart in header if cart is empty
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see number of items currently in his shopping cart
    Given test steps are under design

  @proj:stagestores @manual
  Scenario:[Stagestores] Logged in User can see number of items currently in his shopping cart across all devices he logged in
    Given test steps are under design

#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User does not see number of items near shopping cart in header if cart is empty
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see number of items currently in his shopping cart
    Given test steps are under design

  @proj:blueplanet @manual
  Scenario:[BluePlanet] Logged in User can see number of items currently in his shopping cart across all devices he logged in
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @manual
  Scenario:[Ariat] User does not see number of items near shopping cart in header if cart is empty
    Given test steps are under design
#goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] User can see number of items currently in his shopping cart
    Given user is on "item_1" product_page
    And user scroll page
    When user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    Then user can see "cart_items_count" with value "1" on header

  @proj:ariat @manual
  Scenario:[Ariat] User can see update the number of cart items when item has been added in cart.
    Given test steps are under design

  @proj:ariat @manual
  Scenario:[Ariat] Logged in User can see number of items currently in his shopping cart across all devices he logged in
    Given test steps are under design
