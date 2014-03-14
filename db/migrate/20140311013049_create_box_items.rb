class CreateBoxItems < ActiveRecord::Migration
  def change
    create_table :box_items do |t|
      t.references :box, index: true
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end
