class CreateBudgetsCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :budgets_categories, id: false do |t|
      t.belongs_to :budget, index: true
      t.belongs_to :category, index: true
    end
  end
end
