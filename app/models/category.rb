class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :expenses

  validates :name, :icon, presence: true

  def total
    expenses.sum(:amount)
  end

  def recent_expenses
    expenses.order(created_at: :desc)
  end
end
