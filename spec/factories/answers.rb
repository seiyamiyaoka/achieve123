# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    user nil
    question nil
    content "MyString"
  end
end
