#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet

Feature: As a customer, I can view the product details and description content.
  PDP - Description
    #Venus: "Description" tab

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see tabs of product description on PDP
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can switch between product description tabs and see description information
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see product details content
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can see tabs of product description on PDP
    Given user is on "item_1" product_page
    Then user can see "product_page_content" on product_page

  @proj:revolve @automated
  Scenario:[Revolve] User can switch between product description tabs and see description information
    Given user is on "item_1" product_page
    And user scroll page
    Then user can see "product_page_content" on product_page
    When user click "size_and_fit_tab" on product_page
    Then user can see "size_and_fit_description" on product_page
    When user can see "about_brand_tab" on product_page
    Then user click "about_brand_tab" on product_page
    And user can see "about_brand_description" on product_page

  @proj:revolve @automated
  Scenario:[Revolve] User can see product details content
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "description_tab" on product_page
    Then user can see "product_details_description" on product_page

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can see tabs of product description on PDP
    Given user is on "item_1" product_page
    And user scroll page
    When user can see "product_page_content" on product_page
    And user can see "product_description_btn" on product_page
    And user can see "product_description_info" with value "These little shorts are destined to become favorites." on product_page
    And user can see "product_more_details_btn" on product_page
    And user can see "product_get_social_btn" on product_page
    And user can see "rating_and_reviews_button" on product_page



#    And user click "product_more_details_btn" on product_page
#    And user can see "product_more_details_info" with value "Machine wash warm with like colors" on product_page
#    And user click "product_get_social_btn" on product_page
#    And user can see "product_get_social_info" with value "Share your style with friends:" on product_page

  @proj:venus @automated
  Scenario:[Venus] User can switch between product description tabs and see description information
    Given user is on "item_1" product_page
    And user scroll page
    When user can see "product_page_content" on product_page
    And user can see "product_description_btn" on product_page
    And user can see "product_description_info" with value "These little shorts are destined to become favorites." on product_page
    And user click "product_more_details_btn" on product_page
    Then user can see "product_more_details_info" with value "Machine wash warm with like colors" on product_page
    When user click "product_get_social_btn" on product_page
    Then user can see "product_get_social_info" with value "Share your style with friends:" on product_page
    When user click "rating_and_reviews_button" on product_page
    Then user can see "rating_info" with value "Review Snapshot" on product_page

  @proj:venus @automated
  Scenario:[Venus] User can see product details content
    Given user is on "item_1" product_page
    And user scroll page
    When user can see "product_page_content" on product_page
    And user click "product_more_details_btn" on product_page
    Then user can see "product_more_details_info" with value "Machine wash warm with like colors" on product_page

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can see product details content
       The Ability to see the product details
       The Ability to see a list of product features / attributes
    Given test steps are under design
  @proj:shoecarnival @tobeautomated

  Scenario:[ShoeCarnival][SCP-233] PDP should Adjust to Horizontal View
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see tabs of product description on PDP
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can switch between product description tabs and see description information
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see product details content
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see tabs of product description on PDP
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can switch between product description tabs and see description information
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see product details content
    Given test steps are under design