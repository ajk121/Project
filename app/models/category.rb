class Category < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, on: :create
  has_many :recipes
  
end
