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

  describe '#id' do
    it 'should return correct id number' do
      video_asset = VideoAsset.new(video_asset_hash)
      expect(video_asset.id).to eq '123'
    end
  end

  describe '#title' do
    it 'should return correct title' do
      video_asset = VideoAsset.new(video_asset_hash)
      expect(video_asset.title).to eq 'Video title'
    end
  end

  describe '#description' do
    it 'should return correct description' do
      video_asset = VideoAsset.new(video_asset_hash)
      expect(video_asset.description).to eq 'Video description'
    end
  end
end
