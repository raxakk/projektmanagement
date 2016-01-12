class RamController < ApplicationController
  def index
    @wbs = Wb.all.order(l1: :asc, l2: :asc, l3: :asc)
    @einsatzmittel = Rb.where(ebene: 2)
  end

  # POST /ram
  def create

  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def ram_params
    params.require(:ram).permit(:einsatzmittel)
  end
end


