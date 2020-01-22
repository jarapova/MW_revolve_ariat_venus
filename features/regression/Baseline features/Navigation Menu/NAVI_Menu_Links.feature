#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I can see all available menu items, navigate through different menu sections, and be directed to the destination page after tapping the desired item.
  As a Customer, I can see all available categories and press on them to navigate to the corresponding page.
  Navigation - Menu Links

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can navigate through the site pages by taping corresponding element on hamburger menu
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can navigate through the site pages by taping corresponding element on category selection pop-up
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can navigate through the site pages by taping corresponding element on hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    Then user can see "hamburger_first_page_content" on hamburger_menu
    When user click "Mens" on hamburger_menu
    And user click "Shoes" on hamburger_menu
    And user click "View All" on hamburger_menu
    Then user can see "product_list_page_content" on subcategory_page
    And user can see "main_text" with value "Shoes" on subcategory_page
    When user click hamburger_menu_icon on header
    And user click "2_back_button" on hamburger_menu
    And user click "1_back_button" on hamburger_menu
    Then user can see "hamburger_first_page_content" on hamburger_menu
    When user click "Beauty" on hamburger_menu
    And user click "Hair" on hamburger_menu
    And user click "View All" on hamburger_menu
    Then user can see "product_list_page_content" on subcategory_page
    And user can see "main_text" with value "Hair" on subcategory_page

  @proj:revolve @manual
  Scenario:[Revolve][REV-300] User can see last sub-category completely presented on hamburger menu
    Given user click hamburger_menu_icon on header
    When user scroll to the bottom of page
    Then user can see fully presented category at the bottom if hamburger list

  @proj:revolve @manual
  Scenario:[Revolve][REV-374] User should be able to navigate to appropriate page through the hamburger menu after scrolling
    Given user click hamburger_menu_icon on header
    When user Click on Womens categorie
    Then user Scroll down to the Sale subcategorie
    And user Click on Sale subcategorie
    And user should navigate to the expected page

  @proj:revolve @automated
  Scenario:[Revolve][REV-377] 'Hot list' category in Hamburger menu should lead to the expected page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Hot List" on hamburger_menu
    Then user can see "hot_list_content" on hot_list_page

  @proj:revolve @automated
  Scenario:[Revolve][REV-462] Logged in user can see expected page after click 'Shipping address' from the hamburger menu
  My revolve>My settings>Shipping address
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    Then user make login as "rev_test_user"
    When user click hamburger_menu_icon on header
    And user click "My Revolve" on hamburger_menu
    And user click "My Settings" on hamburger_menu
    And user click "Shipping Address" on hamburger_menu
    Then user can see "shipping_address_page_content" on account_information_page

  @proj:revolve @manual
  Scenario:[Revolve][REV-489][REV-499] User can see all content in hamburger menu right after sign in extremely fast
    Given test steps are under design


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can navigate through the site pages by taping corresponding element on category selection pop-up
    Given user is on home_page
    When user can see main_navigation_carousel on header
    And user click "Clothing" on main_navigation_carousel
    And user select "Dresses" from subcategory_filter on category_page
    And user scroll page
    Then user can see "dress_items_content" on subcategory_page
    When user click subcategory_filter on subcategory_page
    And user click "random_subcategory" from subcategory_filter on subcategory_page
    And user scroll page
    Then user can see "random_subcategory_items_content" on subcategory_page

  @proj:venus @automated
  Scenario:[Venus] User can navigate through the site pages by taping corresponding element on hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_first_page_content" on hamburger_menu
    And user click "shop_by_categories_on_first_page" on hamburger_menu
    Then user can see "hamburger_category_page_content" on hamburger_menu
    When user is on home_page
    And user click hamburger_menu_icon on header
    And user click "venus_card_on_first_page" on hamburger_menu
    Then user can see "venus_card_page_content" on venus_card_page
    When user is on home_page
    And user click hamburger_menu_icon on header
    And user click "about_us_on_first_page" on hamburger_menu
    Then user can see "about_us_page_content" on about_us_page
    When user is on home_page
    And user click hamburger_menu_icon on header
    When user click "contact_us_on_first_page" on hamburger_menu
    Then user can see "contact_us_page_content" on contact_us_page
    When user is on home_page
    And user click hamburger_menu_icon on header
    And user click "order_status_on_first_page" on hamburger_menu
    Then user can see "order_status_guest_page_content" on order_status_page
    When user is on home_page
    And user click hamburger_menu_icon on header
    And user click "customer_care_on_first_page" on hamburger_menu
    Then user can see "customer_care_page_content" on customer_care_page

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can navigate through the site pages by taping corresponding element on hamburger menu
      Each navigation link has a primary category
      Each primary category is expandable to have sub-categories
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-210] User can see "View all" for each main categories on hamburger menu
    Given test steps are under design

     @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-139] Hamburger menu & search button should work on all perfect proxy pages
    Given test steps are under design

     @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-231] In hamburger there should be a Kids top-level category with Boys and Girls as subcategories.
     Boys and Girls should not be their own separate top-level categories.
       Given test steps are under design



#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can navigate through the site pages by taping corresponding element on category selection pop-up
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can navigate through the site pages by taping corresponding element on hamburger menu
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can navigate through the site pages by taping corresponding element on category selection pop-up
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can navigate through the site pages by taping corresponding element on hamburger menu
    Given test steps are under design


    #================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible
#goodNoTa
  @proj:ariat @automated
  Scenario:[Ariat] User can navigate through the site pages by taping corresponding element on category selection pop-up
    Given user is on home_page
    And user click "Women" on main_navigation_carousel
    And user can see "product_list_page_content" on subcategory_page
    When user click "subcategory_filter" on subcategory_page
    And user click "Clothing" from subcategory_filter on subcategory_page
    Then user can see "product_list_page_content" on subcategory_page

    When user click "subcategory_filter" on subcategory_page
    And user click "Denim" from subcategory_filter on subcategory_page
    Then user can see "product_list_page_content" on subcategory_page

    When user click "subcategory_filter" on subcategory_page
    And user click "Trouser" from subcategory_filter on subcategory_page
    Then user can see "product_list_page_content" on subcategory_page
#goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] User can navigate through the site pages by taping corresponding element on hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Women" on hamburger_menu
    And user click "Outdoor" on hamburger_menu
    And user click "Boots" on hamburger_menu
    Then user click "View all" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    When user click hamburger_menu_icon on header
    And user click "3_back_button" on hamburger_menu
    And user click "2_back_button" on hamburger_menu
    And user click "Men" on hamburger_menu
    Then user click "View all" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    When user click hamburger_menu_icon on header
    And user click "2_back_button" on hamburger_menu
    And user click "Clearance" on hamburger_menu
    Then user click "View all" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
