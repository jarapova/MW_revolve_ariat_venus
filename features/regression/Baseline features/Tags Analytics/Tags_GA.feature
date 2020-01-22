#Projects:
#@proj:revolve
#@proj:blueplanet
#@proj:ariat


Feature: Google Analytics will be implemented in Google Tag Manager.
  Tags - GTM - Google Analytics

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Check google analytics events on all corresponding pages
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @manual
  Scenario:[Revolve] Check google analytics events on all corresponding pages
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve][REV-390] Google Analytics uses a custom dimension. It means that 'cd5' key will have value 'pwa=true' in Google Analytics
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve][REV-391] The pwa=true cookie for Google Analytics is presented on all PWA and not PWA pages after first visiting PWA page
    Given user is on PWA page
    And user can see pwa=true cookie
    Then user is on not PWA page
    And user can see pwa=true cookie

  @proj:revolve @manual
  Scenario:[Revolve][REV-296] The tid value should be UA-319064-1 for non-PWA pages
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve][REV-432] Check Proceed to Checkout Tracking from PDP and Cart Page
  "Proceed To Checkout"
  "Checkout as a Guest"
  "Sign in for Faster Checkout"
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve][REV-432] Check tracking for "buy now" on PDP
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:blueplanet @manual
  Scenario:[BluePlanet] Check google analytics events on all corresponding pages
    Given test steps are under design

    #================================  [Ariat]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:ariat @manual
  Scenario:[Ariat] Check google analytics events on all corresponding pages
    Given test steps are under design