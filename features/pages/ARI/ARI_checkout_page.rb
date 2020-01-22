require 'capybara/cucumber'

module ARI_CheckoutPage
	extend Capybara::DSL
	extend RSpec::Matchers

	def self.expect_content(content_name)
		if content_name == 'checkout_content'
			expect_checkout_content
		end
	end

	def self.expect_checkout_content
		assert_elements(ari_get_checkout_page_content['base_locators'])
	end

end
