FactoryBot.define do
  factory :user do
    nickname { 'suzuki' }
    email { Faker::Internet.email }
    password { '000aaa' }
    password_confirmation { '000aaa' }
  end
end
