#Projects:
#@proj:venus

Feature: As a customer, I should see an interactive social section on the homepage.
  Homepage - Social Section

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User see see an interactive social section on the homepage. And can interact with each one.
    Given test steps are under design


#================================  [Ariat]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios
#Need to be automated if possible

  @proj:ariat @automated
  Scenario:[Ariat] User see see an interactive social section on the homepage. And can interact with each one.
    Given user is on home_page
    When user scroll to the bottom of page
    Then user can see "social_section_widget" on home_page