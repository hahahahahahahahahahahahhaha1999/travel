FactoryBot.define do
  factory :article do
    prefecture        { 1 }
    title             { 'ああああ' }
    check_in          { Faker::Date.between(from: Date.today, to: 1.year.from_now) }
    check_out         { Faker::Date.between(from: 1.day.from_now, to: 1.year.from_now) }
    partner           { 1 }
    price             { 1000 }
    travel_site       { 1 }
    content           { 'あああああ' }

    association :user
    association :prefecture

    after(:build) do |article|
      article.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end