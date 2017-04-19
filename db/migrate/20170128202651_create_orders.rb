class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.date :serving_date, index: true
      t.belongs_to :breakfast, foreign_key: { to_table: :meals }
      t.belongs_to :lunch, foreign_key: { to_table: :meals }
      t.belongs_to :supper, foreign_key: { to_table: :meals }
      t.timestamps
    end
  end
end
