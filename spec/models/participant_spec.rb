require "rails_helper"

RSpec.describe Participant, :type => :model do
  let(:participant_hash) do
    {
      "description" =>  "description",
      "name" =>  "participant_name",
      "person_tag" =>  "person_tag",
      "image" =>  {
        "url" =>  "http://image.jpg",
      }
    }
  end

  describe '#name' do
    it 'should return correct participant name' do
      participant = Participant.new(participant_hash)
      expect(participant.name).to eq 'participant_name'
    end
  end

  describe '#description' do
    it 'should return correct participant description' do
      participant = Participant.new(participant_hash)
      expect(participant.description).to eq 'description'
    end
  end

  describe '#person_tag' do
    it 'should return correct participant person_tag' do
      participant = Participant.new(participant_hash)
      expect(participant.person_tag).to eq 'person_tag'
    end
  end
end
