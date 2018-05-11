class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]
  def new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(params[:ingredient_id])
    @dose = Dose.new(dose_params)
    unless @dose.save
      redirect_to cocktail_path(@cocktail)
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description)
  end
end
