#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I can see placeholder components for all product tiles until the content is loaded.
  PDP - Skeletons - Product Tiles

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see placeholders of product tiles while PDP content is loading
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @manual
  Scenario:[Revolve] User can see placeholders of product tiles while PDP content is loading
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve][REV-388] User shouldn't see Permanent skeletons on PDP on iOS 11
    Given test steps are under design


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @manual
  Scenario:[Venus] User can see placeholders of product tiles while PDP content is loading
    Given test steps are under design


#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival] User can see placeholders of product tiles while PDP content is loading
    Given test steps are under design

  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival] [SCP-181] Skeletons are pixel perfect to ensure there is no jank when landing on the PDP.
    Given test steps are under design



#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @manual
  Scenario:[Stagestores] User can see placeholders of product tiles while PDP content is loading
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @manual
  Scenario:[BluePlanet] User can see placeholders of product tiles while PDP content is loading
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @manual
  Scenario:[Ariat] User can see placeholders of product tiles while PDP content is loading
    Given test steps are under design
