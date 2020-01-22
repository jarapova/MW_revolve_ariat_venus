#Projects:
#@proj:revolve
#@proj:venus
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat


Feature: As a customer, when I've scrolled down the page I should see a "back to top" button in the bottom right which I can tap to take me back to the top of the screen.
  Global - Scroll Back To Top
  Ariat: As a customer, I will need to click on a button to immediately go back to the top of the page.
venus: only PLP
stagestore: only PLP


#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User tap "Back to top" button to be scrolled up to the top of the page
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User tap "Back to top" button to be scrolled up to the top of the page
    Given user is on home_page
    And user can see "no_back_to_top_button" on page
    When user scroll to the bottom of page
    Then user can see "back_to_top_button" on page
    When user click arrow_button on page
    Then user can see "no_back_to_top_button" on page

  @proj:revolve @manual
  Scenario:[Revolve][REV-356] User can scroll page without any errors
    Given user is on home_page
    And user scroll through the page several times
    And user can't see any errors
    Given user is on pdp_page
    And user scroll through the page several times
    And user can't see any errors
    Given user is on product_list_page
    And user scroll through the page several times
    And user can't see any errors
    Given user is on cart_page
    And user scroll through the page several times
    And user can't see any errors

  @proj:revolve @manual
  Scenario:[Revolve][REV-294] "Back to top" button shouldn't be invisible and clickable on every pages
    Given user is on home_page
    When scroll down the page
    Then tap on place where "Back to top" button supposed to be
    And observe scrolling-up page

  @proj:revolve @manual
  Scenario:[Revolve][REV-528] User can scroll page after using 'Back' button
    Given user is on pdp_page
    When user click "<string>" on category_panel
    And user click browser back button
    Then  user can scroll page

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @manual
  Scenario:[Venus] User tap "Back to top" button on PLP to be scrolled up to the top of the page
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User tap "Back to top" button on PLP to be scrolled up to the top of the page
    Given test steps are under design


#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User tap "Back to top" button on PLP to be scrolled up to the top of the page
    Given test steps are under design


  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] [SCP-118]  Back To Top button should be above footer and should be visually easy detected
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User tap "Back to top" button to be scrolled up to the top of the page
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible
#goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] User tap "Back to top" button to be scrolled up to the top of the page
    Given user is on home_page
    When user scroll to the bottom of page
    Then user can see "back_to_top_button" on page
    And user click "back_to_top_button" on page
    When user is on "item_1" product_page
    And user scroll to the bottom of page
    Then user can see "back_to_top_button" on page
    And user click "back_to_top_button" on page