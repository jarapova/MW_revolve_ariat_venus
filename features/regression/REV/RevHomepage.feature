Feature: This test suite is for checking REV homepage content: Recently viewed, Promo banners, Recommended for you, Hot List

  Promo Banner 01 on homepage  ========================================================================== Ready for dev
  Recently viewed content on homepage =================================================================== Ready for dev
  Navigate to PDP from Recently viewed ================================================================== Ready for dev
  Hot List content on homepage ========================================================================== Ready for dev
  Recommended for you content on homepage =============================================================== Ready for dev

  Scenario: As User I want to see First Slide Banner on homepage
    Given user is on home_page
    When user can see "home_page_content" on home_page
    And user click "1_slide_banner" on home_page
    Then user can see "product_list_page_content" on subcategory_page

  Scenario: As User I want to see Recently viewed content on homepage
    #Recently viewed feature was broken on revolve
    Given user is on home_page
    When user can see "home_page_content" on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    Then user click logo_button on header
    And user can see "recently_viewed_content" on home_page
    And user can see "home_page_content" on home_page

  Scenario: As User I want to navigate to PDP from Recently viewed content from homepage
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    And user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    And user click logo_button on header
    And user can see "recently_viewed_content" on home_page
    Then user click "random_recently_viewed_item" on home_page
    And user can see "product_page_content" on product_page
  
  Scenario: As User I want to see Hot List content on homepage
    Given user is on home_page
    When user can see "home_page_content" on home_page
    And user click "random_hot_list_image" on home_page
    Then user can see "product_list_page_content" on subcategory_page
    And user click logo_button on header
    And user can see "home_page_content" on home_page

  Scenario: As User I want to see Recommended for you content on homepage
    Given user is on home_page
    When user can see "home_page_content" on home_page
    Then user click "random_recommended_product" on home_page
    And user can see "product_page_content" on product_page