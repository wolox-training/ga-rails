class BooksController < ApplicationController
  before_action :authenticate_user!

  def book_id
    params.require(:id)
  end

  def show
    render json: Book.find(book_id), serializer: BookSerializer
  end

  def index
    render json: Book.all, each_serializer: BookSerializer
  end
end
