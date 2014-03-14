class BoxItem < ActiveRecord::Base
  belongs_to :box
  belongs_to :product

  validates :box_id, presence: true
  validates :product_id, presence: true
end
