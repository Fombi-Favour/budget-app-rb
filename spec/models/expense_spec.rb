require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'Expense validations' do
    before(:each) do
      user = User.create(id: 1, name: 'example')
      @expenses = Expense.new(name: 'expense1', amount: 150, user: user)
    end

    it 'should validate name' do
      subject.name = 'expense1'
      expect(@expenses).to be_valid
    end

    it 'should validate amount as an integer' do
      @expenses.amount = 'abc'
      expect(@expenses).to_not be_valid
    end

    it 'should validate amount as greater or equal to 0' do
      @expenses.amount = -1
      expect(@expenses).to_not be_valid
    end
  end

  describe 'Expenses associations' do
    it 'should belong to a user' do
      expect(Expense.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it 'has and should belong to many expenses' do
      expect(Expense.reflect_on_association(:categories).macro).to eq(:has_and_belongs_to_many)
    end
  end
end
