class RbsController < ApplicationController
  before_action :set_rb, only: [:show, :edit, :update, :destroy]

  # GET /rbs
  # GET /rbs.json
  def index
    @rbs = Rb.all.order(l1: :asc, l2: :asc)
  end

  # GET /rbs/1
  # GET /rbs/1.json
  def show
  end

  # GET /rbs/new
  def new
    @rb = Rb.new
    @rb.parent_id = params[:id]
    @rb.ebene = 0
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new_art
    @rb = Rb.new
    @rb.parent_id = params[:id]
    @rb.ebene = 1

    counter = 1

    while !Rb.where(l1: counter ).blank?
      counter = counter + 1
    end

    @rb.l1 = counter
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new_rolle
    @rb = Rb.new
    @rb.parent_id = params[:id]
    @rb.ebene = 2

    @rb.l1 = Rb.find(params[:id]).l1

    counter = 1

    while !Rb.where(l1: @rb.l1, l2: counter ).blank?
      counter = counter + 1
    end

    @rb.l2 = counter
    respond_to do |format|
      format.html
      format.js
    end
  end


  # GET /rbs/1/edit
  def edit
  end

  # POST /rbs
  # POST /rbs.json
  def create
    @rb = Rb.new(rb_params)

    respond_to do |format|
      if @rb.save
        format.html { redirect_to @rb, notice: 'Erfolgreich erstellt.' }
        format.json { render :show, status: :created, location: @rb }
      else
        format.html { render :new }
        format.json { render json: @rb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rbs/1
  # PATCH/PUT /rbs/1.json
  def update
    respond_to do |format|
      if @rb.update(rb_params)
        format.html { redirect_to @rb, notice: 'Erfolgreich bearbeitet.' }
        format.json { render :show, status: :ok, location: @rb }
      else
        format.html { render :edit }
        format.json { render json: @rb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rbs/1
  # DELETE /rbs/1.json
  def destroy
    @rb.destroy
    respond_to do |format|
      format.html { redirect_to rbs_url, notice: 'Erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rb
      @rb = Rb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rb_params
      params.require(:rb).permit(:name, :parent_id, :qualifikation, :erfahrung, :ebene, :l1, :l2)
    end
end
