class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]
  def index
    if params[:query]
      @cocktails = Cocktail.where("name like ?", "%#{params[:query]}%")
    else
      @cocktails = Cocktail.all
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
