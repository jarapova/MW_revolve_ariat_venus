#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, clicking on any of the products in the recommendations content should bring me to the destination screen extremely fast.
  PDP - Prefetching - Recommendations

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can navigate to related page of recommended product from PDP extremely fast by taping related CTA
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @manual
  Scenario:[Revolve] User can navigate to related page of recommended product from PDP extremely fast by taping related CTA
    Given test steps are under design

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @manual
  Scenario:[Venus] User can navigate to related page of recommended product from PDP extremely fast by taping related CTA
    Given test steps are under design

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival] User can navigate to related page of recommended product from PDP extremely fast by taping related CTA
      Prefetch header links
      Prefetch add to cart page?
      Prefetch breadcrumb links
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @manual
  Scenario:[Stagestores] User can navigate to related page of recommended product from PDP extremely fast by taping related CTA
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @manual
  Scenario:[BluePlanet] User can navigate to related page of recommended product from PDP extremely fast by taping related CTA
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @manual
  Scenario:[Ariat] User can navigate to related page of recommended product from PDP extremely fast by taping related CTA
    Given test steps are under design
