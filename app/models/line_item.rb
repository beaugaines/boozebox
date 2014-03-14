class LineItem < ActiveRecord::Base
  belongs_to :box
  belongs_to :product
  belongs_to :cart

end
