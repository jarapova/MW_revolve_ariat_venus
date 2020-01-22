#Projects:
#@proj:revolve

Feature: As a customer, I can choose the language, shipping country, and currency for my browsing experience.
  Navigation - Language/Country/Currency Selector

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can change language of browsing experience
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can change country of browsing experience
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can change currency of browsing experience
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:revolve @automated
  Scenario:[Revolve] User can change language of browsing experience
    Given user is on home_page
    And user scroll to the bottom of page
    When user click "country_preferences_button" on footer
    Then user can see "country_preferences_modal_content" on footer
    And user click "language_selector" on footer
    Then user set "language_selector" with value "Deutsch" on footer
    When user click "update_button" on footer
    Then user can see "Die begehrtesten" on home_page
    And user scroll to the bottom of page
    When user click "country_preferences_button" on footer
    And user click "language_selector" on footer
    Then user set "language_selector" with value "English" on footer
    When user click "update_button" on footer
    And user can see "home_page_content" on home_page

  @proj:revolve @manual
  Scenario:[Revolve] [REV-343] User can change language of browsing experience and its apply for hamburger menu
    Given Current country US
    When Change to Japanese
    Then All items like "Women", "Men", "Beauty", "Customer Care" in hamburger menus are translated
    When Change to German
    Then All items like "Women", "Men", "Beauty", "Customer Care" in hamburger menus are translated
    When Change to Chinese
    Then All items like "Women", "Men", "Beauty", "Customer Care" in hamburger menus are translated


  @proj:revolve @automated
  Scenario:[Revolve] User can change country of browsing experience
    Given user is on home_page
    And user scroll to the bottom of page
    When user click "country_preferences_button" on footer
    Then user can see "country_preferences_modal_content" on footer
    And user click "ship_to_selector" on footer
    And user set "ship_to_selector" with value "UNITED KINGDOM" on footer
    When user click "update_button" on footer
    Then user scroll to the bottom of page
#    And user can see "home_page_content" on home_page
    When user click "country_preferences_button" on footer
    Then user can see "country_preferences_modal_content" on footer
    And user can see "ship_to_selector" with value "UNITED KINGDOM" on footer

  @proj:revolve @manual
  Scenario:[Revolve] [REV-272] User can change country of browsing experience twice to UK and to JAP
    Given Current country US
    When Change to UK
    Then Currency changes to British pound
    Then UK specific top banners show: Privacy policy and Duties and Taxes
    Then Display "Duties + Taxes" messaging below estimated total
    When Change to Japan - currency should change to YEN and language to Japanese

  @proj:revolve @automated
  Scenario:[Revolve] User can change currency of browsing experience
    Given user is on home_page
    And user scroll to the bottom of page
    When user click "country_preferences_button" on footer
    Then user can see "country_preferences_modal_content" on footer
    When user click "currency_selector" on footer
    And user set "currency_selector" with value "Russia (₽)" on footer
    When user click "update_button" on footer
    And user can see "home_page_content" on home_page
    And user scroll to the bottom of page
    And user can see "₽" on home_page
    When user click "country_preferences_button" on footer
    Then user can see "currency_selector" with value "Russia (₽)" on footer

  @proj:revolve @automated
  Scenario:[Revolve][REV-387][REV-325] User can see 'Free shipping & Returns' message in 'Country preferences'
    Given user is on home_page
    And user scroll to the bottom of page
    When user click "country_preferences_button" on footer
    Then user can see "country_preferences_modal_content" on footer
    And user click "close_modal_button" on footer
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Dresses" on hamburger_menu
    And user click "Gowns" on hamburger_menu
    Then user scroll to the bottom of page
    When user click "country_preferences_button" on footer
    Then user can see "country_preferences_modal_content" on footer
    And user click "close_modal_button" on footer
    When user scroll page
    Then user click "random_item_name" on subcategory_page
    And user scroll to the bottom of page
    When user click "country_preferences_button" on footer
    Then user can see "country_preferences_modal_content" on footer
    And user click "close_modal_button" on footer
    When user click logo_button on header
    And user scroll to the bottom of page
    When user click "country_preferences_button" on footer
    Then user can see "country_preferences_modal_content" on footer
    And user click "close_modal_button" on footer

  @proj:revolve @manual
  Scenario:[Revolve][REV-337] Elements that not have translation should be English by default
    Given test steps are under design