### Capybara test automation framework

> Example framwork for testing web applications using capybara and siteprism
> Tests can be run on chrome, firefox and remote browsers and operating systems using browserstack

### Language Runtimes

* Ruby 2.2.x - Recommended way to manage Ruby versions is to with [ruby-install][] and [chruby][] (alternatives are [rvm][] or [rbenv][]).
* Bundler

### Prerequisites
```
Mac/Linux/windows:
firefox versions 50 or higher
chrome versions 50 or higher
Clone or Fork the repository to your local machine. Ensure that you install the repository to a working folder.
Navigate to directory and use 'bundle install' to install all dependencies.
```
### Running tests on local browser
```
from root directory run:
bundle exec cucumber -p run_tests
or cucumber
```

### Running tests on browserstack
```
from root directory run:
rake BROWSER=browserstack BS_USERNAME=simonbaire3 BS_AUTHKEY=nhZBoz6HxjnVdypzpavN nodes=2
```

### Contributing
```
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
```