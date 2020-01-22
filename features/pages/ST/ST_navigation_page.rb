# In this module we collecting methods for navigation page of ST
require 'capybara/cucumber'


module ST_NavigationPage
  extend Capybara::DSL
  extend RSpec::Matchers
  def self.select_random_item
    page.assert_selector(:xpath, "//div[@id]//*[contains(.,'$')]/ancestor::li")
    item_count_on_page = find_all(:xpath, "//div[@id]//*[contains(.,'$')]/ancestor::li").count
    random_item_index = Random.rand(1...item_count_on_page)
    item_name,  item_price,  item_price_discount = get_item_paramenters_from_list(random_item_index)
    p  "I see #{item_name} with price #{item_price} and discount #{item_price_discount}"

    find(:xpath, "(//div[@id]//*[contains(.,'$')]/ancestor::li)[#{random_item_index}]").click
    p  "I've clicken on #{item_name} image"
    expect(page).to have_text(item_name)
    p  "Name is correct on PDP page"
    return item_name, item_price, item_price_discount
  end

  def self.go_to_url(arg)
    visit BASE_URL+"#{arg}"
  end

  def self.get_item_paramenters_from_list(item_index_in_the_list)
    p item_name = find(:xpath, "(//div[@id]//*[contains(.,'$')]/ancestor::li//h6)[#{item_index_in_the_list}]").text
    item_text = find(:xpath, "(//div[@id]//*[contains(.,'$')]/ancestor::li)[#{item_index_in_the_list}]").text
    item_parameters = item_text.split(/\n/)
    p item_price_value =item_parameters[0]
    p item_price_discount_value =item_parameters[1]
    return item_name , item_price_value, item_price_discount_value
  end


  def self.close_rewards_modal
    banner_count = find_all(:xpath, "//div[@data-modal-id='modal-join-rewards']").count
    # if find(:xpath, "//div[@data-modal-id='modal-join-rewards']", visible: false)['style'] =='display: block;'
    if banner_count == 1
      find(:xpath, "//div[@data-modal-id='modal-join-rewards']//button[@data-modal-close]").click
      p  "I've closed rewards modal"
    elsif
    p"I don't see join rewards modal"
    end
  end
  def self.close_acs_full_screen_container
    banner_count = find_all(:xpath, "//div[@class='acsClassicInner']").count
    if banner_count == 1
      find(:xpath, "//div[@id='acsFullScreenContainer']//a[text()='✕']").click
      p  "I've closed acsFullScreenContainer modal"
    elsif
    p"I don't see acs_full_screen_container modal"
    end
  end
  def self.close_lightbox_modal
    banner_count = find_all(:xpath, "//div[@class='modal lightbox-modal']").count
    if banner_count == 1
      find(:xpath, "//div[@class='modal lightbox-modal']//*[text()='×']").click
      p  "I've closed acsFullScreenContainer modal"
    elsif
    p"I don't see join lightbox modal"
    end
  end
end