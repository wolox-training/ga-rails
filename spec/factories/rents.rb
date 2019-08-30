FactoryBot.define do
  factory :rent do
    user { nil }
    book { nil }
    rent_in { "2019-08-30" }
    rent_out { "2019-08-30" }
  end
end
