class Profile

  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :date_of_birth
  attr_accessor :email
  attr_accessor :password
  attr_accessor :first_address
  attr_accessor :second_line_address
  attr_accessor :city
  attr_accessor :state
  attr_accessor :country
  attr_accessor :zip
  attr_accessor :phone_number
  attr_accessor :alias_name

  #Set state of class for a new profile

  def initialize(options = {})
    @first_name = options.fetch(:first_name, Faker::Name.first_name)
    @last_name = options.fetch(:last_name, Faker::Name.last_name)
    @email = options.fetch(:email, Faker::Internet.email)
    @date_of_birth = options.fetch(:date_of_birth, {:day => rand(1..30), :month => 'April', :year => rand(1900..1984)})
    @password = options.fetch(:password, Faker::Internet.password)
    @first_address = options.fetch(:first_address, Faker::Address.street_address)
    @second_line_address = options.fetch(:second_line_address, Faker::Address.street_address)
    @city = options.fetch(:city, Faker::Address.city)
    @state = options.fetch(:state, Faker::Address.state)
    @country = options.fetch(:country, 'United States')
    @zip = options.fetch(:zip, Faker::Address.zip.split("-").first)
    @phone_number = options.fetch(:phone_number, Faker::PhoneNumber.cell_phone)
    @alias_name = options.fetch(:alias_name, Faker::Name.unique.name)
  end

end