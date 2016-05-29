FactoryGirl.define do
  factory :contact do
    name 'seiya'
    email 'seiyamiyaoka@gmail.com'
    sequence(:email) {|n| "seiya#{n}@example.com"}
  end
end
