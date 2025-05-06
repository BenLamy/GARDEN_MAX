class AddImageUrlToGardens < ActiveRecord::Migration[7.1]
  def change
    add_column :gardens, :image_url, :string
  end
end
