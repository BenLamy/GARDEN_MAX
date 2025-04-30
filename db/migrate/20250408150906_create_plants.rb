class CreatePlants < ActiveRecord::Migration[7.1]
  def change
    create_table :plants do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
