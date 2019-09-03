require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it { should route(:get, '/books').to(action: :index) }
  it { should route(:get, '/books/3').to(action: :show, id: 3) }
end
