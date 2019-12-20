FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    name { FFaker::Name.first_name }
    last_name {  FFaker::Name.last_name }
    mobile_phone { FFaker::PhoneNumber.short_phone_number }
    work_place { FFaker::Company.name }
  end
end