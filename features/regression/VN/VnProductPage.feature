Feature: This test suite declines Product Page functionality for Venus

  Navigate to PDP
  User can see Product name, style and price
  Product images functionality
  Product colors functionality
  Product sizes functionality
  Size chart
  Change item qty
  Add item to bag
  Add item to wishlist
  Product info categories
  Add item to cart from Complete the look section
  Open PDP of item from You'll also like section

#  Navigate to PDP
  Scenario: As user I want to Navigate to PDP page
    Given user is on home_page
    And user can see main_navigation_carousel on header
    And user click "Clothing" on main_navigation_carousel
    And user select random_subcategory from subcategory_filter on category_page
    Then user click "random_item_image" on subcategory_page
    And user scroll page
    And user can see "product_page_content" on product_page

 # User can see Product name, style and price of testing item
  Scenario: As user I want see expected content on PDP
    Given user is on "item_1" product_page
    And user scroll page
    And user click "color_button_olmu" on product_page
    And user can see "item_color" with value "OLIVE MULTI(OLMU)" on product_page
    And user can see "product_page_content" on product_page
    Then user can see "item_1_test_item_content" on product_page


 # Product images switch galary image functionality
  Scenario: As user I want see product images on PDP
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user can see main_product_image on product_page
    Then user click "all_images" from item_image_galary on product_page

 # Product main image zoom functionality
  Scenario: As user I want to zoom product main image on PDP
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    Then user can see main_product_image on product_page
    Then user click image_zoom_button on product_page
    Then user can see main_product_image_zoomed on product_page
    When user click "all_images" from item_image_galary on product_page
    Then user can see main_product_image_zoomed on product_page
    And user click close_zoomed_image on product_page
    And user can see zoomed_image_closed on product_page


 # Product colors functionality
  Scenario: As user I want see colors on PDP and choose available color
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    Then user can see "product_сolors" on product_page
    Then user can see "available_product_сolors" on product_page

    When user click "color_button_black" on product_page
    Then user can see "item_color" with value "BLACK(BK)" on product_page

    When user click "color_button_dark_wash" on product_page
    Then user can see "item_color" with value "DARK WASH(DW)" on product_page

    When user click "color_button_light_wash" on product_page
    Then user can see "item_color" with value "LIGHT WASH(LW)" on product_page

    When user click "color_button_medium_wash" on product_page
    Then user can see "item_color" with value "MEDIUM WASH(MW)" on product_page

    When user click "color_button_white" on product_page
    Then user can see "item_color" with value "WHITE(WH)" on product_page

    When user click "color_button_olmu" on product_page
    Then user can see "item_color" with value "OLIVE MULTI(OLMU)" on product_page

    When user click "color_button_black" on product_page
    Then user can see "item_color" with value "BLACK(BK)" on product_page


 # Product sizes functionality
  Scenario: As user I want see sizes on PDP and choose available size
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    And user click add_to_bag_button on product_page
    Then user click view_bag_button on add_to_bag_popup
    And user can see "cart_page_content" on cart_page
    Then user can see "item_1_size" on cart_page


 # Size chart
  Scenario: As user I want navigate to size chart page from pdp
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    Then user click "size_chart_link" on product_page
    And user can see "size_chart_page_content" on size_chart_page

 # Change item qty
  Scenario: As user I want add item to cart with expected qty
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user click add_to_bag_button on product_page
    Then user click view_bag_button on add_to_bag_popup
    And user can see "cart_page_content" on cart_page
    Then user can see "item_1_size" on cart_page
    Then user can see "item_1_qty" with value "2" on cart_page

    # Add item to wishlist
  Scenario: As user I want to add item to wishlist
    Given user make login as "user1"
    Then user click "wish_list" on account_navigation_tab
    And user can see "wish_list_page_content" on wish_list_page
    And user clear wish_list_page
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user remember "test_item_1" product parameters on product_page
    Then user click "add_to_wish_list" on product_page
    And user can see "test_item_1_hash" on wish_list_page


 # Add item to bag
  Scenario: As user I want to add item to cart
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user remember "test_item_1" product parameters on product_page
    And user click add_to_bag_button on product_page
    Then user click view_bag_button on add_to_bag_popup
    And user can see "test_item_1_hash" on cart_page

 # Product info categories
  Scenario: As user I want see product info categories
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    And user can see "product_description_btn" on product_page
    And user can see "product_description_info" with value "These little shorts are destined to become favorites." on product_page
    And user click "product_more_details_btn" on product_page
    And user can see "product_more_details_info" with value "Machine wash warm with like colors" on product_page
    And user click "product_get_social_btn" on product_page
    And user can see "product_get_social_info" with value "Share your style with friends:" on product_page


 # Add item to cart from Complete the look section
  #Sometimes Complete the look page does not appear
  Scenario: As user I want add item to cart from Complete the look section
    Given user is on "item_2" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    And user can see "complete_the_look_div" on product_page
    Then user can see "complete_the_look_product_name" on product_page
    When user click "complete_the_look_size_button" on product_page
    And user remember "test_item_2" complete the look parameters on product_page
    And user click "complete_the_look_add_to_bag_button" on product_page
    Then user click cart_icon on header
    And user can see "cart_page_content" on cart_page
    And user can see "test_item_2_hash" on cart_page


 # Open PDP of item from Recently viewed section
  Scenario: As user I want open test item pdp from Recently viewed section
    Given user is on "item_2" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    And user remember "test_item_2" product parameters on product_page
    And user can see "product_page_content" on product_page
    And user is on "item_1" product_page
    And user scroll page
    And user click "recently_viewed_btn" on product_page
    Then user can see "recently_viewed_item_name" with value "test_item_2_name" on product_page
    And user click "recently_viewed_item_image" on product_page
    And user scroll page
    And user can see "product_page_content" on product_page


 # Open PDP of item from You'll also like section
  Scenario: As user I want open test item pdp from You'll also like section
    Given user is on "item_2" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    And user can see "you_also_like_btn" on product_page
    And user click "random_you_also_like_item" on product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    And user scroll page
    And user click "random_you_also_like_item" on product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    And user click "random_you_also_like_item" on product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    And user click "random_you_also_like_item" on product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    And user click "random_you_also_like_item" on product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    And user click "random_you_also_like_item" on product_page





    # Proceed to checkout with item in stock
  Scenario: As user I want proceed to checkout with item in stock
    Given user is on "Color_skinny_jeans" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "item_color_BLACK DENIM(BKDE)" on product_page
    When user click "available_waist_size_button" on product_page
    When user click "inseam_size_button_regular" on product_page
    Then user can see "is_in_stock_text" on product_page
    And user click add_to_bag_button on product_page
    Then user click view_bag_button on add_to_bag_popup
    And user can see "cart_page_content" on cart_page
    And user can see "item_1_in_stock" on cart_page


    # Proceed to checkout with item in stock from wishlist
  Scenario: As user I want proceed to checkout with item in stock from wishlist
     When user make login as "user1"
    Then user click "wish_list" on account_navigation_tab
    And user can see "wish_list_page_content" on wish_list_page
    And user clear wish_list_page
    Given user is on "Color_skinny_jeans" product_page
    And user scroll page
    When user click "available_waist_size_button" on product_page
    When user click "item_color_BLACK DENIM(BKDE)" on product_page
    When user click "inseam_size_button_regular" on product_page
    Then user can see "is_in_stock_text" on product_page
    And user remember "test_item_1" product parameters on product_page
    And user click "add_to_wish_list" on product_page
    And user can see "test_item_1_hash" on wish_list_page

    Then user can see "test_item_1_in_stock_text" on wish_list_page
    And user click "test_item_1_move_to_bag" on wish_list_page
    Then user click cart_icon on header
    And user can see "checkout_page_content" on checkout_page
    And user can see "color_skinny_jeans" on checkout_page

