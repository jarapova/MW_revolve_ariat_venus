#Projects:
#@proj:revolve
#@proj:blueplanet

Feature: Criteo will be implemented in Google Tag Manager. GTM includes "Criteo OneTag" as a tag type. Criteo should be implemented in the PWA for all page types (Home, PLP, PDP, Search Results, Bag) and when adding a product to the bag.
  Tags - GTM - Criteo

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Check Criteo tracking on all corresponding pages
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @manual
  Scenario:[Revolve] Check Criteo tracking on all corresponding pages
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @manual
  Scenario:[BluePlanet] Check Criteo tracking on all corresponding pages
    Given test steps are under design