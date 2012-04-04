FactoryGirl.define do
  
  factory :user do
    first_name "Joe"
    last_name "Schmo"
    sequence(:email) { |n| "person_#{n}@example.com"} 
    password "foobar"
    password_confirmation "foobar"
  end
  
end