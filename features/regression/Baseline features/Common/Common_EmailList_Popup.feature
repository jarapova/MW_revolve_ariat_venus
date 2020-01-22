#Projects:
#@proj:revolve
#@proj:venus
#@proj:stagestores

Feature: As a customer, I will be presented with an email sign-up window upon visiting the website. This allows me to subscribe to the email newsletter.
  Global - Email Subscription

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User presented with an email sign-up pop-up window upon visiting the website.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can subscribe to email newsletter using email sign-up pop-up
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User presented with an email sign-up pop-up window upon visiting the website.
    Given user is on home_page
    When user can see "home_page_content" on home_page
    Then user can see "email_discount_banner" on home_page
    When user click "email_discount_banner" on home_page
    Then user can see "email_discount_banner_content" on home_page

  @proj:revolve @automated
  Scenario:[Revolve] User can subscribe to email newsletter using email sign-up pop-up
    Given user is on home_page
    When user can see "home_page_content" on home_page
    Then user can see "email_discount_banner" on home_page
    When user click "email_discount_banner" on home_page
    Then user can see "email_discount_banner_content" on home_page
    When user make email subscription on sign_in_pop_up
    Then user can see "email_offer_code_content" on home_page

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus
  Scenario:[Venus] User presented with an email sign-up pop-up window upon visiting the website.
    Given test steps are under design

  @proj:venus
  Scenario:[Venus] User can subscribe to email newsletter using email sign-up pop-up
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores
  Scenario:[Stagestores] User presented with an email sign-up pop-up window upon visiting the website.
    Given test steps are under design

  @proj:stagestores
  Scenario:[Stagestores] User can subscribe to email newsletter using email sign-up pop-up
    Given test steps are under design