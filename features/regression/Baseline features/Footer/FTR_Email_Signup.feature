#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I will be presented with an email sign-up text box, along with a brief description about what I am signing up for and receive an email that I am subscribed to the newsletter.
  FTR - Email Signup
#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User can subscribe to receive special offers
    Given test steps are under design



#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can subscribe to receive special offers
    Given user is on home_page
    And user scroll to the bottom of page
    And user can see "footer_content" on footer
    When user set "email_input" with value "smith@softesis.com" on footer
    And user click "email_button" on footer
    Then user can see "email_offer_code_content" on home_page

  @proj:revolve @manual
  Scenario:[Revolve] [REV-482] User can submit subscription using device keyboard
    Given user is on home_page
    And user scroll to the bottom of page
    And user can see "footer_content" on footer
    When user set "email_input" with value "smith@softesis.com" on footer
    And user click "Enter" on device keyboard
    Then user can see "email_offer_code_content" on home_page

    #================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can subscribe to receive special offers
    Given user is on home_page
    When user can see email_subscription_field on home_page
    Then user click email_subscription_field on home_page
    And  user fill email_subscription_field with "test12@test.com" on home_page
    And user click email_subscription_field_arrow_button on home_page
    Then user can see "welcome_back_page_content" on welcome_back_page


    #================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can subscribe to receive special offers
      Information about email sign up is created accordingly
      Proper error messages are shown if entered an incorrect email address / format
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] [SCP-26] User can't subscribe to receive special offers using invalid email
    Given test steps are under design



  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] [SCP-25] User can see email subscription description textual content
    Given test steps are under design




#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can subscribe to receive special offers
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can subscribe to receive special offers
    Given test steps are under design


#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible
#goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] User can subscribe to receive special offers
    Banners are not clickable on legacy sign up page
    Given user is on home_page
    When user scroll to the bottom of page
    Then user can see "email_offers_content" on footer
    When user set "email_input" with value "smith@softesis.com" on footer
    And user click "subscribe_button" on footer
    Then user can see "email_sign_up_content" on sign_in_page
