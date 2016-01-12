class RoadmapController < ApplicationController

  def index
    @wbs = Wb.where(ebene: 3).order(start: :asc)
  end

end
