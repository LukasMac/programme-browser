class ParticipantsController < ApplicationController
  def index
    @participants = Participant.find_all_by_programme_name(params[:show_name])
  end

  def show
  end
end
