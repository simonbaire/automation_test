class Website::Page::AccountPage < Website::Page::BasePage
  set_url "#{Website::Site.instance.url}"

  element :info_account, '.info-account'

end
