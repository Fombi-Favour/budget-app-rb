require 'rails_helper'

RSpec.feature 'Categories show page', type: :feature do
  before(:each) do
    @user = User.create(name: 'example', email: 'example@example.com', password: '123456')
    sign_in @user
    @category = Category.create(name: 'category',
                                icon: 'https://images.pexels.com/photos/20021296/pexels-photo-20021296/free-photo-of-lottery-scrabble-letters-on-a-wooden-table.jpeg?auto=compress&cs=tinysrgb&w=600', user_id: @user.id)
    5.times.each do |i|
      Expense.create(name: "expense#{i}", amount: 20, author_id: @user.id, category_ids: @category.id)
    end

    visit category_path(@category.id)
  end

  it 'should expenses on page' do
    expect(page).to have_content 'EXPENSES'
  end

  it 'should display categories content' do
    expect(page).to have_content(@category.name)
    expect(page).to have_content(@category.total)
    expect(page).to have_css("img[src*='#{@category.icon}']")
  end

  it 'should display expense contents' do
    @category.expenses.each do |expense|
      expect(page).to have_content(expense.name)
      expect(page).to have_content(expense.amount)
    end
  end
end
