# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    user nil
    title "MyString"
    content "MyText"
    deadline "2016-03-31 21:58:49"
    charge_id 1
    done false
    status 1
  end
end
