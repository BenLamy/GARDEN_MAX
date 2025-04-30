class CreatePlantations < ActiveRecord::Migration[7.1]
  def change
    create_table :plantations do |t|
      t.references :garden, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
