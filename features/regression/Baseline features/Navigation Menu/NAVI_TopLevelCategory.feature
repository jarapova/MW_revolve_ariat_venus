#Projects:
#@proj:revolve
#@proj:venus

Feature: As a customer, I should see the top level category list underneath the carousel and can tap these category names to be directed to the appropriate screen.
  Navigation - Top Level Categories (Carousel)

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User is opening categories dropdown in quick navigation panel on homepage and navigating to each category page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can navigate through the site pages by taping corresponding element on quick navigation panel
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:revolve @automated
  Scenario:[Revolve] User is opening categories dropdown in quick navigation panel on homepage and navigating to each category page
    Given user is on home_page
    And user can see "navigation_categories" on home_page
    And user click "Featured Shops" on category_panel
    When user click "Brunch Babe" on category_panel
    Then user can see "headless_product_list_page_content" on subcategory_page

  @proj:revolve @automated
  Scenario:[Revolve] User can navigate through the site pages by taping corresponding element on quick navigation panel
    Given user is on home_page
    And user can see "navigation_categories" on home_page
    When user click "Clothing" on category_panel
    Then user can see "product_list_page_content" on subcategory_page
    And user can see "main_text" with value "Clothing" on subcategory_page
    And user click logo_button on header
    When user click "Dresses" on category_panel
    Then user can see "plp_with_filter_widget" on subcategory_page
    And user click logo_button on header
    When user click "Shoes" on category_panel
    Then user can see "plp_with_filter_widget" on subcategory_page
    And user click logo_button on header
    When user click "Beauty" on category_panel
    And user can see "text" with value "Beauty" on subcategory_page
    And user click logo_button on header
    And user click "Featured Shops" on category_panel
    When user click "Jewelry & Accessories" on category_panel
    Then user can see "product_list_page_content" on subcategory_page
    And user can see "main_text" with value "Jewelry & Accessories" on subcategory_page
    And user click logo_button on header
    When user click "Bags" on category_panel
    Then user can see "product_list_page_content" on subcategory_page
    And user can see "main_text" with value "Bags" on subcategory_page



 #================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can navigate through the site pages by taping corresponding element on quick navigation panel
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