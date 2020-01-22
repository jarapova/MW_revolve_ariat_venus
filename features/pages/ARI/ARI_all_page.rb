require 'capybara/cucumber'

class ARI_AllPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.is_ARI?
    PWA == 'ariat'
  end

  def self.expect_content(content_name)
    if content_name == 'page_url'
      sleep 30
      p expected_environment = parse_environment($ari_stored_information['url'])
      p actual_environment = parse_environment(page.current_url)
      expect(actual_environment).to eq expected_environment
      p "User is on the same environment"
    elsif content_name == 'back_to_top_button'
      page.assert_selector(:xpath, ari_get_home_page_content['optional_locators']['back_to_top_button'])
    end
  end

  def self.click_element(element_name, sleep_after = 3)
    locators = ari_get_home_page_content['optional_locators']
    sleep 1
    find(:xpath, locators[element_name]).click
    sleep sleep_after
    p "I see #{element_name}"
  end

  def self.expect_no_content(content_name)
    if content_name == 'search_modal'
      expect_no_search_modal
    end
  end

  def self.expect_no_search_modal
    search_modal_button_locator = ari_get_header_content['search_locators']['search_button']
    page.assert_no_selector(:xpath, search_modal_button_locator, wait: 3)
    p "I cant see search_modal on page"
  end

  def self.remember_current_url
    $ari_stored_information['url'] = page.current_url
  end


end
