# In this module we collecting methods for all common page of ST
require 'capybara/cucumber'

module ST_AllPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.close_all_banners
    p "Closing all banners"
    ST_NavigationPage.close_rewards_modal
    ST_NavigationPage.close_acs_full_screen_container
    ST_NavigationPage.close_lightbox_modal
  end

  def self.isStage?
    PWA == 'stage'
  end

end