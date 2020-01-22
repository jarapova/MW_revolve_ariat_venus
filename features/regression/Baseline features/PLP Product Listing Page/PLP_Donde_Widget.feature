#Projects:
#@proj:revolve

  Feature: As a customer, I can filter the product listing via a visual widget at the top of the page.

#    Filtering options.
#    "*===================================="
#    Revolve:
#    Color
#    Length
#    Sleeve
#    Neckline
#    Pattern
#    Cut
#    Sleeve-Style


  #================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


    @proj:baseline
    Scenario:[Baseline] User can filter product listing by multiple available options.
      Given test steps are under design

    @proj:baseline
    Scenario:[Baseline] User can filter product listing by color option
      Given test steps are under design

    @proj:baseline
    Scenario:[Baseline] User can filter product listing by length option
      Given test steps are under design

    @proj:baseline
    Scenario:[Baseline] User can filter product listing by sleeve option
      Given test steps are under design

    @proj:baseline
    Scenario:[Baseline] User can filter product listing by neckline option
      Given test steps are under design

    @proj:baseline
    Scenario:[Baseline] User can filter product listing by pattern option
      Given test steps are under design

    @proj:baseline
    Scenario:[Baseline] User can filter product listing by cut option
      Given test steps are under design

    @proj:baseline
    Scenario:[Baseline] User can filter product listing by sleevestyle option
      Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

    @proj:revolve @automated
    Scenario:[Revolve] User can filter product listing by multiple available options.
      Given user is on home_page
      When user click hamburger_menu_icon on header
      And user click "Womens" on hamburger_menu
      And user click "Dresses" on hamburger_menu
      And user click "View All" on hamburger_menu
      Then user can see "plp_with_filter_widget" on subcategory_page
      When user click "1_option" on filter_widget
      And user click "3_option" on filter_widget
      And user click "Length_category" on filter_widget
      And user click "1_option" on filter_widget
      And user click "4_option" on filter_widget
      And user click "Pattern_category" on filter_widget
      And user click "1_option" on filter_widget
      And user click "2_option" on filter_widget
      And user click "3_option" on filter_widget
      Then user can see "plp_with_filter_widget" on subcategory_page


    @proj:revolve @automated
    Scenario:[Revolve] User can filter product listing by color option
      Given user is on home_page
      When user click hamburger_menu_icon on header
      And user click "Womens" on hamburger_menu
      And user click "Dresses" on hamburger_menu
      And user click "View All" on hamburger_menu
      Then user can see "plp_with_filter_widget" on subcategory_page
      And user remember items_count on subcategory_page
      When user click "random_option" on filter_widget
      Then user can see "plp_with_filter_widget" on subcategory_page
      And user can see current_items_count become less or equal on subcategory_page


    @proj:revolve @automated
    Scenario:[Revolve] User can filter product listing by length option
      Given user is on home_page
      When user click hamburger_menu_icon on header
      And user click "Womens" on hamburger_menu
      And user click "Dresses" on hamburger_menu
      And user click "View All" on hamburger_menu
      Then user can see "plp_with_filter_widget" on subcategory_page
      And user remember items_count on subcategory_page
      And user click "Length_category" on filter_widget
      When user click "random_option" on filter_widget
      Then user can see "plp_with_filter_widget" on subcategory_page
      And user can see current_items_count become less or equal on subcategory_page

    @proj:revolve @automated
    Scenario:[Revolve] User can filter product listing by sleeve option
      Given user is on home_page
      When user click hamburger_menu_icon on header
      And user click "Womens" on hamburger_menu
      And user click "Dresses" on hamburger_menu
      And user click "View All" on hamburger_menu
      Then user can see "plp_with_filter_widget" on subcategory_page
      And user remember items_count on subcategory_page
      And user click "Sleeve_category" on filter_widget
      When user click "random_option" on filter_widget
      Then user can see "plp_with_filter_widget" on subcategory_page
      And user can see current_items_count become less or equal on subcategory_page

    @proj:revolve @automated
    Scenario:[Revolve] User can filter product listing by neckline option
      Given user is on home_page
      When user click hamburger_menu_icon on header
      And user click "Womens" on hamburger_menu
      And user click "Dresses" on hamburger_menu
      And user click "View All" on hamburger_menu
      Then user can see "plp_with_filter_widget" on subcategory_page
      And user remember items_count on subcategory_page
      And user click "Neckline_category" on filter_widget
      When user click "random_option" on filter_widget
      Then user can see "plp_with_filter_widget" on subcategory_page
      And user can see current_items_count become less or equal on subcategory_page

    @proj:revolve @automated
    Scenario:[Revolve] User can filter product listing by pattern option
      Given user is on home_page
      When user click hamburger_menu_icon on header
      And user click "Womens" on hamburger_menu
      And user click "Dresses" on hamburger_menu
      And user click "View All" on hamburger_menu
      Then user can see "plp_with_filter_widget" on subcategory_page
      And user remember items_count on subcategory_page
      And user click "Pattern_category" on filter_widget
      When user click "random_option" on filter_widget
      Then user can see "plp_with_filter_widget" on subcategory_page
      And user can see current_items_count become less or equal on subcategory_page

    @proj:revolve @automated
    Scenario:[Revolve] User can filter product listing by cut option
      Given user is on home_page
      When user click hamburger_menu_icon on header
      And user click "Womens" on hamburger_menu
      And user click "Dresses" on hamburger_menu
      And user click "View All" on hamburger_menu
      Then user can see "plp_with_filter_widget" on subcategory_page
      And user remember items_count on subcategory_page
      And user click "Cut_category" on filter_widget
      When user click "random_option" on filter_widget
      Then user can see "plp_with_filter_widget" on subcategory_page
      And user can see current_items_count become less or equal on subcategory_page

    @proj:revolve @automated
    Scenario:[Revolve] User can filter product listing by sleevestyle option
      Given user is on home_page
      When user click hamburger_menu_icon on header
      And user click "Womens" on hamburger_menu
      And user click "Dresses" on hamburger_menu
      And user click "View All" on hamburger_menu
      Then user can see "plp_with_filter_widget" on subcategory_page
      And user remember items_count on subcategory_page
      And user click "Sleeve-Style_category" on filter_widget
      When user click "random_option" on filter_widget
      Then user can see "plp_with_filter_widget" on subcategory_page
      And user can see current_items_count become less or equal on subcategory_page

    @proj:revolve @automated
    Scenario:[Revolve][REV-495] Donde widget is working after user goes back to PLP
      Given user is on home_page
      When user click hamburger_menu_icon on header
      And user click "Womens" on hamburger_menu
      And user click "Shoes" on hamburger_menu
      And user click "View All" on hamburger_menu
      Then user can see "plp_with_filter_widget" on subcategory_page
      And user click "Type_category" on filter_widget
      And user click "random_option" on filter_widget
      When user click "random_item_name" on subcategory_page
      And user scroll page
      And user go back
      Then user can see "plp_with_filter_widget" on subcategory_page
      When user remember items_count on subcategory_page
      And user click "Color_category" on filter_widget
      And user click "random_option" on filter_widget
      Then user can see "plp_with_filter_widget" on subcategory_page
      And user can see current_items_count become less or equal on subcategory_page
