class AddCategoriesIdToRecipes1 < ActiveRecord::Migration
  def change
    add_column :recipes, :category_id, :integer
  end
end
