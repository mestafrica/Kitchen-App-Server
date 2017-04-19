class AddLunchIdToOrder < ActiveRecord::Migration[5.0]
  def change
  	add_reference :orders, :lunch, foreign_key: { to_table: :meals }
  end
end
