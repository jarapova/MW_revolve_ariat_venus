# In this module we collecting methods for all common page of REVOLVE
require 'capybara/cucumber'


module REV_AllPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.expect_content(content_name)
    if content_name == 'no_back_to_top_button'
      page.assert_no_selector(:xpath, get_arrow_button_locator)
      p "There is no back to top arrow"
    elsif content_name == 'back_to_top_button'
      expect_arrow_button
    elsif content_name == 'page_url'
      sleep 30
      p expected_environment = parse_environment($revolve_stored_information['url'])
      p actual_environment = parse_environment(page.current_url)
      expect(actual_environment).to eq expected_environment
      p "User is on the same environment"
    end
  end

  def self.isRevolve?
    PWA == 'revolve'
  end

  def self.scroll_to_bottom
    (0..10).each do |i|
      page.execute_script("window.scrollTo(0,document.body.scrollHeight*#{i.to_f/10});")
      sleep 0.5
    end
  end

  def self.get_arrow_button_locator
    "(//button[parent::div and @style])[1]"
  end

  def self.expect_arrow_button
    page.assert_selector(:xpath, get_arrow_button_locator)
  end

  def self.click_arrow_button
    find(:xpath, get_arrow_button_locator).click
    sleep 3
    p "I clicked arrow button"
  end

  def self.go_back
    page.go_back
    page.execute_script("window.scrollTo(0, 0);")
  end

  def self.visit_mens_page
    page.visit BASE_URL + "index_men.jsp"
  end

  def self.visit_womens_page
    page.visit BASE_URL + "index_women.jsp"
  end

  def self.remember_current_url
    $revolve_stored_information['url'] = page.current_url
  end

  def self.parse_environment(url)
    url = url.sub('https://', '')
    url = url.sub('www.','')
    url[0...url.index('/')]
  end

end