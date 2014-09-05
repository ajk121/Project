class IngredientsController < ApplicationController
  load_and_authorize_resource

  def index 
    @ingredients = Ingredient.order(:name).all
  end

  def new 
    @ingredients = Ingredient.new
  end 

  def create
    Ingredient.create(params[:ingredient])
    redirect_to ingredients_path
  end 

  def show
    @ingredient = Ingredient.find(params[:id]) 
  end

  def edit
   @ingredient = Ingredient.find(params[:id])
 end 

 def update
  @ingredient = Ingredient.find(params[:id])
  @ingredient.update_attributes(params[:ingredient])
  redirect_to ingredient_path
end

def destroy
  ingredient = Ingredient.find(params[:id])
  ingredient.destroy
  redirect_to ingredients_path
end 

end 