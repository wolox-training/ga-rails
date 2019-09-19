require 'rails_helper'

RSpec.describe OpenLibraryBooksService, type: :service do
  include WebMock::API
  describe '#retrieve_book_information' do
    context 'when retrieving info on a book with valid ISBN' do
      subject(:data) do
        OpenLibraryBooksService.new
                               .retrieve_book_information_by_isbn('ISBN:0451526538')
      end

      before do
        @response_data = Rails.root.join('spec', 'support', 'mocks_and_stubs', 'book_information_success_stub.json')

        stub_request(:get, 'https://openlibrary.org/api/books')
          .with(
            query:
              { bibkeys: 'ISBN:0451526538', format: 'json', jscmd: 'data' }
          )
          .to_return(status: 200, body: @response_data)
      end

      it 'makes an external request' do
        data
        expect(WebMock).to have_requested(:get, 'https://openlibrary.org/api/books').with(query: { bibkeys: 'ISBN:0451526538', format: 'json', jscmd: 'data' })
      end
    end
  end
end

# '0451526538'   Tom Sawyer
