#Projects:
#@proj:venus

Feature: As user I want to shop items by style
  Specific Page - Shop By Style

#  Shop by style links:
#  venus.com/swim/
#  venus.com/swim/default.aspx
#  venus.com/sportswear.aspx
#  venus.com/sale_clothing_plus-size_shopbystyle.aspx
#  venus.com/clearance_clothing_plus-size_shopbystyle.aspx
#  venus.com/sale_clothing_shopbystyle.aspx
#  venus.com/clearance_clothing_shopbystyle.aspx
#  venus.com/sale_swim_shopbystyle.aspx
#  venus.com/clearance_swim_shopbystyle.aspx
#  venus.com/sale_lingerie_shopbystyle.aspx
#  venus.com/clearance_lingerie_shopbystyle.aspx
#  venus.com/sale_clothing_plus-size_shopbystyle.aspx
#  venus.com/clearance_swim_plus-size_shopbystyle.aspx
#  venus.com/clearance_clothing_plus-size_shopbystyle.aspx
#  venus.com/sale_swim_plus-size_shopbystyle.aspx


#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] User can navigate to expected PLP from Shop by Style page
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Subcategory filter navigates to expected PLP
    Given test steps are under design


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @automated
  Scenario:[Venus] User can navigate to expected PLP from Shop by Style page
    Given user is on "sale_clothing" page
    And user scroll page
    When user can see "style_categories_content" on category_page
    And user click "random_style_category" on category_page
    Then user can see "product_list_page_content" on subcategory_page

  @proj:venus @automated
  Scenario:[Venus] Subcategory filter navigates to expected PLP
    Given user is on "sale_clothing" page
    And user scroll page
    When user can see "style_categories_content" on category_page
    And user select "Shoes & boots" from subcategory_filter on category_page
    Then user can see "product_list_page_content" on subcategory_page
