class Participant
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
end
