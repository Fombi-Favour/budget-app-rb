class Expense < ApplicationRecord
  belongs_to :user, foreign_key: :author_id, class_name: 'User'
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
