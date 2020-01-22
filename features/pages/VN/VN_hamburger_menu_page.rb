# In this module we collecting methods for HamburgerMenu page of VN
require 'capybara/cucumber'


module VN_HamburgerMenuPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.expect_content(content_name)
    if content_name == "hamburger_first_page_content"
    first_page_elements = vn_get_hamburger_page_elements('first_page_buttons_locators')
    first_page_elements.each do |(element_name,element_locator)|
        page.assert_selector(:xpath, element_locator)
        p  "I see #{element_name} element on first page of hamburger"
      end
    elsif content_name == "hamburger_category_page_content"
    category_page_elements = vn_get_hamburger_page_elements('hamburger_category_page')
    category_page_elements.each do |(element_name, element_text)|
      page.assert_selector(:xpath, get_category_element_locator(element_text))
      p  "I see element #{element_name} with text #{element_text} on hamburger category page"
        end
    elsif content_name == "hamburger_subcategory_page_content"
      subcategory_elements_locator = get_subcategory_element_locator
      subcategories_count = find_all(:xpath, subcategory_elements_locator).count
      categories_locator = get_category_element_locator
      category_count = find_all(:xpath, categories_locator).count
      p "Categories count: #{category_count} \n Subcategories count: #{subcategories_count}"
      expect(subcategories_count).to be >= (category_count)
      (1..subcategories_count).each do |subcategory_number|
        p subcategory_text = find(:xpath, subcategory_elements_locator + "[#{subcategory_number}]").text
        expect(subcategory_text).not_to eq("")
      end
    elsif content_name == "hamburger_menu_closed"
      page.assert_no_text('Shop by Categories')
      p  "I see hamburger menu is closed"
    end
  end

  def self.click_hamburger_element(hamburger_item_name)
    if hamburger_item_name.include? '_on_first_page'
      hamburger_item_name = hamburger_item_name.gsub('_on_first_page','')
      first_page_buttons_locators = vn_get_hamburger_page_elements('first_page_buttons_locators')
      button_locator = first_page_buttons_locators[hamburger_item_name]
      page.assert_selector(:xpath, button_locator)
      begin
        find(:xpath, button_locator).click
      rescue Exception
        VN_AllPage.close_hamburger_banner
        find(:xpath, button_locator).click
      end
      p "I have clicked #{hamburger_item_name} on first_page"
    elsif  hamburger_item_name.include? 'category'
      hamburger_item_name = hamburger_item_name.gsub('_category','')
      if hamburger_item_name == 'back'
        back_button_locator = "//ul/*[@role='button']"
        begin
          find(:xpath, back_button_locator).click
        rescue Exception
          VN_AllPage.close_hamburger_banner
          find(:xpath, back_button_locator).click
        end
        p "I clicked back button"
      else
        VN_HamburgerMenuPage.expect_content('hamburger_category_page_content')
        category_page_elements = vn_get_hamburger_page_elements('hamburger_category_page')
        element_text = category_page_elements[hamburger_item_name]
        find(:xpath, get_category_element_locator(element_text)).click
        p "I've clicked #{element_text}"
      end
    elsif  hamburger_item_name.include? '_subcat'
      hamburger_item_name = hamburger_item_name.gsub('_subcat','')
      subcategory_page_elements = vn_get_hamburger_page_elements('hamburger_subcategory_pages')
      element_text = subcategory_page_elements[hamburger_item_name]
      find(:xpath, get_subcategory_element_locator(element_text)).click
      p "I've clicked #{element_text} subcategory"
    elsif hamburger_item_name == 'open_app_cats'
      p "Opening categories"
      category_page_elements = vn_get_hamburger_page_elements('hamburger_category_page')
      category_page_elements.each do |(element_name,element_text)|
        begin
          find(:xpath, get_category_element_locator(element_text)).click
        rescue Exception
          p "Error in expanding categories, trying to close banner"
          VN_AllPage.close_hamburger_banner
          find(:xpath, get_category_element_locator(element_text)).click
        end
        sleep 1
        p "I've clicked and open #{element_text} category"
      end
    end
   sleep 5
  end

  def self.get_category_element_locator(element_name = "")
    if element_name == ""
      return "(//div[@amp-bind]//div[text() and not(text()='Shop by Categories')])"
    else
      return %{//div[@amp-bind]//div[text()="#{element_name}"]}
    end
  end

  def self.get_subcategory_element_locator(element_name = "")
    if element_name == ""
      return "((//ul[not(@role)])[last()]/div[not(@amp-bind) and not(@role)]//div[text()])"
    else
      return "//div[not(@amp-bind)]//div[text()='#{element_name}']"
    end
  end

end