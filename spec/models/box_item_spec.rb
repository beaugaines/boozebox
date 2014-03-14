require 'spec_helper'

describe BoxItem do
  let(:box) { FactoryGirl.create(:box) }
  let(:product) { FactoryGirl.create(:product) }
  
  before do
    @box_item = box.box_items.build(product: product)
  end

  subject { @box_item }

  describe "without box ID" do
    before { @box_item.box_id = nil }
    it { should_not be_valid }
  end

  describe "without product ID" do
    before { @box_item.product_id = nil }
    it { should_not be_valid }
  end
end
