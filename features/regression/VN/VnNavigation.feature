Feature: This test suite defines the navigation functionality for Venus

#Navigate back to home page using breadcrumbs================= Done ===================================================
Scenario: As user I want to use breadcrumbs to navigate back to homepage
Given user is on home_page
And user can see main_navigation_carousel on header
And user click "Clothing" on main_navigation_carousel
And user select "Dresses" from subcategory_filter on category_page
And user click "random_item_image" on category_page
  And user scroll page
Then user can see "product_page_content" on product_page
And user click "Dresses" on breadcrumb
And user go back
And user can see "product_page_content" on product_page
And user click logo_button on header