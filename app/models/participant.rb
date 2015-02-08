class Participant
  def self.find_all_by_programme_name(programme_name)
    response = HTTParty.get("http://api.tv4play.se/site/programs/#{programme_name}").parsed_response
    response.fetch('participant_groups').first.fetch('participants').map do |participant|
      Participant.new(participant)
    end
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

  def video_assets
    VideoAsset.find_all_by_person_tag(person_tag)
  end
end
