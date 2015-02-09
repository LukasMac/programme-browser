class Programme
  def self.find_by_name(name)
    name = URI::encode(name)
    programme_endpoint = Rails.application.config.programme_endpoint

    response = HTTParty.get("#{programme_endpoint}/#{name}").parsed_response
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
