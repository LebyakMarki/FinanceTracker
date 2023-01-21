class CreateShares < ActiveRecord::Migration[6.1]
  def change
    create_table :shares do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :spending, null: false, foreign_key: true

      t.timestamps
    end
  end
end
