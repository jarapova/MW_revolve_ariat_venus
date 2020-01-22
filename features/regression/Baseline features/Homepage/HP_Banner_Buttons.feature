#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I should be directed onto the correct page(s) after clicking on "CTA button(s)" or/and "Banner(s)" on the home page.
  HP - Banner CTAs
  Homepage - Hero Banners
  Homepage - Promo Banners
  Homepage - Additional Banner Links

  Ariat - As a customer, I should see one or more additional images on the home screen that I can click on and be directed to the right page.
  Ariat - As a customer, I should see one or more promos images on the home screen that I can click on and be directed to the right page.


#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can click each CTA button on home page and be navigated to appropriate page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can click each Banners on home page and be navigated to appropriate page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see hero images and can swipe carousel
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can navigate to appropriate page by clicking hero image
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can swipe hero image carousel, and the page is not scrolling while swiping hero images
    Given test steps are under design


#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:revolve @automated
  Scenario:[Revolve] User can click each CTA button on home page and be navigated to appropriate page
    Given user is on home_page
    And user can see "home_page_content" on home_page
    When user click "view_hot_list_button" on home_page
    Then user can see "hot_list_content" on hot_list_page

  @proj:revolve @automated
  Scenario:[Revolve] User can click each Banners on home page and be navigated to appropriate page
    Given user is on home_page
    When user can see "home_page_content" on home_page
    Then user can see "banners_categories_content" on home_page

  @proj:revolve @automated
  Scenario:[Revolve] User can see hero images and can swipe carousel
    Given user is on home_page
    When user can see "home_page_content" on home_page
    Then user can see "banners_content" on home_page

  @proj:revolve @automated
  Scenario:[Revolve] User can navigate to appropriate page by clicking hero image
    Given user is on home_page
    When user can see "home_page_content" on home_page
    And user click "1_slide_banner" on home_page
    Then user can see "min_product_list_page_content" on subcategory_page

  @proj:revolve @manual
  Scenario:[Revolve] User can swipe hero image carousel, and the page is not scrolling while swiping hero images
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] [REV-82] User see a promotional banner with a textual message. Eg. "Get 10% Off Today"
    Given user is on home_page
    And user can see "promotional_banner" on home_page

  @proj:revolve @manual
  Scenario:[Revolve] [REV-383] 'Promo banner' shouldn't be presented for loged-in users, as per prod version.
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] [REV-360] User see "Brand Restrictions" modal window in promotional banner use case
    Given Go to homepage
    When Tap "Promotion Banner"
    And Sign Up
    And Click on "Other exclusions may apply"
    Then user see  "Brand Restrictions" modal window


  @proj:revolve @manual
  Scenario:[Revolve][REV-431] User should see different hero images for Men/Woman homepage
    Given user is on home_page
    When Open hamburger menu
    Then Go to "Mens - New Arrivals - All new items"
    And Click on logo
    And user can see mens hero images on mens home page

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:venus @manual
  Scenario:[Venus] User can click each CTA button on home page and be navigated to appropriate page
    Given test steps are under design


  @proj:venus @manual
  Scenario:[Venus] User can click each Banners on home page and be navigated to appropriate page
    Given test steps are under design

  @proj:venus @automated
  Scenario:[Venus] User can see hero images and CTAs on home page
    Given user is on home_page
    Then user can see "home_page_content" on home_page
    And user can see "all_shop_now_buttons_content" on home_page

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival][SCP-35]User can see hero images on homepage
      Success Criteria:
      Should be able to see the following hero images:
      Main Hero Banner
      Should be redirected to the correct page based on existing mobile operation
    Given user is on home_page
    When user can see "home_page_content" on home_page
    And user remember page_url on page
    And user click "banner_1" on home_page
    Then user can see "product_list_page_content" on subcategory_page
    And user can see "page_url" on page

  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival][SCP-18] User can see Perks Promotion Banner. It's different for Logged in, Logged in Gold user, and guest user
      Guest
      Earn rewards for shopping. Join Shoe Perks!
      FREE In-store pickup + FREE In-Store Returns
      FREE Standard Shipping over $75

      Logged in User
      Current Point Balance:
      FREE Standard Shipping over $75
      Earn your way to GOLD! Learn more

      Logged in Gold user
      Gold member Since dd.mm.yyyy
      You have FREE Standard Shipping
      Points Balance:   Rewards available:
    Given user is on home_page
    When user scroll page
    Then user can see "guest_promotional_banner" on header

  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival][SCP-175] My Offers third party banner on homepage and PDP should be removed
    Given test steps are under design

  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival] User can navigate to appropriate page by clicking hero image
    Given user is on home_page
    When user can see "home_page_content" on home_page
    And user remember page_url on page
    And user click "banner_1" on home_page
    Then user can see "product_list_page_content" on subcategory_page
    And user can see "page_url" on page

  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival] User should appear on correct pages after click "CTA buttons" or/and "Banners"
        Correct banners in the right place
        The Ability to click on the banner and be redirected to the PLP categories
    Given test steps are under design

  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival][SCP-238] User can't see chat icon on the homepage
    Given test steps are under design

#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can click each CTA button on home page and be navigated to appropriate page
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can click each Banners on home page and be navigated to appropriate page
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can navigate to appropriate page by clicking hero image
    Given test steps are under design


#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can click each CTA button on home page and be navigated to appropriate page
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can click each Banners on home page and be navigated to appropriate page
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can navigate to appropriate page by clicking hero image
    Given test steps are under design



#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @manual
  Scenario:[Ariat] Ariat Denim additional image should be present on homepage. User directed to the right page after clicking.
    Given test steps are under design

  @proj:ariat @tobeautomated
  Scenario:[Ariat] User can click each CTA button on home page and be navigated to appropriate page
    cta buttons are not clickable
    Given user is on home_page
    When user can see "home_page_content" on home_page
    Then user can see "each_cta_content" on home_page

  @proj:ariat @manual
  Scenario:[Ariat] User can click each Banners on home page and be navigated to appropriate page
    Given user is on home_page
    When user can see "home_page_content" on home_page
    And user can see "banners_content" on home_page

  @proj:ariat @automated
  Scenario:[Ariat] User can see hero images and can swipe carousel
    Given user is on home_page
    Then user can see "home_page_content" on home_page

  @proj:ariat @manual
  Scenario:[Ariat] User can navigate to appropriate page by clicking hero image
    Given test steps are under design

  @proj:ariat @manual
  Scenario:[Ariat] User can swipe hero image carousel, and the page is not scrolling while swiping hero images
    Given test steps are under design

  @proj:ariat @manual
  Scenario:[Ariat] User can see one or more promos images on the home screen and be navigated to the right page after clicking
    Given test steps are under design


