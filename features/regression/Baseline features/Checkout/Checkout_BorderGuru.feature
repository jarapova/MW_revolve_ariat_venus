#Projects:
#@proj:venus
#@proj:blueplanet


Feature: As user I want to see border guru information
  Checkout_BorderGuru.feature
  #================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] Logged in Canadian user can see Border Guru Shipping method
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Guest user with Canadian address can see Border Guru Shipping method
    Given test steps are under design
    #================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @manual
  Scenario:[Venus] Logged in Canadian user can see Border Guru Shipping method
    Given test steps are under design

  @proj:venus @manual
  Scenario:[Venus] Guest user with Canadian address can see Border Guru Shipping method
    Given test steps are under design


    #================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @manual
  Scenario:[BluePlanet] Logged in Canadian user can see Border Guru Shipping method
    Given test steps are under design

  @proj:blueplanet @manual
  Scenario:[BluePlanet] Guest user with Canadian address can see Border Guru Shipping method
    Given test steps are under design