require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  # subject(:books) { create_list(:book, 3) }
  it { should route(:get, '/books').to(action: :index) }
  it { should route(:get, '/books/1').to(action: :show, id: 1) }
end
