hamburger_menu_page = Object
if VN_AllPage.isVenus?
  hamburger_menu_page = VN_HamburgerMenuPage
elsif ST_AllPage.isStage?
  hamburger_menu_page = ST_HamburgerMenuPage
elsif REV_AllPage.isRevolve?
  hamburger_menu_page = REV_HamburgerMenuPage
elsif SCP_AllPage.is_SCP?
  hamburger_menu_page = SCP_HamburgerMenuPage
elsif ARI_AllPage.is_ARI?
  hamburger_menu_page = ARI_HamburgerMenuPage
end

When(/^user can see "([^"]*)" on hamburger_menu$/) do |content_name|
  hamburger_menu_page.expect_content(content_name)
end

Then(/^user click "([^"]*)" on hamburger_menu$/) do |hamburger_item_name|
  hamburger_menu_page.click_hamburger_element(hamburger_item_name)
end

And(/^user can see "([^"]*)" with value "([^"]*)" on hamburger_menu$/) do |element_name, element_value|
  hamburger_menu_page.check_header_with_value(element_name, element_value)
end