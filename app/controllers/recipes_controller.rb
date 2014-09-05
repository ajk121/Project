class RecipesController < ApplicationController
  load_and_authorize_resource
  def index
    @q = Recipe.search(params[:q])
    @recipes = @q.result(distinct: true)
    @q.build_condition
  end

  def search
    index
    render :index
  end

  def new
    @recipe = Recipe.new
    Ingredient.all.each do |ingredient|
      @recipe.quantities.build(ingredient_id: ingredient.id)
    end
  end 

  def create
    @recipe = Recipe.create(params[:recipe])
    if ir = params[:recipe][:quantities_attributes]
      ir.delete_if do |key, value|
        ir[key]['quantity'].blank?
      end
    end

    if @recipe.save
      redirect_to @recipe, :notice => "Successfully created recipe."
    else
      Ingredient.all.each do |ingredient|
        @recipe.quantities.build(ingredient_id: ingredient.id)  unless @recipe.quantities.map(&:ingredient_id).include?(ingredient.id)
      end
      render :action => 'new'
    end
    
  end 

  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new 
  end

  def edit
    @recipe = Recipe.find(params[:id])
    Ingredient.all.each do |ingredient|
      @recipe.quantities.build(ingredient_id: ingredient.id) unless @recipe.ingredients.include?(ingredient)
    end

  end

  # def update
  #   @recipe = Recipe.find(params[:id])
  #   @recipe.update_attributes(params[:recipe])
  #   redirect_to (@recipe)
  # end


  def update
    @recipe = Recipe.find(params[:id])

    if ir = params[:recipe][:quantities_attributes]
      ir.keys.each do |key|
        ir[key]['_destroy'] = true if ir[key]['quantity'].blank?
      end
    end

    if @recipe.update_attributes(params[:recipe])
      redirect_to @recipe, :notice  => "Successfully updated recipe."
    else
      Ingredient.all.each do |ingredient|
        @recipe.quantities.build(ingredient_id: ingredient.id) unless @recipe.ingredients.include?(ingredient)
      end
      render :action => 'edit'
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path :notice => "You have Successfully destroyed this recipe."
  end 


end 