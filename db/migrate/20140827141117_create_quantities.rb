class CreateQuantities < ActiveRecord::Migration
  def change
    create_table :quantities do |t|
      t.belongs_to :ingredient
      t.belongs_to :recipe
      t.integer :quantity
      t.string  :unit
      t.timestamps
    end
  end
end 
