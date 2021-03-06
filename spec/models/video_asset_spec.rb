require "rails_helper"

RSpec.describe VideoAsset, :type => :model do
  let(:video_asset_hash) do
    {
      "id" => "123",
      "title" => "Video title",
      "description" => "Video description",
      "image" => "http://image.jpg"
    }
  end

  before do
    @video_asset = VideoAsset.new(video_asset_hash)
  end

  describe '#id' do
    it 'should return correct id number' do
      expect(@video_asset.id).to eq '123'
    end
  end

  describe '#title' do
    it 'should return correct title' do
      expect(@video_asset.title).to eq 'Video title'
    end
  end

  describe '#description' do
    it 'should return correct description' do
      expect(@video_asset.description).to eq 'Video description'
    end
  end

  describe '#image' do
    it 'should return correct image path' do
      expect(@video_asset.image).to eq 'http://image.jpg'
    end
  end

  describe '#video' do
    it 'should return correct video path' do
      expect(@video_asset.video('idol')).to eq 'http://www.tv4play.se/program/idol?video_id=123'
    end
  end

  describe '.find_all_by_person_tag' do
    let(:video_asset_endpoint) { 'http://api.tv4play.se/play/video_assets.json?tags=' }

    before do
      stub_request(:get, "#{video_asset_endpoint}person_tag").
        to_return(
          :headers => { 'Content-Type' => 'application/json' },
          :body => <<-videos_assets_json
          {
            "results": [
              {
                "id": "123",
                "title": "Video asset title",
                "description": "Video asset description",
                "image": "http://image.jpg"
              }
            ]
          }
          videos_assets_json
      )
    end
    it 'should return and array' do
      expect(VideoAsset.find_all_by_person_tag('person_tag')).to be_a Array
    end

    it 'should return an Array with VideoAssets from http response data' do
      expect(VideoAsset.find_all_by_person_tag('person_tag').first.id).to eq '123'
    end

    it 'should make a http call to TV4 API video assets endpoint' do
      VideoAsset.find_all_by_person_tag('person_tag')
      assert_requested :get, "#{video_asset_endpoint}person_tag"
    end
  end
end
