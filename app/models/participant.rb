class Participant
  def initialize(participant)
    @participant = participant
  end

  def name
    @participant.fetch('name')
  end
end
