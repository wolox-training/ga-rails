json.extract! book, :id, :genre, :author, :image, :title, :publisher,
              :year, :created_at, :updated_at
json.url book_url(book, format: :json)
