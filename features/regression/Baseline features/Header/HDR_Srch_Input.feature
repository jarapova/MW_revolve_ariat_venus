#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, I can submit a search query in the input field and be taken to a search results page.
  HDR - Search - Submit

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User navigating to PLP search result page after submitting search query
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Suggested results on search modal redirect to product list page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see "No results" search results page if searching some crazy term like
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] After user clear the search field with "x", device keyboard shouldn't hide
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can search items up to 10 times by typing product SKU in search query
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] New invalid search should update page "No Results" page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Suggested items results on search modal redirect to product page
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated
  Scenario:[Revolve] User navigating to PLP search result page after submitting search query
    Given user is on home_page
    And user click search_icon on header
    And user can see "search_modal_content" on search_modal
    When user fill search_field with value "Coats" on search_modal
    And user can see "suggested_search_results_content" on search_modal
    Then user click search_button on search_modal
    And user can see "product_list_page_content" on subcategory_page
    And user can see "main_text" with value "RESULTS FOR: Coats" on subcategory_page

  @proj:revolve @automated
  Scenario:[Revolve] Suggested results on search modal redirect to product list page
    Given user is on home_page
    And user click search_icon on header
    And user can see "search_modal_content" on search_modal
    And user fill search_field with value "Coats" on search_modal
    And user can see "suggested_search_results_content" on search_modal
    When user click "random_suggested_search" on search_modal
    Then user can see "product_list_page_content" on subcategory_page

  @proj:revolve @automated
  Scenario:[Revolve] User can see "No results" search results page if searching some crazy term
    Given user is on home_page
    And user click search_icon on header
    And user can see "search_modal_content" on search_modal
    And user fill search_field with value "erjbfhwebvhwebv" on search_modal
    When user click search_button on search_modal
    Then user can see "empty_search_result_page" on subcategory_page

  @proj:revolve @automated
  Scenario:[Revolve] User can search items up to 10 times by typing product SKU in search query
    Given user is on home_page
    And user click search_icon on header
    And user can see "search_modal_content" on search_modal
    When user fill search_field with value "Coats" on search_modal
    Then user click search_button on search_modal
    And user can see "product_list_page_content" on subcategory_page
    And user click search_icon on header
    When user fill search_field with value "Jackets" on search_modal
    Then user click search_button on search_modal
    And user click search_icon on header
    When user fill search_field with value "Pants" on search_modal
    Then user click search_button on search_modal
    And user click search_icon on header
    When user fill search_field with value "Shoe" on search_modal
    Then user click search_button on search_modal
    And user click search_icon on header
    When user fill search_field with value "Beauty" on search_modal
    Then user click search_button on search_modal
    And user click search_icon on header
    When user fill search_field with value "Swim" on search_modal
    Then user click search_button on search_modal
    And user click search_icon on header
    When user fill search_field with value "Bags" on search_modal
    Then user click search_button on search_modal
    And user click search_icon on header
    When user fill search_field with value "Dresses" on search_modal
    Then user click search_button on search_modal
    And user click search_icon on header
    When user fill search_field with value "Jewelry" on search_modal
    Then user click search_button on search_modal
    And user click search_icon on header
    When user fill search_field with value "Accessories" on search_modal
    Then user click search_button on search_modal
    And user can see "product_list_page_content" on subcategory_page
    When user click logo_button on header
    Then user can see "home_page_content" on home_page
    And user click search_icon on header
    And user close search_modal
    And user click hamburger_menu_icon on header

  @proj:revolve @manual
  Scenario:[Revolve] After user clear the search field with "x", device keyboard shouldn't hide
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve][REV-452] After user make a search from Revolve man, he should see PLP with men's results
    Given test steps are under design

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:venus @automated
  Scenario:[Venus] User navigating to PLP search result page after submitting search query
    Given user is on home_page
    And user click search_icon on header
    And user fill search_field with value "Bras" on search_modal
    And user click search_button on search_modal
    Then user can see "search_results_content" on search_results_page

  @proj:venus @automated
  Scenario:[Venus] User can see "No results" search results page if searching some crazy term
    Given user is on home_page
    And user click search_icon on header
    And user fill search_field with value "DSFV W KBLE RBKE . TB ERTK GER E RT" on search_modal
    And user click search_button on search_modal
    Then user can see "empty_search_page_content" on search_results_page

  @proj:venus @automated
  Scenario:[Venus] Suggested results on search modal redirect to product list page
    Given user is on home_page
    When user click search_icon on header
    And user fill search_field with value "Coats" on search_modal
    And user can see suggested_search on search_modal
    And user click "random_suggested_search" on search_modal
    Then user can see "search_results_content" on search_results_page

  @proj:venus @automated
  Scenario:[Venus] User can search items up to 10 times by typing product SKU in search query
    Given user is on home_page
    And user click search_icon on header
    And user fill search_field with value "Bras" on search_modal
    And user click search_button on search_modal
    Then user can see "search_results_content" on search_results_page
    And user click search_icon on header
    And user fill search_field with value "Coats" on search_modal
    And user click search_button on search_modal
    Then user can see "search_results_content" on search_results_page
    And user click search_icon on header
    And user fill search_field with value "wrgbwgrb" on search_modal
    And user click search_button on search_modal
    Then user can see "search_results_content" on search_results_page
    And user click search_icon on header
    And user fill search_field with value "bbcvcvb" on search_modal
    And user click search_button on search_modal
    Then user can see "search_results_content" on search_results_page
    And user click search_icon on header
    And user fill search_field with value "tewyoewrky" on search_modal
    And user click search_button on search_modal
    Then user can see "search_results_content" on search_results_page
    And user click search_icon on header
    And user fill search_field with value "plplj" on search_modal
    And user click search_button on search_modal
    Then user can see "search_results_content" on search_results_page
    And user click search_icon on header
    And user fill search_field with value "plrknn" on search_modal
    And user click search_button on search_modal
    Then user can see "search_results_content" on search_results_page
    And user click search_icon on header
    And user fill search_field with value "werlblblfs" on search_modal
    And user click search_button on search_modal
    Then user can see "search_results_content" on search_results_page
    And user click search_icon on header
    And user fill search_field with value "awewascxz" on search_modal
    And user click search_button on search_modal
    Then user can see "search_results_content" on search_results_page
    And user click search_icon on header
    And user fill search_field with value "uiuopkm" on search_modal
    And user click search_button on search_modal
    Then user can see "search_results_content" on search_results_page
    And user click search_icon on header
    And user fill search_field with value "nmnklno" on search_modal
    And user click search_button on search_modal
    Then user can see "search_results_content" on search_results_page
    When user click logo_button on header
    Then user can see "home_page_content" on home_page
    And user click search_icon on header
    And user close search_modal
    And user click hamburger_menu_icon on header



#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible



  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival] User navigating to PLP search result page after submitting search query
    Given user is on home_page
    And user scroll page
    When user click search_icon on header
    And user fill search_field with value "Shoes" on search_modal
    And user click search_button on search_modal
    Then user can see "product_list_page_content" on subcategory_page


  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival] User can see "No results" search results page if searching some crazy term
    Given user is on home_page
    And user scroll page
    And user click search_icon on header
    When user fill search_field with value "elkwrgnjwnjnnjtn" on search_modal
    And user click search_button on search_modal
    Then user can see "empty_search_result_page" on subcategory_page


  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival][SCP-177] "Refine Search" links on "Search No Results" page appears in black color.
    Given test steps are under design

  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival] Suggested results on search modal redirect to product list page
    Given user is on home_page
    And user scroll page
    When user click search_icon on header
    And user fill search_field with value "Beauty" on search_modal
    And user click "random_suggested_category" on search_modal
    Then user can see "product_list_page_content" on subcategory_page

  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival] Suggested items results on search modal redirect to product page
    Given user is on home_page
    And user scroll page
    When user click search_icon on header
    And user fill search_field with value "Shoes" on search_modal
    And user click "random_suggested_item" on search_modal
    Then user can see "product_page_content" on subcategory_page

  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival][SCP-160] New invalid search should update page "No Results" page
    Given test steps are under design

#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User navigating to PLP search result page after submitting search query
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] Suggested results on search modal redirect to product list page
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see "No results" search results page if searching some crazy term like "#$%"
    Given test steps are under design

  @proj:stagestores @manual
  Scenario:[Stagestores] After user clear the search field with "x", device keyboard shouldn't hide
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can search items up to 10 times by typing product SKU in search query
    Given test steps are under design

#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User navigating to PLP search result page after submitting search query
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] Suggested results on search modal redirect to product list page
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see "No results" search results page if searching some crazy term like
    Given test steps are under design

  @proj:blueplanet @manual
  Scenario:[BluePlanet] After user clear the search field with "x", device keyboard shouldn't hide
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can search items up to 10 times by typing product SKU in search query
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible
#good
  @proj:ariat @automated1
  Scenario:[Ariat] User navigating to PLP search result page after submitting search query
    Given user is on home_page
    And user click search_icon on header
    When user fill search_field with value "Coats" on search_modal
    Then user click "search_button" on search_modal
    And user can see "product_list_page_content" on subcategory_page
#good
  @proj:ariat @automated1
  Scenario:[Ariat] User can see "No results" search results page if searching some crazy term
    Given user is on home_page
    And user click search_icon on header
    When user fill search_field with value "hggvgkhgkjhg" on search_modal
    Then user click "search_button" on search_modal
    And user can see "empty_search_result_content" on subcategory_page

  @proj:ariat @manual
  Scenario:[Ariat] After user clear the search field with "x", device keyboard shouldn't hide
    Given test steps are under design
#goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] User can search items up to 10 times by typing product SKU in search query
    Given user is on home_page
    And user click search_icon on header
    When user fill search_field with value "100" on search_modal
    And user click "random_suggested_search" on search_modal
    Then user can see "product_page_content" on product_page

    And user click search_icon on header
    When user fill search_field with value "101" on search_modal
    And user click "random_suggested_search" on search_modal
    Then user can see "product_page_content" on product_page

    And user click search_icon on header
    When user fill search_field with value "102" on search_modal
    And user click "random_suggested_search" on search_modal
    Then user can see "product_page_content" on product_page

    And user click search_icon on header
    When user fill search_field with value "103" on search_modal
    And user click "random_suggested_search" on search_modal
    Then user can see "product_page_content" on product_page

    And user click search_icon on header
    When user fill search_field with value "104" on search_modal
    And user click "random_suggested_search" on search_modal
    Then user can see "product_page_content" on product_page

    And user click search_icon on header
    When user fill search_field with value "105" on search_modal
    And user click "random_suggested_search" on search_modal
    Then user can see "product_page_content" on product_page

    And user click search_icon on header
    When user fill search_field with value "106" on search_modal
    And user click "random_suggested_search" on search_modal
    Then user can see "product_page_content" on product_page

    And user click search_icon on header
    When user fill search_field with value "107" on search_modal
    And user click "random_suggested_search" on search_modal
    Then user can see "product_page_content" on product_page

    And user click search_icon on header
    When user fill search_field with value "108" on search_modal
    And user click "random_suggested_search" on search_modal
    Then user can see "product_page_content" on product_page

    And user click search_icon on header
    When user fill search_field with value "109" on search_modal
    And user click "random_suggested_search" on search_modal
    Then user can see "product_page_content" on product_page

    And user click search_icon on header
    When user fill search_field with value "110" on search_modal
    And user click "random_suggested_search" on search_modal
    Then user can see "product_page_content" on product_page

    And user click logo_button on header
    And user can see "home_page_content" on home_page
    And user click hamburger_menu_icon on header
#goodNoTA
  @proj:ariat @automated
  Scenario:[Ariat] Suggested items results on search modal redirect to product page
    Given user is on home_page
    And user click search_icon on header
    When user fill search_field with value "Coa" on search_modal
    And user click "random_suggested_search" on search_modal
    Then user can see "product_page_content" on product_page