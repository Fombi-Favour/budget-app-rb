require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Category validations' do
    before do
      user = User.create(name: 'example')
      @category = Category.new(id: 1, name: 'category 0', icon: 'icon 0', user: user)
    end

    it 'should validate name' do
      expect(@category).to be_valid
    end
  end

  describe 'recent expenses method' do
    before do
      5.times do |expense|
        Expense.create(author_id: subject, name: "expense #{expense}", amount: 100)
      end
    end

    it 'should show recent expenses' do
      expect(subject.recent_expenses).to eq(subject.expenses)
    end
  end

  describe 'Category associations' do
    it 'should belong to a user' do
      expect(Category.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it 'has and should belong to many expenses' do
      expect(Category.reflect_on_association(:expenses).macro).to eq(:has_and_belongs_to_many)
    end
  end
end
