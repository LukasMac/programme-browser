class ProgrammeController < ApplicationController
  def show
    @programme = Programme.find_by_name(params[:show_name])
  end
end
