class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :edit, :update]

  # GET /rounds
  # GET /rounds.json
  def index
    @rounds = Round.all
  end

  # GET /rounds/1
  # GET /rounds/1.json
  def show
    opts = @round.forms.pluck(:opt)
    pess = @round.forms.pluck(:pes)
    reals = @round.forms.pluck(:real)

    sum_opts = 0
    opts.each do |opt|
      unless opt.nil?
        sum_opts = sum_opts + opt
      end
    end

    sum_pess = 0
    pess.each do |pes|
      unless pes.nil?
        sum_pess = sum_pess + pes
      end
    end

    sum_reals = 0
    reals.each do |real|
      unless real.nil?
        sum_reals = sum_reals + real
      end
    end

    begin
      @avg_opt = sum_opts / opts.reject(&:blank?).count
      @avg_pes = sum_pess / pess.reject(&:blank?).count
      @avg_real = sum_reals / reals.reject(&:blank?).count
    rescue
      @avg_opt = 0
      @avg_pes = 0
      @avg_real = 0
    end
  end

  # GET /rounds/new
  def new
    @round = Round.new
  end

  # GET /rounds/1/edit
  def edit
  end

  # POST /rounds
  # POST /rounds.json
  def create
    @round = Round.new(round_params)

    counter = 1

    while !Round.where(count: counter).blank?
      counter = counter + 1
    end

    @round.count = counter

    respond_to do |format|
      if @round.save
        @round.member_number.times do
          @round.forms.create
        end
        format.html { redirect_to rounds_path, notice: 'Round was successfully created.' }
        format.json { render :show, status: :created, location: @round }
      else
        format.html { render :new }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rounds/1
  # PATCH/PUT /rounds/1.json
  def update
    respond_to do |format|
      if @round.update(round_params)
        format.html { redirect_to @round, notice: 'Round was successfully updated.' }
        format.json { render :show, status: :ok, location: @round }
      else
        format.html { render :edit }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rounds/
  # DELETE /rounds/
  def destroy
    Round.destroy_all
    respond_to do |format|
      format.html { redirect_to rounds_url, notice: 'Runden erfolgreich zurückgesetzt' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round
      @round = Round.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def round_params
      params.require(:round).permit(:count, :member_number)
    end
end
