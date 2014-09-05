class Quantity < ActiveRecord::Base
  attr_accessible :quantity, :unit, :ingredient_id, :recipe_id
  # validates :quantity, presence: true, on: :create
  belongs_to :ingredient
  belongs_to :recipe
end
