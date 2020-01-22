require 'capybara/cucumber'

module ARI_ProductListPage
	extend Capybara::DSL
	extend RSpec::Matchers
	PLP_PREFIX = "ariat:product_list_page:"
	def self.expect_content(content_name)
		if content_name == 'product_list_page_content'
			expect_product_list_page_content
		elsif content_name == 'empty_search_result_content'
			expect_empty_search_result_content
		elsif content_name == 'high_to_low_sorted_content'
			expect_sorted_content('high_to_low')
		elsif content_name == 'low_to_high_sorted_content'
			expect_sorted_content('low_to_high')
		elsif content_name == 'subcategory_filter_categories'
			expect_subcategory_filter_categories
		elsif content_name == 'extended_product_list_page_content'
			expect_extended_plp_content
		elsif content_name == 'different_plp_items_names'
			expect_different_plp_items_names
		else
			locators = ari_get_product_list_page_content['optional_locators']
			page.assert_selector(:xpath, locators[content_name])
			p "I see #{content_name} on product_list_page"
		end
	end

	def self.expect_product_list_page_content #ta_bug
		REV_ProductListingPage.wait_placeholders
		scroll_page
		assert_elements(ari_get_product_list_page_content['base_locators'], "product_list_page")
		expect_items_content
	end

	def self.expect_items_content(scroll_to = false)
		scroll_page
		locators = ari_get_product_list_page_content['multiple_locators']
		p items_count = find_all(:xpath, locators['item_name']).count
		expect(items_count).to be > 0
		(1..items_count).each do |item_number|
			locators.each do |name, locator|
				scroll_to_element(locator + "[#{item_number}]", 0.2) if scroll_to
				page.assert_selector(:xpath, locator + "[#{item_number}]")
				p "I see #{name} on item #{item_number}"
			end
		end
	end

	def self.expect_empty_search_result_content
		assert_elements(ari_get_product_list_page_content['empty_search_result_content'],
										'product list page',
										PLP_PREFIX + "empty_search_page:")
	end

	def self.click_element(element_name, sleep_after = 3)
		if element_name == 'random_item_name'
			p click_random_element(ari_get_product_list_page_content['multiple_locators']['item_name'])
			p page.current_url
		else
			locators = ari_get_product_list_page_content['base_locators']
			locators = locators.merge(ari_get_product_list_page_content['optional_locators'])
			locators = locators.merge(ari_get_product_list_page_content['filter_modal_locators'])
			find(:xpath, locators[element_name]).click
			sleep sleep_after
			p "I clicked #{element_name}"
		end
	end

	def self.click_filter_category(filter_category)
		filter_text = filter_category.sub('_accordion', '')
		locator = "//div[@role='presentation' and contains(.,'Filter')]//*[@aria-expanded and .//*[text() = '#{filter_text}']]"
		find(:xpath, locator).click
		sleep 3
		p "I click on #{filter_text} filter category"
	end

	def self.select_filter_accordion_category(filter_accordion_option)
		locator = "//div[@role='presentation' and contains(.,'Filter')]//*[@aria-expanded = 'true']/following-sibling::*//*[text() = '#{filter_accordion_option}']"
		find(:xpath, locator).click
		sleep 3
		p "I click on #{filter_accordion_option} filter option"
	end

	def self.remember_items_count_on_plp
		$ari_stored_information['items_count'] = get_current_items_count
	end

	def self.get_current_items_count
		count_text = find(:xpath, ari_get_product_list_page_content['base_locators']['product_count']).text
		p items_count = count_text.gsub('.', '').gsub(',', '').match(/\d+/).to_s.to_i
	end

	def self.check_current_items_become_less_or_equal
		current_items_count = get_current_items_count
		expect(current_items_count).to be <= $ari_stored_information['items_count']
		p "Items count less or equal. Current: #{current_items_count} previous: #{$ari_stored_information['items_count']}"
	end

	def self.get_items_prices
		items_prices_locator = ari_get_product_list_page_content['multiple_locators']['item_price']
		items_prices = []
		find_all(:xpath, items_prices_locator).each do |element|
			items_prices.push(element.text.sub('$','').sub(',','').to_f)
		end
		p items_prices
	end

	def self.expect_filter_price_in_range(start_value, end_value)
		p "Expecting prices in range #{start_value} - #{end_value}"
		p prices = get_items_prices
		prices.each do |item_price|
			expect(item_price).to be_between(start_value.to_f, end_value.to_f)
		end
		p "Prices are correct"
	end

	def self.click_sort_category(category)
		locator = "//*[@role='document' and contains(., 'Sort')]/descendant::*[contains(text(), '#{category}')]"
		find(:xpath, locator).click
		REV_ProductListingPage.wait_progress_bar
		p "I clicked #{category} on sort_modal"
	end

	def self.expect_sorted_content(content_type)
		p "Expecting #{content_type} content"
		prices = get_items_prices
		p prices
		if content_type == 'high_to_low'
			(1...prices.count).each do |i|
				expect(prices[i-1]).to be >= prices[i]
			end
		elsif content_type == 'low_to_high'
			(1...prices.count).each do |i|
				expect(prices[i-1]).to be <= prices[i]
			end
		end
	end

	def self.check_items_count_equal
		current_count = get_current_items_count
		expected_count = $ari_stored_information['items_count']
		expect(current_count).to eq expected_count
		p "Current count: #{current_count} expected count: #{expected_count}"
	end

	def self.click_subcategory_from_filter(category_name)
		locator = "//*[@role='document' and .//*[contains(text(), 'Categories')]]//*[text()='#{category_name}']"
		find(:xpath, locator).click
		sleep 2
		p "I clicked #{category_name} on subcategory filter"
	end

	def self.expect_subcategory_filter_categories
		categories = ari_get_product_list_page_content['subcategory_filter_modal_locators']['multiple_locators']['categories']
		p categories_count = find_all(:xpath, categories).count
		expect(categories_count).to be > 0
		p "I see subcategories on subcategory filter"
	end

	def self.get_items_names
		scroll_page
		names_locator = ari_get_product_list_page_content['multiple_locators']['item_name']
		items_names = []
		find_all(:xpath, names_locator).each do |element|
			items_names.push(element.text)
		end
		p items_names
	end

	def self.remember_items_names
		$ari_stored_information['items_names'] = get_items_names
	end

	def self.expect_extended_plp_content
		scroll_page
		base_locators = ari_get_product_list_page_content['base_locators']
		assert_elements(base_locators)
		scroll_page
		expect_items_content(true)
	end

	def self.expect_different_plp_items_names
		old_items_names = $ari_stored_information['items_names']
		extended_items_names = get_items_names
		new_items_names = extended_items_names[old_items_names.count .. extended_items_names.count - 1]
		p "Old names #{old_items_names}"
		p "New names #{new_items_names}"
		expect(old_items_names).not_to match_array(new_items_names)
		p "Names are different on plp"
	end

	def self.expect_no_content(content_name)
		if content_name == 'sort_popup'
			page.assert_no_selector(:xpath, "//*[@role='document']//*[contains(text(), 'Sort')]")
		end
		p "I can not see #{content_name}"
	end

end
