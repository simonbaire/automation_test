module TestWorld
#create a new instance of the site class which contains all page object class instances
  def website
    @website ||= Website::Site.new
  end

end

World(TestWorld)