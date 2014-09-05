class Ingredient < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, on: :create
  has_many :quantities
  has_many :recipes, through: :quantities
end
