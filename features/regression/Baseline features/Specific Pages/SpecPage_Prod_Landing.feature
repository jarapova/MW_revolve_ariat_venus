#Projects:
#@proj:venus

Feature: As user I want to see product landing page and interact with elements on this page
  Specific Page - Product Landing Page

# To view product landing page, you should change ‘viewproduct’ to ‘productlanding’ in product link
# Example of product landing page: https://www.venus.com/productlanding.aspx?BRANCH=129~5335~&ProductDisplayID=60490&sale=1


#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User can add to product to cart after selecting product options on product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see "go to cart" pop up when adding product to cart from product landing page, and user can navigate to cart page to see added product
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see "Preorder" button with estimated delivery date info instead of "Add to Bag" button for preorder items on product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see product images carousel and can swipe images on product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User select color on product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see product details on product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] As user I want see Product price with/without sale on product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can view Google AMP version of product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can interact with each web element of Google AMP version of product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see large image view by taping + icon on product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] user can see message to select a size before adding the product to my shopping bag on product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see availability message after selecting required options of product on product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Product reviews stars rating on product landing page is the same as on PLP and cart pages
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can select select qty of the product on product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can select product size on product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can select size 1X and larger and see different product images on product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can select Waist Size on special product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can select Inseam size on special product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can select Band size on special product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see "Size Guide/Size Chart" CTA on product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can tap "Size Guide/Size Chart" CTA on product landing page and be navigated to "Size Guide/Size Chart" spreadsheet
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can navigate back to product landing page from "Size Guide/Size Chart" spreadsheets
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can navigate to full PDP by click on "View More Details" CTA on product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can see products with correct info in "Related products" section on product landing page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can navigate to expected PDP by click on item from "Related products" section on product landing page
    Given test steps are under design


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can add to product to cart after selecting product options on product landing page
    Given user is on "landing_item" product_page
    When user can see "product_landing_content" on product_landing_page
    And user click "available_size_button" on product_landing_page
    And user click add_to_bag_button on product_page
    And user click cart_icon on header
    Then user can see "cart_page_content" on cart_page

  @proj:venus @automated
  Scenario:[Venus] User can see "go to cart" pop up when adding product to cart from product landing page, and user can navigate to cart page to see added product
    Given user is on "landing_item" product_page
    When user can see "product_landing_content" on product_landing_page
    And user click "available_size_button" on product_landing_page
    And user click add_to_bag_button on product_page
    Then user can see "view_bag_button" on product_page

  @proj:venus @manual
  Scenario:[Venus] User can see "Preorder" button with estimated delivery date info instead of "Add to Bag" button for preorder items on product landing page
    Given test steps are under design

  @proj:venus @automated
  Scenario:[Venus] User can see product images carousel and can swipe images on product landing page
    Given user is on "landing_item" product_page
    When user can see "product_landing_content" on product_landing_page
    When user can see main_product_image on product_page
    Then user click "all_images" from item_image_galary on product_page

  @proj:venus @automated
  Scenario:[Venus] User select color on product landing page
    Given user is on "multiple_color_landing_item" product_page
    And user scroll page
    When user click "color_button_dark_wash" on product_landing_page
    Then user can see "color_text" with value "DARK WASH(DW)" on product_landing_page
    When user click "color_button_light_wash" on product_landing_page
    Then user can see "color_text" with value "LIGHT WASH(LW)" on product_landing_page
    When user click "color_button_medium_wash" on product_landing_page
    Then user can see "color_text" with value "MEDIUM WASH(MW)" on product_landing_page
    When user click "color_button_white" on product_landing_page
    Then user can see "color_text" with value "WHITE(WH)" on product_landing_page
    When user click "color_button_olmu" on product_landing_page
    Then user can see "color_text" with value "OLIVE MULTI(OLMU)" on product_landing_page
    When user click "color_button_black" on product_landing_page
    Then user can see "color_text" with value "BLACK(BK)" on product_landing_page

  @proj:venus @automated
  Scenario:[Venus] User can see product details on product landing page
    Given user is on "multiple_color_landing_item" product_page
    And user scroll page
    Then user can see "item_details" on product_landing_page

  @proj:venus @automated
  Scenario:[Venus] As user I want see Product price with/without sale on product landing page
    Given user is on home_page
    When user click "Sale" on main_navigation_carousel
    And user select "Jewelry" from subcategory_filter on category_page
    Then user click "random_item_name" on subcategory_page
    And user scroll page
    When user is on product_landing_page
    And user scroll page
    When user can see "item_price" on product_landing_page
    Then user can see "price_with_sale" on product_landing_page

  @proj:venus @manual
  Scenario:[Venus] User can view Google AMP version of product landing page
    Given test steps are under design

  @proj:venus @manual
  Scenario:[Venus] User can interact with each web element of Google AMP version of product landing page
    Given test steps are under design

  @proj:venus @automated
  Scenario:[Venus] User can see large image view by taping + icon on product landing page
    Given user is on "landing_item" product_page
    And user scroll page
    Then user can see main_product_image on product_page
    Then user click image_zoom_button on product_page
    Then user can see main_product_image_zoomed on product_page
    When user click "all_images" from item_image_galary on product_page
    Then user can see main_product_image_zoomed on product_page
    And user click close_zoomed_image on product_page
    And user can see zoomed_image_closed on product_page

  @proj:venus @manual
  Scenario:[Venus] user can see message to select a size before adding the product to my shopping bag on product landing page
    Given test steps are under design

  @proj:venus @automated
  Scenario:[Venus] User can see availability message after selecting required options of product on product landing page
    Given user is on "landing_item" product_page
    When user can see "product_landing_content" on product_landing_page
    And user click "available_size_button" on product_landing_page
    Then user can see "in_stock_message" on product_landing_page

  @proj:venus @manual
  Scenario:[Venus] Product reviews stars rating on product landing page is the same as on PLP and cart pages
    Given test steps are under design

  @proj:venus @automated
  Scenario:[Venus] User can select select qty of the product on product landing page
    Given user is on "landing_item" product_page
    And user scroll page
    When user can see "product_landing_content" on product_landing_page
    And user click "available_size_button" on product_landing_page
    Then user set "product_qty" with value "2" on product_page
    When user click add_to_bag_button on product_page
    Then user click view_bag_button on add_to_bag_popup
    When user can see "cart_page_content" on cart_page
    Then user can see "item_1_qty" with value "2" on cart_page

  @proj:venus @automated
  Scenario:[Venus] User can select product size on product landing page
    Given user is on "landing_item" product_page
    When user scroll page
    Then user click "available_size_button" on product_landing_page

  @proj:venus @manual
  Scenario:[Venus] User can select size 1X and larger and see different product images on product landing page
    Given test steps are under design

  @proj:venus @automated
  Scenario:[Venus] User can select Waist Size on special product landing page
    Given user is on "Color_skinny_jeans" product_page
    When user is on product_landing_page
    And user scroll page
    When user click "available_waist_size_button" on product_page
    When user click "color_button_black_denim" on product_landing_page
    And user click "inseam_size_button_regular" on product_landing_page
    Then user can see "in_stock_message" on product_landing_page

  @proj:venus @automated
  Scenario:[Venus] User can select Inseam size on special product landing page
    Given user is on "Color_skinny_jeans" product_page
    When user is on product_landing_page
    And user scroll page
    When user click "available_waist_size_button" on product_page
    When user click "color_button_black_denim" on product_landing_page
    And user click "inseam_size_button_short" on product_landing_page
    Then user can see "in_stock_message" on product_landing_page

  @proj:venus @automated
  Scenario:[Venus] User can select Band size on special product landing page
    Given user is on "item_with_band_size" product_page
    When user is on product_landing_page
    And user scroll page
    And user click "available_band_size_button" on product_page
    And user click "available_cup_size_button" on product_page
    Then user can see "in_stock_message" on product_landing_page

  @proj:venus @tobeautomated
  Scenario:[Venus] User can see "Size Guide/Size Chart" CTA on product landing page
  "Size Guide/Size Chart" CTA is not presented on product landing page
    Given user is on "landing_item" product_page
    And user scroll page
    Then user can see "size_chart_link" on product_page

  @proj:venus @tobeautomated
  Scenario:[Venus] User can tap "Size Guide/Size Chart" CTA on product landing page and be navigated to "Size Guide/Size Chart" spreadsheet
    Given test steps are under design

  @proj:venus @tobeautomated
  Scenario:[Venus] User can navigate back to product landing page from "Size Guide/Size Chart" spreadsheets
    Given test steps are under design

  @proj:venus @automated
  Scenario:[Venus] User can navigate to full PDP by click on "View More Details" CTA on product landing page
    Given user is on "multiple_color_landing_item" product_page
    And user scroll page
    When user can see "product_landing_content" on product_landing_page
    And user click "view_details_link" on product_landing_page
    And user scroll page
    And user update page
    Then user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page

  @proj:venus @automated
  Scenario:[Venus] User can see products with correct info in "Related products" section on product landing page
    Given user is on "landing_item" product_page
    When user scroll page
    Then user can see "product_list" on product_landing_page


  @proj:venus @automated
  Scenario:[Venus] User can navigate to expected PDP by click on item from "Related products" section on product landing page
    Given user is on "landing_item" product_page
    When user scroll page
    Then user can see "product_list" on product_landing_page
    And user click "random_item_name" on subcategory_page
    And user scroll page
    And user update page
    And user scroll page
    Then user can see "product_page_content" on product_page