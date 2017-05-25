class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.date :expense_date
      t.string :store
      t.float :amount
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
