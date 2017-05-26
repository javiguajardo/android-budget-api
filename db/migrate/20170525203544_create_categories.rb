class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.float :amount
      t.belongs_to :budget
      t.float :total_amount

      t.timestamps
    end
  end
end
