class StarsController < ApplicationController
  before_action :set_star, only: %i[ show update destroy ]

  # GET /stars
  def index
    @stars = Star.all

    render json: @stars
  end

  # GET /stars/1
  def show
    render json: @star
  end

  # POST /stars
  def create
    @star = Star.new(star_params)

    if @star.save
      render json: @star, status: :created, location: @star
    else
      render json: @star.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /stars/1
  def update
    if @star.update(star_params)
      render json: @star
    else
      render json: @star.errors, status: :unprocessable_content
    end
  end

  # DELETE /stars/1
  def destroy
    @star.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_star
      @star = Star.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def star_params
      params.expect(star: [ :name, :temperature, :magnitude, :mass, :constellation_id ])
    end
end
