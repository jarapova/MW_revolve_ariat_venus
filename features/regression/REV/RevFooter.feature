Feature: This test suite declines footer functionality for Revolve

  Phone number is clickable ============================================================================= Ready for dev
  Expected social icons are presented =================================================================== Ready for dev
  Privacy policy link is presented ====================================================================== Ready for dev
  User is able to make email subscription and proceed to profile confirm ================================ Ready for dev
  Navigation links are presented in footer ============================================================== Ready for dev
  User can change location options in footer ============================================================ Ready for dev
  California supply chains link ========================================================================= Ready for dev
  Copyright information is presented ==================================================================== Ready for dev
  User can switch to desktop version ==================================================================== Ready for dev


  #Phone number is clickable
  Scenario: As user I want see customer care phone number and make call action by click
    Given user is on home_page
    When user see customer care phone number in footer
    And user make call action by click by clicking on phone number

  #Expected social icons are presented
  Scenario: As user I want see social icons in footer
    Given user is on home_page
    When user see "instagram" social icon in the footer
    And user see "facebook" social icon in the footer
    And user see "snapchat" social icon in the footer
    And user see "twitter" social icon in the footer
    And user see "pinterest" social icon in the footer
    And user see "youtube" social icon in the footer
    And user see "google plus" social icon in the footer

  #Privacy policy link is presented
  Scenario: As user I want see privacy policy link
    Given user is on home_page
    When user see privacy policy link in the footer

  #User is able to make email subscription and proceed to profile confirm
  Scenario: As user I to make email subscription and proceed to profile confirm
    Given user is on home_page
    When user click on email subscription field in the footer
    And user enter valid email
    And user click on arrow button to proceed
    Then user is on subscribe landing page

  #Navigation links are presented in footer
  Scenario: As user I want see navigation links in footer
    Given user is on home_page
    When user click "about us" link in the footer
    Then user is on "about us" page
    And user click logo_button on header
    And user click "customer care" link in the footer
    Then user is on "customer care" page
    And user click logo_button on header
    And user click "my revolve" link in the footer
    Then user is on "my revolve" page
    And user click logo_button on header
    And user click "feedback" link in the footer
    Then user is on "feedback" page
    And user click logo_button on header
    And user click "careers" link in the footer
    Then user is on "careers" page
    And user click logo_button on header
    And user click "terms" link in the footer
    Then user is on "terms" page
    And user click logo_button on header
    And user click "privacy" link in the footer
    Then user is on "privacy policy" page
    And user click logo_button on header
    And user click "accessibility" link in the footer
    Then user is on "accessibility" page

  #User can change location options in footer
  Scenario: As user I want change location options in footer
    Given user is on home_page
    When user click location preferences button in the footer
    And user see location preferences modal
    Then user chose "Украина" as ship to option
    And user chose "Русский" as language option
    And user chose "RUB" as currency option
    And user press update preferences button
    Then user is on home_page
    And user see page with updated location preferences
    Then user click location preferences button in the footer
    And user see location preferences modal
    Then user chose "United states" as ship to option
    And user chose "English" as language option
    And user chose "USD" as currency option
    And user press update preferences button
    Then user is on home_page
    And user see page with updated location preferences

  #California supply chains link
  Scenario: As user I want see supply chains link
    Given user is on home_page
    When user click "supply chains" link in the footer
    Then user is on "california supply chains" page

  #Copyright information is presented
  Scenario: As user I want Copyright information
    Given user is on home_page
    When user see copyright information in the footer

  #User can switch to desktop version
  Scenario: As user I want switch to desktop site version from footer
    Given user is on home_page
    When user click "Switch to Desktop Version" link in the footer
    And user is on the Desktop site


