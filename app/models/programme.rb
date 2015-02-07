class Programme
  def initialize(programme)
    @programme = programme
  end

  def name
    @programme.fetch('name')
  end

  def description
    @programme.fetch('description')
  end
end
