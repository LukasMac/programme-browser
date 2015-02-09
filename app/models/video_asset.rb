class VideoAsset
  def self.find_all_by_person_tag(person_tag)
    video_assets_endpoint = Rails.application.config.video_assets_endpoint
    person_tag = URI::encode(person_tag)

    response = HTTParty.get("#{video_assets_endpoint}#{person_tag}").parsed_response
    response.fetch('results').map do |video_asset|
      VideoAsset.new(video_asset)
    end
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
    video_endpoint = Rails.application.config.video_endpoint
    "#{video_endpoint}/#{programme_name}?video_id=#{id}"
  end
end
