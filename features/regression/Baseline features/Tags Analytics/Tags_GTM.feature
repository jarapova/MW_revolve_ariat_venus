#Projects:
#@proj:revolve
#@proj:shoecarnival
#@proj:blueplanet
#@proj:ariat

Feature: The PWA will implement Google Tag Manager which will be used to incorporate all other tools (Google Analytics, Criteo, Cordial, etc.).
  Tags - Google Tag Manager

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Check Google Tags on all corresponding pages
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Check Google Tags on all corresponding pages on AMP
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @manual
  Scenario:[Revolve] Check Google Tags on all corresponding pages
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] Check Google Tags on all corresponding pages on AMP
    Given test steps are under design

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival] Check Google Tags on all corresponding pages
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @manual
  Scenario:[BluePlanet] Check Google Tags on all corresponding pages
    Given test steps are under design

    #================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @manual
  Scenario:[Ariat] Check Google Tags on all corresponding pages
    Given test steps are under design

  @proj:ariat @manual
  Scenario:[Ariat] Check Google Tags on all corresponding pages on AMP
    Given test steps are under design
