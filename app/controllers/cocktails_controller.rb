class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
    @ingredients = Ingredient.all

  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @ingredients = Ingredient.all
    if @cocktail.save
      @dose = Dose.new(dose_params)
      @dose.cocktail = @cocktail
      raise
      redirect_to cocktail_path(@cocktail), notice: 'Cocktail was successfully created.'
    else
      render new_cocktail_path(@cocktail)
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id]) # from the click params
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

   def update
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.doses.update(dose_params)
      redirect_to @cocktail, notice: 'cocktail was successfully updated.'
    else
      render :edit
    end
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
