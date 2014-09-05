class CommentsController < ApplicationController
 load_and_authorize_resource

 def new 
  @comments = Comment.new
end 

def create
  comment = current_user.comments.new(params[:comment])
  recipe = Recipe.find(params[:recipe_id])
  comment.commentable = recipe
  comment.save
  redirect_to :back
end

def update
  @comment = Comment.find(params[:id])
  @comment.update_attributes(params[:comment])
  redirect_to @comment.commentable
end 

def edit 
  @comment = Comment.find(params[:id])
end 

def show
  @comment = Comment.find(params[:id])
end

def destroy
  comment = Comment.find(params[:id])
  recipe = comment.commentable
  comment.destroy
  redirect_to recipe
end 

end