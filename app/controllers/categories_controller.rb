class CategoriesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @categories = Category.order(:name).all
  end 

  def new 
    @categories = Category.new
  end 

  def create
    Category.create(params[:category])
    redirect_to categories_path
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end 

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    redirect_to (@category)
  end 

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to categories_path
  end 

end