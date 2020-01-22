# In this module we collecting methods for account page of ANNIESELKE
require 'capybara/cucumber'


module AN_AccountPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.user_on_my_account_page
    sleep 5
    page.assert_selector(:xpath, "//div[@class='account-tile-links']")
    p  "I'm on 'My Account' Page"
  end
  def self.switch_radio_printed_materials
    radio_1 = find(:xpath,"//input[@id='ctl00_Body1_printoptionid_0']")
    radio_2 = find(:xpath,"//input[@id='ctl00_Body1_printoptionid_1']")
    update_btn = find(:xpath, "//a[@id= 'ctl00_Body1_submitbutton']")
    radio_check_count = 0
    if radio_1['checked'] == nil
      radio_1.click
      p  'clicked radio 1'
      update_btn.click
      radio_check_count = 1
      visit BASE_URL + '/secure/mailoptions.aspx'
      page.assert_selector(:xpath,"//input[@type='radio']")
      page.assert_selector(:xpath,"//input[@id='ctl00_Body1_printoptionid_0' and @checked='checked']") #radio checked
      p  "I've choosed Treat my account as a normal customer radio option and the change have been saved."
    elsif radio_2['checked'] == nil && radio_check_count == 0
      radio_2.click
      p  'clicked radio 2'
      update_btn.click
      radio_check_count = 2
      visit BASE_URL + '/secure/mailoptions.aspx'
      page.assert_selector(:xpath,"//input[@type='radio']")
      page.assert_selector(:xpath,"//input[@id='ctl00_Body1_printoptionid_1' and @checked='checked']") #radio checked
      p  "I've choosed Please send me ONLY Venus catalogs and information radio option and the change have been saved"
    end
  end

  def self.switch_radio_email_contacts
    radio_1 = find(:xpath,"//input[@id='ctl00_Body1_emailoptionid_0']")
    radio_2 = find(:xpath,"//input[@id='ctl00_Body1_emailoptionid_1']")
    update_btn = find(:xpath, "//a[@id= 'ctl00_Body1_submitbutton']")
    radio_check_count = 0

    if radio_1['checked'] == nil
      radio_1.click
      p  'clicked radio 1'
      update_btn.click
      radio_check_count = 1
      visit BASE_URL + '/secure/mailoptions.aspx'
      page.assert_selector(:xpath,"//input[@type='radio']")
      page.assert_selector(:xpath,"//input[@id='ctl00_Body1_emailoptionid_0' and @checked='checked']") #radio checked
      p  "I've choosed Please send me ALL emails regarding Venus, including sales and specials radio option and the change have been saved."
    elsif radio_2['checked'] == nil && radio_check_count == 0
      radio_2.click
      p  'clicked radio 2'
      update_btn.click
      radio_check_count = 2
      visit BASE_URL + '/secure/mailoptions.aspx'
      page.assert_selector(:xpath,"//input[@type='radio']")
      page.assert_selector(:xpath,"//input[@id='ctl00_Body1_emailoptionid_1' and @checked='checked']") #radio checked
      p  "I've choosed Please send me a maximum of 1 email per week containing specials, sales, and new merchandise. radio option and the change have been saved"
    end
  end
end
