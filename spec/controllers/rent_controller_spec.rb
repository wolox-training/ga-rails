require 'rails_helper'

RSpec.describe RentsController do
<<<<<<< HEAD
<<<<<<< HEAD
  describe 'POST #create' do
    context 'When create rent' do
      include_context 'with authenticated user'
      let(:rentParams) { attributes_for(:rent) }
      let(:userParams) { create(:user) }
      let(:bookParams) { create(:book) }

      # /users/:user_id/rents
      subject(:http_response) do
        post :create, params: { user_id: userParams[:id],
                                rent: { user_id: userParams[:id],
                                        book_id: bookParams[:id],
                                        rent_in: rentParams[:rent_in],
                                        rent_out: rentParams[:rent_out] } }
      end

      it 'creates the rent successfully' do
        expect(JSON.parse(http_response.body).to_json).to eq RentSerializer.new(Rent.last).to_json
      end

      it { is_expected.to have_http_status(201) }
=======
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
<<<<<<< HEAD
>>>>>>> 65452d5... Create test POST #create for rents
=======

      it { should have_http_status(200) }
>>>>>>> 3b6b8a2... Crete test #index for rents
    end
  end

  describe 'GET #index' do
<<<<<<< HEAD
<<<<<<< HEAD
    context 'When you look a book with correct id' do
      include_context 'with authenticated user'
      let(:rent) { create(:rent) }
      subject!(:http_response) { get :index, params: { user_id: rent.user_id } }

      it 'with correct answers in json' do
        expect(http_response.body) =~ RentSerializer.new(rent)
      end

      it { is_expected.to have_http_status(200) }
    end
  end
=======
>>>>>>> 76f7f49... Prototype rents routes.
=======
    context 'GET routes checks' do
=======
    context 'route check' do
>>>>>>> 3b6b8a2... Crete test #index for rents
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
>>>>>>> 65452d5... Create test POST #create for rents
end
