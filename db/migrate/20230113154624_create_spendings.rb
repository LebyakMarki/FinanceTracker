class CreateSpendings < ActiveRecord::Migration[6.1]
  def change
    create_table :spendings do |t|
      t.string :description
      t.string :category
      t.decimal :amount

      t.timestamps
    end
  end
end
