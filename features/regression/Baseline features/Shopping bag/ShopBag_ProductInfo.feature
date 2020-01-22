#Projects:
#@proj:revolve
#@proj:venus
#@proj:stagestores

Feature: As a customer, I should be able to see a list of products with:
  Shopping Cart - Product Info
  Shopping Cart - Legacy Functionality
Revolve:
  Image
  Badge
  Name
  Brand
  Style
  Color
  Price or both: Regular price and Price with sale for item
  Notification (eg. Only 1 left!)
  Size (Size menu shouldn't display for "One Size" items. Size description should be "Size:one size")
  Quantity
  "Remove" link
  "Move to Favorites" link
Venus:
  Image
  Name
  ProductSku
  Style
  Color
  Price
  Size
  Quantity
  "Remove" link
BluePlanet:
  As a customer, I should be able to view the shopping cart with perfect proxy.
  As a customer, all legacy functionality for the shopping cart should be working accordingly.

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can see list of added to cart products with corresponding information
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Images for products larger than 1X are different
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @automated @flaky
  Scenario:[Revolve] User can see list of added to cart products with corresponding information
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Dresses" on hamburger_menu
    Then user click "Gowns" on hamburger_menu
    And user scroll page
    When user click "random_item_name" on subcategory_page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    And user click "close_view_bag_modal_button" on product_page
    Then user go back
    And user scroll page
    When user click "random_item_name" on subcategory_page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    And user click view_bag_button on add_to_bag_popup
    Then user can see "guest_cart_page_content" on cart_page

  @proj:revolve @manual
  Scenario:[Revolve][REV-318] Item with Final Sale Defect should have a corresponding message on Shopping Bag
    Given user is on "item_with_sale_defect" product_page
    When user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    And user click view_bag_button on add_to_bag_popup
    Then user can see "final_sale_defect_message" on product_page

  @proj:revolve @automated @flaky
  Scenario:[Revolve][REV-334][REV-255] User can see correct qty in PWA Shopping bag for item added from favorites
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "sign_in_button" on hamburger_menu
    When user can see "sign_in_page_content" on sign_in_page
    Then user make login as "rev_test_user"
    And user click cart_icon on header
    And user clear cart_page
    And user click "favorites_button" on header
    And user clear wish_list_page
    And user is on home_page
    When user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Womens" on hamburger_menu
    And user click "Shoes" on hamburger_menu
    Then user click "View All" on hamburger_menu
    When user can see "plp_with_filter_widget" on subcategory_page
    And user click "random_item_favorites_button" on subcategory_page
    And user click "favorites_button" on header
    Then user click "item_1_add_to_bag_button" on wish_list_page
    And user click "available_size" on wish_list_page
    And user update page
    And user click logo_button on header
    And user click cart_icon on header
    When user can see "logged_in_cart_page_content" on cart_page
    Then user can see "1_item_qty" with value "1" on cart_page

  @proj:revolve @manual
  Scenario:[Revolve][REV-316] User can see low inventory message for special item in cart page (Same as on PDP)
    Find item with low inventory. It can be found on final sale category
    Given user is on pdp_page with low inventory item
    When user user select size with low inventory
    And user can see low inventory message on pdp
    Then click on add to bag
    Then user click on "View bag/checkout"
    And user can see low inventory message on for added item in cart page

  @proj:revolve @automated @flaky
  Scenario:[Revolve][REV-319] Item with Wedding warning should have a corresponding message on Shopping Bag
    Given user is on home_page
    When user click "categories_tab" on header
    Then user can see "dropdown_menu_content" on header
    When user click "Wedding Shop" on dropdown_menu
    And user scroll page
    Then user click "random_not_pwa_item_name" on subcategory_page
    When user can see "product_page_content" on product_page
    And user click "available_size_button" on product_page
    Then user click add_to_bag_button on product_page
    When user click view_bag_button on add_to_bag_popup
    And user scroll page
    Then user can see "wedding_warning_message" on cart_page

  @proj:revolve @automated @flaky
  Scenario:[Revolve][REV-320] Beauty Item should have a corresponding message on Shopping Bag
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Beauty" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    Then user can see "product_list_page_content" on subcategory_page
    And user click "random_item_name" on subcategory_page
    Then user click add_to_bag_button on product_page
    When user click view_bag_button on add_to_bag_popup
    And user scroll page
    Then user can see "beauty_warning_message" on cart_page

  @proj:revolve @automated @flaky
  Scenario:[Revolve][REV-259] User can see both Sale and Regular price for sale items on Shopping Bag
    Given user is on home_page
    When user click "sale_tab" on header
    Then user can see "product_list_page_content" on subcategory_page
    When user click "random_item_name" on subcategory_page
    And user can see "product_page_content" on product_page
    And user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    Then user click view_bag_button on add_to_bag_popup
    When user can see "guest_cart_page_content" on cart_page
    Then user can see "item_1_regular_price" on cart_page

  @proj:revolve @manual
  Scenario:[Revolve][REV-317] Warnings in the shopping bag should displays with space (without underscores)
    Given test steps are under design

  @proj:revolve @automated
  Scenario:[Revolve][REV-321] User adds e/Gift certificates and can see correct displaying of them on ShoppingBag page
    Color, size and qty should be hidden, "To..." for eCert and gift message if added for cert should be presented
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Gift Revolve" on hamburger_menu

    When user set "gift_price" with value "200" on category_page
    And user set "gift_delivery_method" with value "Email" on category_page
    And user fill "gift_email_fields" on category_page
    And user fill "gift_message" on category_page
    Then user click "gift_add_to_bag_button" on category_page
    When user click cart_icon on header
    Then user can see "e_certificate_with_message" on cart_page
    And user click "item_1_remove_button" on cart_page
    And user click logo_button on header
    And user click hamburger_menu_icon on header
    And user click "Gift Revolve" on hamburger_menu

    When user set "gift_delivery_method" with value "Email" on category_page
    And user fill "gift_email_fields" on category_page
    Then user click "gift_add_to_bag_button" on category_page
    When user click cart_icon on header
    Then user can see "e_certificate_with_no_message" on cart_page
    And user click "item_1_remove_button" on cart_page
    And user click logo_button on header
    And user click hamburger_menu_icon on header
    And user click "Gift Revolve" on hamburger_menu

    When user set "gift_delivery_method" with value "Standard Delivery" on category_page
    And user fill "gift_message" on category_page
    Then user click "gift_add_to_bag_button" on category_page
    When user click cart_icon on header
    Then user can see "standard_certificate_with_message" on cart_page
    And user click "item_1_remove_button" on cart_page
    And user click logo_button on header
    And user click hamburger_menu_icon on header
    And user click "Gift Revolve" on hamburger_menu

    When user set "gift_delivery_method" with value "Standard Delivery" on category_page
    Then user click "gift_add_to_bag_button" on category_page
    When user click cart_icon on header
    Then user can see "standard_certificate_with_no_message" on cart_page

  @proj:revolve @manual
  Scenario:[Revolve][REV-435] Back button is should work properly for Shopping Bag
    Given user is on home_page
    When user adds an item to bag
    Then go to shopping bag page
    And click on a product in the shopping bag page
    Then hit the browser "back" button
    And user can see "cart_page_content" on the cart_page

  @proj:revolve @manual
  Scenario:[Revolve][REV-460] User can click on image of item in the shopping bag, and be redirected to PDP extremely fast
    Given test steps are under design


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can see list of added to cart products with corresponding information
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user remember "test_item_1" product parameters on product_page
    And user click add_to_bag_button on product_page
    Then user click cart_icon on header
    And user can see "cart_page_content" on cart_page
    And user can see "test_item_1_hash" on cart_page
    When user is on "item_2" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    And user remember "test_item_2" product parameters on product_page
    And user click add_to_bag_button on product_page
    Then user click cart_icon on header
    And user can see "test_item_2_hash" on cart_page

  @proj:venus @manual
  Scenario:[Venus] Images for products larger than 1X are different
    Given test steps are under design


#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see list of added to cart products with corresponding information
    Given test steps are under design

    #================================  [BluePlanet]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User should be able to view the shopping cart with perfect proxy.
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] All legacy functionality for the shopping cart should be working accordingly.
    Given test steps are under design
