require 'capybara/cucumber'


module SCP_AllPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.is_SCP?
    PWA == 'shoecarnival'
  end

  def self.expect_content(content_name)
    if content_name == 'page_url'
      sleep 20
      expect_page_url(page.current_url)
    end
  end

  def self.expect_page_url(current_url)
    expected_url = parse_environment($shoecarnival_stored_information['page_url'])
    actual_url = parse_environment(current_url)
    expect(actual_url).to eq(expected_url)
    p "URLS have same environment"
  end

  def self.remember_current_url
    $shoecarnival_stored_information['page_url'] = page.current_url
  end

end