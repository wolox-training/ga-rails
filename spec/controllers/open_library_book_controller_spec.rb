require 'rails_helper'

RSpec.describe OpenLibraryBooksController do
  describe 'GET #book_information' do
    context 'When request openlibrary.org' do
      include_context 'with authenticated user'
      subject!(:http_response) { get :book_information, params: { isbn: '0451526538' } }

      it 'When you look a book with correct ISBN' do
        expect(JSON.parse(http_response.body)['title']).to eq('The adventures of Tom Sawyer')
      end
      it { is_expected.to have_http_status(200) }
    end
  end
end
