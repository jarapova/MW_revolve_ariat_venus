Feature: This test suite declares the AN site happy path

#  Open hamburger menu and navigate to subcategory
Scenario: As User and Guest I want to use the Hamburger menu to navigate to each appropriate page in menu
Given user is entered on home_page
When user click hamburger_menu_icon on page header
And user can see all appropriate content on hamburger_menu

And user click on hamburger category "Bath"
And user click on subcategory "Towels"
Then user is on "Towels" subcategory page