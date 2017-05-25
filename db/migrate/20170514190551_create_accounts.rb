class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :type, default: 0
      t.float :amount

      t.timestamps
    end
  end
end
