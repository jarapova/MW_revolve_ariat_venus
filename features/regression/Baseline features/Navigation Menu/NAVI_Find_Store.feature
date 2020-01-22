#Projects:
#@proj:shoecarnival
#@proj:stagestores

Feature: As a customer, I can see a link to Find Store at the top of the navigation above the account link.
  Navigation - Find Store


#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

@proj:baseline
  Scenario:[Baseline] User can see a link to Find Store at the top of the navigation above the account link.
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see a link to Find Store in navigation menu
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can use Find Store functionality from navigation menu
    Given test steps are under design

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can see a link to Find Store at the top of the navigation above the account link.
    Given test steps are under design

    @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-247] Change store shows loading GIF while looking up nearest store
    Given test steps are under design




#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see a link to Find Store in navigation menu
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can use Find Store functionality from navigation menu
    Given test steps are under design