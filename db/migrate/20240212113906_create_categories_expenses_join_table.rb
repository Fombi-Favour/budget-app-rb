class CreateCategoriesExpensesJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :icon
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    create_table :expenses do |t|
      t.string :name
      t.integer :amount
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    create_table :categories_expenses, id: false do |t|
      t.belongs_to :category
      t.belongs_to :expense
    end
  end
end
