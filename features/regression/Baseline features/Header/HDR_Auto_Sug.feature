#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I can start entering my search query in the input field and see auto-suggest results appear after typing a single character.
  HDR - Search - Autosuggest

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can start entering or editing my search query in the input field and see auto-suggest results appear after typing a single character.
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can start entering or editing my search query in the input field and see auto-suggest results appear after typing a single character.
    Given user is on home_page
    And user click search_icon on header
    And user can see "search_modal_content" on search_modal
    And user fill search_field with value "c" on search_modal
    And user can see "suggested_search_results_content" on search_modal
    When user click "random_suggested_search" on search_modal
    Then user can see "product_list_page_content" on subcategory_page


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:venus @automated
  Scenario:[Venus] User can start entering or editing my search query in the input field and see auto-suggest results appear after typing a single character.
    Given user is on home_page
    And user click search_icon on header
    And user fill search_field with value "B" on search_modal
    And user can see suggested_search on search_modal


#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival] User can start entering or editing my search query in the input field and see auto-suggest results appear after typing a single character.
        The Ability to enter a search query and a dropdown box appears to showcase (if applicable):
        Brand Suggestion
        Suggested Phrases
        Suggested Products
        Product Thumbnails as part of the Suggested Productions (see original mobile site for mocks)
    Given user is on home_page
    When user click "search_icon" on header
    And user fill search_field with value "Coa" on search_modal
    Then user can see "search_modal_content" on search_modal


  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival][SCP-249]Search auto-suggest should return unique categories and items list. No duplicates.
    If you search for the term "sand" on the auto-suggest, it should provide unique list under "categories" without duplicates.
    Given test steps are under design


  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival][SCP-250]Searching when you click on one of the categories in the auto-suggest it should navigate to the expected category PLP.
    The issue was After searching for a term like "sand" in the auto-suggest, when you click on one of the categories, the page will return with a "no results".
    Given test steps are under design


  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival][SCP-217]Search auto-suggest layout checks.
  Remove yellow highlighting
  Remove all underlining
  Improve image quality
    Given test steps are under design

#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can start entering or editing my search query in the input field and see auto-suggest results appear after typing a 4 characters.
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can start entering or editing my search query in the input field and see auto-suggest results appear after typing a single character.
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible
#goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] User can start entering or editing my search query in the input field and see auto-suggest results appear after typing a single character.
    Given user is on home_page
    And user click search_icon on header
    When user fill search_field with value "Coa" on search_modal
    Then user can see "search_results_content" on search_modal