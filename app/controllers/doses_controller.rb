class DosesController < ApplicationController


def create
  cocktail = Cocktail.find(params[:cocktail_id])
  @dose = Dose.new(dose_params)
  ingredient_id = params[:dose][:ingredient]
  @dose.cocktail = cocktail
  @dose.ingredient_id = ingredient_id

  if @dose.save
    redirect_to root_path

  else
    render edit_cocktail_path(params[:cocktail_id])
  end
end

def update
  if @dose.update(dose_params)
    redirect_to @cocktail, notice: 'Dose was successfully updated.'
  else
    render :edit
  end
end

def new
  @dose = Dose.find(params[:cocktail_id])
end

private
def ingredient_params
  params.require(:ingredient).permit(:name)
end

def dose_params
  params.require(:dose).permit(:description)
end

end

