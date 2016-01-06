class WbsController < ApplicationController
  before_action :set_wb, only: [:show, :edit, :update, :destroy]

  # GET /wbs
  # GET /wbs.json
  def index
    @wbs = Wb.all
  end

  # GET /wbs/1
  # GET /wbs/1.json
  def show
  end

  # GET /wbs/new
  def new
    @wb = Wb.new
    @wb.parent_id = params[:id]
    @wb.ebene = 0
  end

  def new_aufgabe
    @wb = Wb.new
    @wb.parent_id = params[:id]
    @wb.ebene = 1
  end

  def new_teilaufgabe
    @wb = Wb.new
    @wb.parent_id = params[:id]
    @wb.ebene = 2
  end

  def new_arbeitspaket
    @wb = Wb.new
    @wb.parent_id = params[:id]
    @wb.ebene = 3
  end

  # GET /wbs/1/edit
  def edit
  end

  # POST /wbs
  # POST /wbs.json
  def create
    @wb = Wb.new(wb_params)

    respond_to do |format|
      if @wb.save
        format.html { redirect_to @wb, notice: 'Wb was successfully created.' }
        format.json { render :show, status: :created, location: @wb }
      else
        format.html { render :new }
        format.json { render json: @wb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wbs/1
  # PATCH/PUT /wbs/1.json
  def update
    respond_to do |format|
      if @wb.update(wb_params)
        format.html { redirect_to @wb, notice: 'Wb was successfully updated.' }
        format.json { render :show, status: :ok, location: @wb }
      else
        format.html { render :edit }
        format.json { render json: @wb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wbs/1
  # DELETE /wbs/1.json
  def destroy
    @wb.destroy
    respond_to do |format|
      format.html { redirect_to wbs_url, notice: 'Wb was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wb
      @wb = Wb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wb_params
      params.require(:wb).permit(:name, :parent_id, :beschreibung, :start, :end, :rb_id, :worker_id, :ebene)
    end
end
