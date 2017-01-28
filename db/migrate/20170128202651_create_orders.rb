class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.belongs_to :meal, index: true
      t.belongs_to :menu, index: true
      t.timestamps
    end
  end
end
