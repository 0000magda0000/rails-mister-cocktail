class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    # @ingredients = Ingredient.all
    if @cocktail.save
      # @dose = Dose.new(dose_params)
      # @dose.cocktail = @cocktail
      redirect_to cocktail_path(@cocktail), notice: 'Cocktail was successfully created.'
    else
      render "new"
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id]) # from the click params
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

   def update
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.update(cocktail_params)
      redirect_to @cocktail, notice: 'cocktail was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to root_path

  end

  private
  # def ingredient_params
  #   params.require(:ingredient).permit(:name)
  # end

  def dose_params
    params.permit(:description)
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
