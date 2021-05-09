FactoryBot.define do
  factory :prototype do
    name        { Faker::Team.name }
    concept     { "なんてこったパンナコッタ" }
    text        { Faker::Lorem.sentence }
    genre_id    { Faker::Number.between(from: 1, to: 9) }
    platform_id { Faker::Number.between(from: 1, to: 8) }
    publish_id  { Faker::Number.between(from: 0, to: 1) }
    association :user

    after(:build) do |prototype|
      prototype.image.attach(io: File.open('public/images/lom.jpeg'), filename: 'lom.jpeg')
    end
  end
end