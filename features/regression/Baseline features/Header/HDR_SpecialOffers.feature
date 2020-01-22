#Projects:
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:ariat
#@proj:blueplanet

Feature: As a customer I want to see "promo code" or "special offer" recommendation information on homepage
  HDR - Promo/offer Info
  BluePlanet - Global Elements - Header - Promo Banner
  Venus: only homepage
  Shoecarnival: carousel
  BluePlanet: User will be presented with a promotional banner carousel with multiple text-only messages.
  Eg. "Get 10% Off Today" Clicking on the banner message will take me to the relevant destination page.
  Ariat - Header - Global Promo

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see promo code information on homepage (promo code is changing time to time)
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can scroll promo code information on homepage
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can scroll promotional banner above the header
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see click on promo code's information on homepage and be taken to expected page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see promo content above the header
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can close promo content clicking on the X
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] After closing promo content should NOT be presented across site experience
    Given test steps are under design


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can see "FS75" promo code information on homepage (promo code is changing time to time)
    Given user is on home_page
    Then user can see "promo_code_text" on home_page



#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can see promo code information on homepage (promo code is changing time to time)
    Given test steps are under design

  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival] User can scroll promo code information on homepage
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can see click on promo code's information on homepage and be taken to expected page
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see promo code information on homepage (promo code is changing time to time)
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see click on promo code's information on homepage and be taken to expected page
    Given test steps are under design

#================================  [BluePlanet]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User will be presented with a promotional banner carousel with multiple text-only messages.
  Eg. "Get 10% Off Today"
    Given test steps are under design

  @proj:blueplanet @manual
  Scenario:[BluePlanet] User can scroll promotional banner above the header
    Given test steps are under design

      @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] Clicking on the banner message will take me to the relevant destination page.
  Eg. "Get 10% Off Today"
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios
#Need to be automated if possible
#goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] User can see promo content above the header
    Given user is on home_page
    Then user can see "promotional_content" on header
#goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] User can close promo content clicking on the X
    Given user is on home_page
    When user can see "promotional_content" on header
    And user click "promotional_close_button" on header
    And user scroll page
    Then user can not see "promotional_content" on header

  @proj:ariat @manual
  Scenario:[Ariat] After closing promo content should NOT be presented across site experience
    Given test steps are under design

