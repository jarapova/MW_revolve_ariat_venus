require 'capybara/cucumber'

module ARI_HamburgerMenuPage
	extend Capybara::DSL
	extend RSpec::Matchers
	HAMBURGER_PREFIX = "ariat:hamburger_menu:"

	def self.click_hamburger_element(element_name, sleep_after = 1.5)
		if element_name == 'two_24_button'
			find(:xpath, "//a[contains(@href, 'two24')]").click
		elsif element_name.include? 'back_button'
			click_back_button(element_name.sub('_back_button', ''))
		else
			$ari_stored_information['hamburger_category'] = element_name
			locator = "//*[@role='document']//*[text() = '#{element_name}']"
			find(:xpath, locator).click #ta_bug
			sleep sleep_after
		end
			p "I clicked #{element_name}"
	end

	def self.expect_content(content_name)
		if content_name == 'hamburger_first_page_content'
			expect_hamburger_first_page_content
		elsif content_name == 'hamburger_menu_content'
			expect_hamburger_menu_content
		elsif content_name == 'legacy_hamburger_menu_content'
			expect_legacy_hamburger_content
		else
			element_locator = ari_get_hamburger_menu_content['base_locators'][content_name]
			page.assert_selector(:xpath, m_ta(HAMBURGER_PREFIX + content_name, element_locator))
			p "I see #{content_name} on hamburger menu"
		end
	end

	def self.expect_hamburger_menu_content
		if $ari_stored_information['hamburger_category']
			current_category = $ari_stored_information['hamburger_category'].capitalize
			locator = "(//*[@role='button' and parent::*[not(contains(@amp-bind, '0'))]]//*[text()='#{current_category}'])"
			page.assert_selector(:xpath, locator)
			p "I am on #{current_category} category"
		end
		page.assert_text('View all')
		p categories_count = find_all(:xpath, "//*[@role='document']//*[contains(@amp-bind, '1.')]//*[text()]").count
		expect(categories_count).to be > 2
		p "I see hamburger_menu_content"
	end

	def self.expect_hamburger_first_page_content
		categories = ["Men", "Women", "Kids", "Clearance", "Sign in", "Find a retailer", "Support"]
		prefix = HAMBURGER_PREFIX + "categories:"
		categories.each do |category|
			locator = "//*[@role='document']//*[contains(text(),'#{category}')]"
			ta_locator = prefix + category.downcase.gsub(' ', '_')
			page.assert_selector(:xpath, m_ta(ta_locator, locator)) #ta_bug
			p "I see #{category} category on hamburger"
		end
		self.expect_content("country_button")
	end

	def self.expect_legacy_hamburger_content
		categories = ["Men", "Women", "Kids", "Clearance", "Sign In", "Authorized Retailer", "Support"]
		categories.each do |category|
			page.assert_selector(:xpath, "//*[contains(text(), '#{category}')]")
			p "I see #{category} on legacy hamburger"
		end
	end

	def self.click_back_button(button_number)
		find(:xpath, "((//*[@role='document']/descendant::ul[#{button_number}])//*[text()])[1]").click
		sleep 2
		p "I clicked back_button"
	end

end
