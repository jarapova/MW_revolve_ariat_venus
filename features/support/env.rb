#encoding: UTF-8
require 'logger'
require 'cucumber'
require 'capybara/cucumber'
require 'date'
require 'ostruct'
require 'selenium-webdriver'
require 'allure-cucumber'
require 'allure-ruby-commons'
require 'rspec'
require 'rspec-steps'
require 'capybara'
require 'capybara/dsl'
require 'true_automation/rspec'
require 'true_automation/driver/capybara'
require 'capybara-screenshot/cucumber'
require 'base64'
require 'fileutils'
require 'webdrivers/chromedriver'
require 'nokogiri'
require 'mail'

#===================================================== Capybara driver registration and adding of capabilities

options = Selenium::WebDriver::Chrome::Options.new
if ENV['CI']
  case ENV['CIRCLE_JOB']
  when 'test_run_job'
    p "Setting parameters for build job"
    options.add_argument('disable-gpu')
    options.headless!
  when 'api_test_job'
    p "Setting parameters for api test job"
    options.add_extension('features/data/plugins/har-export-trigger-master.crx')
  else
    p "No parameters for this type of job"
  end
end
options.add_argument('auto-open-devtools-for-tabs')
options.add_emulation(device_name: 'iPhone X')

Capybara.register_driver(:selenium_mobile) do |app|
  if TA_ENABLED
    p "True Automation driver is used"
    TrueAutomation::Driver::Capybara.new(app, options: options)
  else
    p "Default Selenium driver is used"
    Capybara::Selenium::Driver.new(app, :browser => :chrome, options: options)
  end
end

include TrueAutomation::DSL
World(Capybara::DSL)
#===================================================== Capybara default options

Capybara.default_max_wait_time = 12
Capybara.default_driver = :selenium_mobile
MAX_WAIT_PLACEHOLDERS = 60

#===================================================== Allure configurations

ALLURE_RESULTS_DIR = 'gen/allure-results'
Allure.configure do |c|
  c.results_directory = ALLURE_RESULTS_DIR
end
# Method and constant will be triggered in hooks.rb file
CLEAR_ALLURE_DIRECTORY = true

def clear_allure_directory
  if File.exists?(ALLURE_RESULTS_DIR)
    FileUtils.rm_rf(ALLURE_RESULTS_DIR)
    p "Allure results directory has been cleared"
  end
end

#===================================================== Screenshots definitions

Capybara::Screenshot.autosave_on_failure = false
Capybara::Screenshot.prune_strategy = :keep_last_run

# Methods and constants will be triggered in hooks.rb file
SCREENSHOT_DIR = "gen/screenshots_and_logs/"
API_LOG_PATH = 'gen/entries_log.json'

def add_screenshot
  time = DateTime.now.strftime('%s')
  file_path = SCREENSHOT_DIR + "screenshot-#{time}.png"
  page.save_screenshot(file_path, full: true)
end

def clear_screenshot_dir
  if File.exists?(SCREENSHOT_DIR)
    FileUtils.rm_rf(SCREENSHOT_DIR)
    p "Screenshot directory has been cleared"
  end
end