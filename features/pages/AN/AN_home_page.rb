# In this module we collect methods for the home page of ANNIE SELKE
require 'capybara/cucumber'

module AN_HomePage
  extend Capybara::DSL
  extend RSpec::Matchers
  def self.visit_home_page
    visit BASE_URL
    p  "I am on #{BASE_URL} home page"
    p  "AN_HomePage"
  end

  def self.expect_subscription_form
    sleep(12)
    page.assert_selector(:xpath,"//div[@class='fcopt-offer']")
    p  "I see 'Get 15% OFF after signing up for emails*' pop-up on the Home page"
  end

  def self.add_email_to_subscription(arg)
    credentials = get_user(arg)
    current_time = Random.rand(400...9999998)
    random_email = "#{current_time}#{credentials['email']}"
    within_frame "fcopt-offer-57579-content" do
      find(:xpath,"//input[@type='email']").set(random_email)
      p  "I've put #{random_email} for receiving Mail Offers"
      find(:xpath, "//input[@type='email']").click
      p  "I've clicked on the Submit button in the email field"
      if page.has_xpath?("//div[@class='fcopt-offer']")
        page.assert_selector(:xpath,"//span[@class='display' and text()='Oops! Invalid Address - please enter again.']")
        p  "The email address you entered is invalid"
      else
        p  "The email address you entered was submitted"
      end
    end
  end

  def self.navigate_to_page(arg)
    page.assert_selector(:xpath,"//p[@class='herosliceHeader' and text()='#{arg}']/parent::a")
    find(:xpath, "//p[@class='herosliceHeader' and text()='#{arg}']/parent::a").click
    p  "Clicked #{arg} and am navigating to the appropriate page"
    url = URI.parse(current_url)
    p  "I've navigated to #{url}"

    if arg == "Meet The Artist"
      expect(page).to have_current_path('/c/laura-park-collection', ignore_query: true)
      p  "Expected page #{arg} URL has been shown!"
    elsif
    page.assert_selector(:xpath, "//head/title")
      p  find(:xpath,"//head/title").text
      p  "Page #{arg} URL has been shown; not the current expected page"
    end
  end

  def self.expect_main_navigation_carousel
    carouselText = find(:xpath,  "//*[@role='tablist']").text
    carousel_elements = carouselText.split("\n")
    p  "The following categories are displayed in the main navigation carousel:"
    carousel_elements.each do |item|
      p  "> #{item}"
    end
    expect(carousel_elements).to eq(AN_CAROUSELELEMENTS)
    p  "I see the main navigation carousel in the header with the expected #{AN_CAROUSELELEMENTS} items"
  end

  def self.pixlee_check
    scroll_to(find(:xpath, "//div/span/span[text()='All Rights Reserved | Privacy Policy']"))
    sleep(3)
    page.find(:xpath, "//div[@id='pixlee_container_1026365']", visible: :all)
    p  "The Pixlee Container is appearing on the homepage"
  end

  def self.pixlee_click
    pixlee_iframe = find(:xpath, "//div[@id='pixlee_container_1026365']/*[1]")
    within_frame(pixlee_iframe) do
      photo_count = find_all(:xpath, "//ul[@class='clearfix']/li", visible: :all).count

      # TODO: Cannot get the widget to scroll sideways, therefore cannot scroll to random images beyond the first two
      # random_photo_click = Random.rand(1..photo_count)
      # scroll_to(find(:xpath, "(//ul[@class='clearfix']/li[#{random_photo_click}]/div[@class='img_holder'])"))

      random_photo_click = Random.rand(1..2)
      p  "There are #{photo_count} photos in the Pixlee widget. I am selecting photo number #{random_photo_click}"
      random_photo = find(:xpath, "(//ul[@class='clearfix']/li[#{random_photo_click}]/div[@class='img_holder'])", visible: :all)
      until page.has_xpath?("//body[@class='mfp-zoom-out-cur']") do
        random_photo.click()
        p  "Clicked on photo #{random_photo_click}. If this keeps repeating, please click on the photo manually."
      end
    end
  end

  def self.pixlee_verify
    expect(page).to have_selector("//iframe[@id='pixlee_lightbox_iframe']")
    p  "The Pixlee widget is open"
  end

  def self.pixlee_scroll(arg)
    if arg == "previous"
      find(:xpath, "//button[@title='Previous (Left arrow key)']").click
      p  "I've clicked the Left arrow"
    elsif arg == "next"
      find(:xpath, "//button[@title='Next (Right arrow key)']").click
      p  "I've clicked the Right arrow"
    end
  end

  def self.pixlee_buy
    find(:xpath, "//div[text()='Buy Now']").click
    p  "I have clicked Buy Now on the Instagram page"
  end
end
