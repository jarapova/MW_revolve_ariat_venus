
Feature: This test suite declines footer functionality for Venus

Phone number is clickable =============================================================================== Ready for dev
Expected social icons are presented ===================================================================== Ready for dev
User is able to make email subscription and proceed to profile confirm ================================== Ready for dev
Navigation links are presented in footer ================================================================ Ready for dev
User can change location options in footer ============================================================== Ready for dev
Copyright information is presented ====================================================================== Ready for dev
Android app link is working ============================================================================= Ready for dev
iOS app link is working ================================================================================= Ready for dev


  #User can see all expected content for footer modal
  Scenario: As user I want see all expected content for footer
    Given user is on home_page
    When user can see "footer_modal_content" on footer

  #Phone number is clickable
  Scenario: As user I want see customer care phone number and make call action by click
    Given user is on home_page
    When user can see "customer_care_phone_number" on footer


  #Expected social icons are presented
  Scenario: As user I want see social icons in footer
    Given user is on home_page
    When user can see "instagram_social_icon" on footer
    And user can see "facebook_social_icon" on footer
    And user can see "twitter_social_icon" on footer
    And user can see "pinterest_social_icon" on footer
#    And user can see "google_plus_social_icon" on footer
#    And user can see "live_chat_social_icon" on footer


  #Navigation links are presented in footer
  Scenario: As user I want see navigation links in footer
    Given user is on home_page
    And user make login as "user1"
    When user click "venus_card" on footer
    Then user can see "venus_card_page_content" on venus_card_page
    And user is on home_page
    When user click "about_us" on footer
    Then user can see "about_us_page_content" on about_us_page
    And user is on home_page
    And user click "customer_care" on footer
    Then user can see "customer_care_page_content" on customer_care_page
    And user is on home_page
    And user click "order_status" on footer
    Then user can see "order_history_page_content" on order_history_page
    And user is on home_page
    And user click "contact_us" on footer
    Then user can see "contact_us_page_content" on contact_us_page
    And user is on home_page
    And user click "request_a_catalog" on footer
    Then user can see "request_a_catalog_page_content" on request_a_catalog_page
    And user is on home_page
    And user click "gift_cards" on footer
    Then user can see "gift_cards_page_content" on gift_cards_page
    And user is on home_page
    And user click "privacy_policy" on footer
    Then user can see "privacy_policy_page_content" on privacy_policy_page
    And user is on home_page
    And user click "terms_of_use" on footer
    Then user can see "terms_of_use_page_content" on terms_of_use_page
    And user is on home_page
    And user click "sitemap" on footer
    Then user can see "sitemap_page_content" on sitemap_page

  #Copyright information is presented
  Scenario: As user I want Copyright information
    Given user is on home_page
    When user can see "copyright_information" on footer

  #Android app link is working
  Scenario: As user I want to download Android app from footer
    Given user is on home_page
    When user can see "download_android_app" on footer

  #iOS app link is working
  Scenario: As user I want to download iOS app from footer
    Given user is on home_page
    When user can see "download_ios_app" on footer


