class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]
  DISTANCE= 10
  def index
    if params[:address].present? && params[:cocktail_type].present?
      # @worker_profiles = WorkerProfile.search_by_address(params[:address]).search_by_job(params[:cocktail_type])
      @cocktails = Cocktail.near(params[:address], DISTANCE).search_by_tag(params[:cocktail_type])
    elsif params[:address].present?
      ## @cocktails = Cocktail.search_by_address(params[:address])
      @cocktails = Cocktail.near(params[:address], DISTANCE)
    elsif params[:cocktail_type].present?
      @cocktails = Cocktail.search_by_tag(params[:cocktail_type])
    else
      @cocktails = Cocktail.all
    end
    @markers = @cocktails.geocoded.map do |cocktail|
      {
        lat: cocktail.latitude,
        lng: cocktail.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { cocktail: cocktail })
      }
    end
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    @cocktail.save
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def params_cocktail
    params.require(:cocktail).permit(:name, :photo)
  end
end
