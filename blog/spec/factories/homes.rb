FactoryBot.define do
  factory :home do
    owner { FactoryBot.create(:owner) }

    price { Faker::Number.decimal }
    extra_service { Faker::Number.decimal }
    home_features {
      {garden: FFaker::Boolean.random,
      furnished: FFaker::Boolean.random,
      gym: FFaker::Boolean.random}
    }
  end
end