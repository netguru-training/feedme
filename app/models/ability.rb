class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    if user.admin?
      can :manage, :all
    else
      can :manage, OrderItem
      can [:index, :show, :finalize], FoodOrder, user_id: user.id
      can :manage, FavouriteProduct
      can [:favourite, :unfavourite], Product
    end
  end
end
