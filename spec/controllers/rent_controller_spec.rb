require 'rails_helper'

RSpec.describe RentsController do
  describe 'POST #create' do
    context 'without authenticated user' do
      subject(:http_request) { post :create }
      it { should have_http_status(:unauthorized) }
    end

    context 'When create rent' do
      include_context 'with authenticated user'
      let!(:rent) { create(:rent) }
      subject!(:http_response) do
        post :create, params: {
          user: rent.user, book: rent.book
        }
      end

      it 'with a paginated json' do
        expect(JSON.parse(http_response.body).to_json).to eq RentSerializer.new(rent).to_json
      end

      it { should have_http_status(200) }
    end
  end

  describe 'GET #index' do
    context 'route check' do
      it { should route(:get, '/rents').to(action: :index) }
    end

    context 'without authenticated user' do
      subject(:http_request) { get :index }
      it { should have_http_status(:unauthorized) }
    end

    context 'When you look a book with correct id' do
      include_context 'with authenticated user'
      let!(:rent) { create(:rent) }
      subject!(:http_response) { get :index, params: { user_id: rent.user_id } }

      it 'with answers in json' do
        expect(JSON.parse(http_response.body).to_json) =~ RentSerializer.new(rent).to_json
      end

      it { should have_http_status(200) }
    end
  end
end
