class Website::Page::AuthenticationPage < Website::Page::BasePage
  set_url "#{Website::Site.instance.url}"

  element :email_create, '#email_create'
  element :submit_create, '#SubmitCreate'

  def submit_email(email)
    wait_until {sign_in.visible?}
    sign_in.click
    wait_until {email_create.visible?}
    email_create.set(email)
    submit_create.click
  end

end
