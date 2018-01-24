After do |scenario|
  # if a scenario fails then create a failure images directory if non exists then take a screenshot of the failure
  if scenario.failed?
    driver = Capybara.current_session.driver
    driver.browser.manage.window.maximize
    Dir.mkdir('failure_images') unless File.directory?('failure_images')
    screenshot = "./failure_images/FAILED_#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}#{Time.now.strftime('%Y-%m-%d_%H:%M:%S')}.png"
    driver.browser.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end

end