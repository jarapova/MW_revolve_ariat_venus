#Projects:
#@proj:shoecarnival
#@proj:blueplanet

Feature: As a customer, I need to see an image banner if applicable on respective product listing pages to better engage with the content.
  PLP - Category Banners
  PLP - Category Title

  BluePlanet: As a customer, I can read the title of the product listing category I am currently viewing.

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User can see an image banner if applicable on respective product listing pages
    Given test steps are under design

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can see an image banner if applicable on respective product listing pages
    Given test steps are under design

  #================================  [BluePlanet]   ================================================================
  #This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios
  #Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can read the title of the product listing category currently viewing.
    Given test steps are under design