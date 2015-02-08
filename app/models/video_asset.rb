class VideoAsset
  def self.find_all_by_person_tag(person_tag)

  end

  def initialize(video_asset)
    @video_asset = video_asset
  end

  def id
    @video_asset.fetch('id')
  end
end
