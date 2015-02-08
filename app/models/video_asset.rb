class VideoAsset
  VIDEO_ENDPOINT = 'http://www.tv4play.se/program'

  def self.find_all_by_person_tag(person_tag)

  end

  def initialize(video_asset)
    @video_asset = video_asset
  end

  def id
    @video_asset.fetch('id')
  end

  def title
    @video_asset.fetch('title')
  end

  def description
    @video_asset.fetch('description')
  end

  def image
    @video_asset.fetch('image')
  end

  def video(programme_name)
    "#{VIDEO_ENDPOINT}/#{programme_name}?video_id=#{id}"
  end
end
