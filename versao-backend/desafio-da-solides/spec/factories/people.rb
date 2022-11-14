FactoryBot.define do
  factory :person do
    sequence(:full_name) { |n| "MyString#{n}" }
    sequence(:cpf) { |n| "MyString#{n}" }
    sequence(:cns) { |n| "MyString#{n}" }
    sequence(:email) { |n| "MyString#{n}@gmail.com" }
    birth_date { "2022-11-10" }
    sequence(:phone_number) { |n| "MyString#{n}" }
    status { 1 }
    photo { Rack::Test::UploadedFile.new('app/assets/images/ruby_symbol.png', 'image/png') }
  end
end
