class Programme
  def self.find_by_name(name)
    name = URI::encode(name)
    response = HTTParty.get("http://api.tv4play.se/site/programs/#{name}").parsed_response
    Programme.new(response)
  end

  def initialize(programme)
    @programme = programme
  end

  def name
    @programme.fetch('name')
  end

  def description
    @programme.fetch('description')
  end

  def image
    @programme.fetch('program_image').fetch('path')
  end
end
