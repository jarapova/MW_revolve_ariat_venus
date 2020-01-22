require 'capybara/cucumber'

module ARI_HeaderPage
	extend Capybara::DSL
	extend RSpec::Matchers
	HEADER_PREFIX = "ariat:header:"

	@@categories = ['Men', 'Women', 'Kids', 'Clearance']

	def self.click_element(element_name, sleep_after = 1, sleep_before = 0)
		locators = ari_get_header_content['optional_locators']
		locators = locators.merge(ari_get_header_content['base_locators'])
		locator = locators[element_name]
		sleep sleep_before
		sleep 3
		find(:xpath, locator).click
		sleep sleep_after
		p "I click #{element_name} on header"
	end

	def self.navigate_to_category_from_carousel(category_name)
		if category_name == 'random_category'
			p category_text = @@categories[Random.rand(0..3)]
		else
			category_text = category_name
		end
		locator = "//a[@href and contains(text(), '#{category_text}') and not(ancestor::*[@data-page])]"
		find(:xpath, locator).click
		sleep 1
		p "I clicked #{category_name} category from main navigation carousel"
	end

	def self.search_modal_type_term(term)
		search_locator = ari_get_header_content['search_locators']['input_field']
		find(:xpath, search_locator).set(term)
		sleep 1
		p "I set term: #{term}"
	end

	def self.expect_content(content_name)
		if content_name == 'empty_search_modal_content'
			expect_empty_search_modal_content
		elsif content_name == 'search_results_content'
			expect_search_results_content
		elsif content_name == 'main_navigation_carousel'
			expect_main_navigation_carousel
		elsif content_name == 'promotional_content'
			 expect_promotional_content
		end
	end

	def self.expect_promotional_content
		sleep 5
		assert_elements(ari_get_header_content['promotional_content'], "header")
	end

	def self.expect_main_navigation_carousel #ta_bug
		@@categories.each do |category|
			page.assert_selector(:xpath, "//a[@href and contains(text(), '#{category}')]")
			p "I see main navigation carousel #{category.capitalize} category"
		end
	end

	def self.expect_empty_search_modal_content
		assert_elements(ari_get_header_content['empty_search_modal_content'],
										"search_modal",
										HEADER_PREFIX + "search:")
	end

	def self.click_suggested_search(element_name)
		if element_name.include? 'random'
			click_random_element(ari_get_header_content['multiple_locators']['search_items']['items_names'])
		else
			locator = ari_get_header_content['search_locators'][element_name]
			ta_locator = HEADER_PREFIX + "search:" + element_name
			find(:xpath, m_ta(ta_locator, locator)).click
			sleep 1
		end
		p "I clicked #{element_name}"
	end

	def self.expect_search_results_content
		search_results_locators = ari_get_header_content['multiple_locators']['search_items']
		results_count = find_all(:xpath, search_results_locators['items_names']).count
		expect(results_count).to be > 0
		(1..results_count).each do |result_number|
			search_results_locators.each do |name, locator|
				page.assert_selector(:xpath, locator + "[#{result_number}]")
				p "I see #{name} in #{result_number} result"
			end
		end
	end

	def self.expect_element_with_value(element_name, expected_value)
		element_locator = ari_get_header_content['optional_locators'][element_name]
		element_text = find(:xpath, element_locator).text
		actual_value = element_text
		if element_name == 'cart_items_count'
			sleep 15
			actual_value = actual_value.to_i
			expected_value = expected_value.to_i
		end
		p "AR: #{actual_value} ER: #{expected_value}"
		expect(actual_value).to eq expected_value
		p "#{element_name} has correct value"
	end

	def self.expect_no_content(content_name)
		if content_name == 'promotional_content'
			page.assert_no_selector(:xpath, ari_get_header_content['promotional_content']['promotional_text'])
			p "I can't see promotional content on header"
		end
	end
end
