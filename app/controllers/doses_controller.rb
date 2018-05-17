class DosesController < ApplicationController
   def new
    @reviews = Review.where("cocktail_id = ?", params[:cocktail_id])
    @drink_dose = Dose.where("cocktail_id = ?", params[:cocktail_id])
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredients = Ingredient.all
    #raise
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail_id = params[:cocktail_id]
    @dose.ingredient_id = params[:ingredient_id]
    @dose.save
    redirect_to new_cocktail_dose_path(params[:cocktail_id])
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
