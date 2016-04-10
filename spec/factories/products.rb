# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "MyString"
    price 1
    released_on "2016-04-05"
    manufacture nil
  end
end
