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

  before do
    @participant = Participant.new(participant_hash)
  end

  describe '#name' do
    it 'should return correct participant name' do
      expect(@participant.name).to eq 'participant_name'
    end
  end

  describe '#description' do
    it 'should return correct participant description' do
      expect(@participant.description).to eq 'description'
    end
  end

  describe '#person_tag' do
    it 'should return correct participant person_tag' do
      expect(@participant.person_tag).to eq 'person_tag'
    end
  end

  describe '#image' do
    it 'should return correct participant image path' do
      expect(@participant.image).to eq 'http://image.jpg'
    end
  end

  describe '.find_all_by_programme_name' do
    it 'should return an array' do
      expect(Participant.find_all_by_programme_name('idol')).to be_a Array
    end
  end
end
