class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]
  def new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(param[:cocktail_id])
    @ingredient = Ingredient.find(param[:ingredient_id])
    Dose.create(dose_params)
  end

  def destroy
    @dose.destroy
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description)
  end
end
