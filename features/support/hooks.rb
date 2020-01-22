if ENV['pwa']
  PWA = ENV['pwa']
else
  PWA = 'venus'
end

if ENV['version']
  PWA_VERSION = ENV['version']
else
  PWA_VERSION = 'prod'
end

if ENV['enable_ta']
  TA_ENABLED = true
else
  TA_ENABLED = false
end

PASSED_SCENARIOS = 0
FAILED_SCENARIOS = 0

# This hook is used for making screenshots for failed scenarios
# and also it will show whether test failed or passed for more
# efficient debugging
After do |scenario|
  # def delete_saved_elements
  #   port = URI.parse(Capybara.current_session.driver.options[:url]).port
  #
  #   base_url = "http://localhost:#{port}"
  #   url = URI("#{base_url}/clear_elements")
  #
  #   http = Net::HTTP.new(url.host, url.port)
  #   request = Net::HTTP::Delete.new(url)
  #   response = http.request(request)
  #
  #   if response.code == 200.to_s
  #     puts "All elements were deleted"
  #   else
  #     puts "Elements can not be deleted"
  #     puts response.body
  #   end
  # end
  #
  # delete_saved_elements
  #
  if scenario.failed?
    if ENV['screenshot_on_fail']
      path_to_screenshot = add_screenshot
      Allure.add_attachment(name: "screenshot on fail",
                            source: File.open(path_to_screenshot),
                            type: Allure::ContentType::PNG,
                            test_case: true)
      p "screenshot saved #{path_to_screenshot}"
      if scenario.source_tag_names.include? '@flaky'
        p "Flaky test executing full screenshot operation"
        make_full_screen_screenshots.each do |screenshot_path|
          Allure.add_attachment(name: "screenshot on fail",
                                source: File.open(screenshot_path),
                                type: Allure::ContentType::PNG,
                                test_case: true)
        end
      end
    end
    FAILED_SCENARIOS += 1 if ENV['send_email']
    if ENV['api']
      p "API test failed"
      $api_entries_log['failed_page_entries'] = get_current_network_entries
      p "Preparing to send email"
      html_message = get_api_test_html_template(ENV['CIRCLE_BUILD_URL'])
      begin
      get_emails("api").each do |name, email|
        p "Sending to #{name}..."
        send_email_message(email, "API automation testing failure", html_message)
      end
      rescue Exception
        p "Email sending failed"
      end
    end
  end
  if scenario.passed?
    p 'Passed'
    PASSED_SCENARIOS += 1 if ENV['send_email']
  end
  if ENV['api']
    p "Saving API logs..."
    $api_entries_log.each do |key, value|
      $api_entries_log[key] = JSON.parse value
    end
    directories = File.dirname(API_LOG_PATH)
    FileUtils.mkdir_p(directories) unless File.directory?(directories)
    f = File.open(API_LOG_PATH, 'w')
    f.puts $api_entries_log.to_json.to_s
    f.close
    p "API logs saved successfully"
  end
end

# This hook is used for clearing screenshot directory
# and allure results directory
# New version of Allure 2.10.0.beta3 does not support this feature by default.
# In addition, this hook set up BASE_URL constant for identifying base URL of
# testing site
AfterConfiguration do
  clear_screenshot_dir
  clear_allure_directory if CLEAR_ALLURE_DIRECTORY
  environment = get_test_environments_url(PWA, PWA_VERSION)
  if environment == 1
    p "Wrong pwa: #{PWA}"
    exit 1
  elsif environment == 2
    p "Wrong version: #{PWA_VERSION} for site: #{PWA}"
    exit 2
  else
    BASE_URL = environment
  end
  p "Testing site: #{PWA} version: #{PWA_VERSION} environment: #{BASE_URL} TA:#{TA_ENABLED}"
end

Around("@special") do |scenario, block|
  5.times do
    block.call
  end
end
# This hook will create file to show
# environment properties in allure report
# and will add there necessary information.
# Also it will make email broadcast for
# emails specified in yaml file
at_exit do
  if File.exists?("gen/allure-results")
    p "Generating properties of env file..."
    f = File.open('gen/allure-results/environment.properties', 'w')
    f.puts "PWA: #{PWA}"
    f.puts "Version: #{PWA_VERSION}" if ENV['version']
    f.puts "Base_URL: #{BASE_URL}"
    f.puts "Device emulation: iPhone X"
    f.close
    p "Generating successful"
  end
  if ENV['send_email']
    env_info = "PWA: #{PWA} Version: #{PWA_VERSION} BASE_URL: #{BASE_URL} Branch: #{ENV['CIRCLE_BRANCH']}"

    html_message = get_html_template(PASSED_SCENARIOS,
                                     FAILED_SCENARIOS,
                                     env_info,
                                     ENV['CIRCLE_BUILD_URL'],
                                     get_allure_build_link)
    get_emails("framework_tests").each do |name, email|
      p "Sending to #{name}..."
      send_email_message(email, "Test automation notification", html_message)
    end
  end
end