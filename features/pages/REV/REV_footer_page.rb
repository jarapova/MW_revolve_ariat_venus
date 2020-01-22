# In this module we collecting methods for footer page of REVOLVE
require 'capybara/cucumber'


module REV_FooterPage
  extend Capybara::DSL
  extend RSpec::Matchers

  FOOTER_PREFIX = 'revolve:footer:'

  def self.expect_content(content_name)
    if content_name == 'country_preferences_modal_content'
      expect_country_preferences_content
    elsif content_name == 'footer_content'
      expect_footer_content
    else
      page.assert_selector(:xpath, rev_get_footer_content['base_locators'][content_name])
    end
  end

  def self.click_element(element_name)
    locators = rev_get_footer_content['base_locators']
    locators = locators.merge(rev_get_footer_content['country_preferences_modal_locators'])
    find(:xpath, locators[element_name]).click
    p "I clicked #{element_name} on footer"
  end

  def self.set_element_with_value(element_name, element_value)
    if element_name == 'email_input'
      email_field_locator = rev_get_footer_content['base_locators'][element_name]
      find(:xpath, m_ta(FOOTER_PREFIX + element_name, email_field_locator)).set(element_value)
      p "I clicked #{element_name}"
    else
      sleep 0.5
      find(:xpath, "//ul[@role='listbox']//li[contains(., '#{element_value.upcase}')]").click
      p "I set #{element_name} with value #{element_value}"
    end
  end

  def self.expect_country_preferences_content
    locators = rev_get_footer_content['country_preferences_modal_locators']
    locators.each do |name, locator|
      page.assert_selector(:xpath, m_ta(FOOTER_PREFIX + name, locator))
      p "I see #{name} on country preferences modal"
    end
  end

  def self.expect_element_with_value(element_name, element_value)
    locators = rev_get_footer_content['base_locators']
    locators = locators.merge(rev_get_footer_content['country_preferences_modal_locators'])
    actual_text = find(:xpath, locators[element_name]).text
    expect(actual_text.downcase).to eql element_value.downcase
    p "AR: #{actual_text} equals ER: #{element_value}"
  end

  def self.expect_footer_content
    footer_locators = rev_get_footer_content['base_locators']
    footer_locators.each do |name, locator|
      page.assert_selector(:xpath, m_ta(FOOTER_PREFIX + name, locator))
      p "I see #{name} on footer"
    end
  end

end