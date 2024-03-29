class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all
    else
      can :read, User, id: user.id
      can :read, Ingredient
      can :read, Category
      can :read, Recipe
      if user.persisted?
       can :create, Comment 
       can :update, Comment, user_id: user.id
       
       
     end  
   end
 end 
end 

