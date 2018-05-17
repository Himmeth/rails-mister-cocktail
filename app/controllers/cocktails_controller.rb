class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  # def show
  #   @cocktail = Cocktail.all.find(params[:id])
  #   @dose = Dose.where("cocktail_id = ?", params[:id])
  #   @ingredients = Ingredient.all
  #   #raise
  # end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
