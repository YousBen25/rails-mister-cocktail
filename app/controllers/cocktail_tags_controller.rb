class CocktailTagsController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  def new
    @cocktail_tag = CocktailTag.new
  end

  def create
    @tags = Tag.find(params[:cocktail_tag][:tag])
    @tags.each do |tag|
      @cocktail_tag = CocktailTag.new
      @cocktail_tag.cocktail = @cocktail
      @cocktail_tag.tag = tag
      @cocktail_tag.save!
    end
    redirect_to cocktail_path(@cocktail)
  end

    def destroy
      @cocktail_tag = CocktailTag.find(params[:id])
      @cocktail_tag.destroy
    redirect_to cocktail_path(@cocktail_tag.cocktail)
    end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
