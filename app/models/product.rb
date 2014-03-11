class Product < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 80 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG, or PNG image.'
  }
  validates :category, presence: true, length: { maximum: 25 }

  has_many :box_items, dependent: :destroy
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  private

    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, "Line Item present")
        return false
      end
    end
end
