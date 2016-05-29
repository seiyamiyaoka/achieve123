# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user nil
    blog nil
    content "MyString"
  end
end
