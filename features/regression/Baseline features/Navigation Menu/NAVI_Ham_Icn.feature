#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:ariat
#@proj:blueplanet

Feature: As a customer, I can click on the hamburger menu to open up the mobile navigation.
  Navigation - Hamburger Menu

  for Blueplanet proj user should see next links:
  - Find A store
  - Contact us
  - Student Discounts


#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can open hamburger menu by tapping appropriate CTA on header
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see all corresponding menu items in hamburger menu
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can close hamburger menu
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can navigate to product list page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can open hamburger menu on Perfect proxy pages should work
    Given test steps are under design


#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User can open hamburger menu by tapping appropriate CTA on header
    Given user is on home_page
    Then user click hamburger_menu_icon on header

  @proj:revolve @manual
  Scenario:[Revolve] [REV-345] User can open hamburger menu by tapping appropriate CTA on header and its taking no long time to load
    Given test steps are under design

  @proj:revolve @automated
  Scenario:[Revolve] Guest User can see all corresponding menu items in hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_guest_first_page_content" on hamburger_menu

  @proj:revolve @automated
  Scenario:[Revolve] Logged in user can see all corresponding menu items in hamburger menu including "My Revolve" category
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    When user can see "sign_in_page_content" on sign_in_page
    Then user make login as "rev_test_user"
    When user click hamburger_menu_icon on header
    And user can see "hamburger_logged_in_first_page_content" on hamburger_menu

  @proj:revolve @automated
  Scenario:[Revolve] User can close hamburger menu
    Given user is on home_page
    And user click hamburger_menu_icon on header
    When user click hamburger_menu_icon on header
    Then user can see "home_page_content" on home_page

  @proj:revolve @automated
  Scenario:[Revolve] User can navigate to product list page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_first_page_content" on hamburger_menu
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    Then user can see "product_list_page_content" on subcategory_page
    And user can see "main_text" with value "All New Items" on subcategory_page

  @proj:revolve @automated
  Scenario:[Revolve][REV-394] Each subcategory in 'Customer Care' hamburger category leads to correct page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    Then user click "Customer Care" on hamburger_menu
    When user click "Contact Us" on hamburger_menu
    Then user can see "contact_us_page_content" on customer_care_page
    And user click logo_button on header

    When user click hamburger_menu_icon on header
    Then user click "Customer Care" on hamburger_menu
    When user click "Payment" on hamburger_menu
    Then user can see "payment_page_content" on customer_care_page
    And user click logo_button on header

    When user click hamburger_menu_icon on header
    Then user click "Customer Care" on hamburger_menu
    When user click "Your Orders" on hamburger_menu
    Then user can see "your_orders_page_content" on customer_care_page
    And user click logo_button on header

    When user click hamburger_menu_icon on header
    Then user click "Customer Care" on hamburger_menu
    When user click "Shipping & Delivery" on hamburger_menu
    Then user can see "shipping_delivery_content" on shipping_and_delivery_page
    And user click logo_button on header

    When user click hamburger_menu_icon on header
    Then user click "Customer Care" on hamburger_menu
    When user click "Returns & Exchanges" on hamburger_menu
    Then user can see "returns_content" on returns_content_page
    And user click logo_button on header

    When user click hamburger_menu_icon on header
    Then user click "Customer Care" on hamburger_menu
    When user click "Size Guide" on hamburger_menu
    Then user can see "size_guide_page_content" on customer_care_page
    And user click logo_button on header

    When user click hamburger_menu_icon on header
    Then user click "Customer Care" on hamburger_menu
    When user click "Gifting Revolve" on hamburger_menu
    Then user can see "gifting_revolve_page_content" on customer_care_page
    And user click logo_button on header

    When user click hamburger_menu_icon on header
    Then user click "Customer Care" on hamburger_menu
    When user click "Why Revolve" on hamburger_menu
    Then user can see "why_revolve_page_content" on customer_care_page
    And user click logo_button on header

    When user click hamburger_menu_icon on header
    Then user click "Customer Care" on hamburger_menu
    When user click "Feedback" on hamburger_menu
    Then user can see "feedback_page_content" on customer_care_page
    And user click logo_button on header

    When user click hamburger_menu_icon on header
    Then user click "Customer Care" on hamburger_menu
    When user click "Privacy Policy" on hamburger_menu
    Then user can see "privacy_policy_page_content" on customer_care_page
    And user click logo_button on header

    When user click hamburger_menu_icon on header
    Then user click "Customer Care" on hamburger_menu
    When user click "Terms Of Use" on hamburger_menu
    Then user can see "terms_of_use_page_content" on customer_care_page
    And user click logo_button on header

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can open hamburger menu by tapping appropriate CTA on header
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_first_page_content" on hamburger_menu

  @proj:venus @automated
  Scenario:[Venus] User can see all corresponding menu items in hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_first_page_content" on hamburger_menu
    And user click "shop_by_categories_on_first_page" on hamburger_menu
    And user click "back_category" on hamburger_menu
    And user click "shop_by_categories_on_first_page" on hamburger_menu
    And user can see "hamburger_category_page_content" on hamburger_menu
    And user click "open_app_cats" on hamburger_menu
    And user can see "hamburger_subcategory_page_content" on hamburger_menu
    And user click "dresses_subcat" on hamburger_menu
    Then user can see "dress_items_content" on subcategory_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_subcategory_page_content" on hamburger_menu

  @proj:venus @automated
  Scenario:[Venus] User can close hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_first_page_content" on hamburger_menu
    Then user click hamburger_menu_icon on header
    And user can see "hamburger_menu_closed" on hamburger_menu
    And user can see "home_page_content" on home_page

  @proj:venus @automated
  Scenario:[Venus] User can navigate to product list page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_first_page_content" on hamburger_menu
    And user click "shop_by_categories_on_first_page" on hamburger_menu
    And user can see "hamburger_category_page_content" on hamburger_menu
    And user click "clothing_category" on hamburger_menu
    And user can see "hamburger_subcategory_page_content" on hamburger_menu
    And user click "dresses_subcat" on hamburger_menu
    And user scroll page
    Then user can see "product_list_page_content" on subcategory_page

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can open hamburger menu by tapping appropriate CTA on header
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] [SCP-19] User can see all corresponding menu items in hamburger menu
      Bug was reported:
      After user clicks on "Brands" or "Back to school shop" buttons or "Account" icon, user directs to appropriate page
      but Hamburge menu icon doesn't work on that page.
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can close hamburger menu
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can navigate to product list page
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-139] User can open hamburger menu on Perfect proxy pages should work
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can open hamburger menu by tapping appropriate CTA on header
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see all corresponding menu items in hamburger menu
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can close hamburger menu
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can navigate to product list page
    Given test steps are under design

    #================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

#good
  @proj:ariat @automated1
  Scenario:[Ariat] User can open hamburger menu by tapping appropriate CTA on header
    Given user is on home_page
    And user scroll page
    When user click hamburger_menu_icon on header
    Then user can see "hamburger_first_page_content" on hamburger_menu
#goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] User can see all corresponding menu items in hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Women" on hamburger_menu
    Then user can see "hamburger_menu_content" on hamburger_menu
#goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] User can close hamburger menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click hamburger_menu_icon on header
    Then user can see "home_page_content" on home_page
#goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] User can navigate to product list page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Women" on hamburger_menu
    And user click "Clothing" on hamburger_menu
    And user click "Denim" on hamburger_menu
    And user click "View all" on hamburger_menu
    Then user can see "product_list_page_content" on subcategory_page
#nogood
  @proj:ariat @automated
  Scenario:[Ariat] User can open hamburger menu on Perfect proxy pages should work
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Find a retailer" on hamburger_menu
    And user click hamburger_menu_icon on header
    And user can see "legacy_hamburger_menu_content" on hamburger_menu