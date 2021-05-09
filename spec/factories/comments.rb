FactoryBot.define do
  factory :comment do
    comment { 'こんにちわ' }
    association :user
    association :prototype
  end
end