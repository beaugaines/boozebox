require 'spec_helper'

describe LineItem do
  let(:box) { FactoryGirl.create(:box) }
  let(:product) { FactoryGirl.create(:product) }

  before do
    @line_item_box = box.line_items.build
    @line_item_product = product.line_items.build
  end

end
