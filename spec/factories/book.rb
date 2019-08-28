FactoryBot.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::File.file_name(dir: 'path/to') }
    title { Faker::Book.title }
    publisher { Faker::Book.publisher }
    year { Faker::Number.number(digits: 4) }
  end
end
