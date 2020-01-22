Feature: This test suite defines the Hamburger Menu functionality for Venus


Hamburger Menu flow:

User can open and close Hamburger Menu ========================================= Ready for dev
User can navigate to subcategory page through Hamburger Menu ====================== Ready for dev
Navigation links are presented in hamburger ===================================== Ready for dev 

# User can open and close Hamburger Menu =========================================== Ready for dev =====================
  Scenario: As user I want to open and close the Hamburger Menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_first_page_content" on hamburger_menu
    And user click "shop_by_categories_on_first_page" on hamburger_menu
    And user can see "hamburger_category_page_content" on hamburger_menu
    Then user click hamburger_menu_icon on header
    And user can see "hamburger_menu_closed" on hamburger_menu
    And user can see "home_page_content" on home_page

# User can navigate to subcategory page through Hamburger Menu ===================== Ready for dev =====================
  Scenario: As user I want to navigate to the category page through the Hamburger Menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_first_page_content" on hamburger_menu
    And user click "shop_by_categories_on_first_page" on hamburger_menu
    And user click "back_category" on hamburger_menu
    And user click "shop_by_categories_on_first_page" on hamburger_menu
    And user can see "hamburger_category_page_content" on hamburger_menu
#    And user click "clothing_category" on hamburger_menu
    And user click "open_app_cats" on hamburger_menu
    And user can see "hamburger_subcategory_page_content" on hamburger_menu
    And user click "dresses_subcat" on hamburger_menu
    Then user is on "dresses_subcategory" subcategory page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_subcategory_page_content" on hamburger_menu

  #Navigation links are presented in hamburger ===================================== Ready for dev =====================
  Scenario: As user I want use venus_card link in hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    When user click "venus_card_on_first_page" on hamburger_menu
    Then user can see "venus_card_page_content" on venus_card_page

  #Navigation links are presented in hamburger ===================================== Ready for dev =====================
  Scenario: As user I want use about_us link in hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "about_us_on_first_page" on hamburger_menu
    Then user can see "about_us_page_content" on about_us_page

  #Navigation links are presented in hamburger ===================================== Ready for dev =====================
  Scenario: As user I want use contact_us link in hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    When user click "contact_us_on_first_page" on hamburger_menu
    Then user can see "contact_us_page_content" on contact_us_page

  #Navigation link order_status for guest user is presented in hamburger ===================================== Ready for dev =====================
  Scenario: As user I want use order_status link in hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    When user click "order_status_on_first_page" on hamburger_menu
    Then user can see "order_status_guest_page_content" on order_status_page

  #Navigation links are presented in hamburger ===================================== Ready for dev =====================
  Scenario: As user I want use customer_care link in hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    When user click "customer_care_on_first_page" on hamburger_menu
    Then user can see "customer_care_page_content" on customer_care_page

  #Navigation links are presented in hamburger ===================================== Ready for dev =====================
  Scenario: As user I want use request_a_catalog link in hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    When user click "request_a_catalog_on_first_page" on hamburger_menu
    Then user can see "request_a_catalog_page_content" on request_a_catalog_page

  #Navigation links are presented in hamburger ===================================== Ready for dev =====================
  Scenario: As user I want use gift_cards link in hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    When user click "gift_cards_on_first_page" on hamburger_menu
    Then user can see "gift_cards_page_content" on gift_cards_page
