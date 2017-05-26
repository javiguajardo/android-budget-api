class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :acct_type, default: 0
      t.float :amount
      t.belongs_to :budget

      t.timestamps
    end
  end
end
