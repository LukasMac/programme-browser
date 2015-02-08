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

  describe '#video_assets' do
    it 'should search for video assets with correct person tag' do
      VideoAsset ||= double('video asset')

      expect(VideoAsset).to receive(:find_by_person_tag).with('person_tag')
      @participant.video_assets
    end
  end

  describe '.find_all_by_programme_name' do
    let(:programme_endpoint) { "http://api.tv4play.se/site/programs" }

    before do
      stub_request(:get, "#{programme_endpoint}/idol").
        to_return(
          :headers => { 'Content-Type' => 'application/json' },
          :body => <<-programme_json
          {
            "participant_groups": [
              {
                "participants": [
                  {
                    "description": "Ålder: 16 år Ort: Stockholm Sökte till Idol...",
                    "name": "Lisa Ajax",
                    "person_tag": "lisa-ajax",
                    "image": {
                      "url": "http://aman.production.s3.amazonaws.com/541c9453c45948d3ba000097/Lisa_profilbild.jpg?2"
                    }
                  }
                ]
              }
            ]
          }
          programme_json
      )
    end

    it 'should return an array' do
      expect(Participant.find_all_by_programme_name('idol')).to be_a Array
    end

    it 'should make a http call to TV4 API programme endpoint' do
      Participant.find_all_by_programme_name('idol')
      assert_requested :get, "#{programme_endpoint}/idol"
    end

    it 'should return array of Participants with http request data' do
      expect(Participant.find_all_by_programme_name('idol').first.name).to eq 'Lisa Ajax'
    end
  end
end
