class Website::Page::RegistrationPage < Website::Page::BasePage
  set_url "#{Website::Site.instance.url}"

  #Personal information

  element :gender_mr, '#uniform-id_gender1'
  element :gender_mrs, '#uniform-id_gender2'
  element :first_name, '#customer_firstname'
  element :last_name, '#customer_lastname'
  element :email, '#email'
  element :password, '#passwd'
  element :day_of_birth, '#days'
  element :month_of_birth, '#months'
  element :year_of_birth, '#years'
  element :newsletter, '#newsletter'
  element :special_offers, '#optin'

  # Address information

  element :address_firstname, '#firstname'
  element :address_lastname, '#lastname'
  element :company, '#company'
  element :address_line_1, '#address1'
  element :address_line_2, '#address2'
  element :city, '#city'
  element :state, '#id_state'
  element :postcode, '#postcode'
  element :country, '#id_country'
  element :additional_info, '#other'
  element :home_phone, '#phone'
  element :mobile_phone, '#phone_mobile'
  element :alias_address, '#alias'

  element :register, '#submitAccount'

  def create_account(user)
    wait_until {register.visible?}
    enter_personal_information(user)
    enter_address(user)
    register.click
  end

  def enter_personal_information(user)
    gender_mr.click
    first_name.set(user.first_name)
    last_name.set(user.last_name)
    password.set(user.password)
    day_of_birth.send_keys(user.date_of_birth[:day])
    month_of_birth.send_keys(user.date_of_birth[:month])
    year_of_birth.send_keys(user.date_of_birth[:year])
    newsletter.click
    special_offers.click
  end

  def enter_address(user)
    address_firstname.set(user.first_name)
    address_line_1.set(user.first_address)
    address_line_2.set(user.second_line_address)
    city.set(user.city)
    state.send_keys(user.state)
    postcode.send_keys(user.zip)
    country.send_keys(user.country)
    mobile_phone.set(user.phone_number)
    alias_address.set(user.alias_name)
  end

end