class Website::Page::SignInPage < Website::Page::BasePage
  set_url "#{Website::Site.instance.url}"

  element :email_address, '#email'
  element :password, '#passwd'
  element :sign_in_button, '#SubmitLogin'

  #sign in user with their user credentials
  #abort if the user object is not a hash or is empty

  def sign_in_user(user)
    wait_until {sign_in.visible?}
    sign_in.click
    enter_credentials(user)
    sign_in_button.click
  end

  def enter_credentials(user)
    verify_credentials(user)
    email_address.set(user[:email])
    password.set(user[:password])
  end

  def verify_credentials(user)
    abort('user object must be hash') if (user.class != Hash)
    abort("user object does not contain email or password") if (user[:email].empty? == true or user[:password].empty? == true)
  end

end
