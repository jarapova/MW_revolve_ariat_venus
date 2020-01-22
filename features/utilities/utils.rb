require 'yaml'

USERS = YAML.load_file(File.join(__dir__, '../data/users.yaml'))
TEST_ENVIRONMENTS = YAML.load_file(File.join(__dir__, '../data/test_environments.yaml'))


def get_user(id)
  USERS['users'][id]
end

#Method allows to specify loading time for page, after this time
# Capybara will return page timeout exception
def set_page_timeout(seconds)
  page.driver.browser.manage.timeouts.page_load = seconds
end

# Method return PWA test environment for testing, else it will
# return error code 1 – wrong pwa site name,
# 2 – wrong pwa site version
def get_test_environments_url(site, version)
  begin
    environment_url = TEST_ENVIRONMENTS[site][version]
  rescue Exception
    return 1
  end
  if environment_url.nil?
    2
  else
    environment_url
  end
end

# Smart alias for ta function (see TrueAutomation doc).
# If enable_ta is set to true it return TrueAutomation
# smart locator, else method will return default
# xpath (initial) locator
def m_ta(ta_locator, initial_locator)
  if TA_ENABLED
    ta(ta_locator, initial_locator)
    # t = Time.now.to_i
    # ta("#{ta_locator}#{t}", initial_locator) #рандом
  else
    initial_locator
  end
end

# Requires har_export_trigger to be added in webdriver options.
# Method will collect all network entries for current
# page and return it as JSON string
def get_current_network_entries
  p "Fetching network entries..."
  begin
    har_json_string = page.execute_script(
        "return (async () => {
  console.log('before req');
  const test = await HAR.triggerExport();
  console.log('test:', test);
  return JSON.stringify(test.entries);
})();")
    p "Entries fetching success"
  rescue Exception
    p "Error in script"
    har_json_string = %{{"Error":"Unable to fetch data"}}
  end
  har_json_string
end

# Method takes a multiple locator covered with round brackets
# and then finds all elements on page and click on a random.
# Returns a number of clicked element
def click_random_element(elements_xpath)
  elements_count = find_all(:xpath, elements_xpath).count
  expect(elements_count).to be > 0
  random_number = Random.rand(1..elements_count)
  element_xpath = elements_xpath + "[#{random_number}]"
  scroll_to_element(element_xpath)
  find(:xpath, element_xpath).click
  random_number
end

#Method takes a hash or an array of locators like
# {element_name: xpath_locator} and then will assert they presented
# on page.
def assert_elements(elements, page_name = 'page', ta_prefix = nil)
  if (elements.is_a? Array) and (elements.count > 0)
    (0..elements.count - 1).each do |i|
      if ta_prefix
        page.assert_selector(:xpath, m_ta(ta_prefix + i.to_s, elements[i]))
      else
        page.assert_selector(:xpath, elements[i])
      end
      p "I see #{i} element on #{page_name}"
    end
  elsif elements.is_a? Hash
    elements.each do |name, locator|
      if ta_prefix
        page.assert_selector(:xpath, m_ta(ta_prefix + name, locator))
      else
        page.assert_selector(:xpath, locator)
      end
      p "I see #{name} on #{page_name}"
    end
  else
    raise StandardError.new "Unsupported set of selectors #{elements.class}"
  end
end

# Returns a string with every word capitalized
def camel_case(str)
  str.split.map!(&:capitalize).join(' ')
end

# Method will return a hash with number of item and item locator from
# item string like "item_1_button" so the structure is
# item _ itemNumber _ second_Part_Of_Item_String
def parse_item_value(item_string)
  item_number = item_string.sub('item_', '').to_i
  item_locator_name = item_string.sub("_#{item_number}", "")
  p "Name: #{item_locator_name} Number:#{item_number}"
  {
      locator_name: item_locator_name,
      number: item_number,
      ta_name: item_locator_name + "_" + item_number.to_s
  }
end

# Generates random email, that can be used in subscription fields
def generate_email
  length = Random.rand(5..14)
  str = ''
  length.times do
    str += Random.rand(97..122).chr
  end
  str += '@gmail.com'
end

#Method will return an URL endpoint string
# without adress inside server and
# without www. or https:// prefix
def parse_environment(url)
  url = url.sub('https://', '')
  url = url.sub('www.','')
  url[0...url.index('/')]
end

# Method will scroll to element through executing
# JS method. If xpath is broken then it will
# print an Error message in console and
# sleep for 1 sec
def scroll_to_element(xpath, sleep_after = 0.5)
  begin
    page.execute_script(%{document.evaluate("#{xpath}",
        document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView();})
    sleep sleep_after
  rescue Exception
    p "Couldn't evaluate script"
    sleep 1
  end
end

# Completely scrolls down the page and scroll back to top
# You can pass sleep between every scroll, sleep
# after getting back to top and how many steps
# method will use for scrolling down
def scroll_page(sleep_between_tap = 0.3, after_sleep_time = 1.5, steps_count = 10)
  scroll_to_bottom(steps_count, sleep_between_tap)
  p "Scrolled to bottom"
  page.execute_script("window.scrollTo(0,0);")
  sleep after_sleep_time
  p "Page updated"
end

# Scrolls to bottom of the page. Takes a integer value of
# how many steps should be used for scrolling down
# and sleep after every step
def scroll_to_bottom(steps_count = 10, sleep_between_tap = 0.5)
  (0..steps_count).each do |i|
    page.execute_script("window.scrollTo(0,document.body.scrollHeight*#{i.to_f/steps_count});")
    sleep sleep_between_tap
  end
end

# Alias for refreshing the page
def update_page
  page.visit(page.current_url)
end

# Alias for sleep
def wait(duration)
  duration = duration.to_f
  sleep duration
end

# Alias for going back in browser
def go_back
  page.go_back
end

# Method will set a new cookie with parameters:
# name, value, path and that cookie is secure
def my_set_cookie(name, value, path = '/', secure = false)
  page.driver.browser.manage.add_cookie(name: name, value: value, path: path, secure: secure)
  update_page
  p "Cookie setted"
end

# A method that will be triggered by adding a @flaky tag for
# a scenario. Method takes a screenshots of the whole page
# and returns an array of paths to screenshots.
# Visible_height – is a constant that represents mobile screen height.
# Now it is set for default value for IPhone X in chromedriver
Visible_height = 810.0
def make_full_screen_screenshots
  p max_height = page.execute_script("return document.body.scrollHeight;")
  screenshots_paths = []
  screens_count = (max_height.to_f/Visible_height).round
  (0..screens_count+1).each do |i|
    page.execute_script("window.scrollTo(0,#{i*Visible_height});")
    sleep 0.1
    screenshots_paths.push(add_screenshot)
  end
  screenshots_paths
end

# A method that will click each element by give multiple elements xpath.
# Wrapping element in round brackets is not necessary, method
# will do this by itself. Method will return true if
# any element was clicked else method will return false
def click_all_elements(xpath, sleep_between = 2)
  element_xpath = "(" + xpath + ")"
  elements_count = find_all(:xpath, element_xpath).count
  p "Elements on page: #{elements_count}"
  if elements_count == 0
    p "No elements on page"
    false
  else
    elements_count.times do
      find(:xpath, element_xpath + "[1]").click
      sleep sleep_between
    end
    p "All elements clicked"
    true
  end
end