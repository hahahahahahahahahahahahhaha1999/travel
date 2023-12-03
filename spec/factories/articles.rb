FactoryBot.define do
  factory :article do
    title             { 'ああああ' }
    check_in          { Faker::Date.between(from: Date.today, to: 1.year.from_now) }
    check_out         { Faker::Date.between(from: 1.day.from_now, to: 1.year.from_now) }
    partner_id         { 2 }
    price             { 1000 }
    content           { 'あああああ' }

    association :user
    association :prefecture

    after(:build) do |article|
      article.image.attach(io: File.open('app/assets/images/1603887_s.jpg'), filename: '1603887_s.jpg')
    end
  end
end