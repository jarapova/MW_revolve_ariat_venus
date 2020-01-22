#Projects:
#@proj:revolve
#@proj:blueplanet

Feature: The Facebook pixel will be implemented with Google Tag Manager to track ad-driven customer page views.
  Tags - GTM - Facebook Pixel

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Check Facebook pixel on all corresponding pages
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @manual
  Scenario:[Revolve] Check Facebook pixel on all corresponding pages
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @manual
  Scenario:[BluePlanet] Check Facebook pixel on all corresponding pages
    Given test steps are under design