class AddImageUrlToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :image_url, :string
  end
end
