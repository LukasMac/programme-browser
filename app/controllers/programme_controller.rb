class ProgrammeController < ApplicationController
  def show
    @programme = Programme.find_by_name(params[:id])
  end
end
