class ConstellationsController < ApplicationController
  before_action :set_constellation, only: %i[ show update destroy stars ]

  # GET /constellations
  def index
    @constellations = Constellation.all

    render json: @constellations
  end

  # GET /constellations/1
  def show
    render json: @constellation
  end

  # GET /constellations/1/stars
  def stars
    render json: @constellation.stars
  end

  # POST /constellations
  def create
    @constellation = Constellation.new(constellation_params)

    if @constellation.save
      render json: @constellation, status: :created, location: @constellation
    else
      render json: @constellation.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /constellations/1
  def update
    if @constellation.update(constellation_params)
      render json: @constellation
    else
      render json: @constellation.errors, status: :unprocessable_content
    end
  end

  # DELETE /constellations/1
  def destroy
    @constellation.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_constellation
      @constellation = Constellation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def constellation_params
      params.expect(constellation: [ :name, :abbreviation, :adjective ], star: [ :name, :temperature, :magnitude, :mass ])
    end
end
