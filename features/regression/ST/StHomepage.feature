Feature: This test suite is for checking ST homepage content:

  Main banner =========================================================================================== Ready for dev
  Main categories (Woman, Shoes, Kids, Shop all) ======================================================== Ready for dev
  Shop top categories (images and titles should be presented) =========================================== Ready for dev
  Special offers (sales) categories (images and titles should be presented) ============================= Ready for dev
  Addition banners (rewards, shipping info) ============================================================= Ready for dev
  “Explore more” items carousel (expected info for each item, scrollability) ============================ Ready for dev

  Scenario: As User I want to see Main Banner on homepage
    Given: user is on home_page
    Then user can see "main_banner_content" on home_page
    Then user click "main_banner" on home_page
    And user can see "main_banner_page_content" on main_banner_page

  Scenario: As User I want to see main categories content on homepage
    Given: user is on home_page
    Then user can see "main_categories_content" on home_page
    Then user click "main_categories_kids" on home_page
    And user can see "kids_category_page_content" on subcategory_page

  Scenario: As User I want to see Shop top categories content on homepage
    Given: user is on home_page
    Then user can see "top_categories_content" on home_page
    Then user click "top_categories_dresses" on home_page
    And user can see "dresses_category_page_content" on subcategory_page

  Scenario: As User I want to see Special offers content on homepage
    Given: user is on home_page
    Then user can see "special_offers_content" on home_page
    Then user click "special_offers_content" on home_page
    And user can see "special_offers_page_content" on subcategory_page

  Scenario: As User I want to see Addition banners content on homepage
    Given: user is on home_page
    Then user can see "addition_banner_01" on home_page
    Then user click "addition_banner_01" on home_page
    And user can see "addition_banner_01_page_content" on subcategory_page
    Then user click logo_button on header
    Then user can see "addition_banner_02" on home_page
    Then user click "addition_banner_02" on home_page
    And user can see "addition_banner_02_page_content" on subcategory_page

  Scenario: As User I want to see “Explore more” items carousel content on homepage
    Given: user is on home_page
    Then user can see "explore_more_content" on home_page
    Then user can see "explore_more_item_1_name" on home_page
    Then user click "explore_more_item_1" on home_page
    And user can see "pdp_page_content" on pdp_page
    And user can see "explore_more_item_1_name" on pdp_page