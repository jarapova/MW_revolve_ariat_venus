require 'capybara/cucumber'


module SCP_HomePage
  extend Capybara::DSL
  extend RSpec::Matchers

  HOME_PAGE_PREFIX = "shoecarnival:home_page:"

  def self.visit_home_page
    visit BASE_URL
  end

  def self.expect_content(content_name)
    if content_name == 'home_page_content'
      expect_home_page_content
    end
  end

  def self.expect_home_page_content
    VN_AllPage.update_page
    VN_AllPage.update_page
    banners_locator = scp_get_home_page_content['home_page_multiple_locators']['banners']
    banners_count = find_all(:xpath, banners_locator).count
    expect(banners_count).to be > 2
  end

  def self.click_element(element_name)
    if element_name.include? 'banner'
      banner_number = element_name.sub('banner_', '')
      banners_locator = scp_get_home_page_content['home_page_multiple_locators']['banners']
      find(:xpath, banners_locator + "[#{banner_number}]").click
    else
      element_locator = scp_get_home_page_content['base_locators'][element_name]
      ta_locator = HOME_PAGE_PREFIX + element_name
      find(:xpath, m_ta(ta_locator, element_locator)).click
    end
    p "I clicked #{element_name}"
  end

end