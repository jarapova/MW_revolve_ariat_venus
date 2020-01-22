require 'capybara/cucumber'

module SCP_HamburgerMenuPage
extend Capybara::DSL
extend RSpec::Matchers

  def self.click_hamburger_element(hamburger_item_name)
    find(:xpath, "//*[@role='presentation']//*[text()='#{camel_case(hamburger_item_name)}']").click
    p "I clicked #{hamburger_item_name} on hamburger"
  end

  def self.expect_content(content_name)
    if content_name == 'welcome_text'
      user_first_name = get_user($shoecarnival_stored_information['logged_user'])['first_n']
      page.assert_text("Hi, #{user_first_name}")
      p "I see #{content_name} on hamburger menu"
    end
  end

end
