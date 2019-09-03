class BooksController < ApplicationController
  def show
    render json: Book.find(book_id), serializer: BookSerializer
  end

  def index
    render json: Book.all, each_serializer: BookSerializer
  end

  private

  def book_id
    params.require(:id)
  end
end
