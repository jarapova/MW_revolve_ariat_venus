# In this module we collecting methods for catalog page of ANNIESELKE
require 'capybara/cucumber'


module AN_CatalogPage
  extend Capybara::DSL
  extend RSpec::Matchers


  def self.press_catalog_page_expect
    page.assert_selector(:xpath, "//div[@class='header']/h1[text()=' Press']")
    p  "I'm on Press catalog page"
  end

  def self.press_on_random_catalog
    catalogs_count_on_page = find_all(:xpath, "//div[@class='collection-details']").count
    random_catalog = Random.rand(1...catalogs_count_on_page)
    random_catalog_name = find(:xpath, "(//div[@class='collection-details'])[#{random_catalog})/a").text
    p  "I see #{catalogs_count_on_page} catalogs on page"
    find(:xpath, "(//div[@class='collection-details'])[#{random_catalog})").click
    p  "I've clicken on #{random_catalog_name} catalog"
  end





end
