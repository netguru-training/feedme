class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    if user.admin?
      can :manage, :all
    else
      can :manage, OrderItem
      can :manage, FoodOrder
    end
  end
end
