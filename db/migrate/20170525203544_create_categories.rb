class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.float :amount
      t.float :total_amount

      t.timestamps
    end
  end
end
