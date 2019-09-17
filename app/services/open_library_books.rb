class OpenLibraryBooks
  include HTTParty
  base_uri 'openlibrary.org'

  def initialize(isbn)
    @service = '/api/books'
    @isbn = isbn
    @options = { query: { bibkeys: @isbn, format: 'json', jscmd: 'data' } }
  end

  def retrieve_book_information
    response = self.class.get(@service, @options)
    JSON.parse(response.body)[@isbn].deep_symbolize_keys
        .slice(:title, :subtitle, :number_of_pages, :authors)
  end
end
