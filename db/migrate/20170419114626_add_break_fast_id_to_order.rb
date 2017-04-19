class AddBreakFastIdToOrder < ActiveRecord::Migration[5.0]
  def change
  	add_reference :orders, :breakfast, foreign_key: { to_table: :meals }
  end
end
