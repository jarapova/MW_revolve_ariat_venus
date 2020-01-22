Feature: This test suite defines footer functionality for Stage

  Navigation links should be presented and should lead to correct pages =================================== Ready for dev
  Accordion menus - subpages should lead to correct pages ================================================= Ready for dev
  Social links should be presented and should lead to correct pages ======================================= Ready for dev
  Sign up for emails ====================================================================================== Ready for dev
  Legal & privacy policy Accordion menus subpages should lead to correct pages ============================ Ready for dev
  Copyright information is presented ====================================================================== Ready for dev


  # Navigation links should be presented and should lead to correct pages
  Scenario: As user or guest I should see navigation links which lead to the correct pages
    Given user is on home_page
    And user can see "footer_modal_content" on home_page
    When user click "shop_todays_deals" on footer_modal
    Then user can see "todays_deals_page_content" on todays_deals_page
    And user click logo_button on header

    When user click "find_a_store" on footer_modal
    Then user can see "find_a_store_page_content" on find_a_store_page
    And user click logo_button on header

    When user click "track_your_order" on footer_modal
    Then user can see "track_your_order_page_content" on track_your_order_page
    And user click logo_button on header

    When user click "give_a_gift_card" on footer_modal
    Then user can see "gift_card_page_content" on gift_card_page
    And user click logo_button on header

    When user click "earn_rewards" on footer_modal
    Then user can see "rewards_page_content" on rewards_page
    And user click logo_button on header

    When user click "read_our_blog" on footer_modal
    Then user can see "blog_page_content" on blog_page

  # Accordion menus - subpages should lead to correct pages
  Scenario: As user or guest I should see accordion menus' subpages which lead to the correct pages
    Given user is on home_page
    And user can see "footer_modal_content" on home_page

    # Guest Services Accordion

    When user click "guest_services" on footer_modal
    And user click "returns_policy" on footer_modal
    Then user can see "returns_policy_page_content" on returns_policy_page
    And user click logo_button on header

    When user click "guest_services" on footer_modal
    And user click "shipping_policy" on footer_modal
    Then user can see "shipping_policy_page_content" on shipping_policy_page
    And user click logo_button on header

    When user click "guest_services" on footer_modal
    And user click "secure_shopping" on footer_modal
    Then user can see "secure_shopping_page_content" on secure_shopping_page
    And user click logo_button on header

    When user click "guest_services" on footer_modal
    And user click "help_faqs" on footer_modal
    Then user can see "help_faqs_page_content" on help_faqs_page
    And user click logo_button on header

    When user click "guest_services" on footer_modal
    And user click "size_charts" on footer_modal
    Then user can see "size_charts_page_content" on size_charts_page
    And user click logo_button on header

    When user click "guest_services" on footer_modal
    And user click "contact_us" on footer_modal
    Then user can see "contact_us_page_content" on contact_us_page
    And user click logo_button on header

    # Our Company Accordion

    When user click "our_company" on footer_modal
    And user click "about_us" on footer_modal
    Then user can see "about_us_page_content" on about_us_page
    And user click logo_button on header

    When user click "our_company" on footer_modal
    And user click "careers" on footer_modal
    Then user can see "careers_page_content" on careers_page
    And user click logo_button on header

    When user click "our_company" on footer_modal
    And user click "real_estate" on footer_modal
    Then user can see "real_estate_page_content" on real_estate_page
    And user click logo_button on header

    When user click "our_company" on footer_modal
    And user click "investor_relations" on footer_modal
    Then user can see "investor_relations_page_content" on investor_relations_page
    And user click logo_button on header

    When user click "our_company" on footer_modal
    And user click "community_counts" on footer_modal
    Then user can see "community_counts_page_content" on community_counts_page
    And user click logo_button on header

    When user click "our_company" on footer_modal
    And user click "associate_login" on footer_modal
    Then user can see "associate_login_page_content" on associate_login_page
    And user click logo_button on header

    # Credit Center Accordion

    When user click "credit_center" on footer_modal
    And user click "manage_your_card" on footer_modal
    Then user can see "card_management_page_content" on card_management_page
    And user click visit_stagestores_link on card_management_page

    When user click "credit_center" on footer_modal
    And user click "apply_now" on footer_modal
    Then user can see "sign_in_page_content" on sign_in_page
    And user click logo_button on header

    When user click "credit_center" on footer_modal
    And user click "card_benefits" on footer_modal
    Then user can see "card_management_page_content" on card_management_page

  # Social links should be presented and should lead to correct pages
  Scenario: As user or guest I should see social links which lead to the correct pages
    Given user is on home_page
    And user can see "footer_modal_content" on home_page
    When user click "pinterest_logo" on footer_modal
    Then user can see "pinterest_page_content" on pinterest_page

    Given user is on home_page
    When user click "facebook_logo" on footer_modal
    Then user can see "facebook_page_content" on facebook_page

    Given user is on home_page
    When user click "instagram_logo" on footer_modal
    Then user can see "instagram_page_content" on instagram_page

    Given user is on home_page
    When user click "twitter_logo" on footer_modal
    Then user can see "twitter_page_content" on twitter_page

    Given user is on home_page
    When user click "youtube_logo" on footer_modal
    Then user can see "youtube_page_content" on youtube_page

  # Sign up for emails
  Scenario: As user or guest I can sign up for emails
    Given user is on home_page
    And user can see "footer_modal_content" on home_page
    When user click "sign_up_for_emails_and_text_alerts" on footer_modal
    Then user can see "email_sign_up_page_content" on email_sign_up_page

  # Legal & privacy policy accordion menus' subpages should lead to correct pages
  Scenario: As user or guest I should see legal & privacy accordion menus' subpages which lead to the correct pages
    Given user is on home_page
    And user can see "footer_modal_content" on home_page
    When user click "legal_and_privacy_notices" on footer_modal
    And user click "terms_of_use" on footer_modal
    Then user can see "terms_of_use_page_content" on terms_of_use_page
    And user click logo_button on header

    When user click "legal_and_privacy_notices" on footer_modal
    And user click "privacy_policy" on footer_modal
    Then user can see "privacy_policy_page_content" on privacy_policy_page
    And user click logo_button on header

    When user click "legal_and_privacy_notices" on footer_modal
    And user click "pricing_policy" on footer_modal
    Then user can see "pricing_policy_page_content" on pricing_policy_page
    And user click logo_button on header

    When user click "legal_and_privacy_notices" on footer_modal
    And user click "alerts_policy" on footer_modal
    Then user can see "alerts_policy_page_content" on alerts_policy_page
    And user click logo_button on header

    When user click "legal_and_privacy_notices" on footer_modal
    And user click "ca_transparancy_act" on footer_modal
    Then user can see "ca_transparancy_act_page_content" on ca_transparancy_act_page
    And user click logo_button on header

    When user click "legal_and_privacy_notices" on footer_modal
    And user click "ca_privacy_rights" on footer_modal
    Then user can see "ca_privacy_rights_page_content" on ca_privacy_rights_page
    And user click logo_button on header

    When user click "legal_and_privacy_notices" on footer_modal
    And user click "copyrights" on footer_modal
    Then user can see "copyrights_page_content" on copyrights_page
    And user click logo_button on header

    When user click "legal_and_privacy_notices" on footer_modal
    And user click "site_map" on footer_modal
    Then user can see "site_map_page_content" on site_map_page

  # Copyright information is presented
  Scenario: As user or guest I should see copyright information in the footer
    Given user is on home_page
    And user can see "footer_modal_content" on footer_modal
    And user can see "footer_copyright_content" on footer_modal