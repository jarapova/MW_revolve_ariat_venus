#Projects:
#@proj:revolve
#@proj:blueplanet

Feature: Cordial will be implemented in Google Tag Manager. GTM does not include it as a tag type so it will be manually entered. Cordial should be implemented in the PWA for:
  Tags - GTM - Cordial

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Check Cordial tracking on all corresponding pages
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @manual
  Scenario:[Revolve] Check Cordial tracking on all corresponding pages
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @manual
  Scenario:[BluePlanet] Check Cordial tracking on all corresponding pages
    Given test steps are under design