class AddSupperIdToOrder < ActiveRecord::Migration[5.0]
  def change
  	add_reference :orders, :supper, foreign_key: { to_table: :meals }
  end
end
