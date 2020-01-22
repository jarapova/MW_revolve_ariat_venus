#Projects:
#@proj:revolve
#@proj:shoecarnival
#@proj:blueplanet
#@proj:ariat

Feature: The following custom events will be tracked with Google Analytics via Google Tag Manager:
  Tags - GTM - Custom GA Events

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Check custom Google Analytics custom events on all corresponding pages
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Check event "Page Click" is triggered after every navigating to PDP (from Cart Page, Wish List, PLP etc.)
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Check custom Google Analytics custom events on all corresponding pages on AMP
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Check event "Page Click" is triggered after every navigating to PDP (from Cart Page, Wish List, PLP etc.) on AMP
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @manual
  Scenario:[Revolve] Check custom Google Analytics custom events on all corresponding pages
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] Check event "Page Click" is triggered after every navigating to PDP (from Cart Page, Wish List, PLP etc.)
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve][REV-362] Check GTM Data Layer Push is happened for all corresponding events
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] Check custom Google Analytics custom events on all corresponding pages on AMP
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] Check event "Page Click" is triggered after every navigating to PDP (from Cart Page, Wish List, PLP etc.) on AMP
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve][REV-362] Check GTM Data Layer Push is happened for all corresponding events on AMP
    Given test steps are under design


 #================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival][SCP-76] Check custom Google Analytics custom events on all corresponding pages
  The following events need to be created based on the documentation above:
  Global Page DDO Elements
  Internal Search DDO Elements
  Product Listing/Category Page DDO Elements
  Product Detail Page DDO Elements
  Event Based DDO Elements
  Email form submit on footer
  Add to Cart
  Remove from Cart
  Post Load Product Listing Filters/Refinements
  Post Load Product Listing Sorting
    Given test steps are under design

  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival] Check event "Page Click" is triggered after every navigating to PDP (from Cart Page, Wish List, PLP etc.)
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @manual
  Scenario:[BluePlanet] Check custom Google Analytics custom events on all corresponding pages
    Given test steps are under design

  @proj:blueplanet @manual
  Scenario:[BluePlanet] Check event "Page Click" is triggered after every navigating to PDP (from Cart Page, Wish List, PLP etc.)
    Given test steps are under design


    #================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @manual
  Scenario:[Ariat] Check custom Google Analytics custom events on all corresponding pages
    Given test steps are under design

  @proj:ariat @manual
  Scenario:[Ariat] Check event "Page Click" is triggered after every navigating to PDP (from Cart Page, Wish List, PLP etc.)
    Given test steps are under design