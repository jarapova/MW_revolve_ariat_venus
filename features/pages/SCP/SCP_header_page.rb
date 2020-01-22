require 'capybara/cucumber'

module SCP_HeaderPage
extend Capybara::DSL
extend RSpec::Matchers

HEADER_PREFIX = "shoecarnival:header:"
SEARCH_PREFIX = HEADER_PREFIX + "search_modal:"

  def self.close_search_modal
    self.click_element("close_modal_button")
  end

  def self.click_search_btn
    self.click_element("find_button")
  end

  def self.expect_content(content_name)
    if content_name.include? 'banner'
      expect_promotional_banner(content_name.sub('_promotional_banner',''))
    elsif content_name == 'search_modal'
      search_field_locator = scp_get_header_content['search_modal_content']['search_field_input']
      ta_locator = SEARCH_PREFIX + 'search_field_input'
      page.assert_selector(:xpath, m_ta(ta_locator, search_field_locator))
      p "I see search modal"
    elsif content_name == 'closest_store'
      expect_closest_store
    elsif content_name == 'search_modal_content'
      expect_search_modal_content
    elsif content_name == 'stores_list_content'
      expect_stores_list_content
    elsif content_name.include? 'store_name'
      expect_remembered_store(content_name)
    end
  end

  def self.expect_promotional_banner(user_type)
    banner_block_locator = "//*[@aria-hidden='false' and @data-swipeable='true']"
    page.assert_selector(:xpath, banner_block_locator)
    messages = scp_get_header_content['text_for_promotional_banner'][user_type]
    text_locator = ''
    messages.each do |message_num, message|
      text_locator += banner_block_locator + "//*[contains(text(), '#{message}')] | "
    end
    p text_locator[0..text_locator.length-3]
    page.assert_selector(:xpath, text_locator[0..text_locator.length-3])
  end

  def self.click_suggested_search(element_name)
    self.click_element(element_name)
  end

  def self.click_element(element_name)
    if element_name == 'random_suggested_category'
      click_random_suggested_category
    elsif element_name == 'random_suggested_item'
      click_random_suggested_item
    else
      locators = scp_get_header_content['base_locators']
      locators = locators.merge scp_get_header_content['closest_store']
      locators = locators.merge scp_get_header_content['search_modal_content']
      element_locator = locators[element_name]
      element_ta_locator = HEADER_PREFIX + element_name
      page.assert_selector(:xpath, m_ta(element_ta_locator, element_locator))
      find(:xpath, m_ta(element_ta_locator, element_locator)).click
      p "I clicked #{element_name}"
    end
  end

def self.click_random_suggested_item
  p click_random_element(scp_get_header_content['search_modal_multiple_locators']['items_names'])
end

def self.click_random_suggested_category
  suggested_results_locator = "(//div[@role='presentation']//form/following-sibling::*//a[@href]//*[text()][1])"
  items_locator = scp_get_header_content['search_modal_multiple_locators']['items_names']
  suggested_pdp_count = find_all(:xpath, items_locator).count
  all_suggested_results_count = find_all(:xpath, suggested_results_locator).count
  p "PDP: #{suggested_pdp_count} total results: #{all_suggested_results_count}"
  random_number = Random.rand(1..all_suggested_results_count - suggested_pdp_count)
  find(:xpath, suggested_results_locator + "[#{random_number}]").click
  p "I clicked #{random_number} result"
end

  def self.expect_search_modal_content
    modal_locators = scp_get_header_content['search_modal_content']
    modal_locators.each do |name, locator|
      page.assert_selector(:xpath, m_ta(SEARCH_PREFIX + name, locator))
      p "I see #{name} on search_modal"
    end
    suggested_items_multiple_locators = scp_get_header_content['search_modal_multiple_locators']
    items_count = find_all(:xpath, suggested_items_multiple_locators['items_names']).count
    expect(items_count).to be > 0
    (1..items_count).each do |item_number|
      suggested_items_multiple_locators.each do |name, locator|
        ta_locator = SEARCH_PREFIX + name + item_number.to_s
        scroll_to_element(locator + "[#{item_number}]")
        page.assert_selector(:xpath, m_ta(ta_locator, locator + "[#{item_number}]"))
        p "I see #{name} on #{item_number}"
      end
    end
  end

  def self.search_modal_type_term(term)
    search_field_locator = scp_get_header_content['search_modal_content']['search_field_input']
    find(:xpath, search_field_locator).set(term)
    p "Term: #{term} is set to search modal"
  end

  def self.expect_closest_store
    wait_for_closest_store_loading
    scp_get_header_content['closest_store'].each do |name, locator|
      page.assert_selector(:xpath, m_ta(HEADER_PREFIX + name, locator))
      p "I see #{name} on closest store section"
    end
  end

  def self.wait_for_closest_store_loading
    time = Time.now
    closest_store_text_locator = scp_get_header_content['closest_store']['closest_store_value']
    ta_locator = HEADER_PREFIX + 'closest_store_value'
    p "Waiting for closest store loading"
    loop do
      sleep 0.5
      text = find(:xpath, m_ta(ta_locator, closest_store_text_locator)).text
      break unless (text.include? 'Loading' or (Time.now - time) > 30)
    end
  end

  def self.set_element_with_value(element_name, value)
    if element_name == 'closest_store_input'
      find(:xpath, "//*[@role='presentation']//input").set(value)
      find(:xpath, "//*[@role='presentation']//input").native.send_keys(:enter)
      p "#{value} is set for #{element_name}"
    end
  end

  def self.expect_stores_list_content
    multiple_locators = scp_get_header_content['closest_stores_multiple_locators']
    stores_count = find_all(:xpath, multiple_locators['store_name']).count
    expect(stores_count).to be > 0
    (1..stores_count).each do |store_number|
      multiple_locators.each do |name, locator|
        page.assert_selector(:xpath, locator + "[#{store_number}]")
        p "I see #{name} on #{store_number}"
      end
    end
  end

  def self.click_closest_store(store_element)
    store = parse_store_element(store_element)
    element_locator = scp_get_header_content['closest_stores_multiple_locators'][store[:locator_name]]
    find(:xpath, element_locator + "[#{store[:number]}]").click
    p "I clicked #{store_element}"
  end

  def self.remember_closest_store_content(content_name)
    store = parse_store_element(content_name)
    element_locator = scp_get_header_content['closest_stores_multiple_locators'][store[:locator_name]]
    p $shoecarnival_stored_information[content_name] = find(:xpath, element_locator + "[#{store[:number]}]").text
  end

  def self.parse_store_element(store_element)
    store_number = store_element.to_i
    store_locator_name = store_element.sub("#{store_number}_", "")
    {number: store_number, locator_name: store_locator_name}
  end

  def self.expect_remembered_store(store_key)
    expected_store_name = $shoecarnival_stored_information[store_key]
    actual_store_name = find(:xpath, scp_get_header_content['closest_store']['closest_store_value']).text
    p "AR: #{actual_store_name} ER:#{expected_store_name}"
    expect(actual_store_name).to include expected_store_name
    p "remembered store is correct"
  end

  def self.expect_no_content(content_name)
    sleep 5
    if content_name == 'search_modal'
      page.assert_no_selector(:xpath, scp_get_header_content['search_modal_content']['search_field_input'])
    else
      locators = scp_get_header_content['base_locators']
      locators = locators.merge(scp_get_header_content['count_locators'])
      page.assert_no_selector(:xpath, locators[content_name])
      p "I can't see #{content_name}"
    end
    p "I can't see #{content_name} on page"
  end

  def self.expect_element_with_value(element_name, element_value)
    if element_name == 'cart_items_count'
      sleep 15
      element_locator = scp_get_header_content['count_locators'][element_name]
      p element_text = find(:xpath, element_locator).text
      expect(element_text).to eq element_value
    end
  end

end
