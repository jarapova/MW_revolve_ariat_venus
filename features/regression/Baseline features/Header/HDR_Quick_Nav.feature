#Projects:
#@proj:revolve
#@proj:venus
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I should see a quick navigation bar underneath the main header which allows me to jump to relevant sections. This quick navigation bar includes the following:
  HDR - Quick Navigation

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see a quick navigation bar underneath the main header which allows me to jump to relevant sections.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can click each item in quick navigation bar underneath the main header to be navigated to appropriate page
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see a quick navigation bar underneath the main header which allows me to jump to relevant sections.
    Given user is on home_page
    Then user can see "navigation_bar_content" on header

  @proj:revolve @automated
  Scenario:[Revolve] User can click each item in quick navigation bar underneath  the main header to be navigated to appropriate page
    Given user is on home_page
    And user can see "navigation_bar_content" on header
    When user click "new_tab" on header
    Then user can see "product_list_page_content" on subcategory_page
    And user can see "main_text" with value "New Arrivals" on subcategory_page
    When user click "categories_tab" on header
    Then user can see "dropdown_menu_content" on header
    When user click "Clothing" on dropdown_menu
    Then user can see "product_list_page_content" on subcategory_page
    And user can see "main_text" with value "Clothing" on subcategory_page
    When user click "designers_tab" on header
    And user can see "designers_list" on brand_page
    When user click "sale_tab" on header
    Then user can see "product_list_page_content" on subcategory_page
    And user can see "main_text" with value "Sale" on subcategory_page

  @proj:revolve @manual
  Scenario:[Revolve][REV-502] Lists of categories and on QuickNav and dropdown have the same content as on prod
    Given user is on home_page
    Then user can see "navigation_bar_content" on header
    And user can see that the lists of categories and on QuickNav and dropdown have the same content as on prod



#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can see a quick navigation bar underneath the main header which allows me to jump to relevant sections.
    Given user is on home_page
    Then user can see main_navigation_carousel on header

  @proj:venus @automated
  Scenario:[Venus] User can click each item in quick navigation bar underneath the main header to be navigated to appropriate page
    Given user is on home_page
    When user can see main_navigation_carousel on header
    And user click "Clothing" on main_navigation_carousel
    Then user can see "clothing_category_dropdown" on category_page
    And user can see "clothing_shop_now_buttons" on category_page
    And user can see "clothing_category_banners" on category_page
    And user click logo_button on header

    When user can see main_navigation_carousel on header
    And user click "Swimwear" on main_navigation_carousel
    Then user can see "swimwear_category_dropdown" on category_page
    And user can see "swimwear_shop_now_buttons" on category_page
    And user can see "swimwear_category_banners" on category_page
    And user click logo_button on header

    When user can see main_navigation_carousel on header
    And user click "Lingerie" on main_navigation_carousel
    Then user can see "lingerie_category_dropdown" on category_page
    And user can see "lingerie_shop_now_buttons" on category_page
    And user can see "Lingerie_category_banners" on category_page
    And user click logo_button on header

    When user can see main_navigation_carousel on header
    And user click "PlusSize" on main_navigation_carousel
    Then user can see "plus_size_category_dropdown" on category_page
    And user can see "plus_size_shop_now_buttons" on category_page
    And user can see "plus_size_category_banners" on category_page
    And user click logo_button on header

    When user can see main_navigation_carousel on header
    And user click "WhatsNew" on main_navigation_carousel
    Then user can see "whats_new_category_dropdown" on category_page
    And user can see "whats_new_shop_now_buttons" on category_page
    And user can see "whats_new_category_banners" on category_page
    And user click logo_button on header

    When user can see main_navigation_carousel on header
    And user click "Trends" on main_navigation_carousel
    Then user can see "trends_category_dropdown" on category_page
    And user can see "trends_shop_now_buttons" on category_page
    And user can see "trends_category_banners" on category_page
    And user click logo_button on header

    When user can see main_navigation_carousel on header
    And user click "PreOrder" on main_navigation_carousel
    Then user can see "pre_order_shop_now_buttons" on category_page
    And user can see "sale_category_banners" on category_page
    And user click logo_button on header

    When user can see main_navigation_carousel on header
    And user click "Sale" on main_navigation_carousel
    Then user can see "sale_category_dropdown" on category_page
    And user can see "sale_shop_now_buttons" on category_page
    And user can see "sale_category_banners" on category_page
    And user click logo_button on header


#================================  [BluePlanet]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see a quick navigation bar underneath the main header which allows me to jump to relevant sections.
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can click each item in quick navigation bar underneath the main header to be navigated to appropriate page
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios
#Need to be automated if possible
#goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] User can see a quick navigation bar underneath the main header which allows me to jump to relevant sections.
    Given user is on home_page
    Then user can see "main_navigation_carousel" on header
  #goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] User can click each item in quick navigation bar underneath the main header to be navigated to appropriate page
    Given user is on home_page
    And user can see "main_navigation_carousel" on header
    When user click "Men" on main_navigation_carousel
    Then user can see "product_list_page_content" on subcategory_page
    When user click "Women" on main_navigation_carousel
    Then user can see "product_list_page_content" on subcategory_page
    When user click "Kids" on main_navigation_carousel
    Then user can see "product_list_page_content" on subcategory_page
    When user click "Clearance" on main_navigation_carousel
    Then user can see "product_list_page_content" on subcategory_page