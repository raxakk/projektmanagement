class PbsController < ApplicationController
  before_action :set_pb, only: [:show, :edit, :update, :destroy]

  # GET /pbs
  # GET /pbs.json
  def index
    @pbs = Pb.all.order(l1: :asc, l2: :asc, l3: :asc, l4: :asc)
  end

  # GET /pbs/1
  # GET /pbs/1.json
  def show
  end

  # GET /pbs/new
  def new
    @pb = Pb.new
    @pb.ebene = 0
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /pbs/1/newTeilprodukt
  def new_teilprodukt
    @pb = Pb.new
    @pb.parent_id = params[:id]
    @pb.ebene = 1

    counter = 1

    while !Pb.where(l1: counter ).blank?
      counter = counter + 1
    end

    @pb.l1 = counter
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /pbs/1/newModul
  def new_modul
    @pb = Pb.new
    @pb.parent_id = params[:id]
    @pb.ebene = 2

    @pb.l1 = Pb.find(params[:id]).l1

    counter = 1

    while !Pb.where(l1: @pb.l1, l2: counter ).blank?
      counter = counter + 1
    end

    @pb.l2 = counter
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /pbs/1/newTeilmodul
  def new_teilmodul
    @pb = Pb.new
    @pb.parent_id = params[:id]
    @pb.ebene = 3

    @pb.l1 = Pb.find(params[:id]).l1
    @pb.l2 = Pb.find(params[:id]).l2

    counter = 1
    while !Pb.where(l1: @pb.l1, l2: @pb.l2, l3: counter ).blank?
      counter = counter + 1
    end

    @pb.l3 = counter
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /pbs/1/newKomponente
  def new_komponente
    @pb = Pb.new
    @pb.parent_id = params[:id]
    @pb.ebene = 4

    @pb.l1 = Pb.find(params[:id]).l1
    @pb.l2 = Pb.find(params[:id]).l2
    @pb.l3 = Pb.find(params[:id]).l3
    counter = 1
    while !Pb.where(l1: @pb.l1, l2: @pb.l2, l3: @pb.l3, l4: counter ).blank?
      counter = counter + 1
    end

    @pb.l4 = counter
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /pbs/1/edit
  def edit
  end

  # POST /pbs
  # POST /pbs.json
  def create
    @pb = Pb.new(pb_params)
    if @pb.ebene == 0
      @wb = Wb.new
      @wb.ebene = 0
      @wb.name = @pb.name
      @rb = Rb.new
      @rb.ebene = 0
      @rb.name = @pb.name
    end

    respond_to do |format|
      if @pb.save
        if !@wb.nil? && !@rb.nil?
          @wb.save
          @rb.save
        end
        format.html { redirect_to pbs_path, notice: 'Erfolgreich erstellt.' }
        format.json { render :show, status: :created, location: @pb }
      else
        format.html { render :new }
        format.json { render json: @pb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pbs/1
  # PATCH/PUT /pbs/1.json
  def update
    respond_to do |format|
      if @pb.update(pb_params)
        format.html { redirect_to pbs_path, notice: 'Erfolgreich bearbeitet.' }
        format.json { render :show, status: :ok, location: @pb }
      else
        format.html { render :edit }
        format.json { render json: @pb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pbs/1
  # DELETE /pbs/1.json
  def destroy
    @pb.destroy
    respond_to do |format|
      format.html { redirect_to pbs_url, notice: 'Erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pb
      @pb = Pb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pb_params
      params.require(:pb).permit(:name, :parent_id, :beschreibung, :ebene, :l1, :l2, :l3, :l4)
    end

end
