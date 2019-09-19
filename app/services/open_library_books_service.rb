class OpenLibraryBooksService
  include HTTParty
  base_uri 'https://openlibrary.org'

  def retrieve_book_information_by_isbn(isbn)
    path = '/api/books'
    options = { query: { bibkeys: isbn, format: 'json', jscmd: 'data' } }

    book_response = self.class.get(path, options)

    raise book_response.response unless book_response.success?

    JSON.parse(book_response.body)[isbn].deep_symbolize_keys
        .slice(:title, :subtitle, :number_of_pages, :authors)
  end
end
