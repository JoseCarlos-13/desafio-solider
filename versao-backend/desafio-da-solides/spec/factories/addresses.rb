FactoryBot.define do
  factory :address do
    cep { "29190400" }
    sequence(:public_place) { |n| "MyString#{n}" }
    complement { "MyString" }
    sequence(:district) { |n| "MyString#{n}" }
    sequence(:city) { |n| "MyString#{n}" }
    sequence(:uf) { |n| "MyString#{n}" }
    ibge_code { "MyString" }
    person { 1 }
  end
end
