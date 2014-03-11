require 'spec_helper'

describe Product do
  before { @product = Product.new(name: "Skyy Vodka",
                                  description: "The best Russian vodka money can buy -
                                                before you know it, you'll be puking
                                                your pathetic guts out.",
                                  price: 25.00,
                                  image_url: "skyy_vodka.png",
                                  category: "booze") }
  subject { @product }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:price) }
  it { should respond_to(:category) }
  it { should respond_to(:image_url) }

  it { should be_valid }

  describe "when name is blank" do
    before { @product.name = "" }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @product.name = "Skyy Vodka" * 50 }
    it { should_not be_valid }
  end

  describe "when description is blank" do
    before { @product.description = "" }
    it { should_not be_valid }
  end

  describe "when description is too long" do
    before { @product.description = "The best Russian vodka" * 500 }
    it { should_not be_valid }
  end

  describe "when price is less than or equal to 0" do
    before { @product.price = 0 }
    it { should_not be_valid}    
  end

  describe "when image URL file type is invalid" do
    before { @product.image_url = "vodka.pdf" }
    it { should_not be_valid }
  end

  describe "when category is blank" do
    before { @product.category = "" }
    it { should_not be_valid }
  end

  describe "when category is too long" do
    before { @product.category = "booze" * 25 }
    it { should_not be_valid }
  end

  describe "product associations" do
    before { @product.save }

    let!(:first_item) { FactoryGirl.create(:box_item, product: @product) }
    let!(:second_item) { FactoryGirl.create(:box_item, product: @product) }

    it "should destroy the associations" do
      items = @product.box_items.to_a

      @product.destroy

      expect(items).not_to be_empty
      items.each do |item|
        expect(BoxItem.where(id: item.id)).to be_empty
      end
    end
  end

  describe "protect line items from product destruction" do
    before { @product.save }
    
    let!(:first_line_item) { FactoryGirl.create(:line_item, product: @product) }
    let!(:second_line_item) { FactoryGirl.create(:line_item, product: @product) }

    it "should not be destroyed if it has line_items" do
      expect(@product.destroy).to eql(false)
    end
  end
end
