require 'rails_helper'

RSpec.describe BooksController do
  it 'responds with 200 status' do
    expect(response).to have_http_status(:ok)
  end

  it { should route(:get, '/books').to(action: :index) }
  it { should route(:get, '/books/3').to(action: :show, id: 3) }
end
