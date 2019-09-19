require 'rails_helper'

class OpenLibraryBooksServiceMock
  include WebMock::API

  def retrieve_book_information_by_isbn_success
    stub_request(:get, 'openlibrary.org/api/books')
      .with(
        query:
          { bibkeys: 'ISBN:0385472579', format: 'json', jscmd: 'data' }
      )
      .to_return(
        status: 200,
        body: File.read('./spec/support/mocks_and_stubs/book_information_success_stub.json')
      )
  end
end
