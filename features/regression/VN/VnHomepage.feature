Feature: This test suite is for checking VEN homepage content: Shop Now buttons, plus_button and content

  Shop Now buttons  ====================================================================================== Ready for dev
  Plus button  =========================================================================================== Ready for dev
#Error buttons have been removed
#  Scenario: As User I want to see shop_collection_shop_now_button on homepage
#    Given user is on home_page
#    Then user can see "shop_collection_shop_now_button" on home_page
#
#  Scenario: As User I want to see maxi_dresses_shop_now_button on homepage
#    Given user is on home_page
#    Then user can see "maxi_dresses_shop_now_button" on home_page
#
#  Scenario: As User I want to see all_dresses_shop_now_button on homepage
#    Given user is on home_page
#    Then user can see "all_dresses_shop_now_button" on home_page
#
#  Scenario: As User I want to see all_bras_shop_now_button on homepage
#    Given user is on home_page
#    Then user can see "all_bras_shop_now_button" on home_page
#
#  Scenario: As User I want to see strapless_and_backless_shop_now_button on homepage
#    Given user is on home_page
#    Then user can see "strapless_and_backless_shop_now_button" on home_page
#
#  Scenario: As User I want to see push_up_bras_shop_now_button on homepage
#    Given user is on home_page
#    Then user can see "push_up_bras_shop_now_button" on home_page
#
#  Scenario: As User I want to see solid_swim_sale_shop_now_button on homepage
#    Given user is on home_page
#    Then user can see "solid_swim_sale_shop_now_button" on home_page
#
#  Scenario: As User I want to see push_up_top_sale_shop_now_button on homepage
#    Given user is on home_page
#    Then user can see "push_up_top_sale_shop_now_button" on home_page
#
#
#  Scenario: As User I want to see summer_deals_now_button on homepage
#    Given user is on home_page
#    Then user can see "summer_deals_shop_now_button" on home_page
#
#  Scenario: As User I want to see clearance_now_button on homepage
#    Given user is on home_page
#    Then user can see "clearance_shop_now_button" on home_page

  Scenario: As User I want to see shop_now_buttons on homepage
    Given user is on home_page
    Then user can see "all_shop_now_buttons_content" on home_page

  Scenario: As User I want to use plus_button on homepage
    Given user is on home_page
    Then user can see plus_button on home_page
    When click plus_button on home_page
    When click plus_button on home_page
    When click plus_button on home_page
    When click plus_button on home_page
    Then user can see plus_button on home_page

  Scenario: As User I want to see home_page_content on homepage
    Given user is on home_page
    Then user can see "home_page_content" on home_page


  Scenario: As User I to make email subscription and proceed to profile confirm
    Given user is on home_page
    When user can see email_subscription_field on home_page
    Then user click email_subscription_field on home_page
    And  user fill email_subscription_field with "test12@test.com" on home_page
    And user click email_subscription_field_arrow_button on home_page
    Then user can see "welcome_back_page_content" on welcome_back_page
