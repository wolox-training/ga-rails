require 'rails_helper'

RSpec.describe RentsController do
  describe 'POST #create' do
    context 'When create rent' do
      include_context 'with authenticated user'
      let!(:rentParams) { attributes_for(:rent) }
      let!(:userParams) { create(:user) }
      let!(:bookParams) { create(:book) }

      # /users/:user_id/rents
      subject!(:http_response) do
        post :create, params: { user_id: userParams[:id], user: userParams[:id],
                                book: bookParams[:id], rent_in: rentParams[:rent_in],
                                rent_out: rentParams[:rent_out] }
      end

      it 'rent created successfully' do
        expect(JSON.parse(http_response.body).to_json).to eq RentSerializer.new(Rent.last).to_json
      end

      it { should have_http_status(201) }
    end
  end

  describe 'GET #index' do
    context 'When you look a book with correct id' do
      include_context 'with authenticated user'
      let!(:rent) { create(:rent) }
      subject!(:http_response) { get :index, params: { user_id: rent.user_id } }

      it 'with correct answers in json' do
        expect(JSON.parse(http_response.body).to_json) =~ RentSerializer.new(rent).to_json
      end

      it { should have_http_status(200) }
    end
  end
end
