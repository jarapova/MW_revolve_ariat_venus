#Projects:
#@proj:revolve
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I can click on any of the AMP footer buttons or links and be directed to the "real" PWA with that functionality triggered.
  FTR - Google AMP

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Every button and link on Google AMP version in of Footer should direct to "real" PWA page
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @manual
  Scenario:[Revolve][REV-308] Every button and link on Google AMP version in of Footer should direct to "real" PWA page
    Given test steps are under design

    #================================  [BluePlanet]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] Every button and link on Google AMP version in of Footer should direct to "real" PWA page
    Given test steps are under design

        #================================  [Ariat]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios
#Need to be automated if possible

  @proj:ariat @manual
  Scenario:[Ariat] Every button and link on Google AMP version in of Footer should direct to "real" PWA page
    Given test steps are under design