Recipe.delete_all
Category.delete_all
Ingredient.delete_all

Ingredient.create name: 'Chicken'
Ingredient.create name: 'Lamb'
Ingredient.create name: 'Rice'
Ingredient.create name: 'Potatoes'
Ingredient.create name: 'Salt'
Ingredient.create name: 'Pepper'
Recipe.create name: 'Eggs&Toast', instructions: 'Fry egg and place toast in toaster'
Category.create name: 'Starters'