FactoryGirl.define do
  factory :list do
    title "MyString"
    description "MyText"
  
    trait :invalid do
      title ""
    end
  end
end
