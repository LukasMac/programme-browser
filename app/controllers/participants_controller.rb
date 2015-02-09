class ParticipantsController < ApplicationController
  def index
    @participants = Participant.find_all_by_programme_name(params[:show_name])
  end

  def show
    @video_assets = VideoAsset.find_all_by_person_tag(params[:person_tag])
  end
end
