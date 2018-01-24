class Website::Page::BasePage < SitePrism::Page
  include Utilities
  set_url "#{Website::Site.instance.url}"

  #contains all page objects shared amongst different pages hence its name base page
  #this class inherits all attributes of the SitePrism::Page

  element :sign_in, '.login'
  elements :products, '.product_img_link'



end