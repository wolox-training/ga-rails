FactoryBot.define do
  factory :rent do
    user { build(:user) }
    book { build(:book) }
    rent_in { DateTime.now.to_date }
    rent_out { DateTime.now.to_date + 10.days }
  end
end
