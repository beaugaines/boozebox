# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :box do
    name "Russian Box"
    description "Craziest Russian Box ever."
    image_url "box.png"
  end
end
