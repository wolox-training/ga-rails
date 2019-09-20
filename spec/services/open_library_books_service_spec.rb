require 'rails_helper'

RSpec.describe OpenLibraryBooksService, type: :service do
  include WebMock::API
  describe '#retrieve_book_information' do
    let(:path) { 'https://openlibrary.org/api/books' }
    context 'when retrieving info on a book with valid ISBN' do
      let(:isbn) { 'ISBN:0451526538' }
      subject(:http_request) do
        OpenLibraryBooksService.new.retrieve_book_information_by_isbn(isbn)
      end

      before do
        retrieve_book_information_by_isbn_success
        http_request
      end

      it 'when an external request successfully' do
        expect(WebMock).to have_requested(:get, path)
          .with(query: { bibkeys: isbn, format: 'json', jscmd: 'data' })
      end

      it 'whe you look a book with correct data title' do
        expect(http_request[:title]).to eq('The adventures of Tom Sawyer')
      end
    end

    context 'when retrieving info not found' do
      let!(:non_existent_isbn) { 'ISBN:9999999999' }
      subject(:http_request) do
        OpenLibraryBooksService.new.retrieve_book_information_by_isbn(non_existent_isbn)
      end

      before do
        retrieve_book_information_no_found
      end

      it 'should respond Not found 404 code' do
        expect { http_request }.to raise_error('Not found 404')
      end
    end

    context 'when retrieving info bad request' do
      let!(:invalid_isbn) { 'ISBN:123' }
      subject(:http_request) do
        OpenLibraryBooksService.new.retrieve_book_information_by_isbn(invalid_isbn)
      end

      before do
        retrieving_book_information_bad_request
      end

      it 'Bad request 400' do
        expect { http_request }.to raise_error('Bad request 400')
      end
    end
  end
end
