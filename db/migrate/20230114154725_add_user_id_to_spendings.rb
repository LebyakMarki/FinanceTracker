class AddUserIdToSpendings < ActiveRecord::Migration[6.1]
  def change
    add_column :spendings, :user_id, :integer
    add_index :spendings, :user_id
  end
end
