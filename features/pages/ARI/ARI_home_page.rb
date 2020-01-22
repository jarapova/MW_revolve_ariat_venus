require 'capybara/cucumber'

module ARI_HomePage
	extend Capybara::DSL
	extend RSpec::Matchers
	HOME_PAGE_PREFIX = "ariat:home_page:"

	def self.visit_home_page
		visit BASE_URL
	end

	def self.click_element(element_name)
		if element_name == 'random_new_arrival_item'
			click_random_element(ari_get_home_page_content['multiple_locators']['new_arrivals']['items_names'])
		end
	end

	def self.expect_content(content_name)
		if content_name == 'home_page_content'
			expect_home_page_content
		elsif content_name == 'each_cta_content'
			expect_each_ct_content
		elsif content_name == 'new_arrivals_content'
			expect_new_arrivals_content
		elsif content_name == 'social_section_widget'
			expect_social_section_widget
		elsif content_name == 'two_24_home_page_content'
			expect_two_24_home_page_content
		end
	end

	def self.expect_home_page_content
		scroll_page
		locators = ari_get_home_page_content['multiple_locators']
		p image_count = find_all(:xpath, locators['banners']).count
		expect(image_count).to be > 1
		p "I see images on home_page"
		p categories_count = find_all(:xpath, locators['categories']).count
		expect(categories_count).to be >= 2
		p "I see categories home_page"
		p shop_categories_buttons_count = find_all(:xpath, locators['shop_categories_buttons']).count
		expect(categories_count).to eq shop_categories_buttons_count
		p "I see shop categories buttons"
	end

	def self.expect_each_ct_content
		locators = ari_get_home_page_content['multiple_locators']
		ta_prefix = HOME_PAGE_PREFIX + "cta_buttons:"
		p shop_categories_buttons_count = find_all(:xpath, locators['shop_categories_buttons']).count
		(1..shop_categories_buttons_count).each do |button_number|
      locator =  locators['shop_categories_buttons'] + "[#{button_number}]"
			find(:xpath, m_ta(ta_prefix + button_number.to_s, locator)).click
			p "I clicked #{button_number} cta button"
			ARI_ProductListPage.expect_product_list_page_content
			go_back
			scroll_page
		end
	end

	def self.expect_new_arrivals_content
		page.assert_selector(:xpath, ari_get_home_page_content['base_locators']['new_arrivals_text'])
		items_locators = ari_get_home_page_content['multiple_locators']['new_arrivals']
		items_count = find_all(:xpath, items_locators['items_prices']).count
		(1..items_count).each do |item_number|
			items_locators.each do |name, locator|
				scroll_to_element(locator, 0.5)
				page.assert_selector(:xpath,locator) #ta_bug
				p "I see #{name} on #{item_number} item"
			end
		end
	end

	def self.expect_social_section_widget #iframe has cross origin policy
		page.assert_selector(:xpath, "((//*[@data-page='Home'] | //*[@data-page='home'])//iframe[contains(@id, 'pixlee')])")
		p "I see social section widget"
	end

	def self.expect_two_24_home_page_content
		page.assert_selector(:xpath, "//img")
		expect(page.current_url).to include 'two24'
		p "I am on two24 page"
	end


end
