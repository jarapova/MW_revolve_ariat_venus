#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I can create, view, sort, and rate product reviews.
  PDP - Product Reviews

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User can see product reviews
    Given test steps are under design
  @proj:baseline
  Scenario:[Baseline] User can create product reviews
    Given test steps are under design
  @proj:baseline
  Scenario:[Baseline] User can sort product reviews
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Product reviews stars rating on PDP is the same as on PLP and cart pages
    Given test steps are under design

    #================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can see product reviews
      Product review section at the very end of the product details page
      ability to add a review and rate a review
      ability to filter the reviews
      ability to flag a review
    Given test steps are under design

  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival] User can create product reviews
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can sort product reviews
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-78] PowerReviews will need to be implemented to utilize product reviews on the PDP.
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see product reviews on PDP
    Given user is on "item_1" product_page
    When user can see "product_page_content" on product_page
    Then user can see "ratings_and_review_content" on product_page


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can see product reviews on PDP
    Given user is on "item_1" product_page
    And user scroll page
    When user can see "product_page_content" on product_page
    And user click "rating_and_reviews_button" on product_page
    Then user can see "product_reviews" on product_page

  @proj:venus @manual
  Scenario:[Venus] Product reviews stars rating on PDP is the same as on PLP and cart pages
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see product reviews
    Given test steps are under design

  @proj:stagestores @manual
  Scenario:[Stagestores] User can create product reviews
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see product reviews
    Given test steps are under design

  @proj:blueplanet @manual
  Scenario:[BluePlanet] User can create product reviews
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @tobeautomated
  Scenario:[Ariat] User can see product reviews
    Given test steps are under design

  @proj:ariat @manual
  Scenario:[Ariat] User can create product reviews
    Given test steps are under design

  @proj:ariat @manual
  Scenario:[Ariat] User can sort product reviews
    Given test steps are under design

  @proj:ariat @manual
  Scenario:[Ariat] Product reviews stars rating on PDP is the same as on PLP and cart pages
    Given test steps are under design