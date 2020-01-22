# In this module we collecting methods for all page of VN
require 'capybara/cucumber'


module VN_AllPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.isVenus?
    PWA == 'venus'
  end

  def self.wait(duration)
    duration = duration.to_f
    sleep duration
  end

  def self.close_hamburger_banner
    p "Trying to close hamburger banner"
    if page.has_selector?(:xpath, "//div[@class='eg-promo']//a", wait: false)
      find(:xpath, "(//div[@class='eg-promo']//a)[1]").click
      p "I have closed banners"
      sleep 5
    end
  end

  def self.go_back
    page.go_back
  end

  def self.scroll_to_bottom
    page.assert_selector(:xpath, "//*")
    (0..10).each do |i|
      sleep 0.3
      begin
        page.execute_script("window.scrollTo(0,document.body.scrollHeight*#{i.to_f/10});")
      rescue Exception
        p "Cannot scroll page while loading"
        sleep 0.2
      end
    end
    p "Scrolled to bottom"
  end

  def self.update_page
    VN_AllPage.scroll_to_bottom
    page.execute_script("window.scrollTo(0,0);")
    sleep 1.5
    p "Page updated"
  end

  def self.scroll_to_element(xpath)
    begin
      page.execute_script(%{document.evaluate("#{xpath}",
        document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView();})
      sleep 0.5
    rescue Exception
      p "Couldn't evaluate script"
      sleep 1
    end
  end

  def self.scroll_to_top
    sleep 1
    page.execute_script("window.scrollTo(0,0);")
    sleep 2
    p "I scrolled to top"
  end

  def self.visit_page(page_name)
    url = BASE_URL + vn_get_specific_pages['page_links'][page_name]
    page.visit url
    p "I am on #{url}"
  end

end