require 'capybara'
require 'capybara/dsl'
require 'cucumber'
require 'rspec'
require 'site_prism'
require 'faker'
require 'selenium-webdriver'
require 'active_support/dependencies'
require 'pry'
require 'require_all'
require Dir.pwd + '/lib/lib_require.rb'

#used to load all files within the lib folder
#this will load all of the page object classes and helpers
ActiveSupport::Dependencies.autoload_paths << File.expand_path(File.join(Dir.pwd, 'lib'))

# creates $env - has environments variables and defines the Environment to run the tests
EnvironmentHelper.read_yml_file('./features/config/env.yml')

# creates $user - has login credentials for a valid  user
EnvironmentHelper.read_yml_file('./features/config/users.yml')

############ Choose Browser ###############
#default is set to firefox if non is specified
browser_type = ENV['BROWSER'].nil? ? :firefox : ENV['BROWSER'].to_sym

#create cucumber reports folder in root directory
FOLDER_NAME = 'reports/cucumber'
FileUtils.mkdir_p(FOLDER_NAME) unless File.exists?(FOLDER_NAME)

#ability to run tests using chrome, firefox or using browserstack for remote browsers
case browser_type
  when :chrome
    Capybara.default_driver = :chrome
  when :firefox
    Capybara.default_driver = :firefox
  when :browserstack
    Capybara.default_driver = :browserstack
  else
    raise("Browser '#{browser_type}' is not supported. Use Firefox or Chrome")
end

# setup config for browser
Capybara.configure do |config|
  config.run_server = false
  config.default_selector = :css
  config.ignore_hidden_elements = true
  config.visible_text_only = false
  config.match = :prefer_exact
  config.exact_options = true
  config.ignore_hidden_elements = false
end

# this will create a selenium instance with chrome as the browser
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

# this will create a selenium instance with firefox as the browser
Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

# this will create a selenium instance with a remote browser hosted on browserstack
# the selenium remote cabailities instance will set its operating system and browser using the environment variables
# set in the rake when using rake to run the tests
Capybara.register_driver :browserstack do |app|
  profile = Selenium::WebDriver::Remote::Capabilities.new
  profile['os'] = ENV['BS_AUTOMATE_OS']
  profile['os_version'] = ENV['BS_AUTOMATE_OS_VERSION']
  profile['browser'] = ENV['SELENIUM_BROWSER']
  profile['browser_version'] = ENV['SELENIUM_VERSION']
  profile['browserstack.debug'] = "true"

  #use the browser and operating system set in the profile variable to run the tests on browserstack
  url = "http://#{ENV['BS_USERNAME']}:#{ENV['BS_AUTHKEY']}@hub-cloud.browserstack.com/wd/hub"
  Capybara::Selenium::Driver.new(app, browser: :remote, desired_capabilities: profile, url: url)
end

After do
  #delete all cookies in the browser once the scenario is finished running
  driver = Capybara.current_session.driver
  driver.browser.manage.delete_all_cookies
end

World(Capybara)