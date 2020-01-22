require 'capybara/cucumber'

module ARI_CartPage
	extend Capybara::DSL
	extend RSpec::Matchers
	CART_PAGE_PREFIX = "ariat:cart_page:"

	def self.expect_content(content_name)
		if content_name == 'empty_cart_page_content'
			expect_empty_cart_page_content
		elsif content_name == 'logged_in_cart_page_content'
			expect_logged_in_cart_page_content
		elsif content_name == 'guest_cart_page_content'
			expect_guest_cart_page_content
		elsif content_name == 'item_name'
			expect_item_name
		else
			raise StandardError.new "No such content to check"
		end
	end

	def self.click_element(element_name, sleep_after = 1)
		locators = ari_get_cart_page_content['logged_in_cart_page_content']
		find(:xpath, locators[element_name]).click
		sleep sleep_after
		p "I clicked #{element_name} on cart_page"
	end

	def self.accept_cookie_modal
		locator = ari_get_cart_page_content['pop_ups_locators']['accept_cokkies_button']
		find(:xpath, locator).click if page.has_selector?(:xpath, locator)
		sleep 3
		p "I closed accept cookie modal"
	end

	def self.close_location_modal
		locator = ari_get_cart_page_content['pop_ups_locators']['close_location_pop_up']
		find(:xpath, locator).click if page.has_selector?(:xpath, locator)
		sleep 3
		p "I closed location modal"
	end

	def self.expect_empty_cart_page_content #ta_bug
		close_location_modal
		accept_cookie_modal
		scroll_page
		assert_elements(ari_get_cart_page_content['empty_cart_page_content'], "cart_page")
	end

	def self.expect_logged_in_cart_page_content #ta_bug
		close_location_modal
		accept_cookie_modal
		assert_elements(ari_get_cart_page_content['logged_in_cart_page_content'],'cart_page')
		p items_count = find_all(:xpath, ari_get_cart_page_content['multiple_locators']['items_names']).count
		expect(items_count).to be > 0
	end

	def self.expect_guest_cart_page_content
		expect_logged_in_cart_page_content
	end

	def self.expect_item_name
		p "Expecting item_name"
		close_location_modal
		accept_cookie_modal
		items_names = []
		find_all(:xpath, ari_get_cart_page_content['multiple_locators']['items_names']).each do |element|
			items_names.push(element.text.downcase)
		end
		p items_names
		p expected_name = $ari_stored_information['item_name'].downcase
		expect(items_names).to include(expected_name)
		p "I see expected #{expected_name} item name"
	end

end
