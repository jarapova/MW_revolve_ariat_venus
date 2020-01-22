require 'capybara/cucumber'

module ARI_FooterPage
	extend Capybara::DSL
	extend RSpec::Matchers

	def self.expect_content(content_name)
		if content_name == 'accordions_and_links_content'
			expect_accordions_and_links_content
		elsif content_name == 'email_offers_content'
			expect_email_offers_content
		end
	end

	def self.expect_accordions_and_links_content
		accordions = ari_get_footer_content['footer_accordions']
		accordions.each do |name, accordion|
			# locator = "//*[@aria-expanded and .//*[text() = '#{accordion['accordion_name']}']]"
			# locator = "//*[text() = '#{accordion['accordion_name']}']"
			locator = "//h6[text() = '#{accordion['accordion_name']}']"
			page.assert_selector(:xpath, locator)
			find(:xpath, locator).click
			sleep 2
			p "I clicked #{name} accordion"
			links = accordion['accordion_links']
			links.each do |link_name|
				# page.assert_selector(:xpath, "//*[@aria-expanded = 'true']/following-sibling::*//*[text()='#{link_name}']")
				page.assert_selector(:xpath, "//p[text()='#{link_name}']")
				p "I see #{link_name} on #{name} accordion"
			end
		end
		# expect_partnerships_accordion
	end

	def self.expect_partnerships_accordion
		locator = "//*[@aria-expanded and .//*[text() = 'PARTNERSHIPS']]"
		page.assert_selector(:xpath, locator)
		find(:xpath, locator).click
		sleep 2
		p partnerships_count = find_all(:xpath, "//*[@aria-expanded = 'true']/following-sibling::*//img[@src]").count
		expect(partnerships_count).to be > 1
		p "I see partnerships content"
	end

	def self.set_element_with_value(element_name, element_value)
		if element_name == 'email_input'
			locators = ari_get_footer_content['email_offers_content']
			find(:xpath, locators['email_input']).set(element_value)
			sleep 0.1
		end
	end

	def self.expect_email_offers_content
		assert_elements(ari_get_footer_content['email_offers_content'], 'footer')
	end

	def self.click_element(element_name, sleep_after = 1)
		locators = ari_get_footer_content['email_offers_content']
		find(:xpath, locators[element_name]).click
		sleep sleep_after
		p "I see #{element_name}"
	end

end
