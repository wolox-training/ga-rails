require 'rails_helper'

RSpec.describe BooksController do
  include Wor::Paginate

  describe 'GET rutes checks' do
    it { should route(:get, '/books').to(action: :index) }
    it { should route(:get, '/books/1').to(action: :show, id: 1) }
  end

  describe 'GET #index without authenticated user' do
    subject(:http_request) { get :index }
    it { should have_http_status(:unauthorized) }
  end

  describe 'GET #index with authenticated user' do
    context 'When you are looking all books' do
      include_context 'Authenticated User'
      let!(:books) { create_list(:book, 3) }
      subject!(:http_response) { get :index }

      it 'responds with a paginated json' do
        expect(JSON.parse(http_response.body)).to be_paginated
      end

      it 'responses with books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json

        expect(http_response.body) =~ JSON.parse(expected)
      end

      it { should have_http_status(200) }
    end
  end

  describe 'GET #show without authenticated user' do
    subject(:http_request) { get :index }
    it { should have_http_status(:unauthorized) }
  end

  describe 'GET #show with authenticated user' do
    context 'When you look a book with correct id' do
      include_context 'Authenticated User'
      let!(:book) { create(:book) }
      subject!(:http_response) { get :show, params: { id: book.id } }

      it 'responses with json' do
        expect(JSON.parse(http_response.body).to_json).to eq BookSerializer.new(book).to_json
      end

      it { should have_http_status(200) }
    end
  end
end
