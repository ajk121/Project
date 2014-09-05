class Recipe < ActiveRecord::Base
  acts_as_commentable
  attr_accessible :instructions, :name, :category_id, :recipe_image, :quantities_attributes, :comments, :RecipeImageUploader

  validates :name, presence: true, on: :create
  validates :instructions, presence: true, on: :create
  belongs_to :category
  has_many :quantities
  has_many :ingredients, through: :quantities
  mount_uploader :recipe_image, RecipeImageUploader

  accepts_nested_attributes_for :quantities, allow_destroy: true
end
