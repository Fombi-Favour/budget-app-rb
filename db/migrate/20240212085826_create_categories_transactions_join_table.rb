class CreateCategoriesTransactionsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :icon
      t.references :user, foreign_key: true

      t.timestamps
    end

    create_table :transactions do |t|
      t.string :name
      t.integer :amount
      t.references :author, foreign_key: { to_table: 'users' }

      t.timestamps
    end

    create_join_table :categories, :transactions
  end
end
