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
end
