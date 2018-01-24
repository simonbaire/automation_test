require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'parallel'
require 'json'
require 'pry'
require 'rake/testtask'
require 'fileutils'

desc "install dependencies"
task :gem_tasks do
  puts "Installing and listing gems"
  system "gem sources --add http://rubygems.org/"
  system "gem install bundler cucumber rspec site_prism capybara selenium-webdriver chromedriver-helper pry activesupport require_all"
  system "bundle install"
  system "bundle update"
  system "gem list"
end

desc "Remove report directory and any failure images"
task :cleanup do
  puts "Removing reports directory"
  FileUtils.rm_rf('Reports')
  FileUtils.rm_rf('failure_images')
end

@browsers = JSON.load(open('browser.json'))
@parallel_limit = ENV["nodes"] || 1
@parallel_limit = @parallel_limit.to_i

task :cucumber do
  Parallel.each(@browsers, :in_processes => @parallel_limit) do |browser|
    begin
      puts "Running with: #{browser.inspect}"
      ENV['SELENIUM_BROWSER'] = browser['browser']
      ENV['SELENIUM_VERSION'] = browser['browser_version']
      ENV['BS_AUTOMATE_OS'] = browser['os']
      ENV['BS_AUTOMATE_OS_VERSION'] = browser['os_version']

      Rake::Task[:run_features].execute()
    rescue Exception => e
      puts "Error while running task"
    end
  end
end

Cucumber::Rake::Task.new(:run_features) do |t|
  t.cucumber_opts = "--expand -f pretty -f json -o Reports/cucumber/cucumber.json"
end
task :default => [:cucumber]