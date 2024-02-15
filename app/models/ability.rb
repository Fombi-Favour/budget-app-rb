class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can(:manage, Expense, user:)
    can(:manage, Category, user:)
    can :read, Category
  end
end
