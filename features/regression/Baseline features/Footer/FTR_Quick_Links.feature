#Projects:
#@proj:shoecarnival
#@proj:venus
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat


Feature: As a customer, I need have a list of quick links available on the footer.
  FTR - Quick Links

#Venus: Venus card, Wish list, About us, Contact us, Order status, Customer care, Request a catalog, Gift cards, Privacy policy, Terms of use, Sitemap.

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User can see a list of quick links available on the footer.
    Given test steps are under design


#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can see a list of quick links available on the footer. Each link should navigate me to expected page.
    Given test steps are under design


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can see a list of quick links available on the footer.
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

#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see a list of quick links available on the footer.
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] [REV-213] User can see a list of quick links available on the footer.
    Given user is on home_page
    When user scroll to the bottom of page
    Then user can see "footer_content" on footer


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see a list of quick links available on the footer.
    Given test steps are under design


#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible
  #goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] User can see a list of quick links available on the footer.
    Given user is on home_page
    When user scroll to the bottom of page
    Then user can see "accordions_and_links_content" on footer