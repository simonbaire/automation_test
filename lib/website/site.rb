module Website
  class Site

    attr_accessor :url

    def initialize
      @url ||= set_url
    end

    def set_url
      $env[:website]
    end

    # Provide a way to access an instance of the class
    def self.instance
      @instance ||= new
    end

    #new signleton instance's for each page obect

    def base
      @base ||= Website::Page::BasePage.new
    end

    def registration
      @registration ||= Website::Page::RegistrationPage.new
    end

    def sign_in
      @sign_in ||= Website::Page::SignInPage.new
    end

    def account
      @account ||= Website::Page::AccountPage.new
    end

    def authentication
      @authentication ||= Website::Page::AuthenticationPage.new
    end

  end

end