class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update]
  def index
    @cocktails = Cocktail.all

  end

  def show

  end

  def new
    @cocktail = Cocktail.new
    @cocktail.doses.build
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.valid?
      @cocktail.save
      respond_to do |format|
        format.html { render new }
        format.js  # <-- will render `app/views/cocktails/create.js.erb`
      end
    else
      @cocktail = Cocktail.find_by(name: @cocktail.name)
      @cocktail.update(cocktail_params)
      respond_to do |format|
        format.html { render new }
        format.js  # <-- idem
      end
    end
  end

  def update
    @cocktail.update(cocktail_params)
    render :new
  end



  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, doses_attributes: [:description, :ingredient_id])
  end
end
