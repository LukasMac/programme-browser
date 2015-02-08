class Participant
  def self.find_all_by_programme_name(programme_name)
    []
  end

  def initialize(participant)
    @participant = participant
  end

  def name
    @participant.fetch('name')
  end

  def description
    @participant.fetch('description')
  end

  def person_tag
    @participant.fetch('person_tag')
  end

  def image
    @participant.fetch('image').fetch('url')
  end
end
