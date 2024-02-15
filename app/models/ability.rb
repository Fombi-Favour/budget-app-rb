# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?


    can :manage, Expense, user: user
    can :manage, Category, user: user
    can :read, Category
  end
end
