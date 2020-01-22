#Projects:
#@proj:shoecarnival


Feature: As a customer, I will need to search for the closest store available by clicking on the closest store icon.
  HDR - Closest Store

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User can see the closest store according to SCVL’s custom logic of retrieving the closest store.
    Given test steps are under design




#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival] User can see the closest store according to SCVL’s custom logic of retrieving the closest store.
      The Ability to see the closest store information
      The Ability to change the closest store with link to Change store
    Given user is on home_page
    When user can see "closest_store" on header
    And user click "change_store_link" on header
    Then user fill "closest_store_input" with value "New-York" on closest_store_modal
    When user can see "stores_list_content" on closest_store_modal
    And user remember "1_store_name" on closest_store_modal
    And user click "1_store_name" on closest_store_modal
    Then user can see "closest_store" on header
    And user can see "1_store_name" on header


  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival][SCP-205] Closest store should be the same between PWA & Legacy website.
    Given test steps are under design


      @proj:shoecarnival @manual
  Scenario:[ShoeCarnival][SCP-278] User can search the closest store according to SCVL’s custom logic by clicking search icon
    Given test steps are under design


      @proj:shoecarnival @manual
  Scenario:[ShoeCarnival][SCP-241] Change the store from the ship to store sections update the header and store displayed under. Also after changing the store the radio button is working.
    Given test steps are under design




