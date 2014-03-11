# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "Skyy Vodka"
    description "A smooth vodka."
    price "9.99"
    category "booze"
    image_url "booze.png"
  end
end
