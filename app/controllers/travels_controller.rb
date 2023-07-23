class TravelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_travel, only: %i[show edit update destroy]
  verify_authorized

  # GET /travels
  def index
    @travels = authorized_scope(Travel.all)
    authorize!
  end

  # GET /travels/1
  def show
    authorize! @travel
  end

  # GET /travels/new
  def new
    @travel = Travel.new
    authorize! @travel
  end

  # GET /travels/1/edit
  def edit
    authorize! @travel
  end

  # POST /travels
  def create
    @travel = Travel.new(travel_params.merge(owner: current_user))

    if @travel.save
      authorize! @travel
      redirect_to @travel, notice: 'Travel was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /travels/1
  def update
    authorize! @travel
    if @travel.update(travel_params)
      redirect_to @travel, notice: 'Travel was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /travels/1
  def destroy
    authorize! @travel
    @travel.destroy
    redirect_to travels_url, notice: 'Travel was successfully destroyed.', status: :see_other
  end

  def search_destinations
    authorize!
    @search = Geocoder.search('', params: { city: params[:q] })
    render :search_destinations, layout: false
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_travel
    @travel = authorized_scope(Travel.all).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def travel_params
    params.require(:travel).permit(:title, :start_date, :end_date, :destination_address)
  end
end
