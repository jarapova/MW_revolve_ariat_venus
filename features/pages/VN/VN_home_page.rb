module VN_HomePage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.visit_home_page
    visit BASE_URL
    p  "I am on VN_HomePage  #{BASE_URL} home page"
    my_set_cookie('smartbanner-closed', 'true')
    my_set_cookie('ConsentToCookies', 'true')
  end

  def self.expect_content(homepage_content_name)
    VN_AllPage.scroll_to_bottom
    page.execute_script("window.scrollTo(0,0);")
    if homepage_content_name == "all_shop_now_buttons_content"
      expect_shop_now_buttons
    elsif homepage_content_name == 'promo_code_text'
      page.assert_text('FREE SHIPPING')
      page.assert_text('AT CHECKOUT')
      p "I see promo_code_text"
    elsif homepage_content_name == 'home_page_content'
      # check text content on homepage
      text_array = vn_get_homepage_content['text_content']
      text_array.each do |item|
        page.assert_selector(:xpath, "//*[text()='#{item[1]}']")
        p  "I see homepage_content_text #{item[1]} on homepage"
      end
      # check shop now buttons content on homepage
      expect_shop_now_buttons
      # check plus_button content on homepage
      expect_plus_button
      # check main banners
      banners_locator = vn_get_homepage_content['locators']['banners']
      banners_count = find_all(:xpath, banners_locator).count
      expect(banners_count).to be > 1
      #check main navigation carousel
      expect_main_navigation_carousel

    elsif homepage_content_name.include? 'shop_now_button'
      buttons_array = vn_get_homepage_content['shop_now_buttons_text'][homepage_content_name]
      button_text = buttons_array['button_text']
      page.assert_selector(:xpath, "//a[@title='Shop Now' and text()='#{button_text}']")
      p  "I see shop_now_button on home_page with Expected text: #{button_text}"
    end
  end

  def self.expect_shop_now_buttons
    p "Expecting all shop now buttons content"
    all_buttons_locator = vn_get_homepage_content['locators']['all_shop_now_buttons']
    all_buttons_count = find_all(:xpath, all_buttons_locator).count
    p "Shop now buttons count is #{all_buttons_count}"
    expect(all_buttons_count).to be > 1
    (1..all_buttons_count).each do |button_number|
      p find(:xpath, all_buttons_locator+"[#{button_number}]").text
    end

  end

  def self.expect_plus_button
    # sleep 2
    VN_AllPage.update_page
    page.assert_selector(:xpath, "(//*[contains(@class, 'fs-timeline-entry')])[1]")
    page.assert_selector(:xpath, "(//*[contains(@class, 'fs-timeline-entry')])[6]")
    page.assert_selector(:xpath, "//*[@class='fs-next-svg']")
    p  "I see plus_button on home_page with Expected text 6 svg images"
  end

  def self.click_plus_button
    images_count = find_all(:xpath, "(//*[contains(@class, 'fs-timeline-entry')])").count
    page.assert_selector(:xpath, "//*[@class='fs-next-svg']")
    p  "I see plus_button on home_page with Expected #{images_count} svg images"
    # Added because of lazy loaded images on venus.com home_page
    page.execute_script("window.scrollTo(0, 0);")
    sleep 2
    find(:xpath, "//*[@class='fs-next-svg']").click
    sleep 5
    p  "I click plus_button on home_page"
    VN_AllPage.scroll_to_bottom
    last_image_locator = "(//*[contains(@class, 'fs-timeline-entry')])[#{images_count + 6}]"
    VN_AllPage.scroll_to_element(last_image_locator)
    page.assert_selector(:xpath, last_image_locator)
    images_count_after_click = find_all(:xpath, "(//*[contains(@class, 'fs-timeline-entry')])").count
    expect(images_count_after_click.to_i).to eq images_count.to_i + 6
    p  "I click plus_button on home_page and there are new 6 images added"
  end

  def self.expect_main_navigation_carousel
    sleep 1.5
    page.execute_script %{function getElementByXpath(path) {
  return document.evaluate(path, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
}
    getElementByXpath("(//*[@role='tablist']//*[text()])[5]").scrollIntoView();}
    sleep 0.5
    carouselText = find(:xpath, "//*[@role='tablist']").text
    carousel_elements = carouselText.split("\n")
    carousel_elements.each do |item|
      p  "I see #{item} in main navigation carousel"
    end
    expected_elements = []
    if carousel_elements.include? 'PRE-ORDER'
      p "No pre-order section"
      expected_elements = VN_CAROUSELELEMENTS
    else
      p "Pre-order section"
      expected_elements = VN_CAROUSELELEMENTS_1
    end
    expect(carousel_elements).to eq(expected_elements)
    p  "I see main navigation carousel in header with Expected #{expected_elements} items"
  end

def self.expect_email_subscription_field
  VN_AllPage.scroll_to_bottom
  email_field_locator = vn_get_homepage_content['locators']['email_subscription_field']
  page.assert_selector(:xpath, email_field_locator)
  p  "I can see email subscription field on homepage"
end


def self.click_email_subscription_field
  sleep 1
  email_field_locator = vn_get_homepage_content['locators']['email_subscription_field']
  find(:xpath, email_field_locator).click
  p  "I've clicked email subscription field on homepage"
end


def self.fill_email_subscription_field(value)
  email_field_locator = vn_get_homepage_content['locators']['email_subscription_field']
  find(:xpath, email_field_locator).set value
  p  "I've filled email subscription field with #{value} on homepage"
end


def self.email_subscription_field_arrow_button_click
  email_field_button_locator = vn_get_homepage_content['locators']['email_subscription_field_arrow_button']
  find(:xpath, email_field_button_locator).click
  p  "I've clicked arrow button on email subscription field on homepage"
end

end
