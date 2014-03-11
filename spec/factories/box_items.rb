# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :box_item, :class => 'BoxItem' do
    box
    product
  end
end
