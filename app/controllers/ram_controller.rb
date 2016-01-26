class RamController < ApplicationController
  def index
    @wbs = Wb.all.order(l1: :asc, l2: :asc, l3: :asc)
    @einsatzmittel = Rb.where(ebene: 2)
  end

  # POST /ram
  def create
    @wbs = Wb.all.order(l1: :asc, l2: :asc, l3: :asc)
    ems = params[:em]
    counter = 0
    @wbs.each do |wb|
      if wb.ebene == 3
        wb.update(rb_id: ems[counter])
        counter = counter + 1
      end
    end
    redirect_to ram_index_path, notice: 'Erfolgreich bearbeitet.'
  end
end

