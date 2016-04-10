# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task_comment do
    user nil
    task nil
    content "MyString"
  end
end
