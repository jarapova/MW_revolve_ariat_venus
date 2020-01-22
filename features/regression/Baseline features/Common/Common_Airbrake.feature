#Projects:
#@proj:revolve
#@proj:venus
#@proj:stagestores


Feature: As a customer, I want my site to be integrated with Airbrake
  Global - Scroll Back To Top
#venus: only PLP
#stagestore: only PLP

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Site integrated with Airbrake
    Given test steps are under design


#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-162] Check Airbrake for Production Logging
    Given test steps are under design

