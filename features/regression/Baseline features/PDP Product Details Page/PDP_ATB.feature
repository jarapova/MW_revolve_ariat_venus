#Projects:
#@proj:revolve
#@proj:venus
#@proj:shoecarnival
#@proj:stagestores
#@proj:blueplanet
#@proj:ariat

Feature: As a customer, after I've selected my product options (eg. color and size), I can click on "Add to Bag" to add the product to my bag/cart.
  PDP - Add to Cart


  BluePlanet: As a customer, after I've adding an item to my shopping bag,
  I should see a temporary popup message stating that the product has been added successfully.

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can add to product to cart after selecting product options
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User cant add product to bag if mandatory product options not selected. User see error text for each field
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see "go to cart" pop up when adding product to cart, and user can navigate to cart page to see added product
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see "Preorder" button with estimated delivery date info instead of "Add to Bag" button for preorder items
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can add to product to cart and will stay on the same environment
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User CAN'T add to cart out of stock product
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User navigates to PLP and add random product to back to check stability of PWA
    Given test steps are under design


#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:revolve @automated @flaky
  Scenario:[Revolve] User can add to product to cart after selecting product options
    Given user is on "item_1" product_page
    When user can see "product_page_content" on product_page
    Then user click "Ivory_item_color" on product_page
    And user click "available_size_button" on product_page
    When user click add_to_bag_button on product_page
    Then user click view_bag_button on add_to_bag_popup
    And user can see "guest_cart_page_content" on cart_page

  @proj:revolve @manual
  Scenario:[Revolve] User cant add product to bag if mandatory product options not selected. User see error text for each field
    Given test steps are under design

  @proj:revolve @automated
  Scenario:[Revolve] User can see "go to cart" pop up when adding product to cart, and user can navigate to cart page to see added product
    Given user is on "item_1" product_page
    And user can see "product_page_content" on product_page
    And user click "available_size_button" on product_page
    When user click add_to_bag_button on product_page
    And user can see "pop_up_content" on product_page
    And user click view_bag_button on add_to_bag_popup
    And user can see "guest_cart_page_content" on cart_page

  @proj:revolve @tobeautomated
  Scenario:[Revolve] User can see "Preorder" button with estimated delivery date info instead of "Add to Bag" button for preorder items
      Find items with preorder, search term is not working for preorder see for more info REV-363
    Given user is on "preorder_item" product_page
    When user can see "product_page_content" on product_page
    Then user can see "preorder_message" on product_page

  @proj:revolve @manual
  Scenario:[Revolve] [REV-256] the styling of Preorder messaging on the PWA BAG to be consistent with PWA PDP.
     Find items with preorder
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] [REV-329] the styling of Beauty+Preorder messaging on the PWA BAG to be consistent with PWA PDP.
     Find items with preorder
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve][REV-292] user can add item to cart on iOS11
     Find items with preorder
    Given user is on any PDP using iOS11
    When user select all required options on pdp
    And user click add_to_bag_button on product_page
    And user click view_bag_button on add_to_bag_popup
    Then can see cart with items

  @proj:revolve @manual
  Scenario:[Revolve][REV-314] PDP displays correctly after user signs in on pop-up
    Given user is on PDP
    When user add more than 15 items to cart
    Then user can see "Sign in/Create account popup" on product_page
    When user make login
    Then user can see "product_page_content" on product_page
    And user can see correct styling on product_page

  @proj:revolve @automated
  Scenario:[Revolve][REV-384] After click on ‘add to bag’ button on the Certificate page user should stay at the same env
    Given user is on home_page
    And user click hamburger_menu_icon on header
    And user click "Gift Revolve" on hamburger_menu
    When user set "gift_price" with value "200" on category_page
    And user set "gift_delivery_method" with value "Email" on category_page
    And user fill "gift_email_fields" on category_page
    And user fill "gift_message" on category_page
    And user remember page_url on page
    Then user click "gift_add_to_bag_button" on category_page
    And user can see "page_url" on page

  @proj:revolve @automated
  Scenario:[Revolve][REV-409] User should be able to add to cart items from 'New arrivals' in 'Mens' category
    Given user is on home_page
    And user click hamburger_menu_icon on header
    When user click "Mens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    And user scroll page
    Then user click "random_item_name" on subcategory_page
    And user scroll page
    When user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    And user click "close_view_bag_modal_button" on product_page
    Then user can see "cart_icon_items_count" with value "1" on header
    And user click cart_icon on header
    And user scroll page
    Then user can see "guest_cart_page_content" on cart_page





#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @manual
  Scenario:[Venus]User can add plus size item to cart, and product image is different for 3X and 1X sizes
    Given test steps are under design

  @proj:venus @automated
  Scenario:[Venus] User can add to product to cart after selecting product options
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user remember "test_item_1" product parameters on product_page
    And user click add_to_bag_button on product_page
    Then user click view_bag_button on add_to_bag_popup
    And user can see "test_item_1_hash" on cart_page

  @proj:venus @manual
  Scenario:[Venus] User cant add product to bag if mandatory product options not selected. User see error text for each field
    Given test steps are under design

  @proj:venus @automated
  Scenario:[Venus] User can see "go to cart" pop up when adding product to cart, and user can navigate to cart page to see added product
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user remember "test_item_1" product parameters on product_page
    And user click add_to_bag_button on product_page
    Then user can see "view_bag_button" on product_page

  @proj:venus @automated
  Scenario:[Venus] User navigates to Jumpsuit and Rompers PLP and add random product to back to check stability of PWA
    Given user is on "jumpsuit_and_rompers" subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    When user click "random_item_image" on subcategory_page
    And user can see "product_page_content" on product_page
    Then user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    When user click cart_icon on header
    Then user can see "cart_page_with_items_content" on cart_page

  @proj:venus @automated
  Scenario:[Venus] User navigates to Boots sale PLP and add random product to back to check stability of PWA
    Given user is on "shoes_and_boots_sale" subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    When user click "random_item_image" on subcategory_page
    And user can see "product_page_content" on product_page
    Then user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    When user click cart_icon on header
    Then user can see "cart_page_with_items_content" on cart_page

  @proj:venus @automated
  Scenario:[Venus] User navigates to Clothing Tops PLP and add random product to back to check stability of PWA
    Given user is on "clothing_tops" subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    When user click "random_item_image" on subcategory_page
    And user can see "product_page_content" on product_page
    Then user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    When user click cart_icon on header
    Then user can see "cart_page_with_items_content" on cart_page

  @proj:venus @automated
  Scenario:[Venus] User navigates to Dresses PLP and add random product to back to check stability of PWA
    Given user is on "dresses" subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    When user click "random_item_image" on subcategory_page
    And user can see "product_page_content" on product_page
    Then user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    When user click cart_icon on header
    Then user can see "cart_page_with_items_content" on cart_page

  @proj:venus @automated
  Scenario:[Venus] User navigates to Pants PLP and add random product to back to check stability of PWA
    Given user is on "pants" subcategory_page
    And user can see "product_list_page_content" on subcategory_page
    When user click "random_item_image" on subcategory_page
    And user can see "product_page_content" on product_page
    Then user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    When user click cart_icon on header
    Then user can see "cart_page_with_items_content" on cart_page

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can add to product to cart after selecting product options
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] Green color "add to bag" button (light green when it is disabled)
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can see "View Bag" pop up when adding product to cart, and user can navigate to cart page to see added product
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-220] User can see The toaster message after a user adds a product to their shopping bag and should say "View Bag"
    Given test steps are under design

 @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-245] Remove the quantity selector and always add just 1 to the cart when pressing add to bag
   Given test steps are under design

    @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-246] Size should not be defaulted to anything on PDP.
      Given test steps are under design

   @proj:shoecarnival @manual
  Scenario:[ShoeCarnival][SCP-232] The sizes that are unavailable should be shown as disabled with a diagonal line as crossed out.
   Need to fix irregular size boxes for these ones crossed out.
    Given test steps are under design

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival][SCP-226] User can add to product to cart and will stay on the same environment
    Given test steps are under design

  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival][SCP-273] User CAN'T add to cart out of stock product
    Given test steps are under design

  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival][SCP-277] 'Add to bag' button should be fixed right under the shipping selection.
    Given test steps are under design

      @proj:shoecarnival @manual
  Scenario:[ShoeCarnival]The inactive Add to Bag button on PDP should be gray instead of green active.
        Given test steps are under design

      @proj:shoecarnival @manual
  Scenario:[ShoeCarnival][SCP-254]Add To Cart button should be disabled till user session is fully set up
        Given test steps are under design


      @proj:shoecarnival @manual
  Scenario:[ShoeCarnival][SCP-242]After selecting the option to Buy online, pick up in store and then adding it to bag, view cart. The cart page should have the same option select
        Given test steps are under design





#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can add to product to cart after selecting product options
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User cant add product to bag if mandatory product options not selected. User see error text for each field
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see "go to cart" pop up when adding product to cart, and user can navigate to cart page to see added product
    Given test steps are under design



#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible


  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can add to product to cart after selecting product options
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User cant add product to bag if mandatory product options not selected. User see error text for each field
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see "go to cart" pop up when adding product to cart, and user can navigate to cart page to see added product
    Given test steps are under design

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] User can see see a temporary popup message stating that the product has been added to cart successfully.
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @automated @flaky
  Scenario:[Ariat] User can add to product to cart after selecting product options
    Given user is on "item_with_width_and_size" product_page
    When user scroll page
    And user click "available_size_button" on product_page
    And user click "available_width_button" on product_page
    And user remember "item_name" on product_page
    Then user click add_to_bag_button on product_page
    When user click view_bag_button on add_to_bag_popup
    And user can see "guest_cart_page_content" on cart_page
    Then user can see "item_name" on cart_page

  @proj:ariat @manual
  Scenario:[Ariat] User cant add product to bag if mandatory product options not selected. User see error text for each field
    Given test steps are under design

  @proj:ariat @automated
  Scenario:[Ariat] User can see "go to cart" pop up when adding product to cart, and user can navigate to cart page to see added product
    Given user is on "item_with_no_size" product_page
    And user scroll page
    When user click add_to_bag_button on product_page
    Then user can see "pop_up_content" on product_page
    When user click view_bag_button on add_to_bag_popup
    Then user can see "guest_cart_page_content" on cart_page

  @proj:ariat @tobeautomated
  Scenario:[Ariat] User can see "Preorder" button with estimated delivery date info instead of "Add to Bag" button for preorder items
    Given test steps are under design

  @proj:ariat @automated
  Scenario:[Ariat] User can add to product to cart and will stay on the same environment
    Given user is on "item_with_no_size" product_page
    And user scroll page
    And user remember page_url on page
    When user click add_to_bag_button on product_page
    Then user can see "pop_up_content" on product_page
    When user click view_bag_button on add_to_bag_popup
    And user can see "guest_cart_page_content" on cart_page
    Then user can see "page_url" on page

  @proj:ariat @tobeautomated
  Scenario:[Ariat] User CAN'T add to cart out of stock product
    Given test steps are under design

  @proj:ariat @tobeautomated @special @flaky
  Scenario:[Ariat] User navigates to PLP and add random product to back to check stability of PWA
    Given user is on home_page
    And user scroll page
    When user click "random_category" on main_navigation_carousel
    And user can see "product_list_page_content" on subcategory_page
    Then user click "random_item_name" on subcategory_page
    And user scroll page
    And user click "all_available_sizes" on product_page
    And user remember "item_name" on product_page
    Then user click add_to_bag_button on product_page
    When user click view_bag_button on add_to_bag_popup
    And user can see "guest_cart_page_content" on cart_page
    Then user can see "item_name" on cart_page