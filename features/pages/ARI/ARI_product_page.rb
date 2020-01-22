require 'capybara/cucumber'

module ARI_ProductPage
	extend Capybara::DSL
	extend RSpec::Matchers
	PRODUCT_PAGE_PREFIX = "ariat:product_page:"

	def self.go_to_pdp(item_id)
		page.visit BASE_URL + ari_get_test_items(item_id)['pdp_link']
	end

	def self.expect_content(content_name)
		if content_name == 'product_page_content'
			expect_product_page_content
		elsif content_name == 'pop_up_content'
			expect_pop_up_content
		elsif content_name == 'product_images_content'
			expect_product_images_content
		elsif content_name.include? 'select_' and content_name.include? 'message'
			expect_message(content_name.sub('select_','').sub('_message',''))
		elsif content_name == 'recently_viewed_content'
			expect_recently_viewed_content
		elsif content_name == 'remembered_items_names'
			expect_remembered_items_names
		elsif content_name == 'size_guide_modal_content'
			expect_size_guide_modal_content
		else
			locators = ari_get_product_page_content['base_locators']
			locators = locators.merge(ari_get_product_page_content['optional_locators'])
			locator = locators[content_name]
			page.assert_selector(:xpath, locator)
			p "I see #{content_name} on product page"
		end
	end

	def self.expect_product_page_content
		scroll_page
		REV_ProductListingPage.wait_placeholders
		assert_elements(ari_get_product_page_content['base_locators'], "product_page")
	end

	def self.click_element(element_name, sleep_after = 1)
		p "Clicking on #{element_name}"
		if element_name == 'all_available_sizes'
			click_all_available_sizes
		elsif element_name.include? 'available'
			size_type = element_name.sub('available_','').sub('_button','')
			click_available_size(size_type)
		elsif element_name.include? 'color_button'
			click_color_button(element_name.sub('_color_button', ''))
		elsif element_name == 'random_recently_viewed_item'
			click_random_element(ari_get_product_page_content['recently_viewed_content']['multiple_locators']['items_names'])
		else
			locators = ari_get_product_page_content['base_locators']
			locators = locators.merge(ari_get_product_page_content['optional_locators'])
			page.assert_selector(:xpath, locators[element_name])
			find(:xpath, locators[element_name]).click
			sleep sleep_after
			p "I clicked #{element_name}"
		end
	end

	def self.get_available_size_locator_for(size_type)
		"(//*[@role='document' and descendant::*[text()='#{size_type}']]//*[@aria-label and not(@disabled)])"
	end

	def self.click_available_size(size_type)
		if size_type.downcase == 'width'
			click_available_width_size
		else
			self.click_element("#{size_type.downcase}_selector", 3)
			available_size_locator = get_available_size_locator_for(size_type.capitalize)
			p click_random_element(available_size_locator)
		end
		sleep 3
		p "I clicked available #{size_type} size"
	end

	def self.click_view_bag_popup
		self.click_element('view_bag_button')
	end

	def self.expect_element_with_value(element_name, expected_value)
		if element_name == 'size_selector'
			locator = "//*[@role='document']//*[@aria-label and not(@disabled)]//*[text()='#{expected_value}']"
			page.assert_selector(:xpath, locator)
			p "I see expected size: #{expected_value}"
		elsif element_name == 'current_item_qty'
			expect_current_item_qty(expected_value)
		elsif element_name == 'color_text'
			locator = ari_get_product_page_content['base_locators']['item_color']
			p color_text = find(:xpath, locator).text
			actual_color = color_text.sub('Color: ', '').downcase
			p "AR: #{actual_color} ER: #{expected_value.downcase}"
			expect(actual_color).to eq expected_value.downcase
			p "Colors match"
		end
	end

	def self.expect_current_item_qty(expected_value)
		scroll_page
		p item_qty = find(:xpath, ari_get_product_page_content['base_locators']['current_item_qty'])[:value]
		p "AR: #{item_qty.to_i} ER: #{expected_value.to_i}"
		expect(item_qty.to_i).to eq expected_value.to_i
		p "Qty is correct"
	end

	def self.click_available_width_size
		size_num = click_random_element(ari_get_product_page_content['multiple_locators']['available_width_sizes'])
		sleep 2
		p "I clicked #{size_num} width size"
	end

	def self.click_all_available_sizes
		scroll_page
		locators = ari_get_product_page_content['optional_locators']
		width_locator = ari_get_product_page_content['multiple_locators']['available_width_sizes']
		click_available_size("Size") if page.has_selector?(:xpath, locators['size_selector'])
		click_available_size("Waist") if page.has_selector?(:xpath, locators['waist_selector'], wait: 1)
		click_available_size("Length") if page.has_selector?(:xpath, locators['length_selector'], wait: 1)
		click_available_size("Width") if page.has_selector?(:xpath, width_locator, wait: 5)
		scroll_page
	end

	def self.remember_item_element(element_name)
		if element_name == 'item_name'
			element_text = find(:xpath, ari_get_product_page_content['base_locators']['item_name']).text
			$ari_stored_information[element_name] = element_text
			p "I remember #{element_text}"
		elsif element_name == 'item_name_for_rv'
			p item_name = find(:xpath, ari_get_product_page_content['base_locators']['item_name']).text
			unless $ari_stored_information['rv_items']
				$ari_stored_information['rv_items'] = []
			end
				p $ari_stored_information['rv_items'].push(item_name)
		end
	end

	def self.expect_pop_up_content
		assert_elements(ari_get_product_page_content['pop_up_locators'], "pop_up")
	end

	def self.expect_product_images_content
		main_image_locator = ari_get_product_page_content['base_locators']['item_main_image']
		all_images_locator = ari_get_product_page_content['multiple_locators']['item_gallery_images']
		p images_count = find_all(:xpath, all_images_locator).count
		expect(images_count).to be > 1
		(2..images_count).each do |image_number|
			find(:xpath, all_images_locator + "[#{image_number}]").click
			sleep 1
			page.assert_selector(:xpath, main_image_locator)
			p "I see main image for #{image_number} image"
		end
	end

	def self.click_color_button(color_number)
		locator = ari_get_product_page_content['multiple_locators']['color_buttons']
		find(:xpath, locator + "[#{color_number}]").click
		sleep 2
		p "I clicked #{color_number} color_number"
	end

	def self.expect_message(type)
		page.assert_selector(:xpath, "//*[contains(text(), 'Select your #{type.downcase}')]")
		p "I see #{type.downcase} message"
	end

	def self.expect_recently_viewed_content
		rv_label_locator = ari_get_product_page_content['recently_viewed_content']['recently_viewed_label']
		items_locators = ari_get_product_page_content['recently_viewed_content']['multiple_locators']
		page.assert_selector(:xpath, rv_label_locator)
		rv_items_count = find_all(:xpath, items_locators['items_prices']).count
		expect(rv_items_count).to be > 0
		(1..rv_items_count).each do |item_number|
			items_locators.each do |name, locator|
				item_locator = locator + "[#{item_number}]"
				scroll_to_element(item_locator, 0.2)
				page.assert_selector(:xpath, item_locator)
				p "I see #{name} on item #{item_number}"
			end
		end
	end

	def self.expect_remembered_items_names
		items_names_locator = ari_get_product_page_content['recently_viewed_content']['multiple_locators']['items_names']
		actual_items_names = []
		find_all(:xpath, items_names_locator).each do |element|
			actual_items_names.push(element.text)
		end
		p "AR: #{actual_items_names}"
		p expected_items_names = $ari_stored_information['rv_items']
		expected_items_names.each do |name|
			expect(actual_items_names).to include(name)
		end
		p "Items are correct"
	end

	def self.expect_size_guide_modal_content
		assert_elements(ari_get_product_page_content['size_guide_modal_locators'])
		sizes_locators = ari_get_product_page_content['size_guide_modal_multiple_locators']
		sizes_locators.each do |name, value|
			p "Expecting #{name}"
			p sizes_count = find_all(:xpath, value).count
			expect(sizes_count).to be >= 20
		end
	end

	def self.expect_no_content(content_name)
		if content_name == 'size_guide_modal'
			modal_locators = ari_get_product_page_content['size_guide_modal_locators']
			page.assert_no_selector(:xpath, modal_locators['header_text'], wait: 5)
			page.assert_no_selector(:xpath, modal_locators['us_size_to_label'], wait: 5)
		end
		p "I can`t see #{content_name} on product_page"
	end

end
