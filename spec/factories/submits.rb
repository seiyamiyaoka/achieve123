# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :submit do
    task nil
    user nil
    charge_id 1
    status 1
    message "MyText"
  end
end
