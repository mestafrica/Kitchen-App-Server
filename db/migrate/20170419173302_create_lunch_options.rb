class CreateLunchOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :lunch_options do |t|
      t.date :serving_date
      t.references :meal, foreign_key: true

      t.timestamps
    end
  end
end
