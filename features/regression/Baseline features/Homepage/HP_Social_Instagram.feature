#Projects:
#@proj:venus

Feature: As customer I want to see 6 instagram images, and want to see 9 more by clicking + button
  HP - Social - Instagram

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User see 6 instagram images, and want to see 9 more by clicking + button
    Given test steps are under design

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User see 6 instagram images, and want to see 9 more by clicking + button
    Given user is on home_page
    And user scroll page
    Then user can see plus_button on home_page
    When click plus_button on home_page
    When click plus_button on home_page
    When click plus_button on home_page
    When click plus_button on home_page
    Then user can see plus_button on home_page

#================================  [BluePlanet]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see and interact with the Instagram social section, which allows me to go to their product details page.
    Given test steps are under design