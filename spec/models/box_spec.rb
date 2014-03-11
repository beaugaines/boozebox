require 'spec_helper'

describe Box do
  before { @box = Box.new(name: "Russian Box", description: "5 of the best Russian vodka money can buy,
                                                            plus a book on some great pick-up lines!",
                                               image_url: "me.jpg") }
  subject { @box }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:image_url) }

  it { should be_valid }

  describe "when name is not present" do
    before { @box.name = "" }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @box.name = "Russian Box" * 50 }
    it { should_not be_valid }
  end

  describe "when description is blank" do
    before { @box.description = "" }
    it { should_not be_valid }
  end

  describe "when description is too long" do
    before { @box.description = "5 of the best Russian vodka" * 1000 }
    it { should_not be_valid }
  end

  describe "when image file type is invalid" do
    before { @box.image_url = "me.pdf" }
    it { should_not be_valid }
  end

  describe "box associations" do
    before { @box.save }

    let!(:first_item) { FactoryGirl.create(:box_item, box: @box) }
    let!(:second_item) { FactoryGirl.create(:box_item, box: @box) }

    it "should destroy the box_item associations" do
      products = @box.box_items.to_a

      @box.destroy

      expect(products).not_to be_empty
      
      products.each do |product|
        expect(BoxItem.where(id: product.id)).to be_empty
      end
    end
  end

  describe "protect line items from box destruction" do
    before { @box.save }

    let!(:first_line_item) { FactoryGirl.create(:line_item, box: @box) }
    let!(:second_line_item) { FactoryGirl.create(:line_item, box: @box) }

    it "should not be destroyed if it has line_items" do
      expect(@box.destroy).to eql(false)
    end
  end
end
