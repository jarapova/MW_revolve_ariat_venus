require 'capybara/cucumber'

module ARI_SignInPage
	extend Capybara::DSL
	extend RSpec::Matchers
	SIGN_IN_PREFIX = "ariat:sign_in_page:"

	def self.make_login_as(username) #ta_bug
		ARI_CartPage.close_location_modal
		ARI_CartPage.accept_cookie_modal
		user_info = get_user(username)
		locators = ari_get_sign_in_page_content['base_locators']
		find(:xpath, locators['email_input']).set(user_info['email'])
		find(:xpath, locators['password_input']).set(user_info['password'])
		sleep 1
		find(:xpath,locators['log_in_button']).click
		p "I have logged in as #{username}"
	end

	def self.expect_content(content_name)
		if content_name == 'sign_in_page_content'
			expect_sign_in_page_content
		elsif content_name == 'email_sign_up_content'
			expect_email_sign_up_content
		end
		p "I see #{content_name} on sign in page"
	end

	def self.expect_sign_in_page_content
		ARI_CartPage.close_location_modal
		ARI_CartPage.accept_cookie_modal
		assert_elements(ari_get_sign_in_page_content['base_locators'], "sign_in_page")
	end

	def self.expect_email_sign_up_content
		# assert_elements(ari_get_sign_in_page_content['email_offers_sign_up_locators'], "sign_in_page")
		# page.assert_selector(:xpath, "//*[@id='ltkframe']")
		page.assert_selector(:xpath, "//*[text()='Get the email updates you want!']")
	end
end
